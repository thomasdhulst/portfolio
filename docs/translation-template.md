# Translation Template

Here's the template of a JSON translation file:

```json
{
  // Personal Information
  "name": "Thomas D'hulst", // Full name (first name and last name)
  "description": "Software Imagineer", // Your professional title or role (e.g., Software Engineer)
  "subDescription": "Flutter Enthusiast", // A brief description of your interests or focus

  // Contact Details
  "contacts": [
    {
      "tooltip": "Github", // Tooltip displayed when hovering or long-pressing the contact icon button
      "url": "https://github.com/thomasdhulst", // URL to open when the contact icon button is tapped, accepts various URL schemes (sms, tel, mailto, https, file)
      "iconCodePoint": "0xf09b", // Unicode code point for the icon (prefix with "0x" for hexadecimal), can be obtained from https://www.fontawesome.com
      "iconFontFamily": "FontAwesomeBrands", // Font family for the icon (e.g., FontAwesomeBrands), can be obtained from https://github.com/fluttercommunity/font_awesome_flutter/blob/32beff2ea1156d62d0c2130b8202b88a9724508f/pubspec.yaml
      "iconFontPackage": "font_awesome_flutter" // Name of the package providing the icon font (here, it's based on Font Awesome)
    }
  ],

  // Resumes
  "resumes": [
    {
      "languageCode": "en", // Language code matching one defined in "languages" key
      "url": "" // URL to open when the corresponding resume language tile is tapped
    }
  ],

  // About Me
  "aboutDescription": "Hello World.", // about text that is displayed in "About Me" section

  // Experiences
  "experiences": [
    {
      "job": "Mobile Developer", // Your job title or role
      "company": "Spotify", // Name of the company you worked at
      "description": "Development of an offline-first mobile.", // Description of your job
      "url": "https://example.com", // URL to open when the experience card is tapped
      "isPresent": true, // Indicates whether the job is your current position
      "startYear": 2022, // Starting year of the job
      "startMonth": 9, // Starting month of the job
      "endYear": 2023, // Ending year of the job (if applicable)
      "endMonth": 8, // Ending month of the job (if applicable)
      "technologies": [
        "Flutter" // Technologies used in this job experience
      ],
      "links": [
        {
          "url": "https://example.com", // URL to open when the corresponding link is tapped
          "display": "Spotify" // Displayed text for the link
        }
      ]
    }
  ],
  "present": "Present", // Text indicating the experience is current

  // Projects
  "projects": [
    {
      "name": "Portfolio", // Name of the project
      "description": "Yes, it's THIS portfolio! \nThis project follows a Riverpod-based Architecture, using a feature-first approach for its structure. It is fully responsive, and supports multiple themes and languages.", // Description of the project
      "url": "https://github.com/Aaldn/portfolio#readme", // URL to open when the project card is tapped
      "iconCodePoint": "0xf09b", // Unicode code point for the icon (prefix with "0x" for hexadecimal), can be obtained from https://www.fontawesome.com
      "iconFontFamily": "FontAwesomeBrands", // Font family for the icon (e.g., FontAwesomeBrands), can be obtained from https://github.com/fluttercommunity/font_awesome_flutter/blob/32beff2ea1156d62d0c2130b8202b88a9724508f/pubspec.yaml
      "iconFontPackage": "font_awesome_flutter", // Name of the package providing the icon font (here, it's based on Font Awesome)
      "screenshotPath": "assets/images/rack.jpg", // screenshot asset path of the project
      "technologies": [
        "Flutter" // Technologies used in this project
      ],
      "links": [
        {
          "url": "https://aladdine.dev", // URL to open when the corresponding link is tapped
          "display": "Inspired by Aladdine Abdou" // Displayed text for the link
        }
      ]
    }
  ],

  // Supported Languages
  "languages": [
    {
      "code": "en", // Language code
      "name": "English", // Display name of the language
      "nativeName": "English" // Native name of the language
    }
  ],

  // Bottom banner
  "bottomBanner": {
    "message": "Open source portfolio -", // Text at the beginning of the "displayLink" part
    "displayLink": "Fork it!", // Text at the end of the "message" part
    "linkUrl": "https://github.com/aaldn/portfolio" // URL to open when the "displayLink" part is tapped
  },

  // Navigation and Section Titles
  "portfolio": "Portfolio", // Title for the app bar
  "homeSectionTitle": "Home", // Text for the home section
  "aboutSectionTitle": "About", // Text for the about section
  "aboutSectionTitleAlt": "About Me", // Alternative text for the about section
  "experienceSectionTitle": "Experience", // Text for the experience section
  "projectsSectionTitle": "Projects", // Text for the projects section
  "resume": "Resume", // Text for the resume button
  "downloadResume": "Download resume", // Title for the resume download dialog

  // Error Messages
  "openUrlError": "Could not open the url", // url error
}
```
