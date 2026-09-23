# arm DISMISS — does a tree change nullify an approval?

purba #142 principle 3 says a change of content nullifies an approval, and that
GitHub already behaves this way. The evidence is 45 post-approval pushes on
purba that were never dismissed. **All 45 left the tree unchanged.** The cell the
principle predicts has never occurred.

This branch fills that cell.

| | dismissed | not dismissed |
|---|---|---|
| tree unchanged | 0 | 45 (purba) |
| tree changed | ? | ? |

Procedure: approve this pull request, then a push changes this file. The
timeline says whether a `ReviewDismissedEvent` follows.

⚠️ This commit carries no `Signed-off-by:` trailer on purpose, so the sign job
refuses before it rewrites anything and cannot add noise to the timeline.

PUSH B changed this file. The tree is now different from the approved tree.
