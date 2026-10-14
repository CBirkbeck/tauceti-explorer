# Independent package review: AutomorphicGaloisRepresentations, revision 3

Issue #9778. Codex, session `codex-9dBi8M`, 14 October 2026.

**Verdict: accepted.** The repaired package identifies the general regular-weight
ordinary characters in its fixed normalization. With the small corrections below,
the README, Suggested.lean and metadata satisfy the package rubric and are ready
for the upstream draft. This is a complete independent review.

## Scope, fidelity and corrections

I read the whole package, its accepted packet, the previous independent review
and the revision handoff. The package retains all 66 packet targets, all 90 API
names and all 66 named tests. Its 71 numbered sections also contain the five
interfaces moved below their later applications: geometric characters,
finite-weight nearly ordinary data, weight-two optimization, compatible-system
data and squarefree weight-two level lowering. The original six stages remain
covered by the seven mathematical layers; the extra layer separates ordinary
lattices from local comparison. Metadata remains `topic = "math.NT"`.

I read ArithmeticDirichletSeries and ConformalMapping as current upstream
models, including their README and Suggested.lean, and applied the binding
12 October statement-only amendment. The package has the required summary,
ownership boundaries, conventions, exact suppliers, ordered layers, examples
and source locators. It has no packet identifiers, review narrative or coverage
statuses in the mathematical document. Definitions retain at least three
discriminating Checks and named APIs. Heavy carriers remain README targets.

Corrections made in this review:

1. In §4.11's nonparallel worked check, changed the twist from η to η⁻¹.
   The argument itself already used `W=V⊗η⁻¹`; the check now gives the same
   degree pairs `(0,1)` and `(0,3)`.
2. Added the two current LocalGaloisGroups Layer 5 cyclotomic reciprocity
   declarations to the ownership boundaries. These are imported normalization
   inputs, not new generic local class-field targets.
3. Added the nonzero-modulus hypothesis to the pinned Dirichlet L-function
   nonvanishing supplier, matching Mathlib's `NeZero N` parameter.
4. Added a closing Lean comment naming the README definitions whose arithmetic
   or geometric carriers are unavailable at the pins. No arithmetic carrier,
   construction or sorry-bodied data definition was added to Lean.

## The earlier ordinary-character defect is closed

The revision supplies an intervening comparison argument, rather than claiming
that Skinner–Wiles's parallel theorem already covers arbitrary multiweight.
I checked its source conventions, every displayed character formula and the
following logical steps.

For canonical type `(k,µ)`, with `v_τ=(µ+2−k_τ)/2`, the selected smooth WD
character ν is distinguished from the locally algebraic Galois character η.
Under geometric reciprocity, η has value `ν(x)∏τ(x)^{−v_τ}`. Unit values retain
both the finite factor and the labelled algebraic factor. The local normalized
root is `α=ν(ϖ)A(ϖ)`, and changing ϖ to uϖ changes α by δ(u). A source
uniformizer's global normalization includes the other p-places; dividing out
their unit factor gives this local root. The unit operator has coordinates
`(y,1)`, hence representative `diag(1,y)` and no additional Teichmüller factor.

The full coefficient-prime comparison supplies a potentially semistable V with
degrees `(v_τ,µ+1−v_τ)` and the selected WD line. After twisting by η⁻¹, its
degrees are `(0,k_τ−1)`. The selected period line has slope zero; the other
slope is positive. Thus the line lifts from the Frobenius-semisimple parameter
to the actual period module and is unique. Its induced Hodge degrees are
nonnegative, while weak admissibility gives their sum at most zero, so they
all vanish. Period equivalence, with the commuting coefficient-field action,
produces the Galois line. Finite Galois descent and the full WD character fix
its character, including the finite descent factor. This yields η⊂V.

The determinant gives the other character. Dualizing gives quotient η⁻¹ in
V^∨, which has value δ on arithmetic reciprocity. I multiplied the two entries
in each of the four rows of the source dictionary and recovered its stated
determinant. The central character distinguishes the source arithmetic object
from the arithmetic dual of the forward representation. The central operator's
finite value and its algebraic specialization are also distinguished: the
µ=2 principal-unit example gives central value u⁻² and determinant u⁻³.
The package explicitly derives this comparison; it does not attribute the
extra formula literally to Skinner–Wiles equation (3.2).

For general central weight, `j=(w−µ)/2` transports η by ε_p^{−j}; it shifts
each degree by j. On coefficient-prime units geometric ε_p is the norm, and on
ϖ it is `Norm(ϖ)/q`. In particular ε_p(p)=1 for K=Q_p. Negative j and changing
the uniformizer obey the same laws. Finite twisting cannot erase nonzero
labelled algebraic exponents. Section 5.1 consumes the rational comparison
before constructing the intersection with the specified stable lattice.

The generic rank-one period theorem and admissible-subobject equivalence are
explicit PadicHodgeTheory contracts. The general local theorem keeps regularity
and the normalized unit-root hypothesis; it does not inherit the even-degree
and odd-p restrictions of the particular global Skinner–Wiles construction.
There is no remaining gap in this normalization argument.

## Sources checked afresh

Sources below were opened on 14 October 2026. I distinguished direct source
statements from their citations of earlier proofs. The original Taylor, Momose,
Saito 1997, Wintenberger 1995 and BR93 proofs were not freshly read; public
primary alternatives directly source the retained conclusions, and the detailed
proof imports remain explicit supplier obligations. No restricted book was used,
and no source passage was copied into the repository.

| Previously flagged obligation | Fresh reading and result |
| --- | --- |
| Kisin coefficient-prime and fixed-type families | Public author DVI: Theorem 2.5.5 pp. 19–20, Theorem 2.7.6 p. 23, §4.1 p. 31 and Theorem 4.3 pp. 32–33. Residual absolute irreducibility, full type and nonreduced coefficient algebras are retained. |
| Original Hilbert congruence and unrestricted construction | Kisin §4.1/4.3, Skinner introduction/Theorem 1 pp. 242–244 and Blasius §§2–3 pp. 15–18. These directly support the constructor and comparison statements; Taylor's original proof is not represented as freshly verified. |
| Classical all-weight coefficient-prime comparison | Skinner Theorem 1 and introduction pp. 242–244, plus Saito's supplement Theorem 3 printed pp. 429–430. The classical case has a direct full comparison source; Hodge numbers alone are not substituted for it. |
| Inner twists and Momose openness | Ribet 1985 Theorem 2.1 pp. 188–190 and §3/Theorem 3.1 pp. 190–192, read on scans. The fixed field, quaternion algebra and determinant constraints remain; no unrestricted full-GL₂ assertion is made. |
| Bad reduction and vanishing cycles | Carayol §5.6 p. 429, §6.7 p. 432, §10.6 pp. 448–449, §11.1 p. 449 and §11.4–11.5 p. 451. The weight-two exception, normalization kernel and nonsplit special extension agree with the package. Detailed geometric proofs remain named geometry/LPV imports. |
| Period continuation and central-isogeny lifting | Kisin 2003 Proposition 5.14/Corollary 5.15 pp. 26–27; Wintenberger 1997 Theorem 2.2.2 pp. 1310–1311; Skinner §§2.4.1–2.4.2 pp. 252–255. Unit factors, injectivity, the family non-zero-divisor condition and liftable Hodge cocharacter are retained. |
| Unitary geometry and eigenvariety interpolation | Skinner §§2.3–2.4 pp. 246–255, Blasius §§3–4 pp. 17–21, Buzzard 2006 Lemma 12.2/§13 pp. 77–80 and Buzzard 2004 §7 Proposition 4 p. 19. Compactness/gluing and small-slope classicality are separate contracts. |
| Ordinary characters, periods and integral comparisons | Skinner–Wiles §§3.1–3.3 pp. 27–32, 37–39; Conrad Appendix B pp. 32–36; Colmez–Fontaine Theorem A p. 2, §3.4 pp. 21–22 and Propositions 4.2/4.4 pp. 23–24; BGV §3 pp. 7–8; DFG §§1.2/4.5/5.3–5.4. These support the explicit intervening argument above. A Hida filtration theorem is not used to supply its normalization. |
| Faithful Hecke module, finite quotients and quaternionic sign | DDT §§4.1–4.2 pp. 109–113; Chenevier §§1.1–1.5 pp. 7–8, §1.10 p. 12 and Theorem 2.22 p. 34; KW II Lemma 7.2 pp. 60–61 and §9.1.1 pp. 80–81. Whole-ring and residual irreducibility hypotheses remain, and the ambiguous sign case is excluded. |
| Independent geometric weights and trace-zero density | Saito's supplement Theorems 1/3 pp. 429–430, Saito Hilbert Theorems 1/2 pp. 12–13, Blasius Proposition 5/Corollary 7 pp. 16/20 and Skinner 2020 §3 p. 350. Geometric weights are an independent input; analytic trace-zero density is not inferred from a bare large-image assertion. |

I also read Conrad's algebraic Hecke-character converse, the second Lemma 1
and proof pp. 9–10, and Ribet 1975 Theorem 2.3 and proof pp. 251–252.
The former requires number-field-valued Weil characters; §3.13 supplies that
hypothesis by its ray-class argument. The latter requires infinite projective
image; distinct regular labelled degrees supply it, unlike the weight-one case.

The random sample was fixed before checking with `random.Random(9778)`, sampling
15 of the 66 packet nodes. All associated locators, not just the first citation
of each sampled node, were compared with the package.

| Sampled target | Locators verified | Result |
| --- | --- | --- |
| §4.11 nearly ordinary construction | SW §2.1 p. 9, (3.1′) p. 30 and §3.3 (3.2) pp. 38–39 | Arithmetic reciprocity, inverse action and the parallel theorem agree; general-weight comparison is separately derived. |
| §5.1 ordinary lattice | SW pp. 38–39; DFG §§1.2/4.5/5.3–5.4 pp. 8–10, 51, 56, 58–59 | Rational character identification precedes the fixed-lattice intersection. |
| §4.13 HK/de Rham multiplicity | CDN §5.2.1 Proposition 5.2 pp. 43–45 | Local JL factor, period module and Tate twist retained. |
| §1.3 Scholl projector | Scholl §§1.0–1.3, Theorems 1.2.1/1.2.4 pp. 1–3; §4.1.1–4.1.4 p. 8 | Projector and coefficient comparisons match, including r=0. |
| §2.4 Condition C | DS §7.1 p. 523 | A large subset, not necessarily a subgroup; semisimplicity concerns the representation. |
| §4.8 classical irreducibility | Skinner Remark p. 256; DDT Theorem 3.1(a)–(c) p. 86 | Absolute characteristic-zero irreducibility is distinct from residual irreducibility. |
| §5.5 endpoint contract | KW Corollary 7.8 pp. 67–68; DFG §§1.2/5.4 | No automatic weight-two or Fontaine–Laffaille conclusion. |
| §5.2 crystalline/Wach factor | Scholl Theorem 1.2.4 p. 2; DFG §§1.2/5.4 pp. 8–10, 58–59 | Good-prime crystallinity and the integral Wach quotient are distinguished. |
| §1.6 integral structures | DFG §1.2 p. 9, Lemma 4.12 p. 51, Lemma 5.5 p. 56 and §5.4 p. 58 | Excluded primes and lattice choices agree. |
| §6.7 reduced localization | DDT Lemma 4.4 p. 111, Lemma 4.6 p. 112, Proposition 4.7 p. 113 | Localization, coinvariants and the specified reduced index set agree. |
| §3.5 fundamental local representation | Carayol §10.6 pp. 448–449 | Its dependence on the local component and weight-two exception are retained. |
| §6.4 conductor/local factors | DDT Theorem 3.1(d)/(e) p. 86; Carayol §0.8 p. 411 | Tate-module/arithmetic convention is transported before reading the Euler factor. |
| §6.11 quaternionic local character | KW Lemma 7.2/proof pp. 60–61 and Remark p. 61 | The Nv≡−1 exclusion and inverse-action sign agree. |
| §2.7 finite-group lifting | DS §8.6 p. 526 | Prime-to-order lifting is invoked there; the roadmap states its congruence-stage proof. |
| §5.4 CM ordinary line | DK Lemma 9.2/proof p. 67 | Conjugation moves the specified distinct-character line. |

The principal repair sources have the following SHA-256 values. Links identify
the versions read; the two Kisin DVI files were obtained from the public author
host after the older host rejected direct access.

| Source | SHA-256 |
| --- | --- |
| [Skinner–Wiles, Numdam](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) | `ec0697b3e9c9fa68063b19688f10347d204a8b7b86526384c9ccd6e7fe30e6f3` |
| [Conrad, Appendix B](https://math.stanford.edu/~conrad/papers/locchar.pdf) | `782fe71a3c7f26ccd67943d468f73540d384e2de5d474bf8369475b8b631d9bd` |
| [Colmez–Fontaine](https://webusers.imj-prg.fr/~pierre.colmez/CF.pdf) | `f0b5c51191831415b39cd363cc9eb5ba759d1ea7e46d9b4c1d15cea0a7aa6490` |
| [Kisin 2008 author DVI](https://people.math.harvard.edu/~kisin/dvifiles/def.dvi) | `ca85f74a47caf411dfb7fe0fa356ef30928d5dbd2cd518bafcc13943cf483dee` |
| [Kisin 2003 author DVI](https://people.math.harvard.edu/~kisin/dvifiles/fmform.dvi) | `670d6a0703a86d5d21292ef0749e6052f3d183123f6383af25909cc7ae2c9a2b` |
| [Conrad, Hecke-character converse](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/algebraicHeckecharacters.pdf) | `4a8c1ad60189b0b49438c10cdf24f5386a088edaca2d29ba96632e3f37694504` |

## Closure and duplication

I checked prerequisite chains against the current tier order: this roadmap is
tier 18, early AG2 is tier 17, and the family/transfer/geometry suppliers are
lower tiers. The later ordinary, Serre-weight and potential-modularity roadmaps
are consumers. No higher-tier import, `FoundationsAndLibraryIntegration` or
`UPSTREAM:` identifier remains. Later-numbered internal references are checked
for a mathematical cycle, rather than treated as a cycle merely by numbering;
the geometric-weight input, early AG2 exports and generic period contracts do
not import their modular application back from this roadmap.

Current upstream commit examined:
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti commit:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I screened every target by its
mathematical objects, hypotheses and operations against all current roadmaps,
the nine newer roadmaps, Completed and current library. Relevant matches were
read, including ModularForms Layers 8/8W/8G, IntegralHeckeAndGaloisDeterminants
Layer 3a.1 and §4.1, and LocalGaloisGroups Layer 5. Generic reciprocity,
polynomial scaling/duality, determinant laws, cohomology comparisons and
analytic modular-form spaces are already deferred. Current
`HeckeRing.GL2.EigenformAwayFromLevel`/`Newform` and
`TauCeti.det_tateModuleGaloisRepresentation` are analytic/elliptic inputs, not
the arbitrary eigenform extraction target. IntegralLattices' quadratic-lattice
targets do not provide the general coefficient-DVR intersection used here.
No further duplicate target was found or removed in this review.

At the pinned Mathlib/Tau Ceti commits I read the actual averaging,
finite-group complement, finite inverse-system, GL cardinality, character
nonvanishing, zeta residue, bounded integral embeddings and Landau declarations.
The package carries their finite-order invertibility, normality/coprimality,
finite-stage, nontrivial-character, integrality/all-embeddings and exact-abscissa
hypotheses. The local cyclotomic input was checked independently in the current
roadmap, including the uniformizer value at Q_p.

The packet's twelve recorded implementation gaps and fifty-one supplier
requests remain explicit obligations in their owners' directions. The package
states the concrete coefficient descent, geometric module, exact local-condition,
endpoint and level-lowering targets; it does not present those developments as
completed library results. The packet was not changed. No new unsourced
mathematical conclusion or unassigned prerequisite remains.

## Adversarial mathematics pass

I checked every numbered target, its displayed identities and its definitions.
The table records the instances used and the result; “retained” means the existing
scope or negative control suffices. These are mathematical checks, not a claim
that sorry-proved examples establish the results formally.

| Statement or convention | Instance/attack | Result |
| --- | --- | --- |
| Frobenius, determinant and duality | 11a1 at 3; norm twist gives t=−3, s=9, q=3 | X²+3X+27 versus Carayol X²+X/3+1/3; retained. |
| Infinity type and labelled degrees | (2,0), (12,10), (2,2), wrong parity (2,1) | (0,1), (0,11), (1,2); wrong parity fails the sum; retained. |
| Coefficient-prime reciprocity | Q_p, u and ϖ=p; ramified K with Norm(ϖ)=u p^f | Geometric values u and 1 over Q_p, Norm(ϖ)/q over K; ownership made explicit. |
| Monodromy direction | F=diag(1,3), N=E₁₂; N=0 alternative | FNF⁻¹=N/3; deleting N changes the parameter; retained. |
| Generic suppliers | Trivial group; characteristic dividing group order; finite/infinite residue fields | Averaging and congruence-stage lifting keep the required invertibility/finiteness. |
| Character recognition and density | Characteristic two; integral versus arbitrary bounded coefficients | Full polynomials and all-embedding integrality retained; nonzero modulus clarified. |
| §1.1 coefficient congruence | r=0; good characteristic p-torsion versus characteristic-p subgroup schemes | Weight-two specialization and p+1 lines have their stated scope; retained. |
| §1.2 parabolic realization | Eisenstein boundary class; zero cusp space; nonquadratic ψ | Image H¹_c→H¹, correct rank/top filtration and ψ⁻¹ convention retained. |
| §1.3 Scholl projector | r=0; r! noninvertible; boundary cohomology | Rational signed projector and excluded integral primes retained. |
| §1.4 orbit descent | One coefficient embedding versus rational orbit; nonminimal coefficient field | Orbit projector and allowed coefficient enlargement retained. |
| §1.5 rank-two newform | k=2 and Δ; ψ of order three; good versus coefficient prime | Rank two and exact dual convention retained. |
| §1.6 integral structures | λ dividing Nk!; ramified coefficient DVR | Excluded comparison primes and actual lattice retained. |
| §1.7 higher-weight existence | k=1; k=2; arithmetic versus geometric Frobenius | k≥2 theorem is separate from the weight-one route. |
| §2.1 Rankin estimate | Zero trace; cusp versus Eisenstein form; s approaching 1 from above | Nonnegative prime sum and exact normalized denominator retained. |
| §2.2 finite eigenvalue set | One bounded embedding versus all embeddings; nonintegral values | Integral all-conjugate bounds are required; retained. |
| §2.3 residual eigensystem | Weight one mod λ; characteristic two | Reduction/lifting precedes characteristic-zero geometry; full polynomials retained. |
| §2.4 Condition C | Trivial group, M=0, η=0; cyclic and split Cartan groups of order four | Counts polynomial images of a subset, not its elements; controls retained. |
| §2.4 semisimplicity and matrix fibres | Diagonal Cartan, order-5 unipotent; exhaustive GL₂(F₂), GL₂(F₃), GL₂(F₅) counts | Invariant complements are the criterion; all fibre formulas verified, totals 6, 48, 480. |
| §2.5 uniform order bound | η<0, η=1/2 boundary; unipotent cyclic group | Negative η is vacuous, strict upper bound and representation semisimplicity retained. |
| §2.6 splitting coefficient primes | Nℓ exclusions; nonsplit residue field | Completely split primes supply F_ℓ and a single pre-reduction finite set. |
| §2.7 prime-to-order lift | n=0, trivial group, equal-characteristic DVR; order-5 unipotent over Z₅ | Completeness/finite residue field retained; forbidden unipotent control remains. |
| §2.8 characteristic-zero lift | Finite set of exceptional polynomials; coefficient enlargement | Injective reduction of the chosen finite eigenvalue set retained. |
| §2.9 cuspidal irreducibility | Two one-dimensional characters, one trivial | Dirichlet/zeta pole distinction and cuspidality retained. |
| §2.10 Artin representation | Finite dihedral image; good p at k=1 | Finite-image odd representation remains separate from regular geometric weights. |
| §3.1 quaternionic multiplicity | d=1; d even without finite discrete series; coefficient extension | Split place and geometric existence hypotheses retained. |
| §3.2 twisting/determinant | Central character of order three; inverse norm twist | Exact central and cyclotomic factors retained. |
| §3.3 vanishing filtration | All k_τ=2; principal versus special local component | Localized weight-two correction and filtration directions retained. |
| §3.4 special component | Split diagonal WD module with same Frobenius roots | N≠0 and nonsplit extension are required; retained. |
| §3.5 local fundamental piece | Special and cuspidal components; weight-two character summand | Local dependence and correction retained. |
| §3.6 ordinary cuspidal comparison | CM comparison form with matching local component | Local matching does not assert global identity; retained. |
| §3.7 Theorem B | Auxiliary place and extraordinary dyadic place | Original exclusions are retained until later removal. |
| §3.8 primitive restriction | A₄ versus S₄; missing determinant; A₅ | Cubic extension need not be normal; determinant required; solvable local image excludes A₅. |
| §3.9 cubic base change | Nonnormal cubic extension | Strong local transfer is an explicit contract, not inferred from cyclic base change. |
| §3.10 unrestricted constructor | d even, parallel weight two, principal series everywhere | Unrestricted congruence construction remains a separate target. |
| §3.11 source dictionary | Norm-twisted elliptic data and nontrivial central character | Dual, central correction and Tate twist all agree. |
| §3.12 Hodge–Tate property | Remaining even-degree weight-two case; quadratic twist | Symmetric square fixes degrees, not the full coefficient-prime parameter. |
| §3.13 geometric characters | ε_ℓ; CM character; nonintegral Sen weight; Weil values not assumed algebraic | Ray-class argument supplies one number field; totally real parallelity has its stated scope. |
| §3.14 determinant/oddness/irreducibility | Complex conjugation; reducible local ordinary restriction; reducible residual object | Global characteristic-zero assertion and the two weaker settings remain distinct. |
| §3.15 CM definition | Q(i) form, split 5 and inert 3; half-integral α | Algebraic shift gives −1±2i at 5 and trace −2; retained. |
| §3.16 virtual reducibility | Regular CM induction versus weight-one finite dihedral representation | Infinite projective image and regularity retained. |
| §3.17 geometric Hilbert theorem | d odd; d even with/without finite square-integrable place | Existence hypothesis retained despite local exclusion removal. |
| §4.1 geometric weights | Saito range versus remaining unrestricted case | Independent geometric supplier is not a circular import. |
| §4.2 Ramanujan | Complementary series and CM forms | Regular integral weights and independent realization inputs retained. |
| §4.3 Langlands normalization | Steinberg twist and unramified roots | Half-norm shift and L(s−1/2,π) retained. |
| §4.4 away-prime compatibility | Bad Steinberg place with N≠0 | Full F-semisimple WD parameter, conductor and N retained. |
| §4.5 geometric coefficient comparison | Good nonordinary form; even-degree existence restriction | Geometric scope retained; no residual hypothesis invented. |
| §4.6 Kisin | Reducible residual representation; nonreduced family | Residual absolute irreducibility and whole fixed-type quotient retained. |
| §4.7 Skinner | Residually reducible remaining case; Q(0) zero divisor on family | Full theorem supplies all cases; continuation hypotheses retained on the family. |
| §4.8 classical irreducibility | 11a1 mod 5 versus characteristic zero | Reducible reduction does not contradict the theorem. |
| §4.9 KW local forms | p=2; p ramified in F; Steinberg branch | Parallel/unramified-field and residual hypotheses retained. |
| §4.10 eigenpacket | (2,4), v=(1,0), principal unit 4 and torsion unit −1 | Values 1/4 and cancellation of two minus signs retained. |
| §4.10 uniformizer/operator | ϖ→4ϖ with ν(4)=ζ₃; split p over Q(√13) | α changes by ζ₃/4; global outside-place factor is divided out. |
| §4.11 selected period line | Twisted degrees (0,1)/(0,3); positive line degree; special N | Unique slope zero plus weak admissibility yields the line; corrected check to η⁻¹. |
| §4.11 source/central/norm transport | Order-three central factor, µ=2 principal unit, j=−1 and j=1 | Determinants, central specialization and unit/uniformizer laws agree. |
| §4.12 nearly ordinary away-p | Arithmetic reciprocity versus geometric reciprocity | Inverse inducing characters and the same global twist retained. |
| §4.13 period multiplicities | Rank-two M with local JL factor; omit twist or JL factor | Source tower, tensor factors and ρ_Π(−1) retained. |
| §5.1 ordinary lattice | Zero/full subspace, T=O², Ke₁, ϖOe₁; ramified/equal-characteristic DVR | Actual T/T⁺ is saturated; nonsaturated replacement has nonzero ϖ-torsion. |
| §5.2 crystalline/Wach | 11a1 at 2; trivial Z_p lattice; repeated root Jordan module | Slopes 1/2; integral quotient needs p inverted; semilinear basis change retained. |
| §5.3 CM splitting | Inert prime; split prime without compatible CM type | Regularity and CM-type condition retained. |
| §5.4 conjugation | Off-diagonal induced basis; coincident local characters | Swaps the specified distinct-character lines; arbitrary lines excluded. |
| §5.5 endpoint | k=p+1; p=2; degree-p crystalline line | Crystallinity does not imply small-range integral comparison or a weight-two lift. |
| §6.1 Tate decomposition | Rational coefficient field versus several λ over ℓ | Direct sum and arithmetic-dual convention retained. |
| §6.2 residual representation | Nonhomothetic lattices; F₄ scalar matrix of trace zero | Semisimplification is lattice independent; trace alone is insufficient. |
| §6.3 full Hecke algebra | 11a1 oldspace at level 88 | Nonzero square-zero class from X²(X²+2X+2) retained. |
| §6.4 conductor/Euler factors | 11a1 at 11; split versus nonsplit multiplicative reduction | N and inertia line determine the bad Euler factor; retained. |
| §6.5 optimization | 11a1 at ℓ=7 versus ℓ=5; ℓ=3 quadratic restriction | Exact modularity/residual/type hypotheses and prime-to-ℓ character retained. |
| §6.6 type-Σ family | Empty index set without optimization; finite quotients | Nonemptiness comes from §6.5; cofinal quotient argument has its reduced scope. |
| §6.7 reduced localization | Coinvariants versus the full oldform Hecke algebra | Specified localization is reduced; no general reduction claim. |
| §6.8 geometric determinant | Dual numbers, characteristic two, non-flat family | Whole generic algebra and O-flat injection retain nilpotents; no division by 2. |
| §6.9 reconstruction | Reducible residual law; nilpotent coefficient ring | Absolutely irreducible residual law and henselian whole-ring supplier retained. |
| §6.10 quaternionic family | p=2, noncompact level; k>2 at quaternionic p-place | Coefficient-action extension and disjointness hypotheses retained. |
| §6.11 fixed local sign | Nv≡−1 mod p with split residual characters; inverse uniformizer action | Ambiguous case excluded; eigenform assertions do not supply an integral family flag. |
| §6.12 whole-family local conditions | Nilpotent Artinian quotient; dense field points | Functor/ideal factorization required over all quotients; reduced-point density is insufficient. |
| §7.1 data/predicates | Trivial rank one, Steinberg rank two, unrelated good polynomials | Carrier and compatibility are separate; N remains. |
| §7.1 operations | Rank-two sum/tensor; ramified scalar twist or restriction killing inertia | Rank four is outside almost-strict domain; newly required coefficient-prime pairs need comparison. |
| §7.2 purity | N=0 versus rank-one N≠0 | Weights w+1 versus kernel/cokernel w,w+2 retained. |
| §7.3 eigenform family | Δ at 2; even-degree everywhere principal series | X²+24X+2048; full local comparison proves strict compatibility. |
| §7.4 Dimitrov | CM form; subfield F_q⊂κ_λ | Non-CM and finite exceptions retained; conclusion is not all GL₂(κ_λ). |
| §7.5 Ribet–Momose | Inner twists and constrained determinant | SL₂/Zariski and constrained open-image conclusions retained. |
| §7.6 fixed-level ramification | Level 11 versus divisor 1; reducible mod 5; level p | Fixed squarefree level and large-p exclusions retained; level lowering is explicit. |
| §7.7 ordinary density | Nonzero norm with all λ nonordinary; CM trace zero | Norm bound forces a_p=0 for p>4; some-λ and every-λ quantifiers remain distinct. |

## Lean signatures and validation

The final Suggested.lean has 377 lines, ten real-bodied definitions, nine theorem
signatures and twenty examples. It states light finite-group, polynomial and
lattice interfaces at the pins. There are no heavy arithmetic carriers,
chains of auxiliary lemmas, sorry-bodied data, `True` placeholders or theorem
hypotheses containing their conclusion. All README definitions occur in a
declaration or the new closing comment.

I checked all ten definition signatures, and the theorem hypotheses, against
their corresponding prose:

| Signature | Match checked |
| --- | --- |
| `arithFrobCharpoly` | Natural k, exponent k−1; representation interpretation restricted to k≥1 and genuine good data. |
| `arithFrobCharpolyDual` | Inverse roots; denominator nonzero for the stated representation interpretation. |
| `ConditionC` | Finset subset of G, proportion inequality and polynomial-image cardinality. |
| `IsSemisimpleSubgroup` | Stable submodules have stable complementary submodules; not elementwise diagonalizability. |
| `hilbertGeomCharpoly` | Coefficients t and qs in geometric convention. |
| `carayolGeomCharpoly` | Coefficients t/s and q/s, with nonzero s for the dictionary. |
| `hodgeDegrees` | Integer pair and explicit parity requirement for interpretation/sum theorem. |
| `nearlyOrdinaryUnitValue` | Finite factor times the product over labelled embedding values; local interpretation requires nonzero values. |
| `ordinaryLatticePlus` | Ambient intersection after scalar restriction over general O, not only Z_p. |
| `ordinaryLatticePlusIn` | Inverse image inside T, making the quotient the actual T/T⁺. |

The lifting theorem carries completeness and finite residue field; the order
bound carries η<1/2 and semisimplicity; the fibre theorem excludes d=0; the
Hodge sum carries parity. Saturation is general over a domain with fraction
field; free rank one additionally carries a DVR, a finite full lattice, ambient
dimension two and subspace dimension one. These are substantive statements.

Validation completed:

- Final `lean-check` exited 0 with exactly twenty declaration-uses-sorry
  warnings and no other warnings or errors. The initial check also passed.
- Exhaustive finite-matrix calculation verified every fixed-polynomial fibre
  over F₂, F₃ and F₅, including repeated roots in characteristic two.
- Original packet check, sorry-data/size check, intake check for every
  submitted path and `git diff --check` passed.
- Inventory and prose checks found no missing API/test name, forbidden
  upward placeholder, local path or process residue in the package.

Nothing remains to repair in this package review. Acceptance concerns the
roadmap and its statable suggested interfaces; it does not assert that the
planned mathematics is formalized.
