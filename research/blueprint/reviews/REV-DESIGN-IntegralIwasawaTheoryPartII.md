# Independent review: IntegralIwasawaTheoryPartII

**Verdict: accepted, with corrections applied.** Reviewer: Codex, session
`codex-Z4GRBK`; job `REV-DESIGN-IntegralIwasawaTheoryPartII`, issue #3552;
2026-10-19. The design was written by the separate session `codex-4a02iA`.
The packet records a verdict and an individual mathematical check for every node.

This is an accepted target-level plan, not an implementation certificate. All six
stages remain `planned`, none `closed`; their remaining supplier obligations are
explicit. The packet's `complete` status means a finished planning pass. The
leading-term theorem is planned at every prime, including two. General exact
order remains conditional on regulator nonvanishing.

## Inventory and coverage

| Item | Reviewed total | Result |
| --- | ---: | --- |
| Targets | 49 | 25 verified; 24 corrected, including test metadata |
| Definitions / constructions | 11 / 6 | Each has an API and at least three discriminating tests |
| Theorems / comparisons / applications | 26 / 3 / 3 | Statements, hypotheses, sources and proof routes checked |
| API items / unit tests | 88 / 54 | Retained; one test made concrete; all test kinds corrected |
| Planets | 29 | Definitions, constructions and central named results |
| Baseline declarations | 15 | All confirmed at the recorded pins; none removed |
| Supplier requests | 15 | Precise owner contracts, with implementation limitations retained |
| Source findings | 31 | 29 inherited findings confirmed; two minor findings added |
| New nodes / unresolved gaps | 0 / 0 | No extra target-level node was needed |

| Stage | Nodes | Coverage checked |
| --- | ---: | --- |
| GS.0 | 7 | Arithmetic conventions, valuation isomorphism, signed regulator, analytic normalization, all-prime order bound and conjectural boundary |
| GS.1 | 9 | Continuous cohomology, rational Kummer comparison, both orthogonality arguments, inertia injectivity and the cohomological regulator |
| GS.2 | 6 | Weight coordinate, Eisenstein dictionary, Ventullo family, cases, semi-cusp family and normalized projection |
| GS.3 | 10 | Three quotient presentations, bases and filtrations, actual Fourier orbits and all three Hecke-image proofs |
| GS.4 | 9 | Actual representations, simultaneous good element, nonfree extension module, diagonal refinement, local conditions and module bounds |
| GS.5 | 8 | Exact and graded determinants, lower-entry inverse-character argument, rank zero, endpoint, exact-order boundary and rank one |

## Corrections applied

1. **Rational local Kummer statement.** `GS.1/kummer-identification` now uses
   the inverse limit of the multiplicative groups modulo their p-power powers,
   tensored over `Z_p` with E, rather than identifying the integral completion
   itself with an E-vector-space cohomology group. The additive-carrier convention
   and order of completion and rationalization are explicit.
2. **Paired Eisenstein specialization.** `GS.2/eisenstein-dictionary` now uses
   the second ordinary family and its common weight-one specialization only when
   R′ is empty. The first ordinary family remains available generally. This
   prevents applying the shared specialization to nonexceptional or ramified
   primes. The supporting locator now includes DKV18 §3.4, p. 854.
3. **Case 1 boundary separation.** The projection proof formerly separated all
   remaining Eisenstein systems with operators away from np. The η=χ system
   shares the desired away-from-np eigenvalues at weight one. The corrected
   proof uses `U_q−χ(q)` for q in R′ when that system survives ordinary projection;
   its eigenvalue on E_S is `1−χ(q)`, which is nonzero. Other systems are separated
   by the Chebotarev argument of DDP11 Lemma 2.9, pp. 469–470. The proof explicitly
   uses V15's family in place of DDP11's Leopoldt-dependent input and does not
   import DDP11's additional order assumption. Added the direct
   `AutomorphicPadicLFunctions:L3` boundary-decomposition prerequisite and the
   corresponding request consumer. Removed a duplicated acceptance condition.
4. **Homological step.** `GS.0/order-lower-bound` now specifies that the free
   group-ring module has zero higher T-homology, so the Hochschild–Serre edge
   isomorphism follows. This is the precise fact used in CD14 Theorem 5.1;
   its dimension terminology is recorded separately as E36.
5. **Concrete nonfree test.** The extension-module test now uses B=(x,y) over
   A=E[[x,y]], with two-dimensional B/mB. It tests the finite-module interface
   without asserting that a particular Hida family realizes that B.
6. **Locators.** Corrected `valuation-isomorphism` to §1.1 and (5)–(6), pp. 835–838;
   `gross-regulator` to its definition after (6), p. 836, and (8), p. 838;
   `algebraic-invariant` and `algebraic-regulator-comparison` to the unnumbered
   definition and comparison on p. 839; and `case-three-normal-form` to §5.2,
   pp. 867–868, rather than the bibliography pages. Expanded the projection
   locator to include DDP11 Lemma 2.9. Narrowed the roadmap's endpoint locator
   to Theorem 1, p. 837.
7. **Test kinds.** Replaced all 54 unsupported `discriminating` kind values with
   the protocol categories: 19 computation, 12 degenerate, nine characterisation,
   eight non-example and six compatibility tests. The reader retains their
   mathematical statements.
8. **Baseline description.** Clarified that `NumberField.Units.finrank_eq` states
   the Z-module rank of the additive unit group. Its rational-rank consequence
   is used after scalar extension; the declaration does not already prove the
   odd p-unit valuation isomorphism.

The reader document contains every mathematical correction above. The roadmap's
source list also records the publisher comparison used for E37. No change to the
suggested Lean file was needed: these corrections concern arithmetic carriers
that the file honestly leaves as reader targets.

## Source and baseline verification

Read the public PDFs at every node locator: published DKV18 throughout;
DKV16 Theorem 3.2, p. 16; DDP11 Proposition 1.4 and Lemma 1.5, pp. 455–456,
Lemma 2.9 and Corollary 2.10, pp. 469–470, and Propositions 3.3–3.4/Lemma 3.5,
pp. 472–474; CD14's author-version Theorem 3 and §5.1–§5.2, pp. 27–32;
and V15 §2.1 and §4.1–§4.2. Source URLs, hashes and version-specific page
conventions are in the packet and reader. Source statements and findings are
expressed in our own words, without excerpts or source-by-source summaries.

All 29 inherited findings were checked directly and confirmed, with individual
reasons. In particular, E2 is an unsupported quotient construction, not a proof
that no independent quotient could exist. E18 was checked against both theorem
versions. E22 was also checked on the rendered published page. The corrected
endpoint avoids the unsupported remark and retains the normalized projection.

Added **E36**, the homological-dimension slip in CD14's author copy, p. 31, scoped
only to that copy; and **E37**, the internal reference to Theorem 1 where §4.2
finishes the construction for Theorem 2. E37 was compared with the publisher
version of V15, p. 961, as well as the arXiv copy, p. 20. These change no result.
The listed correction searches found no notice; no exhaustive search or novelty
claim is made. The inherited findings' earlier correction searches were not
independently repeated.

Read all 15 baseline declarations' actual statements and defining assumptions.
Their cited module contents were compared byte-for-byte with GitHub raw files at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The finite-dimensional determinant,
finite square matrix, nonsingular inverse, finite class-group, tensor-product,
formal-series order and continuous H¹ conventions supply exactly the cited
uses. In particular, the trivial-action H¹ comparison is additive; it does not
silently supply the requested E-linear local-Artin adapter. No baseline citation
was removed or replaced.

## Closure and ownership

Checked the 122 internal node prerequisites and 16 exact cross-packet node
references, the stage contracts, and the reviewed library audit. Read the relevant
current upstream `IntegralHeckeAndGaloisDeterminants` GMA and interpolation targets,
`ProfiniteArithmetic`, `ClassFieldTheory` Layers 7, 11 and 13, and `Chebotarev`
Layer 10, together with the current Tau Ceti logarithm implementation.

The plan reuses those owners. The existing principal-unit logarithm does not yet
supply the extended Iwasawa branch on Q_p×. Generic compact interpolation does
not establish integrality in a noncompact weight-one localization. The all-prime
Hilbert and actual-representation contracts are stronger than restricted
odd-prime or even-degree nodes, and the requests say so explicitly. A reducible
residual determinant does not invoke an absolutely-irreducible reconstruction
theorem, and the realized off-diagonal modules are not assumed free.

The three Artin normal forms, the explicit Case 3 independence induction, the
second-order module bound, exact determinant cancellation and distinct y-adic
inverse-character filtration provide the needed target-level closure. Routine
steps remain in proof sketches. No scope move or duplicate general construction
was introduced.

## Validation and next step

- `python3 scripts/check_blueprint.py research/blueprint/packets/IntegralIwasawaTheoryPartII.json`:
  zero errors and zero warnings.
- Intake file/path validation, JSON parsing, source-finding/version validation,
  reader/packet consistency checks and `git diff --check`: passed.
- `lean-check research/blueprint/suggested/IntegralIwasawaTheoryPartII.lean`:
  exit zero at the pinned shared build, with only 21 expected
  `declaration uses sorry` warnings. The file remains 172 lines, with three
  real-bodied definitions and no admitted data definition.

No question blocks acceptance. The next programme step is packaging under the
existing dependency order. Packaging must preserve all 15 supplier contracts
and the distinction between the proved leading-term formula and arbitrary-rank
nonvanishing; this review does not discharge those suppliers' implementation work.
