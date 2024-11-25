# Test Plan | Team 4

|Authors|Mathis PASCUCCI|
|---|---|
|Created|11/06/2024|
|Last Modified|11/24/2023|
---
<details>
<summary>Table of Contents</summary>

- [Test Plan | Team 4](#test-plan--team-4)
    - [I. Glossary](#i-glossary)
    - [II. Introduction](#ii-introduction)
        - [1. Overview](#1-overview)
        - [2. Targeted audience](#2-targeted-audience)
            - [Former players](#former-players)
            - [New players](#new-players)
            - [Competitive players](#competitive-players)
        - [3. Technology We Used for the Game](#3-technology-we-used-for-the-game)
    - [III. Testing](#iii-testing)
        - [1. Scope](#1-scope)
            - [Documentation](#documentation)
            - [Gameplay Mechanics](#gameplay-mechanics)
            - [Educational Content](#educational-content)
        - [2. Strategy](#2-strategy)
        - [3. Defining Priorities](#3-defining-priorities)
        - [4. Test Tools](#4-test-tools)
            - [Operating Systems](#operating-systems)
            - [GitHub](#github)
</details>

---

## I. Glossary

| Term | Definition | Source |
| ---- | ---------- | ------ |
|<a id="1">[1]</a> **Smoke test**| A smoke test is a test which checks basic functionalities | [Wikipedia](https://en.wikipedia.org/wiki/Smoke_testing_(software)) |



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


### 3. Technology We Used for the Game

**Game Engine**: [Godot™](https://godotengine.org/)
**Language Used**: [GDScript](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/index.html)
**Designs & Sprites**: Created using [Aseprite™](https://www.aseprite.org/) for pixel art and animation.
**SFX & OST DAWs**: Developed with [FL Studio™](https://www.image-line.com/fl-studio/) and [Ableton™](https://www.ableton.com/fr/live/) for high-quality sound effects and original soundtracks.
**Deployment Platform**: The game will be uploaded to [itch.io](https://itch.io/) to allow players to launch it directly on the web, ensuring accessibility and ease of use.

## III. Testing

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
- **Functional Testing**: Validating key features, such as player actions, question feedback, and activity progression.
- **Exploratory Testing**: Navigating freely across continents to identify unforeseen issues in interactions or performance.

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