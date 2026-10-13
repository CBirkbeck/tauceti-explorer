# PKG-HabiroCohomologyFoundations~3

Completed package revision for issue #9174, ready for independent review.
Agent: Codex (GPT-6), session `codex-1X9BGv`; 2026-10-13.
Branch: `codex-1X9BGv-habiro-package`.

## Delivery

The README now follows the binding 2026-10-12 shape: Summary, scope,
conventions, exact supplier contracts, build order, nine numbered layers,
numbered mathematical subsections, named API statements, Checks, worked
examples, dependencies, downstream consumers and references. All 151 target
headings are preserved, in their original construction order, with HQ.4
before HQ.3. All 266 accepted API names remain; five additional named native
or square interfaces make their domains explicit. The 162 existing prose
checks are retained, with four wording corrections, and six new checks give
168 in total. The packets themselves contain 153 tests. Every one of the 38
API-bearing definition/construction sections has at least three Checks.
No target is removed to meet a size limit.

Suggested.lean is 196 lines, with five light real-bodied definitions, six
milestone statements and twelve fully proved examples. It imports Mathlib,
uses the prescribed namespace and has no admitted data, arbitrary theory
contexts, auxiliary theory development or surrogate enhanced categories.
Heavy constructions and their exact mathematics remain in the README.
Metadata is unchanged, exactly `topic = "math.AG"`. All packets, the assembled
reader/suggested inputs and review.json are unchanged. The old needs_changes
review is deliberately left for the next independent reviewer to replace.

This completes the packaging job. It does not claim to formalize the
cohomology theories or prove the six admitted milestones. Existing open
mathematical targets remain open: the analytic comparison, enhanced source
proof sketches, smooth-proper perfectness, action-normalized uniqueness,
framed uncompleted Habiro comparison, and canonical θ/Witt map equalities.
Their hypotheses and suppliers are preserved rather than filled by arbitrary
records. No checkpoint or additional worker claim is needed.

## Review repairs

| Finding | Final repair and reader location |
| --- | --- |
| R4: arbitrary envelope rings and witness | Removed QPDEnvelope, PCompleteFramedComplex, WitnessData and their dependent claims from Lean. §§1.3–1.11 and the supplier contract specify the smooth presentation, universal completed PD/q-PD envelopes, induced maps, regularity, flatness, rationalization and h-completion. §§4.2–4.3 and 5.20 fix the free perfect δ-ring quotient and the ambient universal generator. Universal δ-adjoining is distinguished from ordinary adjoining. |
| R5: arbitrary categories and cohomology | Removed QDeRhamContext, QWittContext, HodgeContext, CohomologyData, HabiroSheafData, AnalyticHabiroData and analogous supplier-record constructions. The README uses actual enhanced modules of named coefficient rings, animation, complete limits and canonical homology. Concrete distinctions in §§1.12, 2.5, 5.13, 7.1 and 9.14 retain their exact examples and domains. |
| R6: ordinary cokernels/kernels | Removed FilZ/FilN, quotBy, ordinary completion towers and their dependent filtered/Nygaard claims. §2.1 states genuine stable cofibres, fibres and completion; §§2.2–2.3 fix the degree-one quotient. §§3.25–3.28 and 4.6–4.7 retain the actual derived sequences and shifts. The native mapping-cone milestone has H^(−1)=H⁰=ℤ/2; the proved kernel example and three prose controls distinguish it from an ordinary cokernel. |
| R7: arbitrary q-Witt rings and ghosts | Removed QWittRings and all formal interfaces built over it. The HR.4 contract specifies the initial relative q-FV-system, its coefficient-balancing construction, and ghost targets R⊗_{A,ψ^d}A[q]/Φ_d. §§3.1–3.7 specify positive-degree initiality over those actual rings, including the m=1 and base-ring checks. No Nontrivial field is substituted for the missing universal construction. |
| R8: arbitrary framed comparison map | Removed framed_equiv. §5.4 fixes the map from the common truncated pullback, the counit/adjunction lift and canonical framed comparison. Its reduction is the identity on the Hodge filtration; complete conservativity applies to this map. The zero-map choice is explicitly excluded. |
| Retain R1 | §3.14 still quantifies over one derived complete complex functor, all its derived cyclotomic reductions, every cohomological degree and the projection-induced unrescaled Frobenii. It excludes no arbitrary independent module family. |
| Retain R2 | §3.22 still fixes the actual perfectoid quotient, canonical q-divided-power monomials and actual relative Frobenius. These remain precise README targets, not arbitrary native generators. |
| Retain R3 | §§5.15–5.23 still use the full cotangent complex, free δ universal properties, actual static cohomology, q↦1+h, the constant-coefficient square, saturated Hodge ideals and coefficient-defined combined filtration. Geometric conclusions are never asserted for independently chosen static rings. |

## Ownership and input reconciliation

The package no longer cites the higher LanglandsParameterStacks LP1 layer
for the lattice quotient. The specific right-Kan-extension/action-groupoid
QCoh application moves down to §§1.26–1.28, using EnhancedDerivedSheaves E0
coherent limits and E1 affine module enhancements. Its contract treats the
infinite discrete lattice, includes higher cocycles, mapping spectra,
pointwise t-structure and affine-local perfectness, and does not use a
finite-group-only action interface. The higher parameter-stack plan should
import this application if it needs it. No general parameter-stack theory is
moved or duplicated. This move replaces three upward dependency clauses;
the packets are not edited here.

The existing QW.5 and QW.6:framings common interface ownership remains as in
the reviewed package. HR.4 owns degree-zero q-Witt theory; HQ.4 owns its
positive-degree application. PR.6 owns local envelopes and comparisons;
this package owns their global arithmetic gluing. Generic Koszul and Lη
belong to AI.1. Trace comparisons do not define prismatic Nygaard.

The following package-only refinements should be reconciled with the packet
API wording when its owner next updates it:

- Local animation completes source colimits at p and target colimits at
  (p,h); these two completions have different roles.
- PairsCat.forget_filtration has filtered modules as target, without an
  extra filtration-completeness assertion. Completion is separate.
- The combined rational associated graded indexes i,j≥0.
- qWittOmega.nygaardFil_comparison includes p-completion and the shifted
  cyclotomic quotient; it does not compare the whole unreduced theories.
- Prime-power coefficient base change applies ψ^{p^a} on A and
  q↦q^{p^a}, followed by (p,h)-completion.
- Twisted-filtration transitions respect lax monoidal structures; no
  unsupported strong monoidal structure on rescaling is asserted.
- Relative semiperfectness gives cotangent amplitude one only with the
  p-quasi-lci hypothesis, and for the p-completed full cotangent complex.
- Naive-filtration base change is along a p-completely flat δ-map between
  p-completely perfectly covered bases, and completes at (p,h).
- The exponent-one envelopes use universal δ-adjoining, not ordinary
  polynomial adjoining. The restriction-map negative control requires the
  usual truncation/Verschiebung identities, rather than forbidding every
  map between indices (Frobenius maps exist).
- The square data explicitly separate filtered and unfiltered domains and
  record rationalization followed by h-completion where required.

## Adversarial mathematics pass

Every numbered subsection was checked for its input class, boundary
indices, operation order, actual carrier and map, and status as a theorem,
construction or open target. The table groups the 151 checked subsections;
it does not claim proofs of the enhanced constructions. The native retained
statements were additionally checked over arbitrary commutative rings,
including zero rings and positive characteristic where applicable.

| Statements checked | Instances and conventions | Result/change |
| --- | --- | --- |
| §§1.1–1.4 | A=S, empty frame, constant polynomial, q=1, r=0, q=2 and x³ | Local (p,h)-completeness is distinguished from global animation. D_q(x³) at q=2 is 7x², and constants give zero. Division in the framed ring requires hx_i regular; native polynomial formulas require no division. |
| §§1.5–1.11 | p=2, n=1, x=0 versus universal x, q=1, rational h-completion | The iteration exponent p−2+i is nonnegative. [p]_q has constant p, hence is invertible after p-inversion and h-completion. Universal envelope identifications exclude the rational q=1 countermodel. N_0=N_1=1, N_2=64 and N_3=2^14·3^26>0; no prime-dependent bound replaces the uniform one. |
| §§1.12–1.21 | A=S=ℤ, identity/disjoint covers, ℤ[x] covered by D(x),D(1−x) | ℤ[[h]] is not its product of local completions. Colimits, totalizations and rationalization retain their order; maps come from the common global functor. No S-linear qΩ tensor is used. |
| §§1.22–1.28 | d=0, q=1, q a unit, m=−1, dot product −5, non-free action | σ_a scales by q^{⟨a,m⟩}; negative exponents require a unit. θ_a:C⊗_{C,σ_a}M→M gives positive σ_a-semilinearity. Ordinary framed connections, modified connections and coherent descent remain distinct. Perfectness is affine-local, not compactness of an equivariant object. |
| §§2.1–2.3 | zero/identity maps, multiplication by 2 on ℤ/2 and on ℤ, m=1 versus m=0 | The cone of zero on ℤ/2 has two homology groups; the identity cone is acyclic; the regular ℤ scalar quotient has only H⁰. Filtered quotient uses F^{i−1}→F^i. βt=q^m−1, with weights (0,1,−1); at m=1 q=1+βt. m=0 is excluded from cyclotomic construction. |
| §§2.4–2.11 | ℚ[x^±1], R=A, h=0, α=0, series Σp^(−n)h^n | qdR and smooth qΩ differ globally. Completed scalar extension and the separate p-rational clause are retained. Lη commutation uses the imported hypotheses; combined graded indices are nonnegative. |
| §§3.1–3.10 | m=d, m=1, A=R=ℤ, m=p=2, terminal zero system versus initial system | FV=integer and VF=q-integer are different; V is not multiplicative and F is not a chain map. Actual degree-zero universal rings rule out the ZMod 1 model. Relative ghosts include Adams twists; ordinary coefficient base change is stated explicitly. |
| §§3.11–3.19 | smooth base-ring input, a=0, m prime to p, non-ℚ base | p-complete comparison is distinct from rational ghost splitting. Rescaled p^iF_p is the chain map. The no-go uses one complex functor and unrescaled projection maps. Animated forms and already shifted graded pieces are kept separate. |
| §§3.20–3.31 | n=0, a=1, S=A=ℤ, perfectoid exponent i=1, h versus Φ_p | N⁰ is full; in degree zero N¹=im V_p, N²=p im V_p. Stupid step one is zero on the base. Divided Frobenius requires smooth torsion-freeness. All fibre statements use actual derived fibres. The comparison is after the filtered cyclotomic quotient. Uncompleted framed Habiro operators divide by x_i, never by h. |
| §§4.1–4.8 | R=A, free perfect δ exponent-one quotient, coordinate polynomial at q=1 | All four axioms and higher agreement data are retained. The chosen filtration need not be filtration-complete. Its modification is completed after the colimit. hD_q specializes to zero, unlike D_q. The witness concerns the envelope generator, not its zero image in R. |
| §§4.9–4.16 | a=0, n=m=1, successive indices, scalar rescaling | Recursion starts from the given filtration. Rescaling is lax; transitions preserve that structure. Quotient is by β_m. Modifying Nygaard by Φ_p recovers qdR; modifying by q^p−1 then completing kills it. |
| §§4.17–4.27 | étale R=A, factorial chain, polynomial pair, identity finite-projective extension | Habiro descent is of qHdg on chosen pairs. Cyclotomic filtration is ascending and exhaustive; graded forms have one intrinsic shift. Finite-projective extension exchanges the full coherent diagrams. Mere flatness and independent objects do not supply the base-change theorem. |
| §§5.1–5.14 | n=0, n=1 affine line, dimension>n, zero comparison map, affine plane, d=0 proper/étale | Truncation and its oplax left adjoint have the stated directions. Canonical framed comparison reduces to identity, so zero is excluded. Small-prime bounds apply to dimension and tensor powers separately. Scheme and perfectness targets keep their exact coefficient localization/completion and source status. |
| §§5.15–5.25 | identity cotangent, polynomial mod p, ℤ→𝔽_p, exponent one/two, p=2, p invertible | Full cotangent, quasi-lci and semiperfect assumptions are distinct. B=A in the free δ example is relatively perfect over itself, without claiming absolute perfection. Saturation and coefficient conditions yield injectivity, not unconditional surjectivity. Higher powers ≥2 work at 2; the spherical proof has extra prime-two restrictions. Finite étale exports supply rings/Taylor maps only. |
| §§6.1–6.5 | spherical E₂ versus ku E₁ lift, identity versus nontrivial cover, p=2, number-field discriminant | Trace existence and prismatic constructions are independent. Resolution, base-lift and inversion hypotheses remain explicit. Genuine finite fixed points precede residual circle fixed points; the result is π₀, not an equivalence of the original global theories. |
| §§7.1–7.3 | arithmetic affine input, affine plane, cyclotomic specialization | Analytic coefficient localization and equivalence range remain open. No unconditional lossy-functor theorem is asserted for arbitrary analytic objects. The open problem is not an algebraic prerequisite. |
| §§8.1–8.2 | ℤ[x], q=1, r=0, ℤ[1/2][x] | The polynomial q-Hodge complex has H⁰(M/^Lh)=ℤ[x], but H⁰(M)/h=ℤ, with correction in H¹[h]. The native definitions have the same commutative-ring generality as their prose specializations. |
| §§9.1–9.10 | p=2 and 3, S=A=ℤ, Φ_p versus h, perfectoid θ versus θ̃ | (q−1)²+3q=[3]_q fixes the sign. q-PD, prism, perfectoid and cyclotomic ideals remain distinct. Only the specified canonical corners/maps form the squares; their metadata are insufficient alone. |
| §§9.11–9.19 | q=1 torsion sequence, ordinary-to-q-Witt direction, S=ℤ, dlog T | No inverse or restriction is fabricated. The θ and Witt equalities are map-equality targets with full-functor/Hodge–Tate normalization and scheme descent prerequisites. Objectwise isomorphisms alone do not imply them. |

## Sources and current-library audit

Read the current upstream AlgebraicVectorBundles and AnalyticToricGeometry
READMEs in full as presentation models. Independently inventoried the
Suggested.lean declarations in the nine newer roadmaps named by WORKERS,
including all eight OperatorTheory subroadmaps, and the four Completed
roadmaps. Searched the whole current Tau Ceti library and current roadmap
tree by q/Habiro/Jackson/Nygaard/prismatic/derived/δ/cotangent object names
and inspected the potentially relevant completion and cyclotomic results.
Those latter results concern lattices/local Galois theory, not these enhanced
cohomology constructions. No existing target was found to remove. Existing
geometric sums, cyclotomic identities, native modules/polynomials/group
algebras, ordinary completion, Kähler differentials, smooth/étale algebras,
cochain mapping cones and homology are reused, not rebuilt.

Current read-only upstream commit:
`0d144d044dacebca17b654695b6f1ad58f159b27`.
Current read-only Tau Ceti library commit:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Elaboration pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Read the affected statements in the fixed public QH v2, QW v5, BS v4,
Sch v1 and DAG VIII sources. In particular: QH §§3.1, 3.3–3.4, 4.1–4.2
and A.1–A.2; QW Lemma 2.41, Definition 2.42, Paragraph 2.44 and Lemma 3.16;
BS Definition 16.2 and Lemma 16.10; Sch Definition 7.3/Remark 7.4 and the
coordinate torus application; DAG VIII Construction 2.7.4, Proposition 2.7.6,
Definition 2.7.8 and Proposition 2.7.14. Two new contract locators were
corrected: BS Lemma 16.10 is on printed pp.110–111, and DAG VIII Proposition
2.7.14 is on p.72. Retained source locators are those of the accepted inputs;
this is not a claim to have reread every source cover to cover.
No restricted source was needed. No source file, excerpt or section-by-section
source summary is committed. A 14-word prose overlap screen against the five
read source texts found no matches; mathematical statements and computations
are expressed in our own words.

## Validation and next step

- Final `lean-check research/blueprint/packages/HabiroCohomologyFoundations/Suggested.lean`:
  exit 0; six declaration-uses-sorry warnings, zero errors and zero other
  warnings. All twelve examples have proofs. The cone homology milestone is
  admitted, not reported as a proved homology computation.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- `python3 scripts/check_blueprint.py` on all four inputs: exit 0, zero
  errors/warnings in each. Their existing gaps and supplier requests remain.
- Verified the target-heading bijection, all 266 accepted API names, all
  existing prose checks, definition check counts and exact metadata.
- `python3 research/blueprint/intake.py check-files` on the package and handoff:
  zero problems. `git diff --check` passes. Only the named deliverables and
  this handoff change; review.json is untouched.
- Memory was checked before elaboration; one own Lean process at a time,
  using only lean-check. No Lake build, update, cache fetch or language
  server was started, and no compilation remains running.

Next step: independent package review, especially the exact enhanced supplier
contracts, the fixed canonical framed map and the genuine derived quotient
conventions. All information needed for that review is in the package and
this note; scratch material is disposable.
