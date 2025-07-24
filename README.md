# Product Search Feature - Flutter Technical Assessment

### Communication
- **Explain your thinking** - this mirrors real pair programming
- **Ask questions** - clarify requirements and constraints
- **Discuss trade-offs** - if there are multiple valid approaches

### Getting started
1. Run `flutter pub get` to install dependencies
2. Run the app with `flutter run` and try searching
3. Run the tests with `flutter test` to see the current state
4. **Do the tasks in order** - they build on each other
5. **Quality over quantity** - better to do fewer tasks really well

## Your tasks

### Task 1: Fix Tests & Write a Test
**Location:** `test/` folder

**Your mission:** 
1. Run `flutter test` and fix the failing test
2. Write one additional test as indicated by the TODO comment

**Hints:**
- Look at the actual widget output vs expected output
- Follow the TODO guidance for what test to write

### Task 2: Optimize Search Performance
**Location:** `lib/screens/product_search_screen.dart`

**The Problem:** The search has significant performance issues.

**Hint:**
Available search terms for candidates:
Categories: Electronics, Sports, Home, Fashion, Books, Toys
Adjectives: Premium, Professional, Deluxe, Ultra, Smart, Eco-Friendly, Portable, Wireless, Ergonomic, Modern
Products: Headphones, Speaker, Watch, Camera, Laptop, Phone, Tablet, Monitor, Keyboard, Mouse, Charger, Cable, Stand, Case, Bag

**Your mission:** 
1. Try searching for products - type quickly and notice the problem
2. Identify why the search feels sluggish
3. Implement a solution to make search responsive

**Think about:**
- What happens when you type quickly?
- Why might the UI feel unresponsive?
- What optimization techniques could help?

### Task 3: Implement State Management
**Location:** Create new files as needed

**The Problem:** All business logic is mixed with UI code in the search screen.

**Your mission:** Extract the logic into a proper state management solution.

**Requirements:**
- Move logic out of the UI widget
- Implement proper separation of concerns
- Use BLoC, Provider, Riverpod, or ChangeNotifier
- Handle loading and data states properly

**Consider:**
- How should state be structured?
- Where should business logic live?
- How do widgets access state?

### Task 4: Implement Search History
**Location:** Build on your state management solution from Task 3

**The Feature Request:** Users want to see their recent searches for faster re-searching.

**Requirements:**
1. **Search History Storage**
   - Keep track of the last 5 unique search queries
   - Only save searches that actually returned results
   - Most recent searches should appear first

2. **Search History UI**
   - Show search history dropdown when search input is focused
   - Hide dropdown when input loses focus
   - Display search terms as tappable list items

3. **Interactive Behavior**
   - Tapping a history item should populate the search field and trigger search
   - Filter history items in real-time as user types (show only matching history)
   - Clear button to remove individual history items
   - If no history matches current input, hide the dropdown

**Success Criteria:**
- Search history appears/disappears correctly with focus
- History filtering works while typing
- Tapping history items works as expected
- Clean, intuitive UI that feels native to the app