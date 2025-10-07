namespace HospitalManagement
{
    public class Patient
    {
        public int PatientId { get; set; }   // Primary Key
        public string Name { get; set; }
        public int Age { get; set; }
        public string Disease { get; set; }
    }
}