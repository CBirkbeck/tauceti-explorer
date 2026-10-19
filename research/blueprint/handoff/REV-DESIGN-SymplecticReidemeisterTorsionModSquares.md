# REV-DESIGN-SymplecticReidemeisterTorsionModSquares

Completed independent review of #3620 by Codex, session codex-M0Vtgx,
2026-10-19. This is not a checkpoint. The original design is #3427 by the
separate session codex-yzPdpu. The corrected packet is accepted as a complete
target-level pass: nine layers planned, none closed, all implementations
unchecked. No second issue was claimed.

The review report records all corrections and source/baseline evidence. The
packet has an individual review verdict for each of its 63 nodes and all 20
source findings. Counts: 9 definitions, 14 constructions, 33 theorems,
7 comparisons; 91 API entries; 70 definition/construction tests plus four
other circle regressions; 41 planets and extraction routes; 13 confirmed
baseline declarations; 16 supplier requests; one honest open gap. Node verdicts
are 59 verified and four corrected; no nodes added. Source verdicts are
18 confirmed and two rejected.

Retain these corrections when packaging:

- Termwise even rank and even-dimensional cohomology are independent. The
  new rank-one differential K²→K² test catches the false implication.
- For P(x,y)=B((1+A)x/2,y), use P(x,(1−A)y), not P((1−A)x,y), as the alternating
  form in the all-odd-characteristic strict-circle proof. The new quarter-turn
  regression and Lean milestone fix the argument position.
- Normality extends generic isomorphisms between torsors already defined
  locally. It does not extend an arbitrary generic torsor.
- The orthogonal-circle specialization example refutes AV §2.3.3's broad raw
  base-change assertion. It is not a geometric three-dimensional symplectic
  counterexample to B.10. The normalized family theorem has its own term-rank
  proof, including the acyclic half-rank sign.
- Source E2 is harmless reuse of a locally bound dimension variable. Source
  E18 already refers to the normalized left side of B.30. Both are rejected.
  E17 is confirmed only for the three actual chain/vector slips; its B.35
  diagonal matrix is already correct. E1 additionally records the missed
  internal-basis pairing typo. E19 and E30 have their corrected scope/locator.

Both Gaussian examples were independently rebuilt from the reader's word and
matrix data using exact Q(i) arithmetic. The surface relator, all four
intertwining equations, and invariant principal-cocycle subspace pass. Quotient
polynomials are x⁴+1 and (x²+1)², with determinant ratios 4/2 and 8/2. The report
and reader specify enough to repeat the computation; no scratch file is needed.

Validation passed: blueprint checker normally and with the submission scanner's
index of the actual eight pinned source files (zero errors/warnings),
check_sorry_data, complete packet/reader consistency, PDF hash verification, and
byte equality of all eight pinned files with the shared build. The 180-line
suggested Lean file compiled with lean-check, exit zero and only 21 permitted
proof-placeholder warnings, after checking sufficient available memory. Its four
light definitions have actual bodies. No build or language server was started.

The recorded baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The reflection norm at this pin
is [−Q(v)]; keep the convention bridge restricted to SO. The current upstream
roadmap and Tau Ceti library were read separately to check ownership and avoid
replanning newer work. No definition was moved between tiers or owners.

The public AV v1, JRV v3 and Thom locators were independently read; the packet
records their hashes. Published AV/JRV passages were not independently read,
and the original author's AV-author-PDF comparison was not repeated. All source
findings retain those version limits. No source passages or private-library
material were copied into the deliverables.

The remaining producer question is RT.5/quadratic-cover-detection: assign an
accessible primary proof of arithmetic-scheme Chebotarev and its quantitative
quadratic-cover lower bound, probably through AnalyticNumberTheory Part II.
AN.4 and number-field Chebotarev do not discharge it. Do not fetch the uncleared
Serre book from another copy. Other precise requests remain with their existing
owners, including the real Chern/metaplectic identification and smooth/simple
cellular comparison. See the report and packet for exact contracts. Those
requests and the one gap remain visible; acceptance is not a claim they have
been proved. Resume with the programme's packaging/follow-up process, not a
second review of the corrections completed here.
