class Doctor

    ##has a name
    attr_accessor :name
    @@all = []

    #initializes with a name and adds itself to an array of all doctors
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    #given a date and a patient, creates a new appointment
    #The Doctor class needs an instance method, #new_appointment, 
    #that takes in a date and an instance of the Patient class in this order, and creates a new Appointment. 
    #That Appointment should know that it belongs to the doctor
    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    #returns all appointments associated with this Doctor
    #The Doctor class needs an instance method, #appointments, 
    #that iterates through all Appointments and finds those belonging to this doctor.
    def appointments
        Appointment.all.select do |appointment|
        appointment.doctor == self
        end
    end

    #has many patients, through appointments
    #The Doctor class needs an instance method, #patients, 
    #that iterates over that doctor's Appointments and collects the patient that belongs to each Appointments.
    def patients
        appointments.collect do |appointment|
        appointment.patient
        end
    end
end
