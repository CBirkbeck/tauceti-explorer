# GN.4 revision 2 handoff

Codex, session `codex-AbbCgD`, issue #10022, 2026-10-16.
Claim confirmed by the bot in [comment 6219867082](https://github.com/CBirkbeck/tauceti-explorer/issues/10022#issuecomment-6219867082).

This is a completed revision pass, submitted for independent review. The packet
has status `complete`; its sole coverage record, GN.4, is `planned`, with four
explicit open-input groups. It does not claim closure. All 65 original target
ids and the entire historical `review` object are retained. The next independent
reviewer replaces that object; this revision does not accept its own work.

There are 76 targets: 13 definitions, 4 constructions, 43 theorems, 14 lemmas and
2 applications; 123 API items, 71 definition/construction tests, six planets,
78 pinned baseline declarations and seven supplier requests. Eleven key targets
were added. The reader includes every target's exact statement, hypotheses,
proof, prerequisites, sources, acceptance checks, and any uses, API and tests.
The suggested file states what is practical on the pinned carriers and lists
the owner-dependent targets in its closing comment.

## Responses to the returned review

1. **Representation pairs.** The false all-parameter statement stays removed.
   The corrected absolute bound assumes `K ≥ 2`, `d ≥ 1`, `16d² ≤ K`.
   Toma's Theorem 1, PDF pp.3–4, supplies a primary nonfundamental-discriminant
   formula. The proof retains its conductor sum and all error terms, bounds
   the conductor by the discriminant, and absorbs them only in this range.
   The text checks that the Ghosh–Sarnak §9 regime falls in the range for large
   K, and explains the swap of the two t variables in their indefinite-form
   second moment. The five zero-t solutions for `K=2`, prime `d→∞`, remain a
   regression test. Blomer–Granville Theorem 2 is credited for the fundamental
   case and is no longer asserted to prove the nonfundamental case directly.
   The restricted count now has a Lean signature.
2. **Barroero–Widmer.** Four new targets expose the key comparison chain:
   `rectifiable-coordinate-measure-bound`, `semialgebraic-hausdorff-bound`,
   `semialgebraic-boundary-null`, `orthogonal-projection-comparison`.
   Coordinate tangent minors and local inverse charts give a dimension-only
   measure bound. Uniform finite fibres give the semialgebraic multiplicity
   bound; semialgebraic sections turn arbitrary orthogonal projections into
   controlled coordinate sums. Closure and frontier treat nonclosed fibres.
   This supplies the content of BW Lemma 5.8, Lemma 6.2, Proposition 6.1 and §7,
   rather than pretending Lemmas 2.2–2.4 prove the whole theorem. Hausdorff
   measure is Mathlib's normalized Euclidean measure, so its equality with
   volume has the correct normalization. The owner interfaces are explicit
   below; none is falsely claimed at the pins.
3. **Unipotent Davenport.** The invalid iterated-fibre-volume induction is
   replaced entirely. Apply the semialgebraic lattice-uniform theorem to the
   original set and the lattice `u⁻¹ℤⁿ`. Its covolume is one. The last nonzero
   integer coordinate of z is unchanged by the upper unipotent `u⁻¹`, so every
   nonzero lattice vector has Euclidean norm at least one. Every minimum is
   therefore at least one and the denominators in the BW error can be dropped.
   The retained family has polynomial coefficients, sign choices, arbitrary
   linear maps and a bounding-ball radius as parameters; every fibre is
   bounded and every bounded input occurs unchanged. Multisets use discrete
   superlevel sets, never fibre-volume functions.
4. **Quantitative nondivergence.** The baseline now cites the actual
   `Besicovitch.BallPackage`, `exist_disjoint_covering_families`, `goodτ` and
   `multiplicity` interfaces at the pin. They cover the centres by selected
   prescribed balls in finitely many disjoint families; no almost-everywhere
   small-ball substitute is used. New `marked-poset-points` and
   `marked-poset-measure-bound` give both marking clauses, countability,
   chain cardinality, continuity, local finiteness, the supremum lower bounds,
   the enlarged ball and the induction constant. The proof identifies the
   maximal-radius balls and explains why all link lower bounds survive.
   New `primitive-flag-short-vector` connects this estimate to KM (5.1) with
   the maximum Plücker norm, including the rank-zero predecessor exception.
   The light marked predicate, its API, four tests and the measure estimate
   have suggested Lean statements.
5. **Algebraic and Lie inputs.** New projective recurrence proves that
   invariant probability measures for a unipotent or positive hyperbolic map
   are supported on fixed lines. Borel density then imports the actual
   Chevalley line-stabilizer theorem from ReductiveGroups Layer 3, and
   functorial unipotence/positive weights from Layer 4. The construction is
   already present on current Tau Ceti main and is not replanned here.
   New `so21-quotient-standard-module` explicitly splits sl₃ into J-skew and
   trace-zero J-symmetric matrices, writes E,F,H and the five-vector ladder,
   and identifies it with the owner's highest-weight-four module. Existing
   LieHighestWeight Layer 0 supplies irreducibility. Exact rational matrix
   arithmetic checked the commutator, weights, raising coefficients, final
   lowering zero, trace and J-symmetry. General homogeneous mixing now uses
   exactly the base Howe–Moore endpoint with its inherited proof gap, with
   explicit homogeneous-space continuity, invariant-vector and proper-escape
   adapters. LieGroups Layer 2 is not cited as a matrix-coefficient theorem.
6. **Other uniform estimates.** Le Boudec's actual 2020 primary Lemma 3,
   pp.5–7, replaces the unidentified 2018 reference. Its proof is unpacked:
   Möbius inversion split at T/Y, the minima asymptotic for the first part,
   the small-vector bound for the tail and its harmonic sum. The additive
   error is `O_R(T log(2Y))`, valid at `Y=1`. For ellipses, two new targets
   derive the absolute Fourier bound and the all-shape `2/3` discrepancy
   bound. The primary Krätzel–Nowak integral formula (3.19)–(3.20), pp.8–9,
   plus an endpoint integration-by-parts argument gives decay `√R |ξ|⁻³ᐟ²`.
   Thin ellipses use Davenport; the others use an isotropic bump and Poisson,
   with smoothing radius proportional to `R⁻¹ᐟ³`. Constants are independent
   of aspect ratio, centre and orientation. A directly statable rotated
   ellipse count is in the suggested file. The fixed-C²-domain van der Corput
   theorem remains distinct. The improved Huxley exponent is explicitly
   conditional on a separately stated uniform-ellipse contract, and the
   inaccessible primary proof is not certified.

## Earlier corrections retained and checked

The ceiling-product Henk argument and constant `2^(3R−1)` remain; the adapted
basis has a dimension-only explicit constant. Skew parameters are positive
of product one and the logarithmic singular count assumes `Y≥2`. Exponent
monotonicity retains the π-factor adjustment. The homogeneous probability
restricts Haar measure to a fundamental domain before pushforward; the
normal-subgroup quotient theorem has not been reintroduced. Goodness uses
positive constants, witnessed local suprema and the bounded-supremum API.
KM uses the exterior-coordinate norm and unipotent constant
`2k³6^k(k²+1)^(1/k²)`. The range/kernel weak-limit argument, column-convention
`g⁻¹Hg`, and irrational-ratio ternary construction remain. CM probability
requires a genuine negative discriminant; geodesic displacement assumes
positive discriminant and Pell t, distinct from primitive period; spherical
averages require the nonempty positive sphere and totalize empty sums to zero.
The sup-norm dual comparison, Markoff coefficient `1/48`, SSTT v3 p.37 and
Miller printed/PDF pagination corrections remain.

E401 keeps its independent rejected verdict: a failed naive argument is not
a source erratum. Its atlas proof gap is now supplied by lattice change.
E402 keeps its independently confirmed inspected-copy scope and the product
of integrals. No claim is made about an uncollated printed edition. Existing
BSW published-numbering corrections retain their extraction attribution.

## Ownership and remaining work

Current read-only upstream roadmaps were checked at
`0d144d044dacebca17b654695b6f1ad58f159b27` and the current Tau Ceti library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Baseline statements were checked at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Nothing in the post-pin checkouts
was built or edited.

The four remaining groups, with exact affected targets in `gaps`, are:

- RealAlgebraicGeometry post-pin interfaces: Layer 6 choice, dimensions,
  fibre-dimension and fibrewise closure; a Layer 7 extension for a finite C¹
  partition. The extension is not currently promised by that Layer 7 README.
  BCR Theorem 2.8.8, Propositions 2.8.13–2.8.14 and 2.9.10, pp.52–57, justify
  the requested interfaces. The atlas registry lacks this existing roadmap;
  assembly must register it and route the exact contracts in `upstreamNotes`.
  These are honest owner-interface gaps, not invalid supplier ids.
- The inherited Huxley spacing proof and its separately required all-ellipse
  constant. The improved admissible range stays conditional; `θ≥2/3` is
  supplied independently by the complete Fourier/smoothing plan.
- Indirect primary proofs for general Davenport, Schmidt extensions,
  Eskin–Katznelson and fixed-domain van der Corput. Their precise secondary
  locators remain, with no claim to have read unavailable primary arguments.
- The base Howe–Moore and Ratner proof inputs. The continuation supplies the
  homogeneous-space adapter but does not close the general decay or measure
  classification proofs.

Seven formal requests remain: AA.2, AA.3, GlobalNumberFields Layer 3A,
LieGroups Layer 2, ReductiveGroups Layers 3 and 4, LieHighestWeight Layer 0.
The last three requests consume existing owner mathematics and its post-pin
implementations; they do not move ownership. The RAG contracts above are
recorded outside `requests` solely because that current owner is absent from
the snapshot registry.

RT-AREA-algebraicnt-1/1 remains an assembly instruction. All local supplier
contracts and the new owner links are recorded. Roadmap-level prerequisites
and reciprocal consumer metadata are outside this issue's deliverables and
have not been edited. QuadraticFormInvariants and GlobalQuadraticForms remain
GN.2 suppliers. No ownership move is proposed. The toral-packets rescope and
four-way GN.4 atlas split remain; node totals and assembly instructions were
updated, including a warning against a circular Howe–Moore/mixing dependency.

## Reading and validation

New primary reading: Le Boudec arXiv:2006.02288v1 §2.1, pp.5–7; Toma's
2020 author-hosted article, Theorem 1 pp.3–4 and conductor proof pp.8–9;
Krätzel–Nowak arXiv:math/0405215v1 §3 pp.4–5 and pp.8–9; BCR pp.52–57 in
the maintainer-cleared library, read in place. No book file or source passage
has been copied into the repository or scratch. Rechecked BW §§5–7, KM §§4–5,
Morris §§4.3, 4.5, 4.7, Ghosh–Sarnak §9 and the fundamental-discriminant
convention of Blomer–Granville. The packet's source records give versions,
hashes, locators and the exact reading scope; inherited source records remain
attributed to their original pass. A permitted readable Huxley 2003 primary
copy was not obtained; neither an unseen proof nor an uncontrolled alternate
copy of a restricted book is claimed.

- `python3 scripts/check_blueprint.py` on the packet: 0 errors, 0 warnings.
- `lean-check` at the pinned build: exit 0; 819 lines; 90 warnings, all
  declaration-uses-placeholder-proof warnings, no other diagnostics.
- `python3 scripts/check_sorry_data.py` on the suggested file: passed.
- `python3 research/blueprint/intake.py check-files` for all four deliverables:
  4 files, 0 problems. No other tracked files were changed.
- Reader parity: every one of the 76 targets occurs exactly once, with its
  full statement, hypotheses, proof, API, tests and acceptance checks.
- All 65 prior ids retained; the historical review is structurally identical
  to the input. All definition/construction APIs, uses and three-test minimums
  pass; six planets; all implementation statuses remain unchecked.
- Source-issue/version validation through the packet checker: passed.
- JSON, no source-excerpt fields, no private absolute paths, and
  `git diff --check`: passed.
- Exact integer/rational matrix checks for the SO(2,1) quotient ladder: passed.

The next action is independent review of this revision, concentrating on the
explicit proof chains above and the conditional Huxley/owner inputs. The source
formulas, locators and complete proofs to inspect are in the packet and reader;
no essential handoff depends on disposable scratch files.
