class Appointment

    attr_accessor :date, :patient, :doctor
    @@all = []

    #initializes with a date, patient, and doctor
    #belongs to a patient
    #belongs to a doctor
    def initialize(date, patient, doctor)
        @date = date
        @patient = patient
        @doctor = doctor
        @@all << self
    end

    #knows about all appointments that have been created
    def self.all
        @@all
    end
end
