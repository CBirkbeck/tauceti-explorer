# Review: GeometryOfNumbersAndQuadraticArithmetic, layer GN.3 (follow-up packet)

Job `REV-GeometryOfNumbersAndQuadraticArithmetic--GN.3` (issue #9285). Reviewer: Claude (Opus 5.5), session
claude-3bIMuQ. The work under review is `BP-GeometryOfNumbersAndQuadraticArithmetic--GN.3` by session
claude-nr5zuB (PR #9346). Date: 2026-10-13.

**Verdict: accepted**, with the corrections below applied in place. The packet, the reader document and the
suggested Lean file now agree.

## Counts

| | Before | After |
| --- | --- | --- |
| Nodes | 72 (11 definitions, 12 constructions, 44 theorems, 4 lemmas, 1 application) | 72, none added |
| Node verdicts | — | 40 verified, 32 corrected |
| API items / unit tests | 129 / 92 | 129 / 92 |
| Baseline declarations | 27 | 27, all confirmed |
| Gaps | 5 | 6 (one closed, two added) |
| Source issues | 10 (E301–E310) | 13: E301–E310 confirmed, E311–E313 added |
| Requests | 4 | 4 |

`python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings. The suggested file was compiled with
`lean-check` at Mathlib 082e2d3 / Tau Ceti f790474: no errors, and the only warnings are the 36
`declaration uses 'sorry'` warnings.

## What was checked

- **Sources.** Every node was read against its sources at the cited theorem, section and page:
  Li–Zhang, *Kudla–Rapoport cycles* (arXiv v3) and *GSpin* (authors' final version); He–Li–Shi–Yang;
  Li–Liu (the published, open-access Forum Math. Pi version, whose numbering the packet uses; arXiv v2
  numbers its statements one higher from Lemma 2.12 on); Feng–Yun–Zhang; Shankar–Shankar–Tang–Tayou;
  Maulik–Shankar–Tang (accepted version); Hanke's Arizona notes; Hironaka; Cho–Yamauchi; Kirschmer;
  Gan–Hanke–Yu (authors' copy); Lipnowski–Tsimerman v1; Yun; Li; Bhargava–Shankar–Wang I and II;
  Duke–Imamoḡlu–Tóth (the Annals' free PDF); Duke; Leslie; Schulze-Pillot; Voight v1.0.7u; Weil 1964;
  Bruhat–Tits II (cleared library copy, located only). Weil 1965 could not be obtained by script.
- **Mathematics.** Every statement, check and unit test was re-derived. Numerical claims were recomputed by
  hand or by brute force: the bad- and good-type counts behind Hanke's reduction (32, 640, 16, 320), SSTT
  Corollary 4.3(1) for x₁x₂ + x₃x₄ + 3x₅² at p = 3 and every m < 27, finite orthogonal, unitary and
  symplectic counts, the Siegel series examples, b_T(t) for n = 1, the trace form on ℤ[(1+√5)/2],
  the archimedean constants for n ≤ 6 (also against Gross's ∏(2π)^{d_i}/(d_i − 1)!).
- **Baseline.** All 27 declarations exist under the cited names and modules at the pins (read in the
  shared build's source trees). `Matrix.orthogonalGroup` is the identity-Gram orthogonal group and
  `Pell.Solution₁` covers x² − dy² = 1; both are partial inputs, as their `provides` lines say, and the
  citing nodes now say how they are used (pell-automorph gained the proof step that relates t² − du² = 4
  to Pell.Solution₁). No citation was removed.
- **Upstream boundaries.** TauCetiRoadmap main was read for AdelicAlgebraicGroups AA.3.2 (the three
  conditions of (e,C)-reduced forms and the Siegel-set containment), IntegralLattices 2F–2G and 7C,
  OrthogonalSpinGroups (scope, 1F and the consumer contract) and ReductiveGroups Layer 9. Nothing in
  GN.3 duplicates them; the audit (`data/library-coverage.json`) shows every GN.3 target absent or partial,
  and no Gaussian binomial exists at the Mathlib pin.
- **RT-AREA-algebraicnt-1/1.** For GN.3 the relevant contracts are AA.0, AA.2 and AA.3, which the packet
  records machine-readably as requests and node prerequisites with atlas stage ids, and which the reader
  lists under "Dependencies on other roadmaps". IntegralLattices (current main) is not an atlas stage and
  is cited in proof text and in an upstream note. An upstream note for OrthogonalSpinGroups was added
  (it names the same nonexistent successor as owner of τ(SO_Q) = 2).

## Corrections

Statements and hypotheses:

1. **siegel-main-theorem.** The theorem used r_gen(L, m) of genus-theta-average, which counts B(x,x) = m,
   against local densities of Q = B/2. It now uses the coefficient of exp(2πiτm), that is r_gen(L, 2m),
   matching Hanke's Θ_Q. Its convergence step rested on the O(1/p) bound of density-good-prime-bounds,
   which does not give an absolutely convergent product; it now uses the level-one count
   1 + O(p^{1−n/2}) at p ∤ 2m det L (prerequisites odd-prime-density-formula and
   finite-orthogonal-group-order replace density-good-prime-bounds).
2. **hermitian-cancellation-law.** The node copied from Li–Zhang §3.2 the equality
   Den(⟨1⟩^{n+m+k}, L^♭ ⊕ M) = Den(⟨1⟩^{n+k}, L^♭), which is false (n = 0, M = ⟨1⟩, k = 0 gives
   1 + q^{−1} against 1). The correct statement carries the factor Den(⟨1⟩^{n+m+k}, M), which cancels in
   the normalized series. New source issue E312.
3. **unitary-tamagawa-mass-formula.** The constant c(M) dropped Lipnowski–Tsimerman's factor
   |N_{K/Q}(D_{L/K})|^{n(n+1)/4} from (39).
4. **good-place-volume-euler-product.** Its L(G) in the non-square case dropped Kirschmer's factor
   N_{K/Q}(d_{E/K})^{r−1/2}; the statement now says that this factor (with d_K^{dim G/2}) is not produced
   by the Euler product and enters through the global Tamagawa normalization. The node also claimed that
   Gan–Hanke–Yu has no Propositions 7.4–7.5 and "corrected" the GN package's citation of them: both
   propositions exist (p.119 of the authors' copy), so that claim is withdrawn and the locator restored.
5. **ikeda-functional-equation.** The unit u of the sign w^ε(L) is any unit with χ(u) = ε (a square for
   ε = +1), not a fixed nonsquare.
6. **density-good-prime-bounds.** Both parts use the standing hypotheses of SSTT §4 (L maximal, rank ≥ 5);
   the packet said part (1) needs only p ∤ 2 det L, which fails in rank one.
7. **hermitian-special-values.** "m_0(T) vanishes unless L ⊆ Λ_n ⊆ L^∨" depends on x, not on T; replaced by
   m_0(T) = Den(L), which vanishes unless T is integral.
8. **orthogonal-isometry-count.** Now says which form of Li–Zhang Lemma 3.2.1 fails at U = 0 (the simplified
   form gives 1 − q^{−m}; the first display gives 1, and is 0/0 only at m = 0).
9. **unimodular-hermitian-mass-asymptotic.** The corrected coefficient is (1/2)[K:Q], not 1/2.
10. **ramified-primitive-density.** He–Li–Shi–Yang Lemma 5.12 needs L integral (acceptance, API item and
    test corrected).

Proof outlines:

11. **minkowski-reduced-siegel.** "d_i/d_{i+1} bounded below" should be bounded above; the step now lists
    the three conditions of AA.3.2 and names Minkowski's product inequality for reduced bases (gap 6;
    prerequisite GN.1/minkowski-second-upper added).
12. **hermitian-finite-fourier-count.** The residue character sum over F_{q²} is −q, not 1 − q.
13. **hermitian-lattice-extension-lemmas.** The unramified minor criterion has no shift by n − 1 (the shift
    belongs to the ramified Lemma 2.23 of Li–Liu).
14. **horizontal-lattice.** Added the χ(L^♭) = 0 case of Li–Zhang Corollary 3.8.3(ii).
15. **gaussian-binomial.** The garbled derivation of the alternating identity was rewritten.
16. **finite-orthogonal-group-order.** The characteristic-2 step credited ReductiveGroups Layer 9 with
    Steinberg's order formula; that layer constructs the pinned groups only. Replaced by the direct count.
17. **orthogonal-tamagawa-two.** The dimension-three step credited QuadraticFormInvariants Layer 2 with
    SO(Q) ≅ PGL_1(C_0(Q)); it goes through OrthogonalSpinGroups 1F and Spin(Q)/μ_2.
18. **pell-automorph.** Added how Mathlib's Pell.Solution₁ covers t² − du² = 4.

Checks (acceptance properties) that were wrong:

19. **full-type-weighted-identities.** The base-case identity quoted was the ramified one (a² = q^{t−1});
    the orthogonal base cases are a vertex lattice and invariants (1,…,1,2) with μ_− = q^{t−1} − q
    (Li–Zhang print q^t − q: E311).
20. **full-type-mu-invariants.** The maximal-lattice identity holds for odd type only; the even-type values
    (8.9)–(8.10) were added.
21. **orthogonal-canonical-local-volume.** The ratio-2 case at q = 3 in rank three is type II+ (split O_2),
    not an anisotropic quotient (types I and II− give 1).
22. **local-lattice-orbit-bounds.** R = ℤ_ℓ[ℓi] has two overorders, not three (ℤ_ℓ[ℓ²i] is not an
    R-module); two orbits.

Sources and locators: the Yun citation pointed to arXiv:1107.0333, a materials-science paper; the paper
is arXiv:1303.2420 (locators re-read and fixed). Li–Liu's URL now points to the published version whose
numbering the packet uses. Cho–Yamauchi, Weil 1964, Voight, Duke–Imamoḡlu–Tóth, Li, Leslie and
Schulze-Pillot matches were rewritten after reading them (Schulze-Pillot proves finiteness via Humbert,
not by restriction of scalars; Voight proves τ(SL_1) = 1 but not τ(PGL_1) = 2; Li prints an unweighted
average over GSpin double cosets). SSTT Lemma 7.9's proof is on p.39, not pp.39–42. The packet's
`sourceVersions` gained the eleven texts read in the review, with SHA-256.

## Source issues

E301–E310 are confirmed, each with the check made (see the packet). E303 is sharpened: Li–Zhang's two
cases exhaust val(L) ≥ t + 2, but case (ii) needs the invariant-2 binary block to be isotropic modulo ϖ;
diag(9,9) over ℤ_3 has no integral index-3 overlattice of full type. E307 rests on the extraction's p-adic
count (c_2 = −1/36 against the printed −5/48 at n = 4, q = 3), which this review did not redo; the source
offers (5.8) as an unproved observation. Added:

- **E311** (known, PAPER-LI-ZHANG-22/E6): base case of Li–Zhang Proposition 8.2.7 prints μ_− = q^t − q.
- **E312** (new): Li–Zhang, *Kudla–Rapoport cycles*, §3.2, the unnormalized cancellation of densities.
- **E313** (known, PAPER-LIPNOWSKI-TSIMERMAN-18/E1): Lipnowski–Tsimerman (13), the count of compositions
  and e^{nδ} ≤ 2^{nδ}.

## Gaps

- Closed: *Cho–Yamauchi primary statements not re-read* (Corollary 3.5, Proposition 3.7, Theorem 3.9,
  Lemma 3.10, Corollary 3.11 and Theorem 3.12 were read).
- Narrowed: the Weil gap now concerns Weil 1965 only; the Weil 1964 locators were checked.
- Added: Minkowski's product inequality ∏‖b_i‖² ≤ c_n det B for reduced bases of real lattices
  (minkowski-reduced-siegel), and a source for τ(PGL_1(D)) = 2 (quaternion-adjoint-tamagawa,
  orthogonal-tamagawa-two).

The stage stays `planned`: every GN.3 target is a node whose chains end in the libraries, other
roadmaps' nodes and requested stages, or the six recorded gaps.

## Suggested file

Tests `MinkowskiReduced.std_Z2` and `MinkowskiReduced.not_shear` were only described in a comment; they
are now typed. `normalizedRepCount_eventually_const` assumed `S.det ≠ 0`, which does not express
nondegeneracy of x ↦ xᵀSx for a non-symmetric S; it now assumes `(S + Sᵀ).det ≠ 0`. Every packet
definition, API item and unit test appears in the file under its packet name, typed or in the closing
list of statements not typed at the pins.

## Questions for the orchestrator

1. The GN.3 handoff (and possibly the GN package) says Gan–Hanke–Yu has no Propositions 7.4–7.5. They exist
   (p.119); any fix job that acted on that claim should restore the citation.
2. E312 is new: Li–Zhang's sentence before (3.2.1.1) and the node of PAPER-LI-ZHANG-22-B that restates it
   should be corrected in that extraction.
3. Li 2023 (3.2.7) prints the Siegel–Weil average with c_K the number of GSpin double cosets, without mass
   weights. This review did not decide whether that is an error or a stacky convention; it is not
   recorded as an erratum.
4. Weil 1965 (Acta Math. 113) is refused to scripts by Springer and Project Euclid; a human copy would close
   gap 3.
