class User {
  int userId;
  String username;
  String password;
  String email;
  String firstName;
  String lastName;
  String phoneNumber;
  String userType;

  User({
    required this.userId,
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.userType,
  });
}

class Applicant {
  int applicantId;
  int userId;
  String resume;

  Applicant({
    required this.applicantId,
    required this.userId,
    required this.resume,
  });
}

class Employer {
  int employerId;
  int userId;
  String companyName;
  String companyDescription;
  String companyWebsite;
  String companyLocation;

  Employer({
    required this.employerId,
    required this.userId,
    required this.companyName,
    required this.companyDescription,
    required this.companyWebsite,
    required this.companyLocation,
  });
}

class JobListing {
  int jobListingId;
  String title;
  String description;
  String requirements;
  String responsibilities;
  String location;
  String salaryRange;
  int employerId;

  JobListing({
    required this.jobListingId,
    required this.title,
    required this.description,
    required this.requirements,
    required this.responsibilities,
    required this.location,
    required this.salaryRange,
    required this.employerId,
  });
}

class Application {
  int applicationId;
  int applicantId;
  int jobListingId;
  String applicationStatus;
  DateTime appliedDate;

  Application({
    required this.applicationId,
    required this.applicantId,
    required this.jobListingId,
    required this.applicationStatus,
    required this.appliedDate,
  });
}

class SavedJob {
  int savedJobId;
  int applicantId;
  int jobListingId;
  DateTime savedDate;

  SavedJob({
    required this.savedJobId,
    required this.applicantId,
    required this.jobListingId,
    required this.savedDate,
  });
}

class Skill {
  int skillId;
  int applicantId;
  String skillName;

  Skill({
    required this.skillId,
    required this.applicantId,
    required this.skillName,
  });
}

class Education {
  int qualificationId;
  int applicantId;
  String institution;
  String degree;
  String fieldOfStudy;
  DateTime startDate;
  DateTime endDate;

  Education({
    required this.qualificationId,
    required this.applicantId,
    required this.institution,
    required this.degree,
    required this.fieldOfStudy,
    required this.startDate,
    required this.endDate,
  });
}

class WorkExperience {
  int workExperienceId;
  int applicantId;
  String company;
  String position;
  DateTime startDate;
  DateTime endDate;

  WorkExperience({
    required this.workExperienceId,
    required this.applicantId,
    required this.company,
    required this.position,
    required this.startDate,
    required this.endDate,
  });
}
