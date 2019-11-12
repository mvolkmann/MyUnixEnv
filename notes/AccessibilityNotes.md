# Web UI Accessibility

Tools for testing web UI accessibility include
Axe (https://www.deque.com/axe/) and Wave (https://wave.webaim.org/).

These tools can identify different issues, so it is recommended to use both.

axe is a free version.
"axe PRO" is an enterprise version of axe that identifies even more issues.
It is currently in beta and no pricing information is available yet.

WAVE is a free tool.
Pope Tech (https://pope.tech/) is an
enterprise-level accessibility tool built on WAVE.
Pricing is available at https://pope.tech/pricing.
The base price of $150/month covers
testing up to 1000 unique pages per month.

## Axe

- Browse https://www.deque.com/axe/.
- Click the "Download axe" button.
- Click the "Add to Chrome" button.
- Browse the web site to be tested.
- Open the browser devtools.
- Click the axe tab.
- Click the "Analyze" button.
- Click each issue identified in the left nav.
  to see a detailed description on the right.
- To navigate between multiple instances of the same issue type,
  click the < and > buttons in the upper-right.
- To see the rendered element associated with the issue,
  click "Highlight".
- To see the DOM element associated with the issue,
  click "Inspect Node".
- Fix the issues.

## WAVE

- Browse https://wave.webaim.org/.
- Click the link "WAVE Firefox and Chrome extensions".
- Click the link for the desired browser extension.
- For example, "WAVE Chrome Extension at the Google Web Store".
- Click the "Add to Chrome" button.
- Click the WAVE icon to the right of the browser address bar.
- An accessibility report will open on the left side of the page.
- Click the "View details >" button.
- WAVE reports both issues and the good things it finds
  (such as having alt text for images).
- Click an icon for an issue to scroll to it on the page.
