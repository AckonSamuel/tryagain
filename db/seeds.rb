club_data = [
  {
    "club_name": "Art Club",
    "description": "A club for students interested in creating and appreciating art",
    "meeting_time": "Thursdays at 6 PM",
    "meeting_location": "Room 101, Fine Arts Building",
    "projects": [
      {
        "project_name": "Art Showcase",
        "description": "An annual exhibition of art created by club members",
        "status": "In Planning"
      },
      {
        "project_name": "Community Mural",
        "description": "A mural to be painted in a local community center",
        "status": "In Progress"
      }
    ],
    "achievements": [
      {
        "achievement_name": "First Prize at State Level Art Competition",
        "year": "2020"
      },
      {
        "achievement_name": "Participation at National Level Art Festival",
        "year": "2019"
      }
    ],
    "events": [
      {
        "event_name": "Sketching Workshop",
        "description": "A workshop for teaching basic sketching skills",
        "date": "01/25/2022",
        "location": "Room 102, Fine Arts Building"
      },
      {
        "event_name": "Art and Music Festival",
        "description": "An annual festival featuring art and music performances by club members",
        "date": "03/20/2022",
        "location": "College Quad"
      }
    ]
  },
  {
    "club_name": "Computer Science Club",
    "description": "A club for students interested in computer science and programming",
    "meeting_time": "Mondays at 7 PM",
    "meeting_location": "Room 205, Engineering Building",
    "projects": [
      {
        "project_name": "Hackathon",
        "description": "An annual event where club members collaborate to create software projects",
        "status": "Completed"
      },
      {
        "project_name": "App Development Workshop",
        "description": "A workshop for teaching students how to develop mobile apps",
        "status": "Upcoming"
      }
    ],
    "achievements": [
      {
        "achievement_name": "Won the Hackathon at Regional Level",
        "year": "2020"
      },
      {
        "achievement_name": "Participation at National Level App Development Competition",
        "year": "2019"
      }
    ],
    "events": [
      {
        "event_name": "Programming Workshop",
        "description": "A workshop for teaching basic programming concepts",
        "date": "02/15/2022",
        "location": "Room 205, Engineering Building"
    },
    {
        "event_name": "Codeathon",
        "description": "An annual coding competition for club members",
        "date": "04/10/2022",
        "location": "Computer Science Lab"
      }
    ]
  },
  {
    "club_name": "Environmental Club",
    "description": "A club for students interested in environmental issues and sustainability",
    "meeting_time": "Wednesdays at 5 PM",
    "meeting_location": "Room 301, Science Building",
    "projects": [
      {
        "project_name": "Beach Cleanup",
        "description": "A monthly cleanup of a local beach",
        "status": "Ongoing"
      },
      {
        "project_name": "Solar Panel Installation",
        "description": "Installation of solar panels on campus buildings",
        "status": "Completed"
      }
    ],
    "achievements": [
      {
        "achievement_name": "Best environmental club award at the state level",
        "year": "2020"
      },
      {
        "achievement_name": "Successfully decreased the carbon footprint of the college by 20%",
        "year": "2019"
      }
    ],
    "events": [
      {
        "event_name": "Nature hike",
        "description": "A hike to explore nature and learn about conservation",
        "date": "02/20/2022",
        "location": "Meet at the Student Union"
      },
      {
        "event_name": "Eco-friendly living seminar",
        "description": "A seminar on how to live an eco-friendly lifestyle",
        "date": "04/05/2022",
        "location": "Room 301, Science Building"
      }
    ]
  },
]

club_data.each do |data|
  club = Club.new(
    club_name: data['club_name'],
    description: data['description'],
    meeting_time: data['meeting_time'],
    meeting_location: data['meeting_location']
  )
  club.save!

  data['projects'].each do |project_data|
    project = Project.new(
      club: club,
      project_name: project_data['project_name'],
      description: project_data['description'],
      status: project_data['status']
    )
    project.save!
  end

  data['achievements'].each do |achievement_data|
    achievement = Achievement.new(
      club: club,
      achievement_name: achievement_data['achievement_name'],
      year: achievement_data['year']
    )
    achievement.save!
  end

  data['events'].each do |event_data|
    event = Event.new(
      club: club,
      event_name: event_data['event_name'],
      description: event_data['description'],
      date: event_data['date'],
      location: event_data['location']
    )
    event.save!
  end
end


