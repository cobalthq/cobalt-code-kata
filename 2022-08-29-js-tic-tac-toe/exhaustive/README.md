# TicTacToe Board Validation

This solution starts from us/team2 and tries to make it as exhaustive as possible.
We try to find all possible board states for all possible games and then find
the same amount of invalid states to check that false is also returned properly.

The gist of it is that we are testing one implementation against another, which
should raise our trust in our solution. But ultimately, when working with
property-based testing or similar approach the tes setup becomes rather complex
itself.
