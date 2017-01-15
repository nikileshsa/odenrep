class Event < ApplicationRecord
  belongs_to :user
  has_many :endorsements
  has_one :chainpoint

  def make_chainpoint
    require 'tierion'

    t = Tierion::HashApi::Client.new(Rails.application.secrets.tierion_user, Rails.application.secrets.tierion_pass)
    my_hash = Digest::SHA256.hexdigest(self.body)
    t.send(my_hash)

    c = Chainpoint.new
    c.event = self
    c.target_hash = t.hash_items.first.hash
    c.chainpoint_id = t.hash_items.first.id
    c.save!
  end

  def finish_chainpoint
    t = Tierion::HashApi::Client.new(Rails.application.secrets.tierion_user, Rails.application.secrets.tierion_pass)

    r = t.receipt_from_id_and_hash(chainpoint.chainpoint_id, chainpoint.target_hash)
    if r
      c = self.chainpoint
      c.merkle_root = r["merkleRoot"]
      c.proof = r["proof"].to_s
      c.anchors = r["anchors"].to_s
      c.save!
    end
  end

end
