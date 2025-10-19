# Faiseur - Requirements Document

## Project Overview
**Project Name:** Faiseur  
**Version:** 0.1.0  
**Last Updated:** October 19, 2025  
**Platforms:** Web, macOS, iOS, Android  
**Backend:** Firebase (Firestore, Authentication, Cloud Functions, Storage)

## Vision Statement
Create a flexible, gamified todo list management system that supports individual and collaborative task management, with template-based workflows, multi-view presentations, and optional gamification features for motivation and engagement.

---

## Core Requirements

### 1. Authentication & User Management (Phase 1)
- **REQ-1.1:** User authentication via Firebase Auth (email/password)
- **REQ-1.2:** Anonymous authentication for initial usage
- **REQ-1.3:** User profile with display name, optional email
- **REQ-1.4:** Username-based user creation (email optional but recommended)
- **REQ-1.5:** Email verification for account security
- **REQ-1.6:** Account linking (connect username to email when user signs up)

### 2. Todo Lists (Phase 1)
- **REQ-2.1:** Create, read, update, delete (CRUD) todo lists
- **REQ-2.2:** Each list has: name, description, creation date, owner
- **REQ-2.3:** List templates with customizable status workflows
- **REQ-2.4:** Default template: New → Assigned → Done
- **REQ-2.5:** Users can create custom templates
- **REQ-2.6:** Tutorial lists and todos provided on first launch

### 3. Todo Items (Phase 1)
- **REQ-3.1:** Create, read, update, delete todo items within lists
- **REQ-3.2:** Single-line todos with emoji support
- **REQ-3.3:** Multi-line todos with rich content
- **REQ-3.4:** Todo properties:
  - Title/Description
  - Status (based on list template)
  - Assigned user(s)
  - Priority (optional)
  - Due date (optional)
  - Creation date
  - Completion date
- **REQ-3.5:** Reorder todos within a list (drag & drop)
- **REQ-3.6:** Filter and sort todos by status, assignee, priority, date

### 4. Status Workflow Management (Phase 2)
- **REQ-4.1:** Template editor to create custom status workflows
- **REQ-4.2:** No restrictions on status transitions by default
- **REQ-4.3:** Optional workflow rules (e.g., cannot skip "In Progress")
- **REQ-4.4:** Color coding for statuses
- **REQ-4.5:** Status analytics (time spent in each status)

### 5. Collaboration Features (Phase 2)
- **REQ-5.1:** Assign todos to users by username
- **REQ-5.2:** Share lists with other users (view, edit permissions)
- **REQ-5.3:** Notification preferences per user:
  - Silent assignment (no notification)
  - Email notification
  - In-app notification
  - Default preference configurable in settings
- **REQ-5.4:** @mention users in todo comments
- **REQ-5.5:** Real-time collaboration (see others' changes live)
- **REQ-5.6:** Activity log per list (who did what, when)

### 6. Email Notifications (Phase 2)
- **REQ-6.1:** Email when todo is assigned (if enabled)
- **REQ-6.2:** Deep link to specific todo in web app
- **REQ-6.3:** Email digest options (immediate, daily, weekly)
- **REQ-6.4:** Unsubscribe from specific list notifications
- **REQ-6.5:** Email templates using Firebase Cloud Functions

### 7. Multiple Views (Phase 3)
- **REQ-7.1:** List view (traditional todo list)
- **REQ-7.2:** Kanban board (columns by status)
- **REQ-7.3:** Card view (grid of todo cards)
- **REQ-7.4:** Sprint view (time-boxed iteration planning)
- **REQ-7.5:** Calendar view (todos by due date)
- **REQ-7.6:** Save preferred view per list
- **REQ-7.7:** Responsive design for all views

### 8. Gamification System (Phase 4)
- **REQ-8.1:** Enable/disable gamification per list
- **REQ-8.2:** Experience points (XP) earned for completing todos
- **REQ-8.3:** Configurable XP values per todo
- **REQ-8.4:** Level system based on total XP
- **REQ-8.5:** Achievements/badges system
- **REQ-8.6:** Reward redemption system:
  - Parents define rewards with XP cost
  - Users request reward redemption
  - Parents approve/deny requests
  - Redemption tracked in dedicated todo list
- **REQ-8.7:** XP history and statistics
- **REQ-8.8:** Leaderboards (optional, per list)

### 9. Reward Management (Phase 4)
- **REQ-9.1:** Rewards catalog per gamified list
- **REQ-9.2:** Reward properties: name, description, XP cost, icon
- **REQ-9.3:** Request reward creates entry in "Rewards Redemption" list
- **REQ-9.4:** Approval workflow:
  - User requests reward
  - Admin/parent gets notification
  - Admin approves/denies with note
  - XP deducted on approval
  - History maintained
- **REQ-9.5:** Recurring rewards vs. one-time rewards

### 10. Settings & Configuration (Phase 1)
- **REQ-10.1:** User preferences:
  - Default notification settings
  - Theme (light/dark/auto)
  - Language preference
  - Default view preference
- **REQ-10.2:** List-specific settings:
  - Notification preferences
  - Collaboration permissions
  - Gamification toggle
  - Template selection
- **REQ-10.3:** App settings page with sections:
  - Account management
  - Notifications
  - Appearance
  - Privacy & Security
  - About

### 11. About & Version Info (Phase 1)
- **REQ-11.1:** About page displaying:
  - App version
  - Release date
  - Build number
  - Open source licenses
- **REQ-11.2:** Changelog accessible from About page
- **REQ-11.3:** Link to GitHub repository
- **REQ-11.4:** Privacy policy and terms of service
- **REQ-11.5:** Contact/support information

### 12. Data Management (Phase 1)
- **REQ-12.1:** Automatic cloud sync via Firestore
- **REQ-12.2:** Offline support (local caching)
- **REQ-12.3:** Conflict resolution for offline changes
- **REQ-12.4:** Data export (JSON, CSV)
- **REQ-12.5:** Data import from common formats
- **REQ-12.6:** Account deletion with data removal

---

## Non-Functional Requirements

### Performance
- **NFR-1:** App launch time < 2 seconds on modern devices
- **NFR-2:** List with 1000 todos loads in < 1 second
- **NFR-3:** Real-time updates appear within 500ms
- **NFR-4:** Smooth 60fps scrolling and animations

### Security
- **NFR-5:** All data encrypted in transit (HTTPS)
- **NFR-6:** Firestore security rules enforce permissions
- **NFR-7:** Email verification required for collaboration
- **NFR-8:** Secure token-based authentication
- **NFR-9:** Regular security audits of Firebase rules

### Scalability
- **NFR-10:** Support 10,000+ users initially
- **NFR-11:** Support lists with 10,000+ items
- **NFR-12:** Firestore query pagination for large datasets
- **NFR-13:** Cloud Functions scale automatically

### Usability
- **NFR-14:** Intuitive UI following platform conventions
- **NFR-15:** Keyboard shortcuts for power users
- **NFR-16:** Accessibility compliance (WCAG 2.1 AA)
- **NFR-17:** Responsive design for all screen sizes
- **NFR-18:** Onboarding tutorial for new users

### Reliability
- **NFR-19:** 99.9% uptime (Firebase SLA)
- **NFR-20:** Graceful error handling with user feedback
- **NFR-21:** Automatic retry for failed operations
- **NFR-22:** Data backup and recovery procedures

### Maintainability
- **NFR-23:** Clean architecture with clear separation of concerns
- **NFR-24:** Comprehensive unit and integration tests (>80% coverage)
- **NFR-25:** Documentation for all public APIs
- **NFR-26:** Consistent code style (enforced by linter)
- **NFR-27:** Version control with semantic versioning

---

## Platform-Specific Requirements

### Web
- **WEB-1:** Progressive Web App (PWA) support
- **WEB-2:** Installable on desktop and mobile browsers
- **WEB-3:** Deep linking support for todo items
- **WEB-4:** Browser notification support

### iOS
- **IOS-1:** App Store compliance
- **IOS-2:** iOS 14+ support
- **IOS-3:** Native iOS notifications
- **IOS-4:** Share sheet integration
- **IOS-5:** Widgets for quick access

### Android
- **AND-1:** Google Play Store compliance
- **AND-2:** Android 8.0+ support
- **AND-3:** Material Design 3 compliance
- **AND-4:** Native Android notifications
- **AND-5:** Widgets for quick access

### macOS
- **MAC-1:** macOS 11+ support
- **MAC-2:** Menu bar integration
- **MAC-3:** Native macOS notifications
- **MAC-4:** Keyboard shortcuts following macOS conventions

---

## Future Considerations (Beyond MVP)

### Integrations
- **FUT-1:** Calendar integration (Google Calendar, Apple Calendar)
- **FUT-2:** Email task creation (send email to create todo)
- **FUT-3:** Slack/Discord notifications
- **FUT-4:** Export to project management tools (Jira, Trello)

### Advanced Features
- **FUT-5:** Subtasks and task dependencies
- **FUT-6:** File attachments per todo
- **FUT-7:** Voice input for creating todos
- **FUT-8:** AI-powered task suggestions
- **FUT-9:** Time tracking per todo
- **FUT-10:** Recurring tasks
- **FUT-11:** Task templates
- **FUT-12:** Batch operations

### Social Features
- **FUT-13:** Public list sharing (view-only link)
- **FUT-14:** List marketplace (share templates)
- **FUT-15:** Social features (follow users, like lists)
- **FUT-16:** Team workspaces

---

## Success Metrics

### User Engagement
- Daily active users (DAU)
- Weekly active users (WAU)
- Monthly active users (MAU)
- Average session duration
- Retention rate (Day 1, Day 7, Day 30)

### Feature Usage
- Lists created per user
- Todos created per user
- Collaboration invites sent/accepted
- Gamification adoption rate
- Views used per list

### Technical Metrics
- App crash rate < 0.1%
- API error rate < 0.5%
- Average API response time < 200ms
- Successful sync rate > 99.5%

### Business Metrics
- User acquisition cost
- App Store ratings (target: 4.5+/5)
- User support tickets per 1000 users
- Time to release new features

---

## Constraints & Assumptions

### Constraints
- Firebase free tier limits during beta
- App store approval requirements
- GDPR and privacy law compliance
- Platform-specific API limitations

### Assumptions
- Users have internet connectivity for full functionality
- Users understand basic todo list concepts
- Firebase infrastructure remains reliable
- Flutter framework continues active development
- Users opt-in to email notifications

---

## Glossary

- **List:** A collection of related todo items
- **Todo:** A single task or action item
- **Template:** A predefined status workflow for lists
- **Status:** The current state of a todo (e.g., New, Done)
- **Workflow:** The allowed transitions between statuses
- **Gamification:** Optional game-like elements (XP, rewards)
- **XP:** Experience Points earned for completing todos
- **Reward:** An incentive redeemable with XP
- **Assignment:** Designating a user responsible for a todo
- **Collaboration:** Multiple users working on the same list
- **Deep Link:** A URL that opens a specific item in the app

---

## Approval

This requirements document serves as the foundation for the Faiseur project. Implementation will proceed in phases as defined in the Implementation Plan.

**Status:** Draft - Pending Review  
**Next Steps:** Review → Design Document → Architecture Document → Implementation Plan
