# Faiseur - Design Document

## Document Information

**Version:** 0.1.0  
**Last Updated:** October 19, 2025  
**Status:** Draft - Pending Review

---

## Table of Contents

1. [Design Philosophy](#design-philosophy)
2. [User Experience (UX) Design](#user-experience-ux-design)
3. [User Interface (UI) Design](#user-interface-ui-design)
4. [Navigation Design](#navigation-design)
5. [Screen Designs](#screen-designs)
6. [Interaction Design](#interaction-design)
7. [Visual Design System](#visual-design-system)
8. [Responsive Design](#responsive-design)
9. [Accessibility Design](#accessibility-design)
10. [Platform-Specific Design](#platform-specific-design)

---

## Design Philosophy

### Core Principles

1. **Simplicity First**: The app should be immediately usable without tutorials for basic functionality
2. **Progressive Disclosure**: Advanced features revealed as users need them
3. **Flexibility**: Support various workflows without imposing rigid structures
4. **Delightful Interactions**: Smooth animations and satisfying micro-interactions
5. **Platform Native**: Feel native to each platform while maintaining consistent branding

### Design Goals

- **Minimize cognitive load**: Clear hierarchy, familiar patterns
- **Support flow state**: Minimal distractions, quick actions
- **Enable collaboration**: Clear indicators of others' presence and actions
- **Motivate completion**: Gamification elements that encourage without overwhelming

---

## User Experience (UX) Design

### User Personas

#### Persona 1: Busy Parent (Sarah)
- **Age**: 35-45
- **Goal**: Manage family tasks and motivate children
- **Pain Points**: Kids lose motivation, hard to track chores
- **Features Used**: Gamification, rewards, collaborative lists
- **Devices**: iPhone, Web

#### Persona 2: Independent Professional (Marcus)
- **Age**: 28-35
- **Goal**: Organize personal and work projects
- **Pain Points**: Too many tools, context switching
- **Features Used**: Multiple views, templates, status workflows
- **Devices**: macOS, Android, Web

#### Persona 3: Student (Emma)
- **Age**: 18-25
- **Goal**: Track assignments and personal goals
- **Pain Points**: Procrastination, overwhelm
- **Features Used**: Gamification, calendar view, priorities
- **Devices**: Web, iOS

#### Persona 4: Small Team Lead (Alex)
- **Age**: 30-40
- **Goal**: Coordinate small team tasks
- **Pain Points**: Lack of visibility, notification overload
- **Features Used**: Collaboration, kanban view, assignments
- **Devices**: Web, macOS

### User Journeys

#### Journey 1: First-Time User Onboarding

```
1. Launch app → See welcome screen with sample lists
2. Explore tutorial list → Understand basic concepts
3. Create first list → Choose template or start blank
4. Add first todo → See it appear instantly
5. Complete todo → Experience completion animation
6. Explore settings → Customize notifications
```

#### Journey 2: Creating a Collaborative List

```
1. Tap "New List" → Enter list details
2. Choose template → Select status workflow
3. Enable sharing → Add collaborators by username
4. Create todos → Assign to team members
5. Configure notifications → Set per-user preferences
6. Switch to Kanban view → See overview
```

#### Journey 3: Gamified List for Child

```
1. Create new list → Enable gamification
2. Set up rewards → Define XP values and rewards
3. Create todos → Assign XP to each
4. Child completes todo → Earns XP with animation
5. Child requests reward → Parent receives notification
6. Parent approves → XP deducted, reward granted
```

### Information Architecture

```
App Root
├── Lists Home (Default)
│   ├── My Lists
│   ├── Shared with Me
│   └── Archived Lists
├── List Detail
│   ├── List Info
│   ├── Todo Items
│   │   ├── List View
│   │   ├── Kanban View
│   │   ├── Card View
│   │   ├── Sprint View
│   │   └── Calendar View
│   ├── Members
│   ├── Activity Log
│   └── List Settings
├── Templates
│   ├── My Templates
│   └── Create Template
├── Rewards (if gamified)
│   ├── Rewards Catalog
│   ├── Redemption Requests
│   └── XP History
├── Settings
│   ├── Account
│   ├── Notifications
│   ├── Appearance
│   ├── Privacy & Security
│   └── About
└── About
    ├── Version Info
    ├── Changelog
    └── Licenses
```

---

## User Interface (UI) Design

### Layout Principles

1. **Adaptive Layouts**: Single column (mobile) → Two column (tablet) → Three column (desktop)
2. **F-Pattern Reading**: Important actions top-left, content flows left-to-right
3. **Thumb Zones**: Primary actions in easy-to-reach areas on mobile
4. **Visual Hierarchy**: Size, color, spacing create clear importance levels

### Component Library

#### Primary Components

**1. List Card**
- List name (bold, 18sp)
- Item count badge
- Progress indicator (circular)
- Last updated timestamp
- Collaborator avatars (max 3, then +N)
- Gamification badge (if enabled)

**2. Todo Item**
- Checkbox/status indicator
- Title (single or multi-line)
- Assignee avatar (small, 24dp)
- Due date badge (if set)
- Priority indicator (color accent)
- XP badge (if gamified)
- Quick actions (swipe reveal)

**3. Status Column (Kanban)**
- Status name with count
- Color-coded header
- Scrollable todo cards
- Add button at bottom

**4. Template Card**
- Template name
- Preview of status workflow
- Usage count
- Edit/Delete actions

**5. Reward Item**
- Reward icon/emoji
- Reward name
- XP cost badge
- Request button
- Lock indicator (if insufficient XP)

### Color System

#### Brand Colors
- **Primary**: `#6366F1` (Indigo) - Main actions, key UI elements
- **Secondary**: `#8B5CF6` (Purple) - Accents, gamification
- **Success**: `#10B981` (Green) - Completion, positive actions
- **Warning**: `#F59E0B` (Amber) - Due soon, attention needed
- **Error**: `#EF4444` (Red) - Errors, destructive actions
- **Info**: `#3B82F6` (Blue) - Informational elements

#### Semantic Colors
- **Background**: `#FFFFFF` (light) / `#1F2937` (dark)
- **Surface**: `#F9FAFB` (light) / `#111827` (dark)
- **Text Primary**: `#111827` (light) / `#F9FAFB` (dark)
- **Text Secondary**: `#6B7280` (light) / `#9CA3AF` (dark)
- **Divider**: `#E5E7EB` (light) / `#374151` (dark)

#### Status Colors (Customizable per template)
- **New**: `#94A3B8` (Slate)
- **In Progress**: `#3B82F6` (Blue)
- **Review**: `#F59E0B` (Amber)
- **Done**: `#10B981` (Green)
- **Blocked**: `#EF4444` (Red)

### Typography

**Font Family**: System Fonts (SF Pro on iOS/macOS, Roboto on Android, -apple-system on Web)

#### Text Styles
- **Headline Large**: 32sp, Bold, Display titles
- **Headline Medium**: 24sp, Bold, Screen titles
- **Title**: 20sp, Semibold, Card titles
- **Body Large**: 16sp, Regular, Primary content
- **Body**: 14sp, Regular, Secondary content
- **Label**: 12sp, Medium, Captions, timestamps
- **Button**: 16sp, Semibold, Buttons

### Iconography

- **Style**: Rounded, 24dp default size
- **Library**: Material Symbols (Rounded variant)
- **Custom Icons**: Gamification elements (XP, levels, badges)

### Spacing System

Based on 8dp grid:
- **xs**: 4dp
- **sm**: 8dp
- **md**: 16dp
- **lg**: 24dp
- **xl**: 32dp
- **2xl**: 48dp

### Elevation & Shadows

**Material Design 3 Elevation**
- **Level 0**: No shadow (default background)
- **Level 1**: Cards, app bar
- **Level 2**: FAB, dialogs
- **Level 3**: Dropdowns, tooltips
- **Level 4**: Modal sheets

---

## Navigation Design

### Navigation Pattern

**Adaptive Navigation**: Changes based on screen size and platform

#### Mobile (< 600dp)
- **Bottom Navigation Bar** (5 items max):
  - Home (Lists)
  - Templates
  - Rewards (if gamified list active)
  - Settings
- **App Bar**: Context-specific actions, search
- **Floating Action Button**: Primary action (New List/Todo)

#### Tablet (600dp - 1000dp)
- **Navigation Rail** (left side):
  - Same items as bottom nav
  - Text labels visible
- **Two-pane layout**: List + Detail side-by-side

#### Desktop (> 1000dp)
- **Navigation Drawer** (permanent, left):
  - Expanded view with labels
  - Section headers
- **Three-pane layout**: Nav + List + Detail

### Deep Linking

**URL Structure**:
```
https://faiseur.app/
├── /lists                    # Lists home
├── /lists/:listId            # Specific list
├── /lists/:listId/:todoId    # Specific todo
├── /templates                # Templates
├── /templates/:templateId    # Specific template
├── /rewards                  # Rewards
└── /settings                 # Settings
```

---

## Screen Designs

### 1. Lists Home Screen

**Purpose**: Central hub for accessing all lists

**Layout**:
```
┌─────────────────────────────┐
│ [App Bar]                   │
│ Faiseur         [Search] [+]│
├─────────────────────────────┤
│ [Tab Bar]                   │
│ My Lists | Shared | Archived│
├─────────────────────────────┤
│ ┌─────────────────────────┐ │
│ │ [List Card]             │ │
│ │ Work Tasks        80%   │ │
│ │ 12 items • Updated 2h   │ │
│ │ [@Alex @Jamie]          │ │
│ └─────────────────────────┘ │
│ ┌─────────────────────────┐ │
│ │ [List Card]             │ │
│ │ Home Chores    [XP]     │ │
│ │ 5 items • Updated 1d    │ │
│ └─────────────────────────┘ │
│                             │
│ [+ New List] FAB            │
└─────────────────────────────┘
```

**Interactions**:
- Tap list → Open list detail
- Long press → Context menu (Edit, Share, Archive, Delete)
- Pull to refresh → Sync with server
- Swipe list card → Quick actions (Archive, Duplicate)
- Tap FAB → Create new list dialog

### 2. List Detail Screen

**Purpose**: View and manage todos within a list

**Layout (List View)**:
```
┌─────────────────────────────┐
│ [App Bar]                   │
│ < Work Tasks    [⋮] [View]  │
├─────────────────────────────┤
│ [Filter Chips]              │
│ [All] [My Tasks] [Overdue]  │
├─────────────────────────────┤
│ ┌─────────────────────────┐ │
│ │ [ ] Todo title          │ │
│ │     @Alex • Due: Today  │ │
│ │     [Priority badge]    │ │
│ └─────────────────────────┘ │
│ ┌─────────────────────────┐ │
│ │ [✓] Completed todo      │ │
│ │     @Jamie • Done 2h ago│ │
│ └─────────────────────────┘ │
│                             │
│ [+ Add Todo] FAB            │
└─────────────────────────────┘
```

**View Options**:
- List: Traditional linear list
- Kanban: Columns by status
- Card: Grid of cards
- Sprint: Time-boxed iterations
- Calendar: Due dates on calendar

**Interactions**:
- Tap todo → Expand details
- Tap checkbox → Toggle status
- Long press → Multi-select mode
- Swipe right → Complete
- Swipe left → Delete/Archive
- Drag handle → Reorder

### 3. Todo Detail Sheet

**Purpose**: View and edit todo details

**Layout**:
```
┌─────────────────────────────┐
│ [Handle]                    │
│                             │
│ [────────────────]          │
│ Todo Title                  │
│                             │
│ [Status Dropdown]           │
│ ● In Progress               │
│                             │
│ [Description]               │
│ Multi-line description...   │
│                             │
│ [Assignee] @Alex            │
│ [Priority] High             │
│ [Due Date] Oct 25, 2025     │
│ [XP Value] 10 XP            │
│                             │
│ [Comments]                  │
│ @Jamie: Looks good!         │
│                             │
│ [Attachments] (Future)      │
│                             │
│ [Delete]      [Save]        │
└─────────────────────────────┘
```

**Interactions**:
- Drag down → Dismiss
- Tap fields → Edit inline
- @mention → Tag collaborator
- Change status → Update with animation

### 4. Kanban View

**Purpose**: Visualize workflow and progress

**Layout**:
```
┌─────────────────────────────────────────────┐
│ [App Bar]                                   │
│ < Work Tasks                    [⋮] [View]  │
├─────────────────────────────────────────────┤
│ [Horizontally scrollable columns]           │
│ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐        │
│ │ New  │ │ Prog │ │Review│ │ Done │        │
│ │  3   │ │  5   │ │  2   │ │  12  │        │
│ ├──────┤ ├──────┤ ├──────┤ ├──────┤        │
│ │[Card]│ │[Card]│ │[Card]│ │[Card]│        │
│ │      │ │      │ │      │ │      │        │
│ │[Card]│ │[Card]│ │      │ │[Card]│        │
│ │      │ │      │ │      │ │      │        │
│ │  +   │ │  +   │ │  +   │ │  +   │        │
│ └──────┘ └──────┘ └──────┘ └──────┘        │
└─────────────────────────────────────────────┘
```

**Interactions**:
- Drag card → Move between columns
- Tap card → Open detail sheet
- Horizontal scroll → View all columns
- Tap + → Add todo to column

### 5. Template Editor

**Purpose**: Create and customize list templates

**Layout**:
```
┌─────────────────────────────┐
│ [App Bar]                   │
│ < New Template      [Save]  │
├─────────────────────────────┤
│ [Template Name]             │
│ Sprint Planning             │
│                             │
│ [Description]               │
│ For agile sprint work       │
│                             │
│ [Status Workflow]           │
│ ┌─────────────────────────┐ │
│ │ 1. Backlog       [Edit] │ │
│ │ 2. Sprint        [Edit] │ │
│ │ 3. In Progress   [Edit] │ │
│ │ 4. Review        [Edit] │ │
│ │ 5. Done          [Edit] │ │
│ │ [+ Add Status]          │ │
│ └─────────────────────────┘ │
│                             │
│ [Workflow Rules]            │
│ ☐ Restrict status changes  │
│ ☐ Require assignment        │
│                             │
│ [Gamification]              │
│ ☑ Enable for this template │
│                             │
└─────────────────────────────┘
```

### 6. Rewards Screen

**Purpose**: Manage rewards and redemptions

**Layout**:
```
┌─────────────────────────────┐
│ [App Bar]                   │
│ Rewards              [Edit] │
├─────────────────────────────┤
│ [XP Balance Card]           │
│ Total XP: 245               │
│ Level 12                    │
│ [Progress bar to Level 13]  │
├─────────────────────────────┤
│ [Tab Bar]                   │
│ Rewards | Requests | History│
├─────────────────────────────┤
│ ┌─────────────────────────┐ │
│ │ 🎮 Reward Name          │ │
│ │ 1 hour gaming time      │ │
│ │ 100 XP      [Request]   │ │
│ └─────────────────────────┘ │
│ ┌─────────────────────────┐ │
│ │ 🍕 Reward Name   [🔒]   │ │
│ │ Pizza night             │ │
│ │ 500 XP (need 255 more)  │ │
│ └─────────────────────────┘ │
│                             │
└─────────────────────────────┘
```

**Redemption Request Flow**:
```
1. User taps [Request]
2. Confirmation dialog appears
3. On confirm → Request created in "Redemption Requests" list
4. Parent/admin receives notification
5. Parent reviews request
6. Approve → XP deducted, todo marked complete
7. Deny → XP refunded, todo marked with reason
```

### 7. Settings Screen

**Purpose**: Configure app and user preferences

**Layout**:
```
┌─────────────────────────────┐
│ [App Bar]                   │
│ < Settings                  │
├─────────────────────────────┤
│ [Account Section]           │
│ [@Username]                 │
│ user@email.com              │
│ Edit Profile                │
├─────────────────────────────┤
│ Notifications               │
│ Appearance                  │
│ Privacy & Security          │
│ Data Management             │
│ About                       │
├─────────────────────────────┤
│ [Account Actions]           │
│ Sign Out                    │
│ Delete Account              │
└─────────────────────────────┘
```

### 8. About Screen

**Purpose**: Display app information

**Layout**:
```
┌─────────────────────────────┐
│ [App Bar]                   │
│ < About                     │
├─────────────────────────────┤
│     [App Icon]              │
│                             │
│     Faiseur                 │
│     Version 0.1.0           │
│     Build 1                 │
│     Released: Oct 19, 2025  │
├─────────────────────────────┤
│ Changelog                   │
│ GitHub Repository           │
│ Privacy Policy              │
│ Terms of Service            │
│ Open Source Licenses        │
│ Support                     │
├─────────────────────────────┤
│ Made with ❤️ by [Team]      │
└─────────────────────────────┘
```

---

## Interaction Design

### Micro-interactions

**1. Todo Completion**
- Checkbox animates with scale and color transition
- Confetti burst animation (if gamified)
- XP badge flies up with counter animation
- Haptic feedback (mobile)

**2. List Creation**
- Card materializes with scale-up animation
- Smooth transition to edit mode
- Auto-focus on name field

**3. Drag & Drop**
- Item lifts with elevation increase
- Shadow grows
- Drop targets highlight
- Snap into place with spring animation

**4. Status Change**
- Smooth color transition
- Movement animation in Kanban view
- Ripple effect from touch point

**5. Loading States**
- Skeleton screens for initial load
- Shimmer effect on placeholders
- Progressive loading (visible content first)

### Gestures

**Mobile Gestures**:
- **Swipe right on todo**: Mark complete
- **Swipe left on todo**: Delete/Archive
- **Long press on list**: Context menu
- **Pull to refresh**: Sync data
- **Pinch on Kanban**: Zoom in/out

**Desktop Interactions**:
- **Hover states**: Subtle color changes
- **Click and drag**: Reorder items
- **Keyboard shortcuts**: Quick actions
- **Right-click**: Context menus

### Feedback Mechanisms

**Visual Feedback**:
- Button press: Ripple effect
- Success: Green checkmark animation
- Error: Red shake animation
- Loading: Progress indicators

**Haptic Feedback** (Mobile):
- Light tap: UI interactions
- Medium tap: Confirmations
- Heavy tap: Errors or warnings
- Success: Notification pattern

**Audio Feedback** (Optional):
- Completion sound: Satisfying "done" chime
- Level up: Achievement sound
- Error: Gentle alert tone

---

## Visual Design System

### Component States

**Interactive Components** (buttons, cards, etc.)
- **Default**: Normal appearance
- **Hover**: Slight color change, cursor change
- **Pressed**: Scale down slightly, darken
- **Focused**: Border/outline for keyboard navigation
- **Disabled**: Reduced opacity (40%)
- **Loading**: Progress indicator overlay

### Animation Guidelines

**Principles**:
- **Duration**: 200-300ms for most interactions
- **Easing**: Ease-out for entrances, ease-in for exits
- **Purpose**: Every animation should serve a purpose
- **Performance**: 60fps minimum, optimize for 120fps

**Animation Timing**:
- **Fast** (100-150ms): Button presses, checkboxes
- **Medium** (200-300ms): Card movements, navigation
- **Slow** (300-500ms): Page transitions, complex animations

### Illustration Style

**Characteristics**:
- **Style**: Minimalist, geometric
- **Colors**: Brand color palette
- **Usage**: Empty states, onboarding, errors
- **Tone**: Friendly, approachable, professional

**Empty State Illustrations**:
- New user: Welcome illustration
- No lists: "Create your first list" illustration
- No todos: "All done!" celebration
- No rewards: "Set up rewards" illustration

---

## Responsive Design

### Breakpoints

- **Mobile Small**: < 360dp
- **Mobile**: 360dp - 599dp
- **Tablet Small**: 600dp - 839dp
- **Tablet**: 840dp - 999dp
- **Desktop**: 1000dp - 1279dp
- **Desktop Large**: 1280dp+

### Adaptive Layouts

**Mobile (< 600dp)**:
- Single column layout
- Full-width cards
- Bottom navigation
- Stacked forms

**Tablet (600dp - 999dp)**:
- Two-column layout (list + detail)
- Navigation rail
- Larger cards with more info
- Side-by-side forms

**Desktop (1000dp+)**:
- Three-column layout (nav + list + detail)
- Permanent navigation drawer
- Grid layouts for lists
- Multi-column forms

---

## Accessibility Design

### WCAG 2.1 AA Compliance

**Color Contrast**:
- Normal text: 4.5:1 minimum
- Large text: 3:1 minimum
- UI components: 3:1 minimum

**Focus Indicators**:
- Visible focus state on all interactive elements
- 3px border, high contrast color
- Skip-to-content link

**Keyboard Navigation**:
- Logical tab order
- Keyboard shortcuts with hints
- Escape key dismisses modals

**Screen Reader Support**:
- Semantic HTML/Flutter semantics
- ARIA labels for icons
- Announce dynamic content changes
- Live regions for updates

**Motion**:
- Respect prefers-reduced-motion
- Option to disable animations
- No auto-playing videos

**Text**:
- Resizable text up to 200%
- Minimum touch target: 44x44dp
- Clear, simple language
- No time limits (or generous ones)

---

## Platform-Specific Design

### iOS Design
- **Navigation**: Native navigation bar
- **Typography**: SF Pro
- **Icons**: SF Symbols
- **Gestures**: Swipe back to previous screen
- **Modals**: Bottom sheets with handle
- **Lists**: Native list style with separators

### Android Design
- **Navigation**: Material Design 3
- **Typography**: Roboto
- **Icons**: Material Symbols
- **Gestures**: Bottom sheet swipe-to-dismiss
- **Modals**: Centered dialogs or bottom sheets
- **Lists**: Material list tiles

### Web Design
- **Navigation**: Responsive navbar
- **Typography**: System fonts
- **Icons**: Material Symbols
- **Gestures**: Mouse hover states
- **Modals**: Centered with backdrop blur
- **Lists**: Hover effects and focus states

### macOS Design
- **Navigation**: Sidebar navigation
- **Typography**: SF Pro
- **Icons**: SF Symbols
- **Window**: Native window controls
- **Menus**: Native menu bar integration
- **Keyboard**: Extensive keyboard shortcuts

---

## Design Deliverables

### Phase 1 (MVP)
- [ ] Complete design system documentation
- [ ] High-fidelity mockups (Lists, Todos, Settings)
- [ ] Prototype for user testing
- [ ] Icon and asset library
- [ ] Onboarding flow designs

### Phase 2 (Collaboration)
- [ ] Collaboration UI designs
- [ ] Notification designs (in-app and push)
- [ ] Email templates
- [ ] Sharing flow designs

### Phase 3 (Multiple Views)
- [ ] Kanban view designs
- [ ] Card view designs
- [ ] Sprint view designs
- [ ] Calendar view designs

### Phase 4 (Gamification)
- [ ] Gamification UI elements
- [ ] Rewards system designs
- [ ] XP and level progression visuals
- [ ] Achievement badge designs

---

## Design Validation

### User Testing
- **Methods**: Moderated usability tests, A/B testing
- **Participants**: 5-8 users per persona
- **Scenarios**: Key user journeys
- **Metrics**: Task completion rate, time on task, error rate, satisfaction

### Heuristic Evaluation
- **Nielsen's 10 Usability Heuristics**
- **Platform-specific guidelines** (iOS HIG, Material Design)
- **Accessibility guidelines** (WCAG 2.1)

### Design Reviews
- **Peer reviews**: Weekly design critiques
- **Stakeholder reviews**: Bi-weekly check-ins
- **Developer handoff**: Design-development pairing

---

## Approval

**Status:** Draft - Pending Review  
**Next Steps:** Review → Architecture Document → Implementation Plan
