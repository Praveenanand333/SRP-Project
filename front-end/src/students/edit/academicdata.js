import React, { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import Navbarfun from '../../usercomponents/Navbarfun';

function EditStudentAcademic() {
    const userRef = useRef(null);
    const [basicacademic, setBasicAcademic] = useState(null);
    const [marks, setMarks] = useState(null);
    const [sem, setSem] = useState(null);
    const [newsem, setNewSem] = useState(null);
    const [tenthMarks, setTenthMarks] = useState('');
    const [higherSecondaryMarks, setHigherSecondaryMarks] = useState('');
    const [currentSemester, setCurrentSemester] = useState('');
    const [newSemesterSubjects, setNewSemesterSubjects] = useState([]);


    const handleInputChange = (event) => {
        const { name, value } = event.target;
        if (name === 'sem') {
            setSem(value);
        } else if (name === 'tenthMarks') {
            setTenthMarks(value);
        } else if (name === 'higherSecondaryMarks') {
            setHigherSecondaryMarks(value);
        } else if (name === 'currentSemester') {
            setCurrentSemester(value);
        }
        else if(name=='newsem'){
            setNewSem(value);
            fetchSubjectsForNewSemester(value);
        }
    };
    const fetchSubjectsForNewSemester = (semester) => {
        axios.get(`http://localhost:5000/getsubjects/${semester}`)
            .then(response => {
                if (response.data) {
                    setNewSemesterSubjects(response.data);
                } else {
                    setNewSemesterSubjects([]);
                    alert('No subjects found for the selected semester');
                }
            })
            .catch(error => {
                console.log(error);
            });
    };
    const handleAddMarksForNewSemester = () => {
        // Iterate through newSemesterSubjects and make API calls to add marks for each subject
        newSemesterSubjects.forEach(subject => {
            if (subject.marks < 0 || subject.marks > 100) {
                alert('Marks should be between 0 and 100');
                return;
            }
            
            axios.post(`http://localhost:5000/addmarks/${userRef.current}/${subject.SubjectID}/${newsem}`, { marks: subject.marks })
                .then(response => {
                    console.log('Marks added successfully for subject:', subject.SubjectID);
                    // You can optionally fetch marks again for the new semester to update the marks table
                    axios.get(`http://localhost:5000/getsemestermarks/${userRef.current}/${newsem}`)
                        .then(response => {
                            if (response.data) {
                                setMarks(response.data);
                            } else {
                                alert('No marks found for selected semester');
                            }
                        })
                        .catch(err => {
                            alert(err.message);
                            console.log(err);
                        });
                })
                .catch(error => {
                    console.log(error);
                });
        });
    };
    
    useEffect(() => {
        axios.get('http://localhost:5000/session')
            .then(response => {
                userRef.current = response.data.username;

                axios.get(`http://localhost:5000/basicacademic/${userRef.current}`)
                    .then(response => {
                        if (response.data) {
                            setBasicAcademic(response.data);
                            setTenthMarks(response.data.TenthMarks);
                            setHigherSecondaryMarks(response.data.HigherSecondaryMarks);
                            setCurrentSemester(response.data.CurrentSemester);
                        } else {
                            alert('No academic data found');
                        }
                    })
                    .catch(error => {
                        console.log(error);
                    });

                axios.get(`http://localhost:5000/getsemestermarks/${userRef.current}/${sem}`)
                    .then(response => {
                        if (response.data) {
                            setMarks(response.data);
                        } else {
                            alert('No marks found for selected semester');
                        }
                    })
                    .catch(err => {
                        console.log(err);
                    });
            })
            .catch(error => {
                console.log(error);
            });
    }, [sem]);

    const handleEditMarks = (subjectID, newMarks) => {
        if (newMarks < 0 || newMarks > 100) {
            alert('Marks should be between 0 and 100');
            return;
        }
        axios.put(`http://localhost:5000/editmarks/${userRef.current}/${subjectID}`, { marks: newMarks })
            .then(response => {
                console.log('Marks edited successfully');
                axios.get(`http://localhost:5000/getsemestermarks/${userRef.current}/${sem}`)
                    .then(response => {
                        if (response.data) {
                            setMarks(response.data);
                        } else {
                            alert('No marks found for selected semester');
                        }
                    })
                    .catch(err => {
                        console.log(err);
                    });
            })
            .catch(error => {
                console.log(error);
            });
    };

    const handleEditBasicAcademic = () => {
        // Make API call to edit basic academic details
        axios.put(`http://localhost:5000/editbasicacademic/${userRef.current}`, {
            TenthMarks: tenthMarks,
            HigherSecondaryMarks: higherSecondaryMarks,
            CurrentSemester: currentSemester
        })
        .then(response => {
            console.log('Basic academic details edited successfully');
            setBasicAcademic({
                ...basicacademic,
                TenthMarks: tenthMarks,
                HigherSecondaryMarks: higherSecondaryMarks,
                CurrentSemester: currentSemester
            });
        })
        .catch(error => {
            console.log(error);
        });
    };
    const handleMarksChange = (subjectID, newMarks) => {
        setNewSemesterSubjects(prevSubjects => {
            return prevSubjects.map(subject => {
                if (subject.SubjectID === subjectID) {
                    return { ...subject, marks: newMarks };
                }
                return subject;
            });
        });
    };
    
    return (
        <>
            <Navbarfun />
   
            {basicacademic && <div className='basic-detail'>
                <p>Current Semester : 
                    <input
                        type="text"
                        name="currentSemester"
                        value={currentSemester}
                        onChange={handleInputChange}
                    />
                </p>
                <p>Tenth Marks : 
                    <input
                        type="number"
                        name="tenthMarks"
                        value={tenthMarks}
                        onChange={handleInputChange}
                    />
                </p>
                <p>Higher Secondary Marks : 
                    <input
                        type="number"
                        name="higherSecondaryMarks"
                        value={higherSecondaryMarks}
                        onChange={handleInputChange}
                    />
                </p>
                <button className="add-btn" onClick={handleEditBasicAcademic}>Save Basic Academic Details</button>
            </div>}
            <div>
                <label htmlFor="semSelect">Select Semester:</label>
                <select
                    id="semSelect"
                    name="sem"
                    value={sem || ''}
                    onChange={handleInputChange}
                >
                    <option value="">Select Semester</option>
                    {[...Array(8).keys()].map((num) => (
                        <option key={num + 1} value={num + 1}>{num + 1}</option>
                    ))}
                </select>
                <p>Semester: {sem}</p>
            </div>
            {marks && <div>
                <h2>Marks Table</h2>
                <table className='marks-table'>
                    <thead>
                        <tr>
                            <th>Subject ID</th>
                            <th>Marks Obtained</th>
                            <th>Grade</th>
                            <th>Edit Marks</th>
                        </tr>
                    </thead>
                    <tbody>
                        {marks.map((mark, index) => (
                            <tr key={index}>
                                <td>{mark.SubjectID}</td>
                                <td>{mark.MarksObtained}</td>
                                <td>{mark.Grade}</td>
                                <td>
                                    <input
                                        type="number"
                                        value={mark.MarksObtained}
                                        onChange={(e) => {
                                            const newMarks = e.target.value;
                                            handleEditMarks(mark.SubjectID, newMarks);
                                        }}
                                    />
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>}
            <div>
                        <label htmlFor="newsemSelect">Select New Semester:</label>
                        <select
                            id="newsemSelect"
                            name="newsem"
                            value={newsem || ''}
                            onChange={handleInputChange}
                        >
                            <option value="">Select Semester</option>
                            {[...Array(8).keys()].map((num) => (
                                <option key={num + 1} value={num + 1}>{num + 1}</option>
                            ))}
                        </select>
                        <p>New Semester: {newsem}</p>
                    </div>
          
            {newsem && (
                <>
                   

                    <div>
                    
                        <table>
                            <thead>
                                <tr>
                                    <th>Subject ID</th>
                                    <th>Subject Name</th>
                                    <th>Marks Obtained</th>
                                </tr>
                            </thead>
                            <tbody>
                                {newSemesterSubjects.map(subject => (
                                    <tr key={subject.SubjectID}>
                                        <td>{subject.SubjectID}</td>
                                        <td>{subject.SubjectName}</td>
                                        <td>
                                            <input
                                                type="number"
                                                value={subject.marks || ''}
                                                onChange={(e) => {
                                                    handleMarksChange(subject.SubjectID, e.target.value)
                                                }}
                                            />
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>

                    <button className='add-btn' onClick={handleAddMarksForNewSemester}>Submit Marks for New Semester</button>
                </>
            )}
        </>
    );
}

export default EditStudentAcademic;
