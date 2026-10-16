# Independent package review: toroidal compactifications and boundary geometry

**Verdict: accepted after corrections.** Job #9887, reviewer Codex, session
`codex-84ObTg`, 2026-10-16. The author was Claude, session `claude-GauUJT`,
package job #9886. This reviewer did not write that package. The verdict applies
to the corrected package in this submission; the accepted packet is unchanged.

## Coverage and form

Read WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL.md, UPSTREAM_GUIDE.md and the
expansion protocol. Compared the form with the current AdicSpaces and
ModularCurves roadmaps, and the ownership with AnalyticToricGeometry and
AlgebraicVectorBundles. Read the entire README and Suggested.lean. The nine
layers contain 155 target subsections: all 148 packet nodes and seven supplier
constructions added by the author. The packet mapping in the author's handoff
is unchanged, including the Klingen correspondence at C4.16–C4.17. No target
was dropped, and no packet was edited.

The README retains its Summary, ownership boundaries, conventions, exact
supplier contracts, build order, hypotheses, named APIs, discriminating Checks,
worked examples and locators. Every internal numbered reference resolves.
Definitions have at least three discriminating prose checks; added a third
computed check for the off-face ideal and for Hilbert cusp data, and named APIs
for arithmetic stabilizers, cusp data and the map to the minimal model. The
Suggested file has only light real-bodied definitions, theorem signatures and
examples, with the geometric constructions listed in its closing comment.
Metadata remains `topic = "math.AG"`.

All text is in the workers' own words. No source excerpt or section-by-section
source summary was added. A normalized 15-word overlap scan of the README
before its bibliography against the public source texts found no matching run.
The cleared Faltings–Chai and Pilloni files were read in place; no copy or
extracted passage was saved.

## Corrections

- Completed charts now allow finite poles by localizing **after** completion,
  with a uniform denominator bound. Completing an already inverted boundary
  equation would give zero. Arithmetic fans use rational closure, not ordinary
  topological closure.
- Cone-stabilizer finiteness is restricted to cones meeting the open positivity
  cone; the zero cone is a counterexample to the former statement. Neatness
  removes the relevant finite effective local stabilizers. Infinite ineffective
  and boundary stabilizers remain explicit.
- C2.2 now states the precise finite analytic quotients on Pink's controlled
  neighbourhoods; it no longer claims an unsourced general Cartan quotient
  theorem. C2.7 assigns projectivity to the refined compactification. Object
  descent in C2.9 uses Pink 12.4–12.5; SGA 1 VIII 5.2 is cited only for descent
  of morphisms and checking their cocycles.
- The full boundary ideal requires positivity on **every nonzero face**, not
  just on the relative interior of the original cone. In the quadrant, `x`
  passes the latter condition but is not in `(xy)`. C3.5 now describes the
  graded Čech calculation via excluded half-spaces, and C5.21 excludes the
  zero cone from the positivity test. The zero-cone ideal is the unit ideal.
- Ordinary inverse limits of compatible isomorphisms need no Mittag-Leffler
  hypothesis. Derived-limit cohomology does: C3.10 states the countable-tower
  and degreewise hypotheses. C5.26 uses uniqueness and compatible extensions
  at every thickening, without an unjustified claim about surjectivity or
  Mittag-Leffler for global sections.
- Fixed the extension-line sign with a rank-one pushout witness in C4.3.
  Added a computed support-function witness to fix Lan's superadditivity sign.
  C6.54 distinguishes character pullback from the contragredient left action,
  with a two-by-two conjugation and power-map witness.
- The precise stratum neighbourhood in C5.4 removes the other strata **in the
  closure of the chosen stratum**, not their entire closures. C5.10 explicitly
  proves the algebraic-space Stein and finite-étale variant used in its
  component argument, rather than silently importing a generic component
  detector. C5.11 explains exactly why the neat subgroup must be normal.
- C5.16 tests the Hodge degree on curves in a contraction fibre; it does not
  assert that every fibre is a curve. C5.30 chooses a smooth **projective**
  cone system. C5.32 states separatedness, smoothness and finite presentation
  of the group, and keeps theta-section descent for algebraic-space bases.
  In C5.33 the torus determinant has finite sign monodromy; its square is
  trivial, but the line itself need not be.
- Hilbert invariant differentials have rank `g` over the structure sheaf,
  not over the constant ring `ℤ`; their determinant has rank one. C6.44
  consequently places the Hasse determinant in `ω^(p−1)`, including `p=2`.
  The field check for C6.53 requires geometric connectedness and geometric
  reducedness. The Siegel genus-two example distinguishes the three-dimensional
  toric chart from the rank-two torus of the semi-abelian family.
- Replaced unavailable Cartan, KKMS and Demazure–Gabriel citations with inspected
  Pink, Lan and SGA 3 statements. Added the missing Lan ramified-model and
  Higher Koecher reference entries, fixed Dimitrov 8.5(iii) to printed p. 548,
  and corrected Moret-Bailly's isotriviality theorem from Chapter IX to XI.

## Source verification

Opened every source the author flagged as unverified. Public copies are the
editions linked in the corrected README. The following table records the
actual mathematical scope checked, not just the presence of a theorem number.

| Author-unverified locator | Verification and resolution |
| --- | --- |
| SGA 3 I §4.7 | Proposition 4.7.3 and Corollary 4.7.3.1, revised pp. 30–31: gradings and diagonalizable actions; applies to the torus-torsor weight algebra of C0.21. |
| SGA 3 VII_A §4 | §§4.1–4.3, revised pp. 464–472; 4.2.1 gives the flat comparison used to construct V, 4.3.1 computes V for diagonalizable/additive groups, and 4.3.2 gives FV=[p]. Smooth Frobenius finiteness/flatness is also checked against Stacks 50.19.5, Tag 0FW2; its étale-coordinate basis gives degree p^g. |
| Demazure–Gabriel IV §3.4 | No cleared copy used. Removed this redundant locator; SGA 3 VII_A supplies the general construction and both identities. |
| SGA 1 VIII 5.2 | Revised p. 165 (original p. 213), descent of morphisms. It does not alone prove effective descent of the compactification; Pink 12.4–12.5, pp. 197–198, now supplies that step. |
| SGA 1 XII 3.2 | Revised pp. 245–246, especially (v): finite-type complex morphisms are proper exactly when their analytifications are proper. Applied to the map to a point in C2.5. |
| EGA IV₂ 5.10.5 | Printed p. 115, coherent Hartogs under depth at least two; C5.26 retains the special-fibre depth and flatness hypotheses through the thickenings. |
| Cartan 1957 | No cleared copy used. Removed the general reference; inspected Pink 6.20–6.24, pp. 107–112, for the exact quotient neighbourhoods actually required by C2.2. |
| KKMS I §3 | No cleared copy used. Replaced by Lan17 Proposition 7.5, pp. 28–29, and Lan, Higher Koecher, Lemma 7.5 and Proposition 7.8, author pp. 18–19; C3.5 states its own integral graded proof obligation. |
| Rapoport 1978 Theorem 3.5 | Printed pp. 276–277: the formal gluing existence criterion, with schematic density, permitted points, field/DVR tests and separation; these are retained in C6.55. |
| Moret-Bailly IX 2.1 | Printed p. 208: generation of a power of the Hodge line for a semistable group over a normal excellent noetherian scheme, abelian on a dense open. Also inspected Lan 7.2.1.1, p. 540, for the toroidal algebraic-space application. |
| Moret-Bailly “IX 4.5” | The intended result is **XI** 4.5, pp. 235–236, with XI 4.4, p. 235. Corrected the chapter and identified the zero differential-height implication. FC V.2.2, pp. 149–150, and Lan 7.2.1.2, pp. 540–541, give the precise curve statement. |
| Lan, Higher Koecher, Theorem 2.3 | Author p. 3: degree-zero Koecher when the minimal boundary has codimension greater than one. The higher-direct-image boundary calculation is separately in §7. |
| Lan ramified-characteristics Propositions 6.1, 6.4 | Author pp. 32–35: normalized interior families and normal projective flat minimal model with its weighted Hodge line. Added the actual 2016 reference. Read the errata; C5.31 retains this model as a stated input at ramified primes. |

The extra random sample is reproducible: `random.Random(9887).sample(nodes, 15)`
on the 148-node accepted whole-roadmap packet, preserving packet order before
sampling. The resulting fifteen targets, in sampled order, are:

| Target | Inspected locator and outcome |
| --- | --- |
| C5.10 | Lan 7.1.2.14(1), p. 539, with 6.4.1.1, pp. 519–523; Stacks 76.36.1, 76.36.4, 76.36.9, Tags 0A19, 0A1B, 0E0D. The component deduction is proved here; Stein's finite factor is étale for the stated smooth proper family. |
| C0.5 | Lan 6.1.2.6, p. 444: closed-stratum quotient. The arbitrary-ring face formula is the package's explicit coefficient calculation, using Mathlib's first isomorphism theorem. |
| C6.32 | Dimitrov 8.6(iii), pp. 548–549: normal projective minimal model and connected contraction fibres. |
| C6.21 | Dimitrov 7.2(i), pp. 541–543: fine toroidal compactification, with source level restrictions retained. |
| C5.22 | Lan17 8.7, Remarks 8.9–8.10, pp. 34–35, and errata item 3; BPS 5.2.1, p. 1010, read with §5.1, pp. 1009–1010. Coefficients and the exclusion of dimension-one factors are explicit. |
| C4.10 | Lan 6.2.5, pp. 484–487, and 6.4.1.1(5), pp. 519–523; cleared Pilloni20 §13.2.1, p. 85. Retains the finite-flat level data and the boundary subgroup in the correspondence application. |
| C6.34 | Dimitrov 8.6(iv), p. 548: minimal cusp schemes and cyclotomic data. |
| C6.26 | Dimitrov 7.6, p. 544: the universal semi-abelian extension. |
| C6.44 | Published BHW §5.2, proof of Lemma 5.12, pp. 1746–1748, and §7.1, pp. 1759–1760. These support the boundary/ordinary comparison and lattice application; the determinant identity itself is the local deduction from C4.15. Corrected relative ranks and the determinant line. |
| C6.23 | Dimitrov 7.2(i), pp. 541–543: exact formal boundary charts and arithmetic quotient. |
| C6.12 | Dimitrov §2, pp. 529–530, boundary equation and completion, equation (5), p. 546, and 8.3, p. 547. Constant-term vanishing is converted to the full boundary ideal using the already proved positive-support theorem. |
| C5.8 | Lan 6.3.2.16, pp. 507–508, 6.3.3.16, p. 518, and 6.4.1.1(2)–(3), pp. 519–520. The exact-pattern and connected-component deduction remains explicit. |
| C5.4 | Lan 6.4.1.1(5), pp. 519–523. Corrected which strata are removed before completion. |
| C6.16 | Dimitrov 4.1(ii), p. 537, and the pinned trace-dual membership statement: congruence uses the dual of B, not of A. |
| C6.8 | Dimitrov 8.5(iii), p. 548. The arbitrary-ring variant correctly requires a regular multiplier; the ℤ/4 counterexample prevents the field argument from being overgeneralized. |

Also inspected Pink 6.19 for finite overlap and its open-cone restriction;
Lan 6.1.1.5–6.1.1.11 for the relatively open cone convention; Lan17 2.5–2.8
for projectivity and its sign; and the cleared FC V.2–V.3 for generation and
isotriviality. The removed references are not left as unexplained gaps.

## Supplier and duplication audit

The checks use current TauCetiRoadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as well as pinned Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and pinned Tau Ceti `f790474`.

Searches used mathematical objects and hypotheses, followed by reading the
relevant declarations and roadmap contracts. All nine newer roadmaps were
included: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices,
LocalGaloisGroups, OperatorTheory (including its component roadmaps),
OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and
RealAlgebraicGeometry. Also searched Completed, including ContourIntegration,
EffectiveBounds, OrthogonalL2Bases, RestrictedProducts, IntegralLattices and
HodgeStructures. Their general inputs are cited rather than recreated.

| Targets checked | Existing object compared; retained difference or imported boundary |
| --- | --- |
| C0.1–C0.7 | Pinned coefficient restriction, monoid-algebra maps and ideal first isomorphism theorem exist; the face-conditioned multiplicativity, off-face kernel and quotient formula do not. No replacement monoid or coefficient carrier. |
| C0.8–C0.12, C0.16–C0.21 | Current affine/fan toric schemes and face localizations have complex coefficients; current relative Spec and AlgebraicVectorBundles supply generic constructions. Retained targets extend to every coefficient ring, torus torsors and their weight multiplication, integral boundary ideals/completion and lattice changes. |
| C0.13–C0.15, C1.5–C1.6 | AnalyticToricGeometry has finite fans; these are infinite arithmetic systems with finite orbit sets and specified positivity domains. IntegralLattices concerns symmetric integral forms, not this arithmetic fan or Hilbert trace-dual cusp calculation. |
| C1.1–C1.4 | Current Hodge/Mixed supplies the carrier, graded pieces, morphisms and strictness. ReductiveGroups supplies parabolics. The Shimura boundary datum, cusp label and torsor construction are absent. |
| C2.1–C2.10, C2.general.1 | Generic analytic spaces, analytification, GAGA and minimal Shimura models belong to their named suppliers; toroidal gluing, its boundary maps and mixed canonical descent are the added statements. |
| C3.1–C3.10, C3.general.1 | Existing finite complex toric maps and support properness are imported. Arithmetic toroidal refinement/level/Hecke maps and integral boundary-ideal acyclicity, completed comparisons and general-data descent are new. ProfiniteArithmetic and LocalGaloisGroups do not supply this coherent-geometric comparison. |
| C4.1–C4.14 | Abelian-scheme duality/theta/Tate theory and complete-DVR Raynaud uniformization are supplied below; this package owns semi-abelian families with jumping toric rank, complete normal bases, boundary PEL structures and compactified comparisons. |
| C4.15–C4.18 | Current SplitTorus/Frobenius computes the p-power map; EllipticCurves and ModularCurves cover elliptic F and V. The retained targets concern all flat commutative groups, their semi-abelian Hasse determinant and the genus-two Klingen correspondence. |
| C5.1–C5.33 | No current roadmap or library target supplies these integral PEL compactifications or scalar Fourier–Jacobi/minimal-model geometry. Generic descent, duality, relative Proj, coherent cohomology and Stein theory are imported. C5.10 proves its detector; C5.32–C5.33 prove missing semiampleness/isotriviality inputs. |
| C6.1–C6.19 | Pinned unit-theorem, total-positivity and trace-dual APIs are imported. The finite-index contracting-unit application, coefficient-sensitive Koecher support and cyclotomic phase formulas are absent. |
| C6.20–C6.49, C6.54–C6.55 | Hilbert moduli/levels/Deligne–Pappas carriers belong to the lower supplier. Boundary charts, formal gluing, compactifications, q-expansion comparison and ordinary boundary applications are new. Modified overconvergent lattices are a downstream consumer, not an imported construction. |
| C6.50–C6.52 | Current ModularCurves Layer 10 and ModularCurvesPartII own the compactified curves and Tate parameters; only the Hilbert degree-one identifications are retained. |
| C6.53 | Current RationalPoint/Basic has global functions over a field for an integral scheme with a rational point. The retained theorem is relative, has possibly reducible boundary fibres, assumes no section, and is universal for nonreduced base change. Added the existing field theorem to the ownership boundary. |

**Removals for duplication: none.** Existing generic objects were already
imported; the retained generalizations now have explicit difference clauses and
the additional nearby results are cited in Scope and ownership only.

Read the pinned monoid-algebra restriction/lift/map definitions and the ideal
quotient equivalence, the unit existence and logarithmic product formula,
finite-index positive-power lemma, trace-dual membership, total positivity and
mixed Hodge strictness. The contracting-unit argument uses signed real
embeddings only for signs; absolute infinite-place values are used for norms.
Read the relevant current toric-scheme, relative-Spec, split-torus Frobenius and
rational-point global-function declarations as well.

Supplier contracts were checked against the local packages and tier order.
The formal and Stein material is SF.4, not SF.3; the component detector is
proved in C5.10, not requested from SF.2. ComplexComparisonPartII C4.4 applies
to the proper-source algebraic map, while Pink supplies existence/descent.
AdicSpacesPartII F0.39/F0.44 supply formal functions/direct images and
ArithmeticGaloisDuality R02.1.1 supplies the countable derived-limit sequence.
All prerequisite chains terminate in pinned carriers, earlier internal targets,
this bundle or lower-tier suppliers. AutomorphicBundles B3.5 is explicitly an
application of C3.9, not its premise. HodgeTateAndCanonicalSubgroups is a consumer.
No FoundationsAndLibraryIntegration or UPSTREAM placeholder remains.

## Lean signature checks and validation

Spot-checked these ten signatures against the README, independently of
elaboration:

| Signature | Scope checked |
| --- | --- |
| `faceProjection` | Actual coefficient restriction along the face inclusion; arbitrary commutative ring; hF used only for proof fields. |
| `ker_faceProjection` | Kernel equals the monomial ideal, not its radical; no reducedness assumption. |
| `faceQuotient_equiv` | R-algebra equivalence with its quotient-map formula; correct domain and direction. |
| `faceProjection_coefficient_change` | Every coefficient-ring homomorphism, including nonflat ones. |
| `boundaryUnion_flat` | All r,s including r=0; quotient by the product monomial, not the intersection ideal. |
| `changeLattice_finite_rankOne` | Positive exponent; explicitly a rank-one signature for the general README target. |
| `bounded_cusp_support_is_positive` | Degree greater than one, finite-index integer units, unit multipliers and one trace lower bound on nonzero coefficients; conclusion includes zero separately. |
| `constant_coefficient_eq_zero` | Zero-kernel condition on c(u,0)−1; nontriviality alone is insufficient over ℤ/4. |
| `trace_exponents_congruent` | Lift difference belongs to traceDual(B); n=0 gives equal zero witnesses and still satisfies the statement. |
| `tracePhaseFun_add` | nB⊆A and x in traceDual(A) force integral exponents before rational numerators are used. |

Added Lean negative controls for `x ∉ (xy)` and the empty-boundary unit ideal,
and a computed support-function sign example. The closing comment includes the
new Stein variant. Final Suggested.lean has 29 named declarations and 12 examples,
well below 5,000 lines; no sorry-defined data or artificial Prop carrier.

Validation on the corrected files:

- `lean-check research/blueprint/packages/ShimuraCompactifications/Suggested.lean`:
  exit 0; 36 warnings, all declaration-uses-sorry; no other diagnostics.
  Memory was checked before compilation; no Lake build/update/cache command
  or language server was used.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- `python3 research/blueprint/intake.py check-files` on all six deliverable
  files: 0 problems.
- JSON parse, unchanged metadata, internal-reference and 155-target coverage
  checks, definition Check counts and `git diff --check`: pass.

## Adversarial mathematics pass

The table below covers every numbered target, including the definitions and
construction conventions. Cases are computed algebraically, rather than inferred
from a sorry build. “Retained” means the existing hypotheses already exclude the
counterexample or the instance has the asserted value. The correction column
identifies changes made in this review. The standalone conventions are tested
by the face/ideal, superadditivity, pushout-sign, degree-one, p=2 and phase rows.

| Target | Instance or failed alternative checked | Resolution |
| --- | --- | --- |
| C0.1 | ℤ/4 retains scalar 2; 2ℕ is not a face since 1+1 lies in it. | Retained coefficient restriction and face hypothesis. |
| C0.2 | Degree m inside F has its original coefficient; outside degrees vanish. | Retained. |
| C0.3 | F=P and F={0}; projection after inclusion is the identity in both cases. | Retained direction. |
| C0.4 | P=ℕ, F={0}: J=(e₁); constant 2 survives over ℤ/4. | Added third computed ideal check. |
| C0.5 | ℤ/4[ℕ]/(e₁) is ℤ/4, not its reduced quotient. | Retained R-algebra quotient formula. |
| C0.6 | Nonflat ℤ→ℤ/4; restriction still commutes coefficientwise. | Retained no flatness assumption. |
| C0.7 | Image of each off-face monomial generator is the corresponding generator. | Retained ordinary ideal image. |
| C0.8 | Trivial torsor gives Spec R[Pσ]; a nontrivial Gm-torsor retains its weight lines. | Retained torsor descent and weight algebra. |
| C0.9 | Quadrant face chart is a monomial localization, not a closed quotient. | Retained open-map direction. |
| C0.10 | Rank zero gives R; rank one ray gives R[x], zero cone gives a Laurent ring. | Retained units separately from boundary coordinates. |
| C0.11 | Quadrant closed orbit quotient is R, including nilpotents. | Retained scheme-theoretic ideal. |
| C0.12 | J empty gives the whole chart; J both rays gives R; exact open uses the other coordinates. | Retained products equal 1 for empty index sets. |
| C0.13 | Infinite cone set is not locally finite at 0; rank zero support is {0}. | Changed closure to rational closure. |
| C0.14 | Fan intersected with its star subdivision returns the subdivision. | Retained finite family and finite-overlap assumptions. |
| C0.15 | Nonregular cone (1,0),(1,2); support-function values 1,1,3 on a subdivided quadrant. | Added explicit superadditivity sign witness and Lean example. |
| C0.16 | R=0 gives the empty scheme; R=ℤ/4 retains nilpotents. | Retained arbitrary-ring variant of complex toric schemes. |
| C0.17 | Positive ray is not a complete fan in the entire real line. | Retained support criterion relative to the specified target support. |
| C0.18 | r=0 gives t=1, unit ideal and empty boundary; r=2 gives (xy), not (x,y). | Added empty-boundary Lean control; retained flat quotient over all R. |
| C0.19 | Completing R[x,x⁻¹] at (x) gives zero; completing R[x] first and inverting x gives R((x)). | Reordered completion/localization and imposed a uniform pole bound. |
| C0.20 | q↦qᵉ with e>0 is finite; e=0 is not the lattice injection in question. | Retained finite-index injection and positive-exponent specialization. |
| C0.21 | Trivial torsor has Lm=O; line torsor has tensor powers; rank-zero torus has only weight zero. | Retained grading multiplication and base change, not arbitrary graded modules. |
| C1.1 | Modular cusp has weight −2 unipotent part; interior has no boundary unipotent part. | Retained full mixed datum and weight conventions. |
| C1.2 | Pure boundary graded quotient agrees with pinned pure Hodge carrier. | Retained graded pieces and strictness from supplier. |
| C1.3 | Modular cusp pure quotient is a point; Klingen boundary has an elliptic abelian part. | Retained both torus and abelian torsors. |
| C1.4 | Changing cusp representative by the declared arithmetic equivalence leaves the label unchanged. | Retained equivalence relation and level data. |
| C1.5 | The zero cone is stabilized by the full effective arithmetic group. | Restricted finite stabilizers to cones meeting the open positivity cone; added API. |
| C1.6 | Rational closure of the positive-definite cone differs from its full real closure. | Retained incidence and rational radicals. |
| C2.1 | Zero cone recovers the original torsor; a regular ray adds its divisor. | Retained partial chart and local arithmetic quotient. |
| C2.2 | An infinite ineffective kernel cannot be discarded by claiming a free action. | Scoped to Pink's controlled neighbourhoods and finite effective analytic quotients. |
| C2.3 | Overlapping cusp charts must be glued by the elementary identifications, not just equal labels. | Retained quotient and interior compatibility. |
| C2.4 | Dense torus lies in each normal complex toric chart; nilpotents are not removed by a new carrier. | Retained actual analytic normality statement. |
| C2.5 | A missing support ray leaves a noncompact cusp neighbourhood. | Retained completeness; made SGA properness comparison exact. |
| C2.6 | Smooth cones with non-neat stabilizers may have a singular coarse quotient. | Restricted smooth quotient argument to controlled neat local stabilizers. |
| C2.7 | A projective refinement does not make the original fan projective. | Assigned projectivity to the refined space only. |
| C2.8 | For a modular curve the toroidal-to-minimal map is the identity. | Added named stratum, interior and refinement API; no irreducible-fibre assumption. |
| C2.9 | Descent of morphisms does not supply an object to descend. | Separated Pink object effectivity from SGA morphism descent. |
| C2.10 | Mixed boundary reflex data must be transported before completing torus embeddings. | Retained Pink mixed canonical-model existence and its Galois compatibility. |
| C2.general.1 | A general pure datum need not be abelian type. | Retained separate general-data descent theorem, not an abelian-type inference. |
| C3.1 | Self-refinement is the identity; star subdivision gives the blow-up of A². | Retained proper birational refinement and support condition. |
| C3.2 | Datum/level map must carry each source cone into a target cone. | Retained cone compatibility as a hypothesis. |
| C3.3 | Hecke span has two different arrows even when their interiors share a uniformization. | Retained common refinement and two-map construction. |
| C3.4 | Two fans need a third common refinement; they need not be equal. | Retained comparison through the coarsest common refinement. |
| C3.5 | x is positive on the quadrant interior but x∉(xy); blow-up pullback has exceptional order 2. | Corrected full-boundary positivity and graded excluded-half-space argument. |
| C3.6 | For H normal in H′, the acting quotient is H′/H, not H/H′. | Retained level direction and invariant functions. |
| C3.7 | f_*O=O alone says nothing about positive higher direct images. | Retained explicit all-degree toric acyclicity and formal-functions proof. |
| C3.8 | On the blown-up quadrant π*I has exceptional order 2 while I′ has order 1. | Retained pushforward/derived vanishing, not equality of pullbacks. |
| C3.9 | Nonflat coefficient module B/(p) tests the torsion part separately. | Retained Dedekind/field base hypothesis for arbitrary modules and all degrees. |
| C3.10 | A tower concentrated in degree one has zero sections without controlling degree-one lim¹. | Separated ordinary limits from derived-limit cohomology; added degreewise ML. |
| C3.general.1 | General-data Hecke maps require the same boundary cone compatibility. | Retained descent of both arrows and composition. |
| C4.1 | Toric rank jumps from an abelian generic fibre to a toric boundary fibre. | Retained fibrewise definition; no global fixed-rank extension in the definition. |
| C4.2 | Split rank-r torus has character sheaf ℤʳ; abelian scheme has zero character sheaf. | Retained étale-local character calculation. |
| C4.3 | For X=ℤ and c(1)=P, pushing out along −1 gives LP, along +1 its dual. | Added rank-one sign witness. |
| C4.4 | Tate period q with v(q)>0 is positive; v(q)=0 fails degeneration positivity. | Retained cubical rigidification and polarized period data. |
| C4.5 | X=Y=0 recovers the abelian part; rank one recovers a Tate degeneration. | Retained complete normal-base construction and algebraization. |
| C4.6 | A complete DVR is a specialization, not the whole asserted generality. | Retained equivalence for the stated complete normal bases. |
| C4.7 | Toric rank zero gives the original abelian family; rank one gives q-adic degeneration. | Retained universal PEL chart and formal base. |
| C4.8 | Two extensions agreeing on the dense interior must coincide over the normal base. | Retained extension theorem with its source hypotheses. |
| C4.9 | Endomorphism identities extend by density after individual maps extend. | Retained actual order action, not only abstract endomorphisms. |
| C4.10 | Boundary torsion includes a multiplicative subgroup and level structures need finite-flat data. | Verified Lan and the compactified Klingen application; retained. |
| C4.11 | The identity in the torus coordinate from qᵖ to q has generic kernel p and boundary kernel 1. | Retained quasi-finite flat, not globally finite of constant degree. |
| C4.12 | Rank-one Mumford quotient is Gm/q^ℤ with differential du/u. | Retained comparison with the supplied Tate curve. |
| C4.13 | q↦qᵖ pulls dq/q back to p dq/q. | Retained normalization and boundary Kodaira–Spencer factor. |
| C4.14 | In characteristic zero, a rank-r torus contributes ℤℓ(1)ʳ; a generic family does not keep its boundary rank. | Retained pointwise geometric Tate-module statement and inverse-limit assumptions. |
| C4.15 | Gm has V=id; an ordinary abelian part contributes its Hasse determinant. | Retained toric factor 1, including characteristic 2. |
| C4.16 | At the cusp the chosen subgroup is multiplicative, not an arbitrary abstract subgroup. | Retained the compactified correspondence with level data. |
| C4.17 | Vanishing concerns the first projection; arbitrary proper Hecke arrows need not be acyclic. | Retained all positive degrees and named first arrow. |
| C4.18 | Gm has V=id, Ga has V=0; smooth dimension zero has Frobenius degree 1. | Replaced unavailable citation with SGA 3 and exact smooth-Frobenius source. |
| C5.1 | Rank-zero chart is an étale chart of the interior; the two completion embeddings can differ. | Retained both embeddings and Artin-approximation conditions. |
| C5.2 | Matching only function-field embeddings is insufficient for the boundary relation. | Retained normalized isomorphism relation and both étale projections. |
| C5.3 | Non-neat level needs a quotient stack; a bad prime does not yield a smooth good-prime model. | Retained good-prime restrictions and universal semi-abelian family. |
| C5.4 | A deeper stratum in the chosen closure is removed; an unrelated closure must not remove the centre. | Corrected the open neighbourhood before completion. |
| C5.5 | Incomplete fan fails the valuative extension condition at a missing cone. | Retained completeness and valuative proof. |
| C5.6 | Different global branches can meet; local SNC coordinates alone do not identify all labels. | Retained neat-level separation and scheme-theoretic intersections. |
| C5.7 | Density in total space is weaker than density in each geometric fibre. | Retained exact-pattern chart proof of fibrewise density. |
| C5.8 | Two smooth divisors can intersect in two disjoint sections, hence two closure components. | Retained connected-component choice and labelled chart argument. |
| C5.9 | A closure is a component of a proper boundary intersection, not the whole intersection. | Retained properness for the chosen component. |
| C5.10 | A connected finite étale Stein cover can have multiple points in a geometric fibre. | Made the algebraic-space finite-étale Stein variant explicit; each point is reached. |
| C5.11 | A nonnormal neat subgroup does not give a quotient group H/H′. | Corrected the negative control; retained branch-stable component descent. |
| C5.12 | Siegel genus two gives Sym²E and rank three logarithmic differentials. | Retained PEL quotient of the tensor expression and log boundary. |
| C5.13 | The Hodge line has degree zero on contracted boundary curves. | Retained semiampleness, not ampleness on the toroidal model. |
| C5.14 | Finite generation of one Veronese subring alone omits other residue classes. | Retained finite modules for every residue class using proper pushforward coherence. |
| C5.15 | At a modular cusp the scalar Fourier–Jacobi expansion is the q-expansion. | Retained Hodge-line expansions; general automorphic coefficients belong to the consumer. |
| C5.16 | Contraction fibres can have dimension greater than one; only their proper curves are tested. | Corrected curve-degree wording and retained normal Proj construction. |
| C5.17 | Positive Hodge power descends and is ample on the minimal model. | Retained power rather than descent of the unmodified line at every level. |
| C5.18 | Quasi-projectivity is restricted to good-prime interior models. | Retained open immersion into the projective minimal model. |
| C5.19 | Finite normalization need not be a toroidal blow-up or be smooth. | Retained actual higher-level function field and normal model. |
| C5.20 | A higher-level normalization changes completed charts and cannot be identified by generic normality alone. | Retained separate formal comparison. |
| C5.21 | The zero cone imposes no vanishing; for a quadrant x is not a full-boundary section. | Excluded zero faces from positivity intersection and corrected boundary weights. |
| C5.22 | Dimension-one factors admit poles; torsion coefficients need the theorem's actual coefficient hypotheses. | Retained normalized-model Koecher hypotheses and corrected-source scope. |
| C5.23 | ℤ/pⁿ coefficients cannot be reduced to a characteristic-zero vector-space argument. | Retained arbitrary-coefficient Siegel statement with dimension restrictions. |
| C5.24 | Ordinary restriction does not turn nonflat coefficients into flat ones. | Retained ordinary-open restriction of the normalized Koecher theorem. |
| C5.25 | For a Siegel threefold the minimal boundary has dimension one, hence codimension two. | Retained Hilbert–Siegel dimension formula and exclusion of elliptic factors. |
| C5.26 | Global sections of successive thickenings need not surject merely from sheaf flatness. | Removed unsupported ML claim; uniqueness gives compatible Hartogs extensions. |
| C5.27 | The cyclic subgroup at the boundary is its finite-flat closure, not just geometric points. | Retained finite-flat level extension. |
| C5.28 | Q=2 gives a single generator; the acting unit group is trivial. | Retained prime-Q generator torsor and representability. |
| C5.29 | Rank-two E gives det Sym²E=(det E)³; passing from log to ordinary adds −D. | Retained genus-two canonical-bundle sign. |
| C5.30 | Smooth fan alone does not supply projectivity of the compactification. | Required a smooth projective cone system. |
| C5.31 | Blowing up (x,y) creates an exceptional P¹, unlike finite normalization; unit ideal gives identity. | Retained normalized blow-up and stated ramified minimal-model input; added its reference. |
| C5.32 | Ga fails the semi-abelian hypothesis; constant abelian family has trivial Hodge line. | Added smooth separated finite-presentation hypotheses and explicit theta-section descent. |
| C5.33 | A rank-one torus from an étale double cover can have a nontrivial 2-torsion Hodge line. | Replaced triviality by finite sign monodromy and fixed Moret-Bailly chapter. |
| C6.1 | Over ℚ the unit group is finite; degree greater than one is essential. | Retained finite index in integer units, using a positive power of a Dirichlet unit. |
| C6.2 | ξ=0 is not totally positive but has no negative embedding. | Retained ξ≠0 and signed real embedding. |
| C6.3 | Over ℚ the orbit of −1 under unit squares is {−1}. | Retained degree>1; negative embedding dominates while others decay. |
| C6.4 | A unit times 2 in ℤ/4 remains nonzero when 2 is nonzero. | Retained unit multipliers, no division by arbitrary nonzero coefficients. |
| C6.5 | The zero coefficient ring has empty nonzero support; ξ=0 is allowed separately. | Retained arbitrary ring and the explicit trace lower bound. |
| C6.6 | A nonzero nonnegative vector pairs positively with an everywhere positive vector; v=0 fails strictness. | Replaced unrelated product lemma by the finite-sum positivity argument. |
| C6.7 | At ξ=0 covariance gives (c(u,0)−1)a(0)=0, even with zero divisors. | Retained annihilation, without automatic vanishing. |
| C6.8 | In ℤ/4, 3≠1 fixes nonzero 2. | Retained injective multiplier hypothesis; corrected source page. |
| C6.9 | Completion admits only series finite modulo each boundary-ideal power; poles require bounded denominators. | Retained actual completed chart and pole-bound topology. |
| C6.10 | A negative real embedding gives unbounded negative traces along the permitted unit orbit. | Retained degree and finite-index hypotheses via C6.1–C6.5. |
| C6.11 | Modular curves admit 1/Δ-type cusp poles. | Retained degree>1; no degree-one Koecher assertion. |
| C6.12 | Nonzero constant term extends but is not cuspidal; rank-one cusp ideal is (q). | Retained full-boundary vanishing using positive support. |
| C6.13 | b′=(1/3)ℤ gives X=(1/3)ℤ, X*=3ℤ and pairing of 1/3 with 3 equal to 1. | Added third computed check and named API. |
| C6.14 | Real-quadratic unit action needs infinitely many cones although it has finitely many orbits. | Retained arithmetic fan rather than a finite-fan carrier. |
| C6.15 | n=0 gives exponent 0; for n=3 and ξ=1/3 the exponent is 1. | Retained nB⊆A and traceDual(A). |
| C6.16 | Changing x by traceDual(B) changes the integer exponent by a multiple of n. | Retained the larger-module dual; n=0 is harmless. |
| C6.17 | ζ=1 is allowed; primitive order n is unnecessary. | Retained only ζⁿ=1 and integer witnesses. |
| C6.18 | n=0 gives 1=1·1; negative integer exponents use a unit. | Retained trace additivity and unit-valued powers. |
| C6.19 | n=3,x=1,ξ=1/3 gives ζ; using traceDual(A) for lift independence fails at n=4. | Retained integral-exponent conditions and negative Lean example. |
| C6.20 | The boundary fibre is the torus Gm⊗a*, not an abelian scheme. | Retained Mumford degeneration and polarization data. |
| C6.21 | A level failing the source's torsion-freeness need not give a fine smooth scheme. | Retained all fine-level restrictions and cyclotomic base. |
| C6.22 | The tame polarization quotient retains stabilizers and branch identifications. | Retained stack/coarse distinction. |
| C6.23 | Different cusps have different completed coefficient rings and finite cyclotomic actions. | Retained exact formal charts, not a single unlabelled completion. |
| C6.24 | Étale toric charts keep nonreduced coefficients under base change. | Retained scheme-theoretic boundary comparison. |
| C6.25 | Smoothness is over the stated good base; ramified Deligne–Pappas comparison is separate. | Retained base restrictions and regular cone refinement. |
| C6.26 | The extended family is semi-abelian at a cusp, not abelian there. | Retained source Proposition 7.6. |
| C6.27 | For g=2 the invariant-differential sheaf has O-rank two, with determinant rank one. | Corrected relative rank. |
| C6.28 | A punctured fan misses a DVR limit. | Retained complete fan and valuative properness. |
| C6.29 | A constant boundary fibre has Hodge degree zero. | Retained semiampleness rather than toroidal ampleness. |
| C6.30 | For g=1 the contraction is the compactified curve itself. | Retained positive-power section ring and contraction. |
| C6.31 | All weights, not merely one Veronese, require finite module arguments. | Retained proper-coherent pushforwards for residue classes. |
| C6.32 | A proper birational toroidal contraction has connected fibres in the normal minimal model. | Retained normality/projectivity and source hypotheses. |
| C6.33 | Polarization quotient is taken on the minimal model with its actual finite group. | Retained quotient and toroidal comparison square. |
| C6.34 | Cyclotomic cusp schemes over the tame base are finite étale, not just sets of complex cusps. | Retained integral cusp rings and finite action. |
| C6.35 | A fibre may be reducible although it is geometrically connected. | Retained connectedness without claiming irreducibility. |
| C6.36 | Completion over a minimal cusp includes the full toroidal boundary fibre. | Retained specified centre and formal comparison. |
| C6.37 | An arbitrary weight need not descend to the minimal model. | Retained the exact cusp-unit-character descent criterion. |
| C6.38 | Changing uniformization multiplies coefficients by the trace phase. | Retained normalized q-parameter and phase action. |
| C6.39 | Selecting cusps on only one geometric component cannot detect all sections. | Retained component coverage for arbitrary coefficient modules. |
| C6.40 | One cusp suffices only with the stated connectedness/component hypotheses. | Retained full q-expansion injectivity hypotheses. |
| C6.41 | The nonflat inclusion ℤ/4⊆(ℤ/4)[t]/(2t) still tests coefficient descent. | Retained injective coefficient map, not a new flatness requirement. |
| C6.42 | Blow-up of the quadrant changes pullback multiplicity but not pushforward of its boundary ideal. | Retained pushforward, not equality of boundary pullbacks. |
| C6.43 | A prime ramified in F but prime to the tame level is outside good-prime PEL smoothness. | Retained independent Hilbert/Deligne–Pappas boundary construction. |
| C6.44 | At p=2 the Hasse determinant lies in ω; general p gives ω^(p−1). | Corrected O-rank g and determinant-line rank one. |
| C6.45 | A boundary torus has V=id, hence unit Hasse determinant. | Retained ordinary boundary at all allowed primes. |
| C6.46 | The condition uses positive valuation bounds and independence of a Hasse lift. | Retained the stated Hasse ideal/domain and admissible radii. |
| C6.47 | Passing to a polarization quotient must preserve the ordinary neighbourhood and its action. | Retained finite group and integral chart comparison. |
| C6.48 | Ramified cusp level maps need not be étale at the boundary. | Retained finite toric lattice-change map, no universal étaleness claim. |
| C6.49 | The natural differential lattice is not automatically an overconvergent modified lattice. | Retained comparison of natural lattices; modified lattices remain downstream. |
| C6.50 | F=ℚ gives a modular curve; degree>1 Koecher cannot be imported. | Retained separate degree-one comparison. |
| C6.51 | Cusp width w changes parameter by tʷ=q. | Retained ramification exponent and Tate parameter normalization. |
| C6.52 | Only the named prime-level diamond quotients lie in ModularCurves Layer 10. | Retained exact level class, no arbitrary GL₂ subgroup comparison. |
| C6.53 | Spec ℂ/Spec ℝ is connected/reduced but not geometrically connected; a fat point has extra functions. | Corrected field check; retained proper-flat universal theorem and nilpotents in base. |
| C6.54 | Conjugation by diag(2,1/2) multiplies the upper coordinate by 4; character pullback is q↦q⁴. | Separated pullback from inverse dual left action; retained full stabilizer and ineffective kernel. |
| C6.55 | An embedded boundary component violates schematic density; a boundary sent to the interior violates permittedness. | Retained exactness, thickened lifting, density and separation hypotheses. |

## Remaining scope

No unresolved review defect remains. C5.31 is a conditional construction at
ramified primes: the normal projective flat minimal model with Lan16's properties
is an explicit input, not an assertion that the good-prime construction extends
to bad primes. General parahoric moduli interpretations and ramified
Pappas–Rapoport splitting-model charts remain outside the package. This review
does not claim a complete independent proof of every source theorem: it checks
all target statements adversarially, the flagged sources, and the reproducible
fifteen-source sample to the package-review standard.
