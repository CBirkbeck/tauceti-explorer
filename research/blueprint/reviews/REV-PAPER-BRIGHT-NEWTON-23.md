# REV-PAPER-BRIGHT-NEWTON-23

Verdict: **revise**. This is a finished independent negative review, not a
checkpoint in reading the paper. The extraction remains partial. Routes 1 and 3
are accepted; routes 2, 4 and 5 are rejected.

Reviewer: Codex — codex-a71f92, 23 September 2026. Input author:
Claude Code cc-39fac3, PR #1962, merge
2668c5fc14be48e2083a6ea233d7cebe46dca844.
Review snapshot: 293c8c40b2024f40c52c852431fe6d22de7d983f.
The reviewer did not write the input extraction.

## Evidence and extent

Read the complete published paper (73 pages, journal pp.819–891), all 113
original items, all five route briefs/reasons and all seven original source
findings. Compared the final-arXiv passages for the recorded mistakes; inspected
rendered pages for the degree, log-carrier, blowup-coordinate and model issues.
The [revised paper report](../papers/PAPER-BRIGHT-NEWTON-23.md) records public
URLs, hashes and exactly which external-source sections were read.

The following source blocks were checked against their extraction entries:

| Source block | Original items | Outcome |
|---|---|---|
| Introduction, A–D, questions and applications | 1–16 | Questions are problems, not theorem goals; one-place test needs nonempty adeles and n>1; missing comparison inputs remain |
| §2 coefficients, lifting, rsw and residues | 17–40 | Corrected twist, edge map, hypotheses and locators; bundles and sign/dependency leaves remain |
| §3 tame evaluation and purity | 41–49 | Corrected purity setup and Lemma 3.4 proof attribution; separate generic suppliers from arithmetic applications |
| §4 geometric Kato theory | 50–57 | Restored all-point unramified condition and explicit four-form decomposition; Kato proof leaves remain |
| §§5–7 blowups, projective forms, tangent lifts | 58–68 | Corrected relative residue sequence, field scope and coordinate origin; Rees/Euler/Čech inputs absent from ledger |
| §8 evaluation induction | 69–81 | Main statements located; positive-level and original-model problems E11/E12 prevent proof certification |
| §9 evaluation filtration | 82–93 | Original E2–E4 confirmed; nonsmooth/nonproper finite-field inputs need the right owner |
| §10 comparison with H¹ and Abbes–Saito | 94–104 | Corrected unit restriction and level-zero notation; E5/E6 confirmed in the precise scope stated |
| §11 arithmetic applications | 105–113 | Ordinary/properness and global hypotheses retained; Picard/Hodge/semicontinuity and comparison closure incomplete |

A negative review can finish without completing the replacement extraction:
the concrete gaps below are failures of the submitted “complete” claim, not
unrecorded work silently assumed done.

## Changes applied in place

Items 6,7,9 now define propositions/questions and no longer advertise unproved
or false universal assertions as theorem goals. Item 7 records the later ANP
resolution without attributing it to the 2023 paper. Item 11 is required, not
“optional”; its comparison inputs remain explicit gaps.

Item 14 now carries smooth/proper/geometric-integrality, nonempty adelic points
in both clauses and n>1 for proper inclusion. E14 explains the last restriction.
Item 15's sequence locator is (2.7), not (2.4).
Item 18 restores the positive-characteristic smoothness assumption.
Item 25's last spectral-sequence term has twist q−1, not the twist q in M^q_r.
Item 26 states smoothness, characteristic zero and r≥1.
Item 27 names the Hochschild–Serre edge map rather than usual inflation.
Items 31,32 restore characteristic zero and locators (2.9),(2.10).
Item 33 uses the standard log point; item 39 restores characteristic zero;
item 40 cites triangle (1.3).
Item 45 now identifies the Bloch–Kato/generator/induction argument, not Gabber.
Item 48 has the full smooth-model/integral-fibre setup and p.848.
Item 50 quantifies over every point for unramifiedness, not only divisors.
Item 56 spells out η,η′,ω,ω′ as ordinary forms on R₂ of the correct degrees.
Item 58 distinguishes relative forms and the closed pushforward.
Items 64,65 use any characteristic-p field, m≥1 and positive n prime to p.
Item 68 uses the coordinate difference.
Item 71 flags the unresolved original-model assertion; item 73's locator is p.864.
Item 75 restricts its refined output to positive level.
Item 81 is the local blown-up-chart construction, not the false original-model
claim; its consumer is 8.1(3), not (5), and the first interval sets t=0.
Item 87 no longer treats another paper route as an ownership contract.
Item 88 states the precise constant-coefficient kernel sequence, without
surjectivity of the final map.
Item 94 uses K×; item 96 uses the defined fil_0 notation at general q.
Item 105 uses a smooth proper model, and items 105/112 no longer assert
unproved universal absence/ownership claims.

New items 114–117 expose four existing foundational suppliers, with exact
declarations and pins. The route-4 residue-characteristic test is now a
Gauss-DVR henselisation, not a t-adic Laurent-series field over Q_p.
Its Remark 2.20 clause keeps β∧dū=0 and n>e′. Route 5 no longer labels
Remark 1.6 optional. Both Part II briefs carry explicit rejection gates.

## Library and owner audit

Read reviewed coverage for SF.2, HL.2, HL.4, Class Field Theory Layer 5,
LocalFieldsRamification Layer 3, ProfiniteCohomology Layer 9, RP.2,
WC.5, LPV.0 and R01.3. Read the cited stage contracts, including CR.4 and
DD.3 (no corresponding reviewed coverage entry in this snapshot).
Read the complete upstream LocalFieldsRamification and ClassFieldTheory
READMEs at TauCetiRoadmap fa4d030 before writing.

Whole-tree searches at the library pins covered Swan/Kato/refined conductor,
Abbes–Saito, Brauer–Manin, logarithmic differentials/de Rham–Witt,
vanishing cycles, Lang–Weil, Cartier operator, purity and proper base change,
with broader Brauer and cohomology near-miss inspection. No exact implementation
of the specialized original missing items was located. The generic
Hochschild–Serre mention is a TODO, not the required theorem.
Algebraic CSA Brauer groups do not supply scheme cohomological Brauer groups.
The recorded “missing” statuses are exact-target judgments, not assertions that
all their ingredients are absent.

Read the statements of every declaration newly cited as library evidence:

- Mathlib Kaehler/Basic: carrier, universal derivation and factorization/uniqueness;
- Mathlib SheafCohomology/Basic: Sheaf.H with sheafification/Ext hypotheses;
- Mathlib DerivedCategory/Basic: carrier, localization and triangulated structure;
- Tau Ceti GaloisCohomology/Coefficients: discrete coefficient modules and
  kummerShortExact with IsUnit(n:K).

The relevant atlas search included Kato/Swan, imperfect residue, p-adic
vanishing cycles, Brauer evaluation, Fontaine–Messing, Deligne–Illusie,
Hochschild–Serre and Lang–Weil. Read the nearest-owner contracts rather than
treating a match in a paper's proposal as an existing layer.

Route 1 is accepted only for its source-scoped statements, with SF.2 coordinating
the actual cohomology suppliers. Route 3 is the corrected elementary one-place
test at RP.2, importing local invariants and global reciprocity.
Route 2 fails a concrete scope comparison: WC.5's stated varieties are smooth
projective, while Lemmas 9.2/9.5 use opens and torsors. Routes 4/5 fail the
closure and proof gates below, despite plausible overall subject placement.

## Required revision before acceptance

1. Split independently used parts: at least 24,36,37,43,59,60,62,66,68,71,73,
   90,91,93; also separate definitions from their exactness/comparison theorems
   in 15,17,18,25,33,58,96. Four foundational additions do not close the inventory.
2. Add the source-to-item ledger for imported proof steps. Examples are Kato's
   residue complex (4.2), p-basis-preserving residue extensions, symbol
   surjectivity, strict henselisation and the cd_p≤1 edge argument, and the
   logarithmic/Kummer coefficient triangle with its sign convention. The
   paper's discussion of Kato's sign is evidence of an adapter requirement,
   not a newly verified erratum to the unread original Kato text.
3. Add cohomological Brauer carriers/comparisons, all-degree cup products and
   their projection/sign formulas. Low-degree Kummer or abstract derived
   categories are not the complete supplier.
4. Give reusable owners for blowup/Rees charts, exceptional projective spaces,
   residue/log-pole sheaves, the Euler sequence and its cohomology, tangent-lift
   torsors and trace nondegeneracy. A single “geometry of blowups” item does not
   replace these steps.
5. Close the global inputs: Picard schemes and torsion, characteristic-zero
   Hodge symmetry, higher-dimensional semicontinuity, Bloch–Kato ordinary
   comparison, and the Fontaine–Messing/Deligne–Illusie results used in
   Remark 1.6. Read their exact source hypotheses. A bibliography or a
   curve-only Jacobian supplier is insufficient.
6. Correct E10/E11 throughout the induction and repair E12 at the actual
   consumer. The local symbols on the blowup do not by themselves give D
   on the original local scheme with the asserted conductor bound.
7. State every terminal theorem in the Part II briefs with all hypotheses.
   The longer formulas of 8.1(3),(5) cannot be reduced to “under the stated
   conditions”. Specify and test the boundary levels, roots-of-unity degree,
   Cartier vanishing and the exceptional dyadic case.
8. Reconcile HL.4's ramification role and LPV.0's generic nearby cycles with the
   proposed general Kato theory, and give a legitimate general Lang–Weil owner.
   Do not mutate other roadmaps in this review.

## Source findings and decisive checks

All seven input findings have independent verdicts. Seven additional findings
were confirmed. See the JSON and paper report for locators and the bounded
correction search. E7 is classified with a later published/preprint resolution,
not “new”; ANP §1.1.3 explicitly distinguishes the ordinary case.

The most substantive checks are these.

E9: a quotient generated by dlogπ in Ω_K/Ω_{O_K} is killed by π, and cannot
be O_K. At π=p, dp=0 makes the fractional recipe especially transparent.
Borger §4.5 supplies the formal log point; Stacks 0FMU's stronger hypotheses
cannot be suppressed.

E10: on A¹_{Z_p}, P=Q with x(P)=p gives u(P̃₀)=u(Q̃₀)=1 but [PP]₁=0.
The corrected difference follows from the paper's own (7.3).

E11: n=p=2,s=0 gives rsw_0, outside Definition 2.14's domain; Lemma 8.7
is the separate ordinary-residue terminal calculation.

E12: nonzero β forces sw_E(C)=n. The asserted extension to an original-model
neighbourhood with sw_Y(C)≤n contradicts the conductor drop in 8.3/8.6;
already k=Q_3,n=1,β=du works. The correction is deliberately local on the
blown-up chart. No claim that all later descent steps have been repaired.

E13: with residue F_p(x), a top-level Kummer character x has conductor e′.
Every unit cup has top form c dlog x∧dlog ā=0, since Ω²_{F_p(x)}=0.
The π cup has nonzero second component. Thus the unit restriction is
genuinely too strong, not merely a proof choosing an inconvenient witness.

E14: B=0 on P¹ has surjective evaluation onto the trivial 1-torsion group,
but its Brauer–Manin set is the whole adelic space.

None of these is claimed to refute Theorems A–D. Counterexamples are to the
specified helper statements or unsupported implications.

## Checks and handoff

The paper checker reports zero errors. The paper/source-issue/queue regression
suite passes. Structural checks verify 117 unique items, the 4/4/109 status
counts, all 109 missing items routed once, and all 14 review verdicts. Finite
diagnostics test the coordinate-origin, witness-index and trivial-class
edge cases; these are sanity checks, not formal proofs.

No Suggested.lean is delivered or required for this paper-review job, and no
Lean elaboration is claimed. Only the four named deliverables and this job's
handoff are submitted. The next extraction worker resumes with the eight
requirements above, not by repeating the completed full-paper review.
