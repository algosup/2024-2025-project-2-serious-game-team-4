# Test Plan | Team 4

|Authors|Mathis PASCUCCI|
|---|---|
|Created|11/06/2024|
|Last Modified|11/26/2023|
---
<details>
<summary>Table of Contents</summary>

- [Test Plan | Team 4](#test-plan--team-4)
  - [I. Glossary](#i-glossary)
  - [II. Introduction](#ii-introduction)
    - [1. Overview](#1-overview)
    - [2. Targeted Audience](#2-targeted-audience)
      - [Former Players](#former-players)
      - [New Players](#new-players)
      - [Competitive Players](#competitive-players)
    - [3. Technology Used for the Game](#3-technology-used-for-the-game)
  - [III. Test Criteria](#iii-test-criteria)
    - [a. Critical Bugs](#a-critical-bugs)
    - [1. Entry Criteria](#1-entry-criteria)
    - [2. Exit Criteria](#2-exit-criteria)
  - [IV. Test Strategy](#iv-test-strategy)
    - [1. Scope](#1-scope)
      - [Documentation](#documentation)
      - [Gameplay Mechanics](#gameplay-mechanics)
      - [Educational Content](#educational-content)
    - [2. Strategy](#2-strategy)
    - [3. Defining Priorities](#3-defining-priorities)
    - [4. Test Tools](#4-test-tools)
        - [Operating Systems](#operating-systems)
        - [GitHub](#github)
    - [5. Test Cases](#5-test-cases)
    - [6. Test Reports](#6-test-reports)
  - [V. Test Deliverables](#v-test-deliverables)

</details>

---

## I. Glossary

| Term | Definition | Source |
| ---- | ---------- | ------ |
|<a id="1">[1]</a> **Smoke test**| A smoke test is a test which checks basic functionalities. | [Wikipedia](https://en.wikipedia.org/wiki/Smoke_testing_(software)) |
|<a id="2">[2]</a> **Functional Testing**|  Functional testing is a type of testing that seeks to establish whether each application feature works as per the software requirements. | [Opentext](https://www.opentext.com/what-is/functional-testing#:~:text=Related%20products-,Overview,with%20the%20end%20user's%20expectations.)                                                  |
|<a id="3">[3]</a> **Exploratory Testing**| Exploratory testing is an approach to software testing that is often described as simultaneous learning, test design, and execution.   | [Atlassian](https://www.atlassian.com/continuous-delivery/software-testing/exploratory-testing#:~:text=Exploratory%20testing%20is%20an%20approach,the%20scope%20of%20other%20tests.)    |
---

## II. Introduction

### 1. Overview
Our team has been tasked to develop a serious game focused on raising awareness about climate change and ecological solutions. In this game, the player embodies Terra, a climate-conscious person who decides to take action against the accelerating environmental crisis. Starting from his eco-friendly home, Terra travels across five continents to uncover specific climate challenges affecting each region.

Each continent features a character representing its unique environmental problems. Through dialogue and guided choices, players will learn about these challenges and choose actions to address them, such as planting trees, adopting water-saving techniques, or reducing CO2 emissions. Players gain feedback on their choices and perform activities, visualized through progress bars and CO2 reduction metrics, making the game both informative and engaging.

### 2. Targeted audience
As testers, we need to put ourselves in the users' shoes. This means identifying all the different types of users who might interact with the product. By doing so, we can test the product from various perspectives, ensuring it meets the needs of all user types.

##### Former players
Former players are familiar with serious games or eco-themed educational content. They’ll expect a seamless experience that respects the conventions of educational gaming while providing new insights into sustainability practices. These players will also look for meaningful challenges tied to real-world ecological solutions.

##### New players
New players may not have experience with educational games or ecology themes. They’ll need clear, accessible instructions and an intuitive layout to help them easily understand the game mechanics and its environmental message.

##### Competitive players
Competitive players will look for challenges within the game, such as achieving specific ecological goals or completing tasks efficiently. They’ll appreciate replayable content with rewarding challenges that encourage them to refine their skills in managing resources and making eco-friendly decisions.


### 3. Technology Used for the Game

**Game Engine**: [Godot™](https://godotengine.org/)
**Language Used**: [GDScript](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/index.html)
**Designs & Sprites**: Created using [Aseprite™](https://www.aseprite.org/) for pixel art and animation.
**SFX & OST DAWs**: Developed with [FL Studio™](https://www.image-line.com/fl-studio/) and [Ableton™](https://www.ableton.com/fr/live/) for high-quality sound effects and original soundtracks.
**Deployment Platform**: The game will be uploaded to [itch.io](https://itch.io/) to allow players to launch it directly on the web, ensuring accessibility and ease of use.

---

## III. Test Criteria

### a. Critical Bugs  

Critical bugs are issues that severely impact the functionality or playability of the game. These bugs can prevent the player from progressing, block the implementation of essential features, or cause the game to crash. Examples include:  
- The game freezing or crashing during gameplay.  
- Unresponsive player controls or interactions with the environment.  
- Collisions failing to work properly, allowing Terra to pass through objects.  
- Severe lag or instability when loading the game in a browser environment (via itch.io).  

If a critical bug is identified, all testing efforts will shift to resolving the issue before continuing with further tests or development.  

### 1. Entry Criteria  

Entry criteria outline the conditions required before testing can begin. This ensures that the testing environment is prepared and that the game is in a state ready for meaningful evaluation. The entry criteria for our game include:  

- **Availability of a testable build**: A stable version of the game, hosted on [itch.io](https://itch.io/), should be ready for testing.  
- **Proper testing environment setup**: All tools and resources required for testing must be operational, including browsers for web-based testing, Godot for debugging, and necessary testing frameworks.  
- **Documented test cases**: The test plan should be fully written, with test cases covering core functionalities such as player movement, collisions, and interactions with NPCs.  
- **Team readiness**: Team members involved in testing must be briefed on the objectives and scope of the tests.  

If any of these conditions are not met, testing will be delayed until the environment and resources are properly prepared.  


### 2. Exit Criteria  

Exit criteria define the conditions to be met to conclude the testing phase and confirm the game is ready for release. For our project, the exit criteria are:  

- **Completion of planned tests**: All functional and non-functional tests must be executed as outlined in the test plan.  
- **Requirement coverage**: At least 80% of the functional requirements must be tested and confirmed as working.  
- **Critical bug resolution**: All critical and high-priority bugs, such as game crashes, unresponsive controls, or significant performance issues, must be resolved.  
- **Verification of core features**: Key game features, such as player movement, collision detection, and interactions, must pass all tests.  
- **Reporting of minor issues**: Medium and low-priority bugs must be documented in an issue tracker (e.g., GitHub Issues) for future reference, even if not resolved before release.  
- **Browser compatibility**: The game must function smoothly on major browsers, ensuring accessibility via itch.io without critical loading or performance issues.  

Adhering to these criteria ensures the game meets the expected quality and performance standards for release.

---

## IV. Test Strategy

### 1. Scope
The primary focus of testing will include documentation, gameplay mechanics, and environmental interactions.

#### Documentation
It is critical to ensure that all documentation is accurate, grammatically correct, and complete. This includes game guides, user interfaces, and in-game dialogues. Testing will check for clarity, typographical errors, and alignment with game objectives.

#### Gameplay Mechanics
We’ll test all core mechanics to verify that they align with the intended design and functional specifications:
- Dialogue interactions with continental characters.
- Decision-making mechanics, including feedback on player choices.
- Actionable activities such as planting, watering, or removing pollutants.
- Progress bars and CO2 reduction indicators.
- Game performance on different devices and operating systems (Windows, MacOS).

#### Educational Content
The educational component will be reviewed to ensure that the presented ecological challenges and solutions are accurate, informative, and engaging.

### 2. Strategy
The game’s features will primarily be tested manually, as the variety of interactions and educational elements require attention to detail. This includes:
- **Smoke Testing**<sup><a href="#1">[1]</a></sup>: Ensuring basic functions like character movement, dialogue pop-ups, and progress tracking work correctly.
- **Functional Testing**<sup><a href="#2">[2]</a></sup>: Validating key features, such as player actions, question feedback, and activity progression.
- **Exploratory Testing**<sup><a href="#3">[3]</a></sup>: Navigating freely across continents to identify unforeseen issues in interactions or performance.

### 3. Defining Priorities
Establishing priorities is essential to determine the sequence in which tests should be conducted. These priorities will align with those outlined in the functional specifications. We will categorize priorities into four levels:
- Critical
- High
- Medium
- Low

It’s important to note that priorities are not fixed and may evolve as the project progresses. For instance, a feature initially marked as high-priority might be reassigned to a lower priority if it proves overly ambitious or less impactful than anticipated.

### 4. Test Tools

#### Operating Systems
Team members are using a mix of operating systems for development and testing, including Windows and macOS, ensuring broad compatibility.

#### GitHub
The project is hosted on GitHub, where we utilize the Issues feature to manage test cases and bug reports. This approach enables transparent tracking of tasks and bugs, allowing anyone reviewing the project to see outstanding implementations and reported issues.

### 5. Test Cases
To effectively track testing progress and coverage, an Excel document will be used to document all test cases. This format ensures clarity and accessibility for all team members.

The test case document will include the following key sections:

- **Test Case ID:** A unique identifier for each test case to simplify tracking.
- **Test Case Title:** A concise title that clearly specifies the functionality being tested (e.g., "Player Movement - Up Key").
- **Description:** A brief explanation of the purpose of the test.
- **Test Steps:** Detailed instructions on how to execute the test, such as "Press the Up key and observe Terra's movement."
- **Expected Result:** The expected behavior, e.g., "Terra moves one step upward without any delays or errors."
- **Status:** Indicates whether the test was Passed, Failed, or Blocked.
- **Priority:** Categorizes the test case as Critical, High, Medium, or Low, depending on the feature’s importance or potential impact.

The Excel document will be a shared resource, updated regularly to ensure real-time tracking of test progress. It will help the team identify which functionalities are validated, pending testing, or require further development.

### 6. Test Reports
For bug reporting and management, GitHub Issues will be our primary tool. This platform provides a streamlined way to document, prioritize, and resolve bugs while maintaining transparency within the team.

Each bug report will follow this structure:

- **Title:** A brief and descriptive title summarizing the bug (e.g., "Terra does not move when 'W' key is pressed").
- **Description:** A detailed explanation of the bug, including its impact on gameplay. For example, "Terra is unable to move upward, blocking progress in the level."
- **Steps to Reproduce:** 
Clear steps to replicate the issue, such as:
    - Launch the game.
    - Press the "W" key.
    - Observe Terra’s lack of movement.
- **Expected Result:** Describes the intended behavior, e.g., "Terra should move one step upward when the 'W' key is pressed."
- **Actual Result:** Explains the observed issue, e.g., "Terra remains stationary, ignoring player input."
- **Severity:** Classifies the bug as Critical, High, Medium, or Low based on its impact on the game.
- **Assigned To:** Specifies the team member responsible for resolving the issue.
- **Status:** Tracks the bug’s progress (e.g., Open, In Progress, or Resolved).
- **Comments:** Notes for additional context, including results of retesting after fixes are applied.

Each bug report will be tagged with "Bug" and assigned to the relevant developer for resolution. After a bug fix is implemented, QA will verify the fix and update the issue accordingly.

This system ensures that all bugs are documented, tracked, and resolved efficiently, helping maintain the game's quality and functionality.

---

## V. Test Deliverables
The following deliverables will ensure thorough testing and tracking for the project:

- **Test Plan:** A document that outlines the testing approach, including the scope, types of tests, and reporting procedures.
- **Test Cases:** Step-by-step testing instructions stored in Excel for clarity and tracking, ensuring coverage of all critical game functionalities.
- **Bug Reports:** Detailed documentation of identified bugs using GitHub Issues, ensuring clear communication with developers and efficient resolution.
- **Bug Data Report:** A summary of all identified bugs, providing stakeholders with an overview of the game's current status and progress in resolving issues.

By delivering these materials, we ensure that testing efforts are transparent, organized, and contribute to the overall quality and success of the project.