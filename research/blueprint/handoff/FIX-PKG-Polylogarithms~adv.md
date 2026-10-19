# FIX-PKG-Polylogarithms~adv — checkpoint

Issue #11149. Worker: Codex, session `codex-oKdv6s`, 2026-10-19.
The claim bot confirmed this session. This run takes no second job.

**Disposition: needs_changes.** G2 and G3 have target-level repairs; the
geometric portion of G1 is planned locally. The remaining weight-four work
belongs to the existing `ZagierConjecturePolylogarithms` continuation and its
suppliers. Their files are outside this issue's four authorized deliverables.
This checkpoint does not certify an upstream-ready package or treat a published
existence theorem as conjectural.

## Finding → change

| Finding | Change and evidence | Disposition |
| --- | --- | --- |
| G1: ideal-boundary geometry was assigned to an unspecified continuation | README §2.4 now constructs the upper-half-space metric, its completeness, curvature, volume density, SL₂ action and boundary; the explicit half-space ideal region; compact measurable truncations; four geometric cusp estimates; convergence; and the signed Lobachevsky integral. Inputs are the existing GeometricTopology and DifferentialGeometry metric/form interfaces. Milnor, Chapter 7, Theorem 7.2.1 and Lemma 7.2.2, printed pp.160–164, supports the integral. | Repaired at target level. |
| G1: weight-four constructions had no actual supplier | Scope and §§4.5–4.6 now name the existing **Polylogarithms, Part II: the weight-four Zagier theorem**, with a construction-by-construction ownership table. Its specialized presentations, extension, reduced cyclic coalgebra, correlators, decorated flags, period DGA, Chern class and K-theory maps remain with their actual owners. The parent's lower-weight objects and determinant convention are independent inputs, rather than consequences of its own regulator interface. | Partial: supplier construction leaves below still block completion. |
| G1: L₄* versus L₄ | §4.5 now gives the tensor proof: apply δ₃⊗id to an explicit cycle, then D⊗log⊗log; the logarithmic correction sums to zero and the period conversion is exactly 5/16. It names Part II Layer 5's existing owner. A native-carrier Lean milestone and two proved rational coordinate controls record this use without constructing another period DGA. | Repaired at target level. |
| G2: unsupported top quotient normalization | Chose the permitted alternative comparison: define r₆=18M₃. The two lower maps are independently shown to be 18 times G95's f₀ and f₁. G95 (3.5), p.266, requires the inverse projected ratio and the rational B₂ inversion sign. Projectivization p.268 and the quotient-level complex isomorphism (5.20), Theorem A p.293, give the upper square. No equality Alt[T]=−90M₃ is claimed. | Repaired at target level. |
| G2: triangle, reduction and projection | §3.6 records Definition 1.5's actual three relations, the order (x₁,x₂,x₃,y₁,y₂,y₃), determinant parameter, endpoint η, exact two-line incidence relation and inverse reduction. G95 Propositions 5.3/5.6 and Lemma 5.4, pp.287–293, supply its quotient descent. Theorem 8.1, pp.304–308, fixes the duality sign; Corollary 7.6, pp.302–303, gives the projected top square. The lower projected squares have their own symmetry proof. | Repaired at target level. |
| G2: regulator scalar | §3.7 now transports the whole G95 comparison by 18, including the K-theory map and original real regulator scalar. Its Tate-coordinate conversion remains explicit. The packet's raw triple-ratio-map formula is replaced by this coherent geometric construction, as the finding permits; the raw determinant diagnostic remains. | Repaired; no claim to verify the abandoned raw alternating identity. |
| G3: a reduced universal support lost multiplicities | §5.3 constructs the needed projective Chow-family case of relative cycles on the native algebraic-cycle carrier: flattening/fat-point specialization; all Noetherian characteristic-zero base maps; h-descent; Chow-form injectivity and h-representability; descent to the supplier's coefficient scheme; tautological cycle and its admissible restriction. SV Definitions/Propositions 3.1.3–3.1.5, pp.16–19; Theorem 3.3.1, pp.23–27; Theorems 4.2.2 and 4.4.11, pp.58–61 and 79–81. | Repaired at target level. |
| G3: faces, vertices, properness and analytic bridge | Chow-form evaluation constructs faces only when all intervening geometric fibers intersect properly; projection retains generic degrees and excludes its center. Proper support survives every algebraic base change. §5.11 resolves pulled-back incidence components, forms logarithmic forms on the resolution and pushes currents with original coefficients. Current pullback is confined to smooth submersions or the specified transverse maps; other smooth families receive their own current. Corrected arity r_(p+q), giving degree q−p−1. Analyticity requires smooth cycles transverse to the arrangement. | Repaired at target level; the pre-existing general current-sign dictionary remains a named theorem obligation. |

## Why G1 still needs work, and where to resume

The actual continuation is already present at
`research/blueprint/readmes/ZagierConjecturePolylogarithms.md`, with its packet,
suggested file and independent review. Its planning pass was accepted on
2026-10-18; all six layers are planned, none closed. This differs from the
missing continuation name in the package's former text. There is no package
for that continuation in this checkout; its package job is still pending.
Naming its targets repairs ownership but cannot certify the missing inputs.

1. **MT:** the continuation's existing MT-1 request goes to
   MotivesAndAlgebraicCycles MC.4: number-field MT(F), graded fiber, Tate
   Ext¹/Ext², primitive K-theory identification and normalized Hodge realization.
   PS.9's existing construction is over ℚ/ℤ, not this entire interface.
   MT-2 goes to PeriodsAndSpecialValues PS.9: arbitrary finite rational puncture
   sets over a number field, tangential paths and endpoint regularization.
   Its existing three-puncture ℚ torsor is insufficient. HODGE goes to
   HodgeStructuresPartII H.2: framed Hodge–Tate Hopf/Lie coalgebra and canonical
   real period DGA, beyond its mixed-variation/degeneration targets. These
   owner extensions need actual construction chains; the generic MC.6 neutral
   Tannaka reconstruction is already planned and must not be duplicated.
2. **FLAG-SIGNS / C8-SQUARE:** the continuation's Layer 4 needs its flag-map
   sign certificate for D=∂+p and finite symbolic certificates for
   R₇³∂+R₇²p=0 on C₈(3), and R₇²∂=0 on C₈(2). Its own review explains why
   separate vanishing of the first pair of contributions cannot be assumed.
3. **LIFT / RES:** Layer 5 still needs the F-defined regularized Grassmannian
   motivic lift, constant terms and descent, and the SNC support/residue sign
   certificate. An integrable symbol over ℂ is weaker. Parent §5.5's raw-current
   dictionary remains a stated proof target; this fix does not certify it.
4. **SUPPLIERS:** the existing P3-SPEC, SCISSORS, HOM, DELIGNE and SCALE requests
   name specialization closure, the A₂ scissors interface, primitive homological
   comparison, nonproper simplicial Deligne compatibility and the real/Tate π³
   adapter. They must be discharged in their owners, with the already existing
   low-weight and upstream constructions imported. The stronger IND target is
   the parent's separate every-inductive-cycle obstruction, not a premise for
   explicit-cycle existence.
5. **Normalization adapter:** the continuation's configuration-formulas text
   uses a raw alternating triple symbol T₃ and identifies it with the negative
   of the parent's former r₆. This fix instead defines r₆ geometrically.
   A quotient-level adapter must be proved before any constants in those raw
   formulas are transported. Keep the raw convention distinct meanwhile;
   the boundary witnesses below cannot prove such an adapter. Do not patch the
   continuation's coefficients by uniform rescaling without verifying every
   row, scissors map and Chern comparison.

These are specific external construction leaves, not a reason to create a
second weight-four roadmap in this package. The next worker should begin with
the continuation's existing gap/request records and its supplier owners,
then reconcile the package's contracts when those interfaces are available.
The four-file scope prevents this run from completing that owner work.

The generic relative-cycle framework remains with the motivic-cycle direction
(MC.4 and the existing M.5a request). This package only plans the projective
Chow-family case required for incidence. No competing finite-correspondence
category or arbitrary motivic transfer is introduced. Current upstream
AlgebraicVectorBundles treats Chow theory as a successor topic; the actual
Chow/Cartier owner is SchemeAndStackFoundations SF.5. The stale ownership in
Scope and §5.3 has been corrected, and the existing Mathlib cycle carrier and
weighted pushforward are imported.

## Adversarial pass on touched statements

The entries below cover the additions and changed claims, including their
hypotheses, definitions, APIs and source boundaries. Original six layers,
47 numbered subsections, mathematical Checks and worked examples remain;
the prior 169-target coverage inventory is retained in the earlier handoffs.
No new proof is inferred from elaboration or numerical agreement.

| Statement/interface | Instances and calculation | Result/change |
| --- | --- | --- |
| Upper-half metric, curvature, completeness | h=1,2; h→0; horizontal plane; noncompact H³ | Vertical distance log 2 and infinite boundary distance; Christoffel formula gives curvature −1. Global volume is infinite, so regional Riemannian measure is used. |
| Möbius action and orientation | Translation; positive diagonal a,a⁻¹; inversion axis; complex conjugation | Density preserved under (w,h)↦(a²w,a²h); positive J requires the h² term; conjugation reverses orientation. |
| Ideal region and truncations | z=i, w=(1+i)/4, heights 1 and 1/10; real z; n=1; repeated/degenerate boundary vertices | Circumcenter (1+i)/2, radius²=1/2; first height lies inside, second outside. Real shapes use the degenerate convention; no division by Im z=0. Compact exhaustions are inside h>0. |
| Cusp convergence and signed volume | Infinity cusp; cutoffs H and 2H; omitted open ball; odd permutation | Tail A/(2H²), hence factor 1/4 after doubling. A nonexhaustive union is excluded. Odd permutations change sign; the positive region measure does not change sign. |
| Lobachevsky/volume identity | θ=0,π/2,π; z=i; regular ideal shape; real flattening | D(i)=2Λ(π/4), regular volume 3Λ(π/3). Geometric integrals precede comparison with D; analytic positivity is independent. |
| r₄=18f₀ | Moment curve (1,2,3,5); four vectors (1,8,2),(7,3,11),(1,3,2),(9,4,3) | Exact rational prime-exterior calculations agree. Alt₄ basic wedge is −6f₀. |
| r₅=18f₁ and lower square | Moment curves (1,2,3,5,7) and (0,1,4,9,16); all 120 permutations | Exact calculations modulo cross-ratio S₃ identities give 18f₁. δr₅=r₄∂ in the free prime exterior group; first fixture gives 36u(2)∧u(3)∧u(5). |
| Lower projected rows | Alternate determinant containing pivot; transpose the two common pivots | Counting 4 versus 6 gives r₅=−(3/2)Alt([q]₂⊗u|012|). The transposition fixes the projected summand, killing its alternation; the analogous three-minor argument handles r₄. |
| Top map and boundary controls | Nonconic tuple (e₁,e₂,e₃,(1,1,1),(1,2,3),(1,3,2)); all 720 permutations | After δ₂⊗id, r₅∂ has coefficient −60 at (u2∧u3)⊗u2, while δ₃Alt[T] has +300. These are necessary controls only; the actual top square uses Theorem A's quotient isomorphism. |
| Triangle parameter and endpoint | Coordinates (e₂,e₁,e₃,e₁+e₂,e₁+e₃,e₂−ze₃), z=2 and 1; z=0; interleaved order | Four determinants are z,−z,z,−1. Parameters two and one have proved Lean examples. Zero needs the endpoint extension; interleaving is odd and negates the geometric class. η maps to [1]₃. |
| Geometric relations/reduction | Coincident points; four collinear; three collinear; the specified two-line incidence | Four-collinear and repeated-point classes vanish; arbitrary three-collinear tuples do not. The R3 relation has its exact intersection and genericity hypotheses. Insertion of the auxiliary seventh point has the recorded deletion signs. |
| Gale duality | Matrix (I,B) and (−Bᵀ,I); rank-two four-vector example; double dual; six-point sign | Kernel matrices multiply to zero and recover the original orbit after dualizing twice. G95's six-point quotient identity is anti-invariance, giving the projected top square; Alt₆M₃=720M₃. |
| Weight-four ownership and extension | Single versus double symbols; quotient by single span; explicit versus inductive presentation | The extra Λ²B₂ term is retained in the full coalgebra complex; quotient is its identity two-term complex only after the extension theorem. No construction takes its own final theorem as input. |
| Cycle-period conversion | Zero cycle; endpoints 0,1; norm-one terms; general field embedding; coordinate triples (16,0,1),(16,48,1) | Tensor evaluation kills the correction on cycles, not termwise. Rational controls give 5 and 6, proved in Lean. General embedding theorem carries the complete universal cycle hypothesis. |
| Presentation comparison | Surjection on symbols; the pre-existing one-dimensional nonlifting square; injective lower map | Relation descent remains explicit; symbol surjectivity does not imply cycle surjectivity. No conjectured presentation isomorphism is used. |
| Chow locus and relative family | e=0; r=0; nonproper face; nonreduced/singular base; characteristic p | Degree-zero family is zero. Fiber dimension is r=d−c≥0. All Noetherian base maps are allowed algebraically in characteristic zero; the integral h-descent claim is not extended to characteristic p. |
| Multiplicity and specialization | x²−t, base change t=s², then s=0; doubled hyperplane; native finite symbol sum in characteristic two | [s]+[−s] specializes to 2[0]; reduced support fails. Native diagnostic is meaningful in any field and gives 2[s] throughout characteristic two, without asserting a positive-characteristic Chow theorem. |
| Tautological cycle and faces | Same support with coefficients one and two; seminormal h-cover; r=0; successive face intersections | Chow-form injectivity preserves coefficients and permits descent to the original parameter scheme. Face evaluation commutes with base change only where every intermediate intersection is proper; negative expected dimension gives zero. |
| Vertex and proper support | Projection center on/off cycle; finite generic degree d; empty support; noncompact S | Center is excluded; pushforward retains degree d. Closed support in X×S is proper over S. Compact test support has compact inverse image even for noncompact S. |
| Resolved-family currents | Doubled component; node with two branches; two-point collision at regular value; submersion; map contained in bad stratum | Components keep coefficients under degree-one resolution. Only the specified transverse/submersion pullbacks commute as currents; other maps use their own base-changed family construction. |
| Radon arity, grading and analyticity | p=0; p=q−1; q=1; q=0; smooth parameter with singular cycle | r_(p+q) has degree p+q−1 before integration, q−p−1 after it. q=0 has no chain. Smoothness of S alone does not imply real analyticity; smooth arrangement-transverse cycles are required. |

All exact configuration calculations used rational arithmetic, prime valuations
and permutation signs. The quotient-level proof still rests on the specified
geometric relations and source theorem, never on these calculations alone.

## Sources and library/ownership audit

Sources were read in their public versions, with rendered pages for the scanned
G95. The new text is mathematical synthesis in the worker's own words. No
source passage or restricted-library file was copied into the repository.
No suspicious instruction was encountered in fetched material. The previous
review's NSW access limitation remains; this fix makes no new verification
claim for those unchanged book locators.

| Source inspected | Principal locators used | SHA-256 of public PDF |
| --- | --- | --- |
| G95, author's Advances scan | (1.6) p.203; Figs.1.6–1.7 and Definition 1.5, pp.210–212; f₀ p.264; (3.5)/Proposition 3.8 pp.266–267; projectivization p.268; inverse construction pp.285–293; Theorem A p.293; duality pp.302–308 | `434fd9093d2e27e96fae240f8f591ca532baa2f9cc7cdfeb8bc087f5235f5344` |
| G94, Seattle manuscript | Theorem 3.12(a)–(b), pp.22–23; lower normalization (3.3), p.17 | `e664e340573fcadd339e46c8d4a105a00f4cae0700622884455c4c9c60c55225` |
| GR, arXiv:1803.08585v5 | Weight-four extension pp.15–16; configuration comparison pp.62–71; canonical period (191)–(192), pp.77–78; Chern/primitive comparison pp.87–94 | `d7694f411ff344af087768a951a871aef6ebd4bbed571af6d6c045560d6ed8df` |
| G04, arXiv:math/0207036v3 | Current extension Theorem 2.4, pp.15–17; incidence Theorem–Construction 3.1 and identities, pp.26–28 | `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db` |
| SV, author's Relative cycles and Chow sheaves | Flattening Theorem 2.2.2, pp.9–10; relative cycles pp.16–19; base change pp.23–32; h-descent pp.58–61; Chow transform/representation pp.79–81 | `4f2cfb7162e9ca5febd9010ffca3a3d1ebe3e34b7031c6d514bd02b00e53ce92` |
| Milnor, Chapter 7 of Thurston's 1980 notes, electronic edition 1.1 | Lemmas 7.1.2–7.1.4, pp.158–159; Theorem 7.2.1/Lemma 7.2.2, pp.160–164 | `a42ef9fc5884005ad72e559e6d59ccadce447dd47ecf985b0ee44b7d17c5a683` |

The source URLs and precise versions are in the package References. Minor
typographical slips in the Milnor electronic text were not copied into its
angle sum, derivative or volume density. No new errata job is claimed here.

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
Also read the current read-only TauCetiRoadmap checkout at
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Compared the exemplar and current DifferentialGeometry/LocalGaloisGroups;
checked GeometricTopology Layer 7 and AlgebraicVectorBundles' successor
boundary. Read the relevant library-coverage entries and actual cycle,
distribution, continuous-log and local-log declarations. No new native
carrier is postulated where those declarations apply. The Lean file uses
only `import Mathlib`; heavier objects remain README targets.

Read the actual Part II targets and the supplying PS.9, HodgeStructuresPartII
H.2, MC.4/MC.6, M.5a/M.8 and Chow/resolution/analytification plans. An accepted
design with explicit remaining leaves is not reported as a closed supplier.
This fix edits no supplier, packet, metadata, campaign file or atlas data.

## Validation and submission

- `lean-check research/blueprint/packages/Polylogarithms/Suggested.lean` exits
  **0**. Available memory was above 20 GB before the check. Final file:
  **436 lines, 20 theorem signatures, 27 proved examples, 20 `sorry` warnings**,
  no other warning and no error. No data definition is admitted. The two new
  light definitions have two examples each; heavy constructions remain targets.
- All six `Polylogarithms*.json` input packets pass
  `python3 scripts/check_blueprint.py <packet>` with **0 errors, 0 warnings**.
  Those checks validate the unchanged inputs, not the mathematical closure
  claimed here.
- `python3 research/blueprint/intake.py check-files` on exactly the four
  deliverables reports **0 problems**. `review.json` parses as JSON;
  `git diff --check` passes.
- Exact rational configuration checks pass for the two lower normalization
  fixtures, two lower-square fixtures and the −60/+300 boundary control.
- Preserve `needs_changes` until the G1 supplier/construction residue above is
  resolved. Submit this work as a checkpoint with `Refs #11149`, then stop.

The scratch PDFs, calculations and logs are disposable; everything needed to
resume is recorded above or linked from the package and the existing
continuation. No background Lean process is left running.
