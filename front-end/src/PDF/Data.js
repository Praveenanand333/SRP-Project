import React, { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import  '../CSS/pdf.css'
function Data(){
    const [studentDetails, setStudentDetails] = useState(null);
    const [errorMessage, setErrorMessage] = useState('');
    const [studentImage, setStudentImage] = useState('');
    const [error, setError] = useState('');
    const userRef = useRef(null);
    const [basicacademic, setBasicAcademic] = useState(null);
    const [marksData, setMarksData] = useState([]);
    const [gpaData, setGpaData] = useState({});
    useEffect(() => {
        axios.get('http://localhost:5000/session')
          .then(response => {
            userRef.current = response.data.username;
    
            axios.get(`http://localhost:5000/basicacademic/${userRef.current}`)
              .then(response => {
                if (response.data) {
                  setBasicAcademic(response.data);
                } else {
                  alert('No academic records found');
                }
              })
              .catch(error => {
                console.log(error);
              });
          })
          .catch(error => {
            console.log(error);
          });
      }, []);
    
      useEffect(() => {
        if (basicacademic) {
          const fetchMarksAndGPA = async () => {
            const marksPromises = [];
            const gpaPromises = [];
    
            for (let sem = 1; sem <= basicacademic.CurrentSemester; sem++) {
              marksPromises.push(axios.get(`http://localhost:5000/getsemestermarks/${userRef.current}/${sem}`));
              gpaPromises.push(axios.get(`http://localhost:5000/getsemestergpa/${userRef.current}/${sem}`));
            }
    
            const marksResponses = await Promise.all(marksPromises);
            const gpaResponses = await Promise.all(gpaPromises);
    
            const marksData = marksResponses.map(response => response.data);
            const gpaData = gpaResponses.map(response => response.data);
    
            setMarksData(marksData);
            setGpaData(gpaData);
          };
    
          fetchMarksAndGPA();
        }
      }, [basicacademic]);
    
    useEffect(() => {
        axios.get('http://localhost:5000/session')
            .then(response => {
                const username = response.data.username;
                
                axios.get(`http://localhost:5000/studentDetails/${username}`)
                    .then(response => {
                        if (response.data) {
                           
                            const formattedStudentDetails = {
                                ...response.data,
                                DateOfBirth: formatDate(response.data.DateOfBirth)
                            };
                            console.log(formattedStudentDetails);
                            var RollNumber=formattedStudentDetails.RollNumber;
                            setStudentDetails(formattedStudentDetails);
                        } else {
                            setErrorMessage('No student details available');
                        }
                        console.log(RollNumber);
                    })
                    .catch(error => {
                        console.error('Error fetching student details:', error);
                    });
            })
            .catch(error => {
                console.error('Error fetching username:', error);
            });    
    }, []);

    const formatDate = (dateString) => {
        const date = new Date(dateString);
        return date.toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        });
    };
    const [Username,setUsername]=useState(null);
    const [internships,setInternships]=useState(null);
    const [Scholarships,setScholarships]=useState(null);
    const [projects,setProjects]=useState(null);
    const [sports,setSports]=useState(null);
    const [exams,setExams]=useState(null);
    const [papers,setPapers]=useState(null);
    const [events,setEvents]=useState(null);
    axios.defaults.withCredentials = true; 
    useEffect(() => {
        axios.get('http://localhost:5000/session')
            .then(response => {
                const username = response.data.username;
                
                axios.get(`http://localhost:5000/InternshipDetails/${username}`)
                    .then(response => {
                        if (response.data) {
                            console.log(response.data);
                           
                            setInternships(response.data);
                        } else {
                            setErrorMessage('No Internship details available');
                        }
                        
                    })
                    .catch(error => {
                        console.error('Error fetching Internship details:', error);
                    });

                    axios.get(`http://localhost:5000/ScholarshipDetails/${username}`)
                    .then(response => {
                        if (response.data) {
                            console.log(response.data);
                           
                            setScholarships(response.data);
                        } else {
                            setErrorMessage('No Scholarship details available');
                        }
                        
                    })
                    .catch(error => {
                        console.error('Error fetching Scholarship details:', error);
                    });
                    axios.get(`http://localhost:5000/ProjectDetails/${username}`)
                    .then(response => {
                        if (response.data) {
                            console.log(response.data);
                           
                            setProjects(response.data);
                        } else {
                            setErrorMessage('No Project details available');
                        }
                        
                    })
                    .catch(error => {
                        console.error('Error fetching Project details:', error);
                    });
                    axios.get(`http://localhost:5000/SportsDetails/${username}`)
                    .then(response => {
                        if (response.data) {
                            console.log("sports",response.data);
                           
                            setSports(response.data);
                        } else {
                            setErrorMessage('No Sports details available');
                        }
                        
                    })
                    .catch(error => {
                        console.error('Error fetching Sports details:', error);
                    });
                    axios.get(`http://localhost:5000/ExamDetails/${username}`)
                    .then(response => {
                        if (response.data) {
                            console.log(response.data);
                           
                            setExams(response.data);
                        } else {
                            setErrorMessage('No Sports details available');
                        }
                        
                    })
                    .catch(error => {
                        console.error('Error fetching Exams details:', error);
                    });

                    axios.get(`http://localhost:5000/PaperDetails/${username}`)
                    .then(response => {
                        if (response.data) {
                            setPapers(response.data);
                            
                        } else {
                            setErrorMessage('No paper details available');
                        }
                        
                    })
                    .catch(error => {
                        console.error('Error fetching Paper details:', error);
                    });

                    axios.get(`http://localhost:5000/EventDetails/${username}`)
                    .then(response => {
                        if (response.data) {
                            console.log(response.data);
                           
                            setEvents(response.data);
                        } else {
                            setErrorMessage('No Events details available');
                        }
                        
                    })
                    .catch(error => {
                        console.error('Error fetching Events details:', error);
                    });
            })
            .catch(error => {
                console.error('Error fetching username:', error);
            });    
    }, []);
    return(
        <div>
           <center> <h2>Student Details Report</h2></center>
           <div className="persoanl-details">
           <div className='view-containerpdf'>
                <h2 className='view-headingpdf'>Student Personal Details</h2>
                {errorMessage && <p>{errorMessage}</p>}
                {studentDetails && (
                    <>
                    <div className='img-containerpdf'>
                    <img className='prof-picpdf' src={`http://localhost:5000/getImage/${studentDetails.RollNumber}`} alt='img'/>
                    </div>
                   
                    <div className='view-formpdf'>
                        
                        
                        <p className='view-fieldpdf'><strong>Roll Number:</strong> {studentDetails.RollNumber}</p>
                        <p className='view-fieldpdf'><strong>Date of Birth:</strong> {studentDetails.DateOfBirth}</p>
                        <p className='view-fieldpdf'><strong>Address:</strong> {studentDetails.Address}</p>
                        <p className='view-fieldpdf'><strong>Phone:</strong> {studentDetails.Phone}</p>
                     
                        <p className='view-fieldpdf'><strong>Sex:</strong> {studentDetails.Sex}</p>
                        <p className='view-fieldpdf'><strong>Sex:</strong> {studentDetails.Sex}</p>
                        <p className='view-fieldpdf'><strong>Blood Group:</strong> {studentDetails.Blood_Group}</p>
                        <p className='view-fieldpdf'><strong>Father's Name:</strong> {studentDetails.FatherName}</p>
                        <p className='view-fieldpdf'><strong>Mother's Name:</strong> {studentDetails.Mothername}</p>
                        <p className='view-fieldpdf'><strong>Father's Occupation:</strong> {studentDetails.Fatheroccupation}</p>
                        <p className='view-fieldpdf'><strong>Mother's Occupation:</strong> {studentDetails.Motheroccupation}</p>
                    </div>
                    </>
                )}
            </div>

           </div>
           <div className="Academic-details">
           {basicacademic && 
        <div className='basic-detail'>
          <p><strong>Current Semester :</strong> {basicacademic.CurrentSemester}</p>
          <p><strong>Tenth Marks : </strong>{basicacademic.TenthMarks}</p>
          <p><strong>Higher Secondary Marks :</strong> {basicacademic.HigherSecondaryMarks}</p>
        </div>
      }
      <div>
        <h2>Marks Table</h2>
        {marksData.length > 0 && 
          <table className='marks-tablepdf'>
            <thead>
              <tr>
                <th>Semester</th>
                <th>Subject ID</th>
                <th>Marks Obtained</th>
                <th>Grade</th>
              </tr>
            </thead>
            <tbody>
              {marksData.map((marks, sem) => (
                marks.map((mark, index) => (
                  <tr key={index}>
                    {index === 0 && <td rowSpan={marks.length}>{sem + 1}</td>}
                    <td>{mark.SubjectID}</td>
                    <td>{mark.MarksObtained}</td>
                    <td>{mark.Grade}</td>
                  </tr>
                ))
              ))}
            </tbody>
          </table>
        }
        {Object.keys(gpaData).length > 0 && 
          <div className='gpa-showpdf'>
            <h2>Semester GPA</h2>
            {gpaData.map((gpa, sem) => (
              <p key={sem}>Semester {sem + 1} GPA: {gpa.gpa}</p>
            ))}
          </div>
        }
      </div>

           </div>
           <div className="other-details">

           {internships && internships.map((internship, index) => (
    <div className='view-formpdf' key={index}>
        <h2>Internship Details {index + 1}</h2>
       
        <p className='view-fieldpdf'><strong>Roll Number:</strong> {internship.roll_number}</p>
        <p className='view-fieldpdf'><strong>Employer:</strong> {internship.employer_name}</p>
        <p className='view-fieldpdf'><strong>On/Off campus:</strong> {internship.on_off_campus}</p>
        <p className='view-fieldpdf'><strong>CTC:</strong> {internship.ctc}</p>
        <p className='view-fieldpdf'><strong>Internship Duration:</strong> {internship.InternshipDuration}</p>
        <p className='view-fieldpdf'><strong>Internship StartDate:</strong> {new Date(internship.InternshipStartDate).toLocaleDateString()}</p>
        <p className='view-fieldpdf'><strong>Internship EndDate:</strong> {new Date(internship.InternshipEndDate).toLocaleDateString()}</p>
        <p className='view-fieldpdf'><strong>Product/Service Based :</strong> {internship.product_service_based}</p>
        
    </div>
))}
        {!Scholarships&&<h3 className='nodatamsg'>No Scholarshp details found</h3>}
{Scholarships && Scholarships.map((Scholarship, index) => (
    <div className='view-formpdfpdf' key={index}>
        <h2>Scholarship Details {index + 1}</h2>
        <p className='view-fieldpdf'><strong>Scholarship Provider:</strong> {Scholarship.ScholarshipProvider}</p>
        <p className='view-fieldpdf'><strong>Amount:</strong> {Scholarship.amount}</p>
   
    </div>
))}

{projects && projects.map((project, index) => (
    <div className='view-formpdf' key={index}>
        <h2>Project Details {index + 1}</h2>
        <p className='view-fieldpdf'><strong>Project Name:</strong> {project.title}</p>
        <p className='view-fieldpdf'><strong>Guide:</strong> {project.guide}</p>
        <p className='view-fieldpdf'><strong>Description:</strong> {project.project_desc}</p>
   
    </div>
))}
            {!projects && <h3 className='nodatamsg'>No Project details found</h3>}

            {sports && sports.map((sport, index) => (
    <div className='view-formpdfpdf' key={index}>
        <h2>Sports Details {index + 1}</h2>
        <p className='view-fieldpdf'><strong>Event Name:</strong> {sport.event_name}</p>
        <p className='view-fieldpdf'><strong>Award:</strong> {sport.award}</p>
    </div>
))}
            {!sports &&<h3 className='nodatamsg'>No sports details found</h3>}
            {exams && (
    <div className='view-form1'>
        <h2>Exams Attended</h2>
        <p className='view-fieldpdf'><strong>GATE Score:</strong> {exams.GATE_score}</p>
        <p className='view-fieldpdf'><strong>GRE Score:</strong> {exams.GRE_score}</p>
        <p className='view-fieldpdf'><strong>TOEFL Score:</strong> {exams.TOEFL_score}</p>
        <p className='view-fieldpdf'><strong>IELTS Score:</strong> {exams.IELTS_score}</p>
        <p className='view-fieldpdf'><strong>UPSC Score:</strong> {exams.UPSC_score}</p>
        <p className='view-fieldpdf'><strong>NET Score:</strong> {exams.NET_score}</p>
    </div>
)}
            {!exams &&<h3 className='nodatamsg'>No exam details found</h3>}

             
       {papers && papers.map((paper, index) => (
        <div className='view-formpdf' key={index}>
            <h2>Papers Presented {index + 1}</h2>
            <p className='view-fieldpdf'><strong>Title:</strong> {paper.title}</p>
            <p className='view-fieldpdf'><strong>Journal:</strong> {paper.journal}</p>
            <p className='view-fieldpdf'><strong>Date:</strong> {paper.date_year}</p>
            <p className='view-fieldpdf'><strong>DOI link:</strong> {paper.DOI_link}</p>
      
        </div>
    ))}
            {!papers &&<h3 className='nodatamsg'>No paper details found</h3>}
            {events && events.map((event, index) => (
    <div className='view-form1' key={index}>
        <h2>Events Details {index + 1}</h2>
        <p className='view-fieldpdf'><strong>Event Name:</strong> {event.event_name}</p>
        <p className='view-fieldpdf'><strong>Institution Name:</strong> {event.institution}</p>
        <p className='view-fieldpdf'><strong>Role:</strong> {event.role}</p>
        <p className='view-fieldpdf'><strong>Date:</strong> {event.date}</p>
        <p className='view-fieldpdf'><strong>Awards:</strong> {event.awards}</p>
  
    </div>
))}
                {!events &&<h3 className='nodatamsg'>No events details found</h3>}

           </div>
        </div>
    )
}
export default Data;