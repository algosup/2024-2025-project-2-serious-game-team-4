# <p style="text-align:center;"> <a style="color:lightgreen">Project 2 Serious Game</a></br> <a style="color:green; font-size: 36px">Functional Specification</a></br><a style="color:orange"> ALGOSUP - Team 4</a></p> 

<details>

**<summary>Team Members</summary>**
| Name             | Picture                                                                                     | Role               | LinkedIn                                                      | GitHub                                           |
|------------------|---------------------------------------------------------------------------------------------|--------------------|---------------------------------------------------------------|--------------------------------------------------|
| Julian Reine     | <img src="https://avatars.githubusercontent.com/u/182214272?v=4" width="75" height="75">  | Project Manager    | [LinkedIn Profile](https://www.linkedin.com/in/julian-reine-b2952632a) | [GitHub Profile](https://github.com/JulianREINE) |
| Ian Laurent      | <img src="https://avatars.githubusercontent.com/u/146005340?v=4" width="75" height="75">  | Program Manager    | [LinkedIn Profile](https://www.linkedin.com/in/ian-h-laurent/)         | [GitHub Profile](https://github.com/Ianlaur)       |
| Raphaël Chiocchi | <img src="https://avatars.githubusercontent.com/u/182256778?v=4" width="75" height="75">  | Software Engineer  | [LinkedIn Profile](https://www.linkedin.com/in/rapha%C3%ABl-chiocchi-50169632a/)  | [GitHub Profile](https://github.com/Raphaneuil?tab=following)     |
| Mariem Zaiane    | <img src="https://avatars.githubusercontent.com/u/159240038?v=4" width="75" height="75">  | Technical Lead     | [LinkedIn Profile](https://www.linkedin.com/in/mariem-zaiane-2b2165225)     | [GitHub Profile](https://github.com/Mariem-Zaiane)      |
| Emilien Chinsy   | <img src="https://avatars.githubusercontent.com/u/182214919?v=4" width="75" height="75">  | Technical Writer   | [LinkedIn Profile](https://www.linkedin.com/in/emilien-chinsy-5a794632b/)    | [GitHub Profile](https://github.com/EmilienChinsy)     |
| Mathis Pascucci  | <img src="https://avatars.githubusercontent.com/u/182209815?v=4" width="75" height="75">  | Quality Assurance  | [LinkedIn Profile](https://www.linkedin.com/in/mathis-pascucci-8b759732a/)   | [GitHub Profile](https://github.com/Mathis441)      |
</details>

<details>

**<summary> Table of content</summary>**



1. [Introduction](#1-introduction)

    [1.1 Project Overview](#11-project-overview)

    [1.2 Purpose of the Document](#12-purpose-of-the-document)

    [1.3 Scope of the Project](#13-scope-of-the-project)

    [1.4 Objectives and Goals](#14-objectives-and-goals)

    [1.5 Stakeholders](#15-stakeholders)



2. [Project Description](#2-project-description)

    [2.1 Problem Statement](#21-problem-statement)

    [2.2 Solution Overview](#22-solution-overview)

    [2.3 Key Features and Functionalities](#23-key-features-and-functionalities)

    [2.4 Assumptions and Dependencies](#24-assumptions-and-dependencies)

3. [Functional Requirements](#3-functional-requirements)

    [3.1 System Requirements](#31-system-requirements)

    [3.2 User Requirements](#32-user-requirements)

    [3.3 Specific Feature Descriptions](#33-specific-feature-descriptions)

    [3.4 Non-functional Requirements (performance, scalability, security...)](#34-non-functional-requirements-performance-scalability-security)
4. [System Architecture and Design](#4-system-architecture-and-design)

    [4.1 Overall System Architecture](#41-overall-system-architecture)

    [4.2 Modules and Components](#42-modules-and-components)

    [4.3 User Interface (UI) Design (Responsiveness, Player-Centric Design...)](#43-user-interface-ui-design-responsiveness-player-centric-design)

5. [User Interaction and Design](#5-user-interaction-and-design)

    [5.1 User Interface Requirements](#51-user-interface-requirements)

    [5.2 User Journey and Use Case Diagrams](#52-user-journey-and-use-case-diagrams)

    [5.3 Mockups or Wireframes (W.I.P.)](#53-mockups-or-wireframes-wip)

6. [Performance Requirements](#6-performance-requirements)

    [6.1 Speed and Latency](#61-speed-and-latency)

    [6.2 Scalability](#62-scalability)

    [6.3 Reliability and Availability](#63-reliability-and-availability)

7. [Security Requirements](#7-security-requirements)

    [7.1 Licence](#71-licence)

    [7.2 Compliance with Standards](#72-compliance-with-standards)

8. [Testing and Validation](#8-testing-and-validation)

    [8.1 Test Plan Layout](#81-test-plan-layout)

    [8.2 Functional Testing Scenarios](#82-functional-testing-scenarios)

    [8.3 Non-functional Testing Scenarios (load testing, security testing...)](#83-non-functional-testing-scenarios-load-testing-security-testing)


9. [Deployment and Maintenance](#9-deployment-and-maintenance)

    [9.1 Deployment Strategy](#91-deployment-strategy)

    [9.2 Maintenance Plan](#92-maintenance-plan)

    [9.3 Public Documentation](#93-documentation-and-training-requirements)

10. [Appendices](#10-appendices)

    [10.1 Glossary of Terms](#101-glossary-of-terms)

    [10.2 References](#102-references)

    [10.3 Supporting Documents (detailed design diagrams, research notes...)](#103-supporting-documents-detailed-design-diagrams-research-notes)

</details>






## 1. introduction


### 1.1 Project overview
This project involves the development of a serious educational game designed to teach players about climate change and its environmental impacts. The game will focus on key concepts such as global warming, the role of greenhouse gases, carbon footprints, and the importance of sustainable practices. Set in a small village, the player follows the journey of a character, Marie, as she explores her surroundings and learns how everyday actions can influence the environment. Through interactive gameplay, players will gain a deeper understanding of how human activities contribute to climate change and how making informed, eco-conscious decisions can help mitigate its effects.

The game’s goal is to provide a fun and engaging platform for learning complex climate science topics. It will target a diverse audience, offering tailored experiences to different user groups, such as middle school students, urban adults, and even political leaders in developing countries. The game is intended to serve as both an educational tool and a catalyst for real-world behavior change, fostering greater awareness and action around climate change.

### 1.2 Purpose of the Document
The purpose of this document is to outline the functional specifications for the development of an educational game focused on climate change. It will serve as a guide for the development process, detailing the features, requirements, and design principles necessary for creating a game that is both educational and engaging. This document defines the scope and objectives of the game, establishes clear functional and non-functional requirements, and provides direction on the system architecture, user interface, and user experience. The goal is to ensure that all aspects of the game are well-defined and aligned with the overall educational mission, meeting the expectations set by the project overseer, such as Franck JEANNIN, our school principal.

### 1.3 Scope of the Project
The scope of this project includes the development of an educational game designed to teach players about climate change, focusing on key environmental concepts such as global warming, greenhouse gases, and carbon footprints. The game will feature an interactive narrative where players learn about sustainability and eco-friendly practices through the journey of a central character, Marie.

**Key aspects of the project include:**

- Game Development: Design, implementation, and testing of the game using the Godot engine.

- Educational Content: Integration of climate change topics, including global warming, the impact of human activities on the environment, actions that can mitigate climate change, the consequences of overconsumption of resources, and the relationship between overpopulation and environmental degradation.

- Target Audience: The game will be designed to cater to middle school students, urban adults, and policymakers, with content adaptable for these different groups.

- Interactivity: Players will engage in tasks like recycling, repairing items, and making sustainable decisions that affect the virtual environment.

- Platform: The game will be designed for desktop and web-based platforms.

**Out of scope:**

- While waste sorting and other eco-friendly actions will be included in the game, they will be presented as part of a broader educational context on sustainability and climate change, rather than as a primary focus.

- The game will not include multiplayer modes or complex real-time simulations.

- No external funding is involved, and the project will be developed strictly as an educational tool for ALGOSUP SAS.

### 1.4 Objectives and Goals
The primary objective of this project is to create an educational game that raises awareness about climate change and sustainability. Through an interactive narrative, players will explore environmental issues by following the journey of the main character, Marie, and her transformation as she learns about eco-friendly practices. The main goals are as follows:

- **<u>Raise Awareness:</u>** Educate players about the science of climate change, including global warming, greenhouse gases, carbon footprints, and the environmental impact of human activities, all through the lens of the character’s experience.

- **<u>Promote Action:</u>** Encourage players to take responsibility for their actions by showing how small, everyday decisions can affect the environment. Through Marie’s journey, players will be inspired to make sustainable choices, such as repairing broken items, recycling, and minimizing waste.

- **<u>Engage through Interactive Storytelling:</u>** Use Marie’s character development to create an emotional connection with players. As they help Marie learn and grow, players will become more engaged with the educational content and motivated to adopt sustainable behaviors themselves.

- **<u>Empower Decision-Making:</u>** Enable players to see the consequences of their actions as they guide Marie through various scenarios. This will help players understand the long-term impact of their decisions on the environment and give them a sense of agency in tackling climate change.

By achieving these goals, the game will aim to foster a deeper understanding of climate change, while also empowering players to take actionable steps toward sustainability, inspired by the personal growth of the central character, Marie.

### 1.5 Stakeholders

The key stakeholders for this project are:

- **<u>Franck JEANNIN</u>** (School Principal): As the principal, Franck JEANNIN is the client who assigned the project to the school. He will be the primary recipient of the final product and will assess whether it meets the educational objectives set for the project.

- **<u>Teachers and Educators:</u>** Teachers are guiding the team through the learning process, specifically helping with mastering Godot and assisting in preparing the team for the final project presentation to Franck JEANNIN and the jury. They provide crucial support for the technical and presentation aspects of the project.

- **<u>Potential Future Partners (e.g. Environmental Organizations):</u>** In the future, the game could expand to partner with environmental organizations, NGOs, or other schools that focus on climate education and advocacy.

## 2. Project Description

### 2.1 Problem Statement
Climate change is one of the most urgent challenges the world faces today. While most people are aware of it, many still struggle to fully understand the science behind it or why it’s so important. Key concepts like greenhouse gases, carbon footprints, and overconsumption of resources can be difficult to grasp, especially for younger audiences or those not familiar with environmental issues.

Traditional teaching methods often fail to make these complex ideas relatable or engaging. As a result, people may not realize how their everyday actions—such as driving a car, wasting food, or using energy—affect the environment. Without a clear understanding of the problem, it’s hard for individuals to feel motivated to change their habits.

To tackle this, there’s a need for a new approach: one that makes learning about climate change not only informative but also engaging. A serious game offers a unique opportunity to present these important concepts in a way that’s interactive and fun. By directly involving players in decision-making and showing the impact of their actions on the environment, the game will be their call for action which can help them understand the gravity of the situation and inspire real-world change.

### 2.2 Solution Overview
The game is designed to provide an interactive way for players to learn about climate change and its environmental impacts. Through the story of Marie, players will experience how everyday actions contribute to larger environmental issues. By making choices and seeing their outcomes, players will understand how their actions can have a positive or negative impact on the planet.

Developed using <u>Godot</u>, the game will combine educational content with engaging gameplay to make complex topics more accessible. By exploring real-world challenges and solutions in a virtual environment, players will gain a deeper understanding of climate change and how they can contribute to creating a more sustainable future.

### 2.3 Key Features and Functionalities

The game will offer a series of interactive features that aim to engage players while teaching them about climate change. The key functionalities include:

1.	**<u>Character-driven Narrative:</u>** Players will follow the journey of Marie, who learns about environmental sustainability through everyday decisions. Her story will guide the player through different aspects of climate science, making the concepts relatable and engaging.

2.	**<u>Decision-making and Consequences:</u>** Throughout the game, players will be presented with choices that affect the environment and the progression of the story. These decisions will illustrate the real-world impact of actions such as waste management, energy consumption, and resource use.

3.	**<u>Exploration of Different Scenarios:</u>** Players will navigate various environments, such as Marie’s village and community projects, where they can engage in activities like recycling, composting, and adopting renewable energy practices.

4.	**<u>Feedback Mechanism:</u>** The game will provide feedback on player decisions, showing how each choice contributes to or mitigates climate change. This feedback will help reinforce the importance of each action in real-world environmental contexts.

5.	**<u>Educational Content Integration:</u>** Key concepts such as carbon footprints, greenhouse gases, and sustainable practices will be integrated into the gameplay, helping players understand how their everyday behaviors can impact the environment.

6.	**<u>Progressive Learning:</u>** As the game progresses, the complexity of the challenges will increase, offering deeper insights into climate change science and solutions. The goal is to keep players engaged while continuously expanding their understanding of the topic.

These features combine to create an immersive learning experience that makes complex environmental concepts more accessible and actionable for players.

### 2.4 Assumptions and Dependencies
When developing this game, there are a few key assumptions and dependencies that the team considered:

1.	Basic Understanding of Climate Change: We assume that players have a general awareness of climate change and environmental issues. The game is meant to expand on this knowledge, but having a basic understanding helps players engage more deeply with the content and ease the gameplay.

2.	Access to Devices: The game assumes players will have access to a computer or device that can run the Godot engine. This includes having the necessary hardware and software to run the game smoothly. **Disclaimer:** This assumption depends on the decision of the team on how the game will be deployed. please refer to [section 9] (#9.Deployment and Maintenance)
## 3. Functional Requirements

### 3.1 System Requirements

### 3.2 User Requirements

### 3.3 Specific Feature Descriptions

### 3.4 Non-functional Requirements (performance, scalability, security...)

## 4. System Architecture and Design

### 4.1 Overall System Architecture

### 4.2 Modules and Components

### 4.3 User Interface (UI) Design (Responsiveness, Player-Centric Design...)

## 5. User Interaction and Design

### 5.1 User Interface Requirements

### 5.2 User Journey and Use Case Diagrams

### 5.3 Mockups or Wireframes (W.I.P.)

## 6. Performance Requirements

### 6.1 Speed and Latency

### 6.2 Scalability

### 6.3 Reliability and Availability

## 7. Security Requirements

### 7.1 Licence

### 7.2 Compliance with Standards

## 8. Testing and Validation

### 8.1 Test Plan Layout

### 8.2 Functional Testing Scenarios

### 8.3 Non-functional Testing Scenarios (load testing, security testing...)

## 9. Deployment and Maintenance

### 9.1 Deployment Strategy

### 9.2 Maintenance Plan

### 9.3 Public Documentation

## 10. Appendices

### 10.1 Glossary of Terms

### 10.2 References

### 10.3 Supporting Documents (detailed design diagrams, research notes...)

