class Patient
    
    attr_accessor :name
    @@all = []

    #initializes with a name
    def initialize(name)
        @name = name
        @@all << self
    end

    #knows about all patients
    def self.all
        @@all
    end

    #given a date and doctor, creates a new appointment belonging to that patient
    #The Patient class needs an instance method, #new_appointment, 
    #that takes in a date and an instance of the Doctor class in this order and creates a new Appointment. 
    #The Appointment should know that it belongs to the patient.
    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end

    #returns all appointments associated with this Patient
    #The Patient class needs an instance method, #appointments, 
    #that iterates through the Appointments array and returns Appointments that belong to the patient.
    def appointments
        Appointment.all.select do |appointment|
            appointment.patient == self
        end
    end

    #has many doctors through appointments
    #The Patient class needs an instance method, #doctors, 
    #that iterates over that patient's Appointments and collects the doctor that belongs to each Appointment.
    def doctors
        appointments.collect do |appointment|
            appointment.doctor
        end
    end

end
