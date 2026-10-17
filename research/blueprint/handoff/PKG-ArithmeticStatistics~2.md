# PKG-ArithmeticStatistics~2 — completed package revision

Author: Codex, session `codex-RkLkt7`, 17 October 2026. Refs #10158.
The swarm bot confirmed the claim. This completes one package job, for
independent review; it is not a checkpoint or a review verdict.

Revised the package README and its representative Suggested.lean. The
existing `metadata.toml` already gives topic `math.NT` and needs no change.
The independent `review.json`, packets, assembled reader, other packages and
upstream checkouts are untouched. No source files or source passages are
included. There is no unfinished authoring work to resume.

## Findings addressed

The three remaining findings in
[REV-PKG-ArithmeticStatistics](../reviews/REV-PKG-ArithmeticStatistics.md)
are addressed as follows.

1. **The general-abelian three-isogeny count now has exact suppliers.**
   [Layer 2](../packages/ArithmeticStatistics/README.md#support-coregular-count)
   states six representation-specific contracts, with their hypotheses,
   estimates, normalization and proof routes, before their consumer.
   C1 gives the general-abelian BKLOS mirror dictionary, fixed integral
   scales and the exact reciprocal-stabilizer correction. C2 constructs
   finite ideal sectors and balanced unit-square windows. C3 supplies
   sections through every local orbit and a finite archimedean multisection.
   C4 states the finite-congruence count and checks the SL2 cubic torus
   inequalities. C5 gives separate quantified representation and invariant
   tails. C6 identifies the local Kummer masses with one common differential,
   including the discriminant-of-F normalization. The supporting SL2
   Tamagawa computation is stated and proved by an unfolding/Poisson route.
   The orbit-count consumer applies to arbitrary abelian degree-three
   isogenies, and both elliptic and abelian average consumers use it.
   Their rank consumers retain the original pointwise Selmer/rank
   inequalities. The general factorization-of-[3] rank statement retains
   its explicitly stated extra uniform-index hypothesis; no such hypothesis
   is silently removed by a mean-size theorem.
2. **Every even-degree consequence retains the sieve hypotheses.**
   [Arithmetic Bertini](../packages/ArithmeticStatistics/README.md#binary-form-arithmetic-bertini),
   the binary-form field lower bound and the unramified alternating-extension
   lower bound now distinguish odd n from even n>=4. The latter retain
   delta, eta > 0, xi >= 0, tau=max(eta,(eta+xi)/delta)<1 and
   (2n+1)tau<n+1, together with the paired-fibre, restricted Gram and
   quantitative excluded-locus hypotheses. The proposed numerical saving
   1/(88 n^6) remains conditional on sufficiently strong estimates.
   These are exact conditional targets, not a claim to have repaired the
   disputed even-degree argument unconditionally. The Bertini comparison
   treats nonprimitive forms separately; their vertical components cannot
   simply be discarded as a negligible set.
3. **Field lower bounds have replacement regular families and multiplicities.**
   The new
   [separated-generator target](../packages/ArithmeticStatistics/README.md#separated-generator-multiplicity)
   uses an unrestricted weighted monic sieve on a compact root-separated
   region. Translation to a normalized trace band loses at most O(t)
   models; a uniformly invertible Vandermonde matrix then shows that two
   counted maximal-order generators of the same field differ by integral
   translation and sign. After trace normalization the field fibre has size
   at most two. This works at n=2 without a false positive trace-zero density.
   The binary-form route uses
   [a uniform fixed-order class bound and real-action properness](../packages/ArithmeticStatistics/README.md#binary-order-uniform-multiplicity),
   instead of strong reduction. It gives a field fibre bounded independently
   of t and the discriminant. The alternating-extension route uses the
   normal closure, the sign quadratic field and a uniform finite subgroup
   bound. It explicitly chooses total reality for the real quadratic case;
   positive discriminant alone does not eliminate ramification at infinity.

The new proofs are plans for formalization, not assertions that the
corresponding Lean proofs have already been implemented. Existing named
statistical conjectures retain their conjectural status.

## Mathematical normalization and replacement arguments

The new
[mirror coefficient adapter](../packages/ArithmeticStatistics/README.md#mirror-cubic-normalization)
uses binomial coefficients, normalized discriminant and ordinary SL2 action.
Its integral formulas specify the action even in characteristic three;
conversion to ordinary coefficients is not injective there. The ordinary
cubic discriminant is -27 times the normalized invariant. The representative
Lean file adds only real-bodied coefficient functions, their signatures and
four numerical/degenerate examples on the existing `Cubic` carrier.

The integral-orbit correction is

`m_v = m_(0,v) / (#Stab_(G(F_v)) * sum_i(1/#Stab_(G(O_v))(v_i)))`.

The rational stabilizer belongs in the denominator. This was checked on the
rendered source equation (13), not just extracted PDF text, which loses the
fraction bar. The README includes three distinguishing mass controls.
Exceptional nontrivial global stabilizers occur in at most one twist
squareclass, contributing O(1); the generic mean is consequently unweighted.

The finite-congruence product is only for factorizable weights. Coupled
residue conditions use finite linear combinations, and unions of local
rectangles use their actual density-weighted sums. The elliptic average
statement previously gave a product formula for all finite local families;
this has been corrected. The archimedean denominator is a finite balanced
window, with the same unit/ideal sectors in the numerator. The raw norm-one
or sign locus is not used as a finite-volume region.

For monogenic fields let N=n(n+1)/2. Weighted polynomial counting gives
asymptotically c*t^N models; the trace-band translation comparison gives
at least c'*t^(N-1) models. If alpha and beta are two counted maximal-order
generators, write beta=sum b_i alpha^i. Root separation bounds the inverse
Vandermonde uniformly and gives |b_i|<=C*t^(1-i); for large t, all i>=2
coefficients vanish. The order index forces b_1=+/-1, and the trace band
allows at most one integer b_0 per sign. This proves the required bounded
fibre without a trace-slice sieve. Discriminant degree n(n-1) yields exponent
1/2+1/n; the generator-house exponent is N-1.

For binary forms a sufficient explicit bound is
`B_n = n * ceil(exp(3 * 12^6 * n^3))` GL2(Z)-classes per fixed rank-n order.
It uses the existing DT.2 finite-rank unit-equation bound, not an unplanned
sharper quantitative theorem. In the BEG cross-ratio argument the class-number
powers cancel the generator-dependent principal factors; ordinary units of
bounded-degree fields, and one fixed pair, give rank at most
6*binomial(n,2)-5. Thus the bound does not grow with the number of discriminant
primes. On a compact coefficient region away from discriminant zero,
only finitely many integral GL2 elements can move the region to meet itself:
unbounded singular values would give a limiting repeated projective root.
Dilation commutes with substitution, so the same bound holds for every t.

The Galois-closure construction over quadratic fields has field fibre at
most 2^(n!), sufficient for the exponent. Squarefree field discriminant gives
transposition inertia. Its normal closure has no finite inertia over the
sign quadratic field. For the real-base count choose totally real fields;
for the imaginary-base count choose one complex pair. The supporting S_n
criterion now uses the discriminant-one obstruction
`NumberField.abs_discr_gt_two`, rather than asking class field theory to
rule out a possibly nonabelian unramified extension of Q.

## Sources read for this revision

All statements and proof sketches in the repository are in our own words.
The following are primary public texts actually read at the indicated
locations. The previous package and review retain the earlier full inventory
and source sample; this revision does not claim to have reread every source
in the 130-entry input bibliography.

| Source | Locations checked and use |
|---|---|
| BKLOS, [1709.09790v2](https://arxiv.org/pdf/1709.09790v2), and [author copy](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf) | §3 p.5 normalization; §§4–7 pp.6–11 general-abelian orbit dictionary, Kummer masses and integrality; Theorem8.1 and §8 pp.12–13 count/measure assembly. |
| Bhargava–Shankar–Wang, [Global Fields II, 2604.16978v1](https://arxiv.org/pdf/2604.16978v1) | §2.2 Proposition2.1/Lemma2.2 pp.6–9; §3 pp.10–16 including (9)–(25), Proposition3.4, Lemma3.7 and Theorem3.8; Theorem4.1 and proof pp.16–20; embedding sieve Theorem4.9 p.23. The April2026 public paper replaces the earlier in-preparation reference. Its abbreviated representative-domain statement does not remove almost-all-prime primitive conditions. The balanced unit-square adaptation and cubic torus checks are stated explicitly here. |
| Bhargava–Shankar–Wang, [Global Fields I, 1512.03035v2](https://arxiv.org/pdf/1512.03035v2) | Theorem5.2 and proof pp.19–21, with the nonmaximal/extra-ramified split. Used for the representation tail after the finite SL2/GL2 lift comparison, not as the coregular main term. |
| BSW I, [1611.09806v3](https://arxiv.org/pdf/1611.09806v3) | Theorems1.1–1.2 pp.1–3, weighted sieve §4 pp.20–23, and §5 pp.24–27. The Vandermonde argument is our replacement for the strong-uniqueness input to the lower bounds, not a restatement of Lemma5.3. |
| BSW II, [published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf) | §§5–6 for the retained restricted even-degree estimates; §7 Theorem7.1 and applications pp.51–53. The fixed-order/properness argument replaces the lower-bound use of strong reduction; the even tail is not asserted unconditionally. |
| Bérczes–Evertse–Győry, [math/0312234v1](https://arxiv.org/pdf/math/0312234) | Invariant order (1.1),(2.4) pp.1–4; Theorem2.1/Corollary2.1 pp.5–6; §§5–6 pp.24–37, especially Proposition5.3, (6.11)–(6.15), Lemmata6.3–6.4 and Proposition6.1. Checked the uniform rank, cancellation and passage from projective configurations to integral classes. |
| Igusa, [TIFR Lectures on Forms of Higher Degree](https://mathweb.tifr.res.in/Documents/Publications/Lectures/tifr59.pdf) | §5.6, (143)–(144), original pp.152–153 (retypeset pp.138–139), the SL_n unfolding/Poisson argument specialized to SL2. TIFR itself makes this book freely readable. The cleared-library index was read; no restricted book or unofficial mirror was used. |

The three new reference editions have these SHA-256 hashes for reproduction:

- Global Fields II: `0cae6d19b11409e5707939cb5e7d56fb5a32b2b5a6d10e4e3decd4a5943264f1`.
- BEG: `61b4f4ae09ae0521e394f3db2b772b348e2176c344ccfb766c1081cd3624350b`.
- Igusa/TIFR: `3f2e24cf3f9126b54dd9782d261089dbfb7360d92b1e0cea1bf3a97e18552527`.

## Existing library and ownership

Read-only upstream inspected: TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read the reviewed ArithmeticStatistics library-coverage entries and checked
current roadmap/library ownership, including the roadmaps newer than the
atlas snapshot. LocalGaloisGroups and ProfiniteArithmetic README/Suggested
files supplied the current presentation models. Existing IntegralLattices,
finite quadratic-module, moment-determinacy, restricted-product and
EllipticCurves ownership boundaries are retained.

Current Tau Ceti already supplies the following; they are imported and not
replanned:

- `TauCeti.GlobalNumberFields.isBigO_rayClassIdealCountingFunction_sub`,
  `rayClassIdealCount`, `tendsto_rayClassIdealCountingFunction_div`, and
  `rayClassIdealMainTerm_pos` in `Global.RayClass.Count.Asymptotic` and
  `Global.RayClass.MainTerm`. Read their statements, including the common
  positive main term in every ray class and the degree-dependent error.
- `exists_fieldUnit_isSquare_div_at_places` in
  `Global.Approximation.SquareClass`, giving simultaneous finite local
  squareclasses, including dyadic and real places.
- `rayFundamentalDomain` and
  `exists_abs_ncard_rayFundamentalDomain_inter_norm_le_inter_vadd_sub_le`
  in `Global.Counting.RayFundamentalDomain`, including the volume and
  translated-lattice error. Only the finite-index unit-square/sector adapter
  is new here.

These ray-class declarations are current-library dependencies, not imports
claimed to exist at the older atlas pin. The Lean file imports only modules
available at that pin. The previous request to AN.4 for a new ideal-counting
asymptotic is removed. The squarefree/squareclass statistical adapter is owned
here, without moving generic ray-class arithmetic from GlobalNumberFields.

At Mathlib `082e2d3`, read the actual `Cubic`/`Cubic.discr`, polynomial,
Northcott and `NumberField.abs_discr_gt_two` statements used here. Checked
local implicit-function and singular-value interfaces. The companion
AnalyticNumberTheory package and lower-tier DT.2 supply the stated analytic
and finite-rank inputs. AA.2/AA.3 supply measures and finite volume;
AutomorphicLFunctionsAndLocalFactors AL.0 supplies Poisson and additive
covolume one. Neither AA nor the current library was found to compute the
SL2 Tamagawa value, so the representation-specific calculation is included
here. No higher-tier dependency or new ownership move is introduced.

## Conservation and validation

All 852 input anchors remain; there are now 865, with ten new mathematical
support targets and three new references. The 708 original individually
anchored targets are retained, giving 718 targets: layer totals
90,84,109,158,102,175. The prior consolidation of the acceptable weight and
deferral of the field-permutation predicate remain. The prior review's
removal of the duplicate pointwise two-Selmer rank target remains; no other
input inventory entry loses its destination. The exhaustive earlier
[conservation inventory](PKG-ArithmeticStatistics.md#inputs-and-conservation)
continues to resolve, apart from that explicitly removed duplicate.

All 175 standard API blocks have at least three Checks. C1 and C2 additionally
have explicit interfaces and three distinguishing Checks each. The remaining
new support targets have their exact assertions, prerequisites, proof plans
and shared normalization controls. Original theorem checks were preserved or
strengthened where their statement changed.

Completed checks:

- `lean-check` on the 558-line Suggested.lean: exit 0; 77 warnings, all
  declaration-uses-sorry, no errors, at Mathlib `082e2d37e8` / Tau Ceti
  `f790474`. Available memory was 90 GB before the final check.
- `scripts/check_sorry_data.py`: exit 0. No data definition uses sorry.
- `scripts/check_blueprint.py` on the core packet and all six stage packets:
  seven successes, zero errors and warnings, 711 nodes in total.
- Local anchor resolution, duplicate-anchor check, explicit Needs-graph
  acyclicity, original target conservation and API Check counts: passed.
- Exact sparse-polynomial expansion independently verified the ordinary
  discriminant factor -27, the complete binomial-substitution invariant
  identity with determinant exponent six, the unipotent/Weyl specializations
  and the section (0,1,0,u/4). The characteristic-three control, both field
  exponents for n=2 through19 and all three mass controls also passed.
  These calculations are separate from the sorry statements.
- `research/blueprint/intake.py check-files` on all four deliverable paths
  and `git diff --check`: passed.

The next action after intake is independent package review. In particular,
review the balanced-window/cusp adapter, fixed-order multiplicity route and
conditional even-degree propagation at the exact linked targets above.
