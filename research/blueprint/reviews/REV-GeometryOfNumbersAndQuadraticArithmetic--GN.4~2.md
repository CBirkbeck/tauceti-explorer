# Independent revision review: GN.4 continuation

**Verdict: accepted.** Codex, session `codex-rI9nQL`, issue #10023,
2026-10-16. This is a finished independent review, not a checkpoint.

The original planner was Claude session `claude-iKBZMu` (PR #9375); the
revision author was Codex session `codex-AbbCgD` (PR #10026). This reviewer
did none of either job or the earlier review. The claim was confirmed in
[comment 6220895300](https://github.com/CBirkbeck/tauceti-explorer/issues/10023#issuecomment-6220895300).
I read the earlier nonaccepting review and revision handoff, then checked the
revision against their returned proof contracts and this issue's checklist.

## Scope and verdict

All 76 incoming targets, their statements, hypotheses, proof plans, direct
prerequisites, source matches and available APIs/tests were inspected. The
review adds one key covering adapter, leaving 77 targets: 13 definitions,
4 constructions, 43 theorems, 15 lemmas and 2 applications. There are
123 API items, 71 definition/construction tests, six planets, 78 baseline
entries and seven supplier requests. The per-target records are **50 verified,
26 corrected and one added**; none is left unverifiable. Corrections include
locator and prerequisite repairs as well as mathematical changes.

The packet remains a complete planning pass and GN.4 remains **planned**, with
four precise remaining input groups. Acceptance concerns the correctness of
this plan relative to those explicit inputs. It does not close the inherited
Huxley, Howe–Moore, Ratner or indirect primary-proof developments, certify
post-pin owner interfaces as pinned declarations, or claim formalisation.
This is the distinction expressly allowed by the review issue.

## Mathematical corrections

1. **Markoff fibre error.** For `B=K−a²`, the exact column length is
   `√(B+(a²−4)m²/4)−(a+2)m/2`. Its strip integral differs from the revision's
   simplified `E_a` by `−a²/2+O(a)`. The simplified formula consequently has
   error `O(√K+a²)`, rather than uniform `O(√K)`. The packet now gives the
   exact antiderivative as well, with the sharper error, and the exact
   feasible range `a³+3a²≤K`. At equality only `(m,n)=(a,a)` occurs, whereas
   the simplified area divided by `a²` tends to `−1/2`; this is a new
   regression check. Summing the additional `O(a²)` costs `O(K)`, preserving
   the final `1/48` coefficient. The negative-sign count now includes its
   wedge integral and truncated strip calculation instead of just saying
   that the argument is analogous. Source: Ghosh–Sarnak, §7, pp.21–22 of
   arXiv:1706.06712v3; the earlier paper-extraction E1 remains credited.

2. **Symmetric matrices and skew lattices.** The skew is consistently
   `diag(t_i⁻¹)`, with positive parameters of product one. The Siegel cone
   and endpoint constants are fixed, and their dependence is explicit.
   Independent minima vectors suffice for the vanishing-coordinate argument;
   they need not be an integral basis. To count lattices, an actual short
   basis and its triangular integral shears provide at least
   `c_n∏_{i<j}L_j/L_i` representatives in an enlarged box. Dividing by this
   multiplicity supplies the factor previously omitted from the proof.
   The final dyadic summation also states its product cancellation.

   The matrix count had another false intermediate estimate, inherited from
   BSW: it included every pair above the antidiagonal as a minimum above
   the counting scale. The product must instead range over
   `U_Y={i≤j:μ_iμ_j>CY}`. Nonvanishing puts this subset above the
   antidiagonal, and the source's injection then bounds its ratio product.
   For a standard rank-two row lattice, the untruncated expression would
   give `O(Y²)` for a count of order `Y³`. The repaired argument preserves
   the final theorem. Source: BSW, Proposition 5.5, arXiv v1 p.22 and the
   author manuscript dated 4 April 2025, p.24; Lemma 5.6 and Proposition
   5.7, author pp.25–26. This new source proof error is E403 below.

3. **The interval covering constant.** Mathlib supplies a finite number of
   families with disjoint closed balls whose prescribed open balls cover the
   centres. That stronger constant cannot silently be set to two on the
   line. The marked estimate and nondivergence theorem now accept any bound
   for a countable prescribed-open-ball subcover of bounded centres and
   bounded radii.

   Added `interval-prescribed-ball-cover`, marked with this review's
   `addedBy`. Start with Mathlib's countable cover of finite multiplicity.
   Process every overlapping triple and remove an interval contained in the
   union of the other two. Each finite step preserves the union. Each point
   initially belongs to finitely many intervals, so the last-removal argument
   preserves coverage at the limit; no overlapping triple survives. This
   proves multiplicity two for the required open-cover contract. It supplies
   the exact `2k³6^k(k²+1)^(1/k²)` recurrence coefficient. The three-centre
   example in the acceptance checks distinguishes open multiplicity from
   two closed-disjoint families. Source context: Kleinbock–Margulis,
   Theorem 4.1, pp.9–13, and Theorem 5.3, p.15.

4. **Siegel unfolding and normalization.** The pinned Bochner unfolding
   lemma allows a countable nonnormal subgroup, but assumes integrability;
   it does not itself supply the nonnegative mirabolic fibre formula.
   AA.2 and Tonelli now explicitly supply that extension. Added AA.2 to
   invariant measures on punctured space and extended its request to the
   quotient integral/lifting and uniqueness contract for `G/P`.

   For the normalization limit, a bounded fundamental parallelepiped gives
   the pointwise ball asymptotic by volume squeeze; the upper counting bound
   alone does not. A grid of combinations of independent minima vectors
   of norm at most one explicitly dominates every inverse partial product
   of minima by the unit-ball lattice count. Finite-constant unfolding
   makes this dominator integrable before the constant is determined, so
   dominated convergence is not circular. The complex `L¹` extension now
   specifies absolute summability almost everywhere and zero totalization
   on its null exceptional set. The ball-count API includes `T≥0`.
   Source: Miller, §4 printed pp.10–11 and §6 printed pp.12–14
   (PDF pp.4–8); Eskin, Luminy notes §1, pp.2,4.

5. **Other local proof repairs.** Saturating the selected minima vectors
   gives exactly the first `r−1` minima in the primitive-lattice induction;
   an extra dyadic decomposition is unnecessary. The band-volume proof now
   calculates both radial moments and its Gram-determinant Jacobian, and
   removes its stale claim that the source proofs were unread (BLS Lemmas
   4.2–4.3, pp.27–29). The closed-orbit rational-form argument uses the
   rational linear invariance equations of the integer lattice subgroup,
   rather than unprovided rational generators of a real Lie group. Its
   one-dimensional invariant space follows from the concrete matrix adapter.
   Harmonic decomposition and the zero rotational average are explained
   explicitly in the spherical Weyl criterion. The shear-rectangle check
   requires `0≤ε≤1`.

Every correction is synchronized in the packet and reader. The Lean file
states the generalized marked estimate with its covering hypothesis and the
new interval adapter, and updates its Markoff target note. It remains a short
statement file, with no new heavy construction or admitted data definition.

## Resolution of the earlier returned contracts

- **Representation pairs:** Toma's primary Theorem 1 and conductor descent,
  PDF pp.3–9, justify the restricted range `K≥2`, `d≥1`, `16d²≤K`, including
  nonfundamental discriminants. All conductor and divisor errors are retained
  before absorption. This covers the Ghosh–Sarnak application; the false
  all-parameter target remains excluded.
- **Semialgebraic and unipotent counts:** the new coordinate/Hausdorff,
  section, closure and frontier chain supplies the BW proof relative to the
  exact RealAlgebraicGeometry owner interfaces. Changing the lattice to
  `u⁻¹ℤⁿ`, rather than integrating fibre volumes, proves unipotent
  uniformity; a first/last nonzero integer coordinate bounds its minima.
- **Primitive ball and planar estimates:** Le Boudec's actual primary
  Lemma 3, pp.5–7, supplies the full primitive-ball range and logarithmic
  error. The Krätzel–Nowak Fourier formula and the explicit smoothing
  adaptation give one absolute `2/3` ellipse bound, including thin ellipses.
  The fixed-domain van der Corput statement is distinguished from that
  uniform result. The stronger Huxley ellipse range stays conditional.
- **Nondivergence:** the prescribed-ball cover, marked predicate, measure
  induction, primitive flags and maximum Plücker norms now form an explicit
  chain. This review supplies the additional interval constant repair above.
- **Borel density and intermediate subgroups:** current ReductiveGroups
  supplies Chevalley stabilizers and functorial representation inputs;
  LieHighestWeight supplies standard-module irreducibility. Exact integer
  matrix arithmetic independently verified the five-vector ladder with
  weights `4,2,0,−2,−4`, its raising coefficients and final lowering zero.
  GN.4 owns the concrete adapter, not those existing theories.
- **General mixing:** the revision imports the precise base Howe–Moore
  endpoint, with its inherited proof gap, and supplies the homogeneous-space
  and proper-escape adapters. It no longer claims that the LieGroups
  closed-subgroup theorem proves matrix-coefficient decay.

Thus each of the eleven previously unverifiable targets is now correct as
stated, including the explicitly conditional targets. Honest inherited inputs
are not treated as newly established proofs.

## Baseline, sources and ownership

Inspected all 78 baseline entries at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Replaced the one inapplicable
citation, `pi_norm_le_iff_of_nonneg'`, which is multiplicative, with
`dist_pi_le_iff`, pinned `Topology/MetricSpace/Pseudo/Pi.lean:72`, applied
at zero. The generated additive norm theorem exists but is omitted by the
static declaration index; no index or unrelated file was changed.
Clarified the actual Bochner unfolding and Besicovitch contracts without
removing those valid citations. All 78 resulting entries are confirmed.

Corrected the inspected-copy locators for MST arXiv v1 pp.28–30, Regev
Theorem 4 p.2 and proof pp.5–6, Miller's printed versus PDF pages, Eskin's
transform definition p.2, the published DIT orientation discussion, and BSW's
two inspected §5 versions. Toma's author manuscript has 13 PDF pages;
the journal's pp.399–413 are a separate pagination. The cleared BCR copy was
read in place for the semialgebraic dimension and finite smooth-partition
inputs, with its numbered page locators retained. No source passages or
private source files were put in the deliverables.

Source issue verdicts, all attributed to this review:

- **E401 rejected.** The shear example invalidates naive projection
  invariance, not Bhargava–Shankar's estimate. The inverse-lattice argument
  now proves the required estimate.
- **E402 confirmed.** Morris Theorem 3.2.9, arXiv printed p.103, displays a
  norm product contradicted by indicator functions or a negative constant.
  The proof and Remark 3.2.8 give the product of integrals. The earlier
  author-copy collation is retained with its existing scope.
- **E403 added and confirmed.** The untruncated minimum product in BSW
  Proposition 5.5 fails the standard rank-two test. The error is present in
  both the hashed arXiv v1 and 4 April 2025 author copy. Searches found no
  separate correction; the publisher landing page was not served, so this
  finding makes no new assertion about an uncollated publisher PDF.

Read the reviewed library audit and the relevant current owner contracts at
TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing carriers and theories
remain imports: GlobalNumberFields, IntegralLattices, AlgebraicCodingTheory,
RealAlgebraicGeometry, LieGroups, ReductiveGroups and LieHighestWeight.
The current real-points/positive-weight adapters are explicit requests,
not declarations claimed at the old pins. No ownership move is introduced.

RT-AREA-algebraicnt-1/1 remains an assembly action. The packet gives its GN.4
supplier edges and reciprocal-consumer instructions; the roadmap-level
metadata and supplier metadata lie outside these deliverables. This review
does not claim that those external fields have been repaired.

## Validation and orchestrator actions

- `scripts/check_blueprint.py`: zero errors and warnings.
- `lean-check` at the pins: elaborated; 91 warnings, all declaration-uses-sorry
  warnings, no errors. The file has 837 lines.
- `scripts/check_sorry_data.py`: passed; no admitted data definition.
- Source-issue/version validation, packet/reader target correspondence,
  intake file validation and `git diff --check`: passed.
- Independently checked the explicit matrix ladder with exact integer
  arithmetic and the Markoff endpoint antiderivative for several scales.

No mathematical question blocks acceptance. Assembly must preserve the four
recorded input groups, route the unregistered RealAlgebraicGeometry interfaces,
carry E403 and the two new counting regression checks, use the interval
adapter for the exact recurrence constant, and reconcile the base packet's
imports and metadata as already instructed. None of those actions is claimed
completed outside this review's files.
