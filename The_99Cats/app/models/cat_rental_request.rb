class CatRentalRequest < ApplicationRecord
    validates :cat_id, :start_date, :end_date, presence: true
    validates :status, inclusion: ['PENDING', 'APPROVED', 'DENIED'] 
    validate :does_not_overlap_approved_request 

    def does_not_overlap_approved_request
        if overlapping_approved_requests.exists?
            errors.add(:overlapping_date, "overlapping dates cannot be approved")
        end
    end

    def overlapping_requests
        if self.id   
        query = CatRentalRequest
            .where('cat_id = ?', self.cat_id)
            .where.not('id = ?', self.id)
            .where('start_date BETWEEN ? and ?', self.start_date, self.end_date)
            .where('? BETWEEN start_date AND end_date', self.start_date)
            .where("status = 'APPROVED'")
        else
        query = CatRentalRequest
            .where('cat_id = ?', self.cat_id)
            .where('start_date BETWEEN ? and ?', self.start_date, self.end_date)
            .where('? BETWEEN start_date AND end_date', self.start_date)
            .where("status = 'APPROVED'")
        end
    query
    end

    def overlapping_approved_requests
        self.overlapping_requests
    end

    belongs_to :cat, 
        class_name: :Cat,
        foreign_key: :cat_id
end