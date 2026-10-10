# REV-ShimuraVarieties--V0~2

Verdict: **accepted**. Completed independent target-level review by Codex (GPT-6), session `codex-lYdqzH`, on 10 October 2026. Refs #7092. This is the completed review of the revision by another session, rather than a checkpoint.

The [packet](../packets/ShimuraVarieties--V0.json) now has an independent verdict for every node. The revised analytic automorphic-ring definition supplies the exact boundary predicate that the preceding review could not verify. The [reader](../readmes/ShimuraVarieties--V0.md) and [suggested file](../suggested/ShimuraVarieties--V0.lean) agree with the corrected specifications. Eight nodes were corrected to use exact source locators, qualified source hypotheses or existing supplier contracts. No unresolved statement contradiction remains.

Acceptance applies to one complete planning pass under PROTOCOL section 0. All eight scoped stages are planned, none is closed, and every implementation status remains unchecked. Nineteen precise proof/carrier refinements and eighteen supplier requests remain. The missing full Baily–Borel, Borel, connected-extension and exceptional-conjugation arguments are recorded as follow-up work, rather than treated as routine consequences of named results.

## Counts

| Item | Revision received | Review output |
| --- | ---: | ---: |
| Nodes | 69 | 69 |
| Theorems / definitions / constructions | 60 / 6 / 3 | 60 / 6 / 3 |
| Verified / corrected / added / unverifiable | historical ledger | 61 / 8 / 0 / 0 |
| API items / test specifications / planets | 58 / 29 / 41 | 58 / 29 / 41 |
| Baseline declarations | 5 | 5 confirmed; none removed or replaced |
| Source findings | 14 | 15: 14 confirmed, 1 rejected |
| Explicit refinements / supplier requests | 19 / 20 | 19 / 18 |
| Planned / partial / closed stages | 8 / 0 / 0 | 8 / 0 / 0 |
| Packet status / review status | complete / historical needs_changes | complete / accepted |

No nodes, API items, tests or planets were added or deleted. The prior review remains a historical report; this review replaces its ledger in the packet.

## Why the revised automorphic definition is verifiable

Baily–Borel sections 8.2–8.5, pp.509–511, identify the analytic condition independently of the compactification's later algebraic structure. In every rational adapted unbounded realization, the scalar coefficient of a canonical tensor section extends continuously to the rational boundary in the Satake topology, with holomorphic restriction to the boundary stratum. Changing the realization transports the coefficient by the canonical Jacobian. The equivalent good-neighborhood formulation includes every incident rational stratum.

The boundary restriction lands in the line factor induced by the **ambient** Jacobian along the boundary projection. It need not be the intrinsic canonical line of that boundary domain. The construction orders rational boundary data and Satake topology before this definition, and constructs the normal analytic/projective compactification afterward. This removes the earlier undefined growth condition and the potential algebraic circularity.

All ten APIs are justified by the specified uses: degree pieces, multiplication, restriction, finite-index pullback, Veronese comparison, construction, section extensionality, evaluation, local characterization and change of chart. The five tests distinguish plausible wrong definitions:

- Degree zero consists of constants once the connected compact normal analytic model is proved.
- On the upper half-plane canonical degree n corresponds to modular weight 2n.
- E₄ restricted to torsion-free Γ(3) is admissible in degree two, with nonzero boundary value, so admissible forms cannot be defined as cusp forms.
- The modular j-function has a cusp pole and fails the finite continuous boundary-limit condition despite interior holomorphy and invariance.
- In genus two the ambient canonical degree n has scalar weight 3n, which remains 3n on the genus-one boundary. Intrinsic canonical degree n there has weight 2n. At n=2 the induced weight is six, so replacing the induced factor by intrinsic degree two fails.

The primary OCR is adequate to verify this mathematical predicate and its conventions. It loses signs in some displays, so convergence inequalities, the analyticity criterion and the remaining full-ring identifications still require a legible primary copy before proof closure.

## Corrections applied

| Node | Correction and justification |
| --- | --- |
| V2/automorphic-finite-generation | Added Baily–Borel Theorem 10.14, pp.523–524, with its exclusion of three-dimensional Q-normal subgroups. Sections 10.6–10.11 construct a finite separating subring and projective realization; they do not alone identify the full admissible ring. The curve/logarithmic-canonical and mixed-factor comparisons remain explicit refinements. |
| V2/koecher | Added primary Proposition 3.15, p.478, and Theorem 10.14, pp.523–524. Their stronger sufficient hypothesis is distinguished from SVI 3.13(b)–(c), p.39, which gives the split-PGL₂ exception in the target. |
| V3/borel-algebraicity | Replaced the duplicate R09.7d request with the existing `AlgebraicModuliForArithmeticGeometry:R09.7/snc-compactification` node. Its smooth quasi-projective characteristic-zero source fits. Added C0 for the analytification of étale SNC coordinates into punctured-polydisk charts. |
| V3/finite-quotient-algebraization | Imported `SchemeAndStackFoundations:SF.1/finite-group-quotient`. Quasi-projectivity over C ensures each finite orbit lies in an affine open, as that contract requires. Only descended ample powers, quasi-projectivity/normality output and analytic comparison remain extensions. |
| V4/canonical-model | SVI p.115 names 12.10 as a **Definition**, not a Proposition. The actual special-pair condition and its APIs/tests are unchanged. |
| V4/torus-model | Removed the unnecessary R09.3 infinite-automorphism descent dependency. ModularCurves Layer 0D already supplies finite continuous Galois sets, finite étale schemes and their morphisms; AGHMP p.416 constructs precisely this finite model. |
| V4/aghmp-stack-comparison | Replaced R09.4/R09.5 stage requests with the exact SF.1 quotient-stack, quotient-stack-algebraic, finite-quotient-coarse and stack-presentation nodes. Finite étale torus schemes are affine, and intermediate neat-refinement actions are free finite étale torsors. Non-neat inertia is retained. |
| V5/cm-frobenius | Imported the existing A4 good-reduction Tate comparison and A6 finite-rank, scalar-extended Hom injectivity, normal-base extension and integral characteristic-polynomial nodes. No stronger positive-characteristic Tate full-faithfulness result is needed. Added the compatible polarization input. |

For the Frobenius correction, let C be the centralizer of the specialized E-action in the rational endomorphisms of the good reduction. Scalar-extended Hom injectivity embeds C⊗Q_ℓ into the endomorphisms of a rank-one E⊗Q_ℓ Tate module, for ℓ different from the residue characteristic. Thus dim C≤dim E, while E⊂C gives the reverse inequality. Hence C=E and the q-power Frobenius lies in E. Its integral characteristic polynomial places it in O_E, and compatible Rosati conjugation gives ππbar=q. This argument uses injectivity, without Tate surjectivity or lifting every special-fibre endomorphism.

Three duplicate stage requests were removed: R09.4, R09.5 and R09.7d. A narrowed SF.1 ample-descent request was added. The retained R09.3 and A6 requests have smaller consumer lists and specify the outputs still missing. All changed proof steps, source matches, direct inputs, request consumers and refinement descriptions are synchronized in the reader; the Lean manifest records the revised supplier interfaces.

## Exact-pin baseline and current upstream audit

The full declarations and their hypotheses were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The packet's Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`; none of these five citations is a Tau Ceti declaration.

| Declaration | Kind / module | Exact contribution |
| --- | --- | --- |
| `MulAction.orbitRel` | def; GroupTheory/GroupAction/Defs | The orbit setoid of a group action, with relation a∈orbit G b. It adds no quotient topology. |
| `MulAction.orbitRel.Quotient` | abbrev; same module | The quotient type of that orbit setoid. |
| `MulAction.stabilizer` | def; same module | The subgroup fixing a specified point. Properness, effective faithfulness and freeness need additional inputs. |
| `AlgebraicGeometry.Scheme` | structure; AlgebraicGeometry/Scheme | Locally ringed spaces locally affine, underlying actual canonical models. |
| `CategoryTheory.Over` | def; CategoryTheory/Comma/Over/Basic | The fixed-codomain category, instantiated for schemes over the actual reflex-field spectrum. |

The reviewed library-coverage entries for V0–V7 were read. The separate current screens used TauCetiRoadmap at `4dd92d30699e43999f5102255f44bca1af475471`, then checked its update to `8c72a04753b11cab07fa593cc38ceaa7c0515380`, and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The update changed only SmoothRepresentationsOfLocalGroups; its Hecke-ring and residual Hermitian-space material does not provide these analytic Shimura or canonical-model targets. AdelicAlgebraicGroups is unchanged from the packet's cited `dea8191cc6047d6142a65872ebce6eeeb841a29b` version.

The complete current ReductiveGroups and AlgebraicVectorBundles reader documents were read, together with the relevant Suggested.lean statements. Current AdelicAlgebraicGroups sections 3.4, 4.1 and 4.3–4.5, ModularCurves 0C–0E and ReductiveGroups Part II restriction-of-scalars/norm contracts were read. The nine roadmaps absent from the atlas snapshot and the current library were screened for competing Shimura datum, automorphic-ring, reflex-norm, complex-analytic-space and Taniyama targets. A real-algebraic analytic-section file concerns polynomial-root sections, not the missing category of complex analytic spaces. Existing group actions, schemes, arithmetic commensurability, neat existence and finite Galois-set descent are imported throughout.

## Sources actually inspected

All eleven public PDF digests match the packet. `sourceVersions` records the copies independently read on 10 October 2026; AGHMP is correctly labelled as the published Annals copy. The Baily–Borel source is an OCR reproduction of the published paper, with the access limitation retained. No source file or source passage is committed.

| Source | Locators checked and audit limits |
| --- | --- |
| [Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), revised 16 September 2017 | pp.33–40, 57–61, 99–109, 113–118 and 122–131: all scoped target statements, conventions and supplied proofs. Primary analytic and connected-extension proof leaves remain separately recorded. |
| [Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf) | Corollary 1.5 with proof, p.6; Theorem 2.1, pp.16–18; Theorem 3.2, pp.19–20; geometric Artin and norm-kernel arguments through Theorem 3.10 and Remark 3.11, pp.21–24. The [public author erratum](https://www.jmilne.org/math/articles/2007c.html) was also read. |
| [Milne 1983 annotated author scan](https://jmilne.org/math/articles/1983a.pdf) | All page images 239–263, including corrected centre cohomology, weak/marked comparison, rank-one subgroups, completion symmetry and the connected appendix. The [author's erratum and updated comments](https://www.jmilne.org/math/articles/1983a.html) were read. |
| [Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf) | Entire six-page author version: Theorem 1.1, Corollary 1.2, Remark 1.3 and the finite-rigidity/canonical-descent argument. |
| [Bakker–Klingler–Tsimerman manuscript](https://benjamin-bakker.github.io/DefArith.pdf) and [erratum](https://benjamin-bakker.github.io/DefArithErr.pdf) | Introduction, pp.2–4; Theorems 4.12–4.13, p.18; entire erratum. Fixed maximal compact and corrected Cartan-compatible functoriality are mandatory. |
| [Andreatta–Goren–Howard–Madapusi Pera, Annals 187 (2018)](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf) | Section 3.1, pp.415–416, finite torus models and stack/coarse distinction. Section 3.2 identifies integral-model material outside V4. |
| [Milne–Shih, Langlands's construction of the Taniyama group](https://jmilne.org/math/articles/1982c.pdf) | Images pp.229–230 and 242–243. The remaining extension construction is explicitly unclosed in the proposed CM.S supplier. |
| [Milne–Shih, Conjugates of Shimura varieties](https://jmilne.org/math/articles/1982d.pdf) | Images pp.280–281 and 339–345: twist, completed symmetry and reduction. |
| [Conrad, Semistable reduction](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf) | Theorem 4.2, p.9; Theorem 5.5/Remark 5.6, pp.17–18; Proposition 6.5 and global torsion-field consequence, pp.23–24. |
| [Platonov–Rapinchuk, Russian published original](https://uva.theopenscholar.com/files/ixqrlw/files/doklady_r_247_8.pdf), 1979 | Images p.279 and p.282: exact perfection statement and final simplicity-conjecture discussion. The full perfection proof is left to its supplier. |
| [Baily–Borel, Annals 84 (1966)](https://annals.math.princeton.edu/1966/84-3/p11), [published-text OCR](https://paperzz.com/doc/6992794/compactification-of-arithmetic-quotients-of-bounded-symme...) | Sections 1.8–1.11, 3.3(ii), 3.5–3.7, 3.15, 4.8–4.11, 8.1–8.9, portions of 9.6–9.7 and 10.4–10.11, and Theorem 10.14; printed pp.454–457, 470–478, 482–484, 509–514 and 517–524. Illegible formulas and full analytic estimates remain refinements. |

These are source checks for the scoped mathematical targets, not claims to have recovered every primary proof cited by those papers. No restricted library book was needed.

## APIs, tests, Lean and planets

| Definition or construction | API items | Discriminating tests | Principal failure caught |
| --- | ---: | ---: | --- |
| AnalyticPoints | 4 | 3 | Dropping the domain or the rational quotient |
| AutomorphicRing | 10 | 5 | Cusp-only forms, cusp poles or intrinsic boundary weight |
| Geometric Artin conversion | 4 | 3 | Reversing the reciprocity convention |
| Reflex norm | 7 | 3 | Adding cocharacters or losing field-change norm |
| CanonicalModel | 8 | 3 | Checking only an arbitrary designated subset |
| Torus model | 6 | 3 | Wrong rational quotient or cyclotomic field |
| Full CM abelian variety | 7 | 3 | Omitting products or full degree |
| ConnectedTower | 6 | 3 | Losing congruence/Galois symmetry or full components |
| Conjugated datum | 6 | 3 | Assuming a full S-map lift or losing the marked adelic map |

All nine objects have constructors or the supplied-data construction, extensionality, structural and compatibility APIs appropriate to their uses. The contracted-product and pro-object mapping properties retain actual descent/diagram data. The named tests each fall within the stated hypotheses. All 41 planets identify key objects, constructions or named theorems, rather than individual proof bookkeeping.

The suggested file elaborates two native slices: the actual diagonal/right group-action quotient, and inversion of a supplied arithmetic reciprocity homomorphism into a commutative group. Its full omission manifest has all 69 node statements, 58 APIs and 29 mathematical tests. It does not assert unavailable analytic carriers, arbitrary Prop-valued substitutes or automatic canonical-model existence. Quotient topology, actual GL₂ data, number-field reciprocity and all advanced signatures remain absent conditions whose owners are recorded.

After the memory check showed 101 GB available, `lean-check research/blueprint/suggested/ShimuraVarieties--V0.lean` exited 0 with **23 declaration-uses-sorry warnings and no other diagnostics**. The imports are Mathlib only; the check validates the native signatures at the exact Mathlib pin, without claiming an exact-pin Tau Ceti integration or advanced formalization. Only omission-manifest comments changed in the Lean file.

## Closure, ownership and assigned red-team findings

Every scoped stage target is realized, and every prerequisite chain ends in a read library declaration, an exact supplier node, a requested stage or a precise gap. The expanded V8 foundational contracts for disjoint special reflex fields and conditional uniqueness were read: they depend on V1–V4 and conditions on candidate models, without assuming V6/V7 existence. CM.0 types are imported, whereas CM.2/CM.4 and PEL M4, which consume V5, are not used to prove it. Current A5 supplies analytic families; V5 owns their algebraization through independent M3 moduli and V3.

AA owns reduction, arbitrary level commensurability, neat existence and simply connected arithmetic approximation. The remaining effective-domain central-unit bridge and positive rational abelianization/local-openness specialization are its extensions. ReductiveGroups Layer 7 supplies structural theory, while the arithmetic real-density, cohomological and root-centre needs remain Part II requests. Current RG Part II plans G_m Weil-restriction norms; the marked norm to an arbitrary torus needs the stated cocharacter extension.

The named common proposals CFT.N and CM.S own generic unit-topology/cyclic-norm and Serre/Taniyama-extension inputs respectively. Their mathematical scope, consumers and outstanding primary proofs are stated. SF.1 owns general finite quotients and stack presentations; V3/V4 specialize these and request only the additional ample-descent output. R09.3 remains responsible for the continuous infinite-Aut descent needed by the positive-dimensional canonical models.

**RT-AREA-algebraicgeometry/3.** The packet and reader correctly propose CA.0 before C0: nilpotent complex analytic spaces locally modelled by (V(I), O_U/I), morphisms, open gluing, fibre products and the SGA 1 XII 1.1 analytification property. Its stated consumers include V1/V2, C0, ShimuraCompactifications C2, PEL M3 and ModularCurves Part II R12.3. PR196 and external ownership records still require the proposed edits. C0's repair target is not itself an implemented carrier. E8's rejected source-error claim does not weaken this required analytic category.

**RT-AREA-algebraicgeometry/28.** Topological gluing alone does not provide compatible holomorphic atlases. The proposed CA.0 or real PR279 M5/M6 stage identifiers must supply atlas transport and transitions to AnalyticToricGeometry Layer 3 and V1, with the M7 holomorphic-bundle route to C0. The external consumer/area records must include AnalyticToricGeometry. Retired LI.2/LI.4 are not used. These are concrete unapplied owner proposals; this review edits none of the supplier or atlas files.

The exceptional rank-one issue remains particularly explicit. The cited 1979 theorem proves semisimple perfection under its all-finite-place splitting hypotheses. A reductive root subgroup containing the entire marked torus can instead have a proper noncentral derived normal subgroup, as the SU(4,1) root-block example shows. A proved bridge back to the marked-torus adjustment is still required; the packet does not replace it with a false simplicity claim.

## Stage coverage

| Stage | Nodes | Status | Targets checked |
| --- | ---: | --- | --- |
| V0 | 6 | planned | Arithmetic stabilizers, commensurability, neat bridge, effective proper action, finite components and positive abelianization formula |
| V1 | 6 | planned | Actual points/topology/analytic structure, finite level maps, right translations, Hecke spans and datum maps |
| V2 | 9 | planned | Rational strata, Satake compactness, exact automorphic ring, separating sections, normality, finite generation, algebraization, Koecher and level extension |
| V3 | 7 | planned | Multivariable extension, Borel algebraicity, uniqueness, datum maps, finite quotients and qualified definable comparison/graph alternative |
| V4 | 8 | planned | Geometric Artin, reflex norm, lift independence, actual canonical condition, torus schemes/stacks, special existence and Hecke density |
| V5 | 12 | planned | Weight-one algebraization, full product-CM objects and Tate modules, spreading/reduction/Frobenius, reciprocity, polarization/level and Siegel existence |
| V6 | 7 | planned | Subdatum inheritance, Hodge models, connected symmetry and reconstruction, products, isogenies and abelian-type models |
| V7 | 14 | planned | Simple reduction, splitting, rank-one comparison, twist, uniformization, conjugation/coherence, finite rigidity, continuity and general models |

The nineteen refinement entries cover analytic foundations/gluing, effective arithmetic levels, Baily–Borel, multivariable Borel, independent definable comparison, CM spreading, connected coherence, Serre/Taniyama, exceptional uniformization, S-arithmetic/cohomology, A₁/completion density, ample finite quotients, omitted Lean carriers, positive abelianization, CM norm-kernel inputs, connected adjoint carriers, exceptional central adjustment and arithmetic reductive ownership. Each coverage remaining-list includes the applicable precise entries. All eight stages remain open for these refinements.

## Independent source-finding verdicts

Every finding has its own locator, correction, search record and `review.by: REV-ShimuraVarieties--V0~2` in the packet. The prior fourteen findings were independently checked; E15 was added here.

| Finding | Verdict | Independently checked correction or qualification |
| --- | --- | --- |
| E1 | confirmed | Milne 1983 Lemma 3.8, p.250, and annotated correction use centre Z(G) in finite-place H¹ injectivity; retain the Aₙ exclusion for n≥4. |
| E2 | confirmed | BKT author erratum restricts maximal-compact-dependent morphism functoriality to corrected Cartan-compatible data. |
| E3 | confirmed | SVI formulas 60–61, p.114, require multiplicative products in the torus. |
| E4 | confirmed | SVI 14.16(b), p.127, takes the isogeny quotient from the G₁ source model. |
| E5 | confirmed | CM Theorem 3.10/Remark 3.11(a), p.22, must use geometric art consistently for the fixed-idele formula. |
| E6 | confirmed | CM Theorem 2.1 proof, p.16, requires localization at the selected prime, as the public author erratum records. |
| E7 | confirmed | Descent Remark 1.3(c) repairs omitted continuity; a cocycle alone is insufficient. |
| E8 | rejected | SVI's convention-specific analytic/algebraic varieties do not establish the proposed nilpotent counterexample as a source error. The new CA.0 category must still include nilpotents. |
| E9 | confirmed | Absolute local inertia has infinite tame pro-ℓ quotients for ℓ≠p, so is not virtually pro-p. Potential good reduction is repaired using semistability and NOS. |
| E10 | confirmed | SVI's final p.127 full-component reconstruction invokes 14.15, while 14.16 concerns connected products/isogenies. |
| E11 | confirmed | The Tate representation of A/K is over Gal(Qbar/K), with the E-action defined over K. |
| E12 | confirmed | Milne 1983 p.252 cannot apply literal rational simplicity to the full reductive root subgroup. The cited primary result gives semisimple perfection, and the marked-torus bridge remains a gap. |
| E13 | confirmed | Milne's annotated p.239 introduction and author erratum give the Langlands reference pages as 232–233. |
| E14 | confirmed | The same public erratum deletes the repeated finite-adelic target factor on p.239. |
| E15 | confirmed | CM Corollary 1.5, p.6, prints F for the rational-endomorphism commutant; its own proof concludes C=E. The page image and complete proof confirm E is intended. The public author erratum lists only E6's localized-base correction. |

## Node-by-node ledger

The following ledger is also stored as the packet's review.checked object. “Verified” certifies the target, stated hypotheses and honestly recorded proof route, including its named refinements; it does not mean a proof is closed or implemented. “Corrected” additionally identifies a mathematical/source/supplier correction made by this review.

### ShimuraVarieties:V0

| Node | Verdict | Evidence and proof boundary |
| --- | --- | --- |
| `ShimuraVarieties:V0/stabilizer-arithmetic` | verified | SVI 3.2 and 5.13 separate the rational arithmetic subgroup from its discrete effective domain image. Current AA already supplies pairwise commensurability; the faithful-integral and compact-kernel bridge is explicitly requested rather than attributed to structural ReductiveGroups. |
| `ShimuraVarieties:V0/stabilizer-commensurable` | verified | The two arbitrary adelic representatives give commensurable compact opens, hence commensurable rational stabilizers by the read AA contract. The exact conjugacy formula additionally requires a common double coset and a component-preserving rational element. |
| `ShimuraVarieties:V0/neat-sublevels` | verified | The read AA.4/neat-level-exists contract includes normality and finite index. Both AA and D5 quantify over rational points in every adelic conjugate; their convention bridge and cofinality specialize existing work without duplicating neat existence. |
| `ShimuraVarieties:V0/effective-proper-action` | verified | The discrete effective arithmetic image and the ALS proper symmetric action give the required local quotient argument. D5 removes effective stabilizers at neat level; rational central units can survive. Holomorphic chart gluing remains an explicit supplier gap. |
| `ShimuraVarieties:V0/component-decomposition` | verified | SVI 5.11–5.13 gives the finite plus-double-coset decomposition and rational transport of representatives. The topological quotient retains the domain coordinate, and its analytic upgrade uses the recorded effective quotient charts. The GL₂ component count keeps both half-planes. |
| `ShimuraVarieties:V0/simply-connected-components` | verified | SVI 5.18–5.21 gives the precise positive rational image in the torus quotient. Current AA already plans Lang/Hensel integral lifts and finite-adelic abelianization. Positivity and local openness remain its specialization request; strong approximation is restricted to the noncompact simply connected derived factors. |

### ShimuraVarieties:V1

| Node | Verdict | Evidence and proof boundary |
| --- | --- | --- |
| `ShimuraVarieties:V1/analytic-points` | verified | The quotient in SVI p.57 is the actual rational diagonal action on domain times finite-level cosets. The native prototype uses inverse right multiplication to obtain a left product action; replacing the subgroup element by its inverse gives the stated equivalence. Topology and literal datum tests are explicitly omitted. |
| `ShimuraVarieties:V1/analytic-structure` | verified | The componentwise effective arithmetic quotient supports the normal analytic target of SVI pp.57–58. Neat charts are manifolds and non-neat charts use finite invariant local rings. CA.0 and holomorphic gluing are requested foundations, not asserted consequences of a topological carrier. |
| `ShimuraVarieties:V1/holomorphic-level-maps` | verified | The finite map and locally biholomorphic neat-target case match SVI p.58. The effective quotient-action group is only a subgroup of the automorphisms over the base. The disconnected C₆ versus S₆ example correctly prevents an unrestricted deck-group equality. |
| `ShimuraVarieties:V1/right-translation` | verified | Conjugating K to g⁻¹Kg makes the right multiplication formula well-defined. The intermediate conjugated level gives R_h after R_g equal to R_gh. SVI pp.58–59 supplies the right-action convention and compatibility with projections. |
| `ShimuraVarieties:V1/holomorphic-hecke` | verified | The right arrow from K∩gKg⁻¹ lands back at level K and factors through a translation and projection. Composition uses the actual fibre product and double-coset multiplicities. The stronger AA single-intersection product formula is used only with its extra hypothesis. |
| `ShimuraVarieties:V1/datum-analytic-map` | verified | SVI 5.16 supports holomorphic tower maps and the closed-immersion result for suitably small compatible levels. Equivariance gives the displayed point formula; no arbitrary coarse-level immersion is asserted. Reflex-field functoriality remains outside the complex-algebraization step. |

### ShimuraVarieties:V2

| Node | Verdict | Evidence and proof boundary |
| --- | --- | --- |
| `ShimuraVarieties:V2/rational-boundary` | verified | BB 1.8–1.11, 3.3(ii) and 3.5–3.7 support the rational-normalizer criterion, arithmetic boundary action and adapted projection. The boundary line factor comes from the ambient Jacobian. Product/nested realization and reductive classification proof interfaces remain explicit refinements. |
| `ShimuraVarieties:V2/satake-compactness` | verified | BB 4.8–4.11 constructs the topology and good neighborhoods before any analytic compactification. The isotropy and incidence conditions support the local extension predicate. Compactness and Hausdorffness use arithmetic reduction and orbit separation, whose detailed interfaces stay recorded as gaps. |
| `ShimuraVarieties:V2/analytic-automorphic-ring` | verified | BB 8.2–8.5 specifies the revised definition: adapted unbounded coefficients extend continuously in Satake topology and holomorphically on each incident stratum. Jacobian transport and induced boundary factors remove the previous ambiguity and circular algebraic definition. All ten APIs and five discriminating tests match these conventions. |
| `ShimuraVarieties:V2/poincare-eisenstein` | verified | BB sections 6–8 and 10 support sufficiently high-weight convergent separating sections with controlled boundary restrictions. The packet keeps convergence, estimates and germ separation as non-routine proof refinements. It does not infer them merely from compactness or a graded-ring name. |
| `ShimuraVarieties:V2/normal-analytic-compactification` | verified | The BB normal analytic target uses continuous functions holomorphic on every arithmetic stratum and agrees with the projective realization. Its normality and analyticity proof depend on separating sections and recorded primary-proof gaps. This normal object does not replace the nilpotent ambient analytic category. |
| `ShimuraVarieties:V2/automorphic-finite-generation` | corrected | Added BB 10.14 and its no-three-dimensional-Q-normal-subgroup restriction. BB 10.6–10.11 alone supplies a finite separating subring; equality with the full admissible ring needs the stated curve/logarithmic-canonical and mixed-factor comparisons outside 10.14. The general target remains an honest proof refinement. |
| `ShimuraVarieties:V2/baily-borel` | verified | SVI 3.12–3.13 and BB sections 9–10 support a normal projective minimal compactification with the arithmetic quotient as an open subvariety. The route constructs analytic strata and sections first, then algebraizes; the graded ring is not defined by this later algebraic variety. |
| `ShimuraVarieties:V2/koecher` | corrected | Added the primary BB 3.15 and 10.14 locators, preserving their stronger sufficient hypothesis. SVI 3.13(c) states the sharper split-PGL₂ exception. The review does not identify those hypotheses or apply the full-ring assertion to the modular-curve case. |
| `ShimuraVarieties:V2/minimal-level-extension` | verified | The finite-level extension follows the automorphic pullback and the identified minimal projective model, with uniqueness on the dense open quotient. Right translations and Hecke spans retain level compatibility. It does not claim that boundary extensions remain étale. |

### ShimuraVarieties:V3

| Node | Verdict | Evidence and proof boundary |
| --- | --- | --- |
| `ShimuraVarieties:V3/borel-extension` | verified | SVI 3.15 states extension from a punctured polydisk to the minimal compactification with a torsion-free effective target. Dense-open uniqueness is routine once separatedness is supplied. The inaccessible primary multivariable metric argument remains a precisely named source gap. |
| `ShimuraVarieties:V3/borel-algebraicity` | corrected | Replaced a duplicate R09.7d request with the existing R09.7/snc-compactification contract, read with its smooth quasi-projective characteristic-zero hypotheses. Added C0 for holomorphic SNC charts. Proper graph GAGA and local gluing give the stated smooth-source result; torsion targets remain excluded. |
| `ShimuraVarieties:V3/unique-algebraization` | verified | SVI 3.16 follows by applying Borel to the prescribed analytic identity and its inverse, then faithful analytification. Uniqueness is relative to that comparison. It neither asserts canonical-model descent nor assumes that arbitrary analytic maps into coarse torsion quotients algebraize. |
| `ShimuraVarieties:V3/algebraic-data-maps` | verified | Borel algebraizes the datum maps at neat target, while SVI 5.16 supplies the suitable-level closed immersion. Faithful analytification transfers identity, composition and level compatibility. The statement correctly distinguishes these complex maps from V8 reflex-field functoriality. |
| `ShimuraVarieties:V3/finite-quotient-algebraization` | corrected | Imported SF.1/finite-group-quotient, whose finite-orbit affine-cover hypothesis holds for a quasi-projective C-scheme. Retained only the descended ample-power/quasi-projectivity extension request and added C0 analytic comparison. Normalization is componentwise in the source fields; stabilizers prevent general étaleness. |
| `ShimuraVarieties:V3/definable-target-comparison` | verified | The BKT erratum requires the fixed maximal compact and compatible Cartan data. The target additionally needs an independent comparison with the algebraic definable structure, explicitly requested from C4. This comparison is not proved by assuming the Borel conclusion it will help establish. |
| `ShimuraVarieties:V3/definable-borel` | verified | BKT 4.12–4.13 uses a genuine polarized variation/period map, the independent target comparison and o-minimal Chow. The packet records these named inputs separately and uses a closed analytic definable graph. It does not claim every arbitrary holomorphic map is automatically definable. |

### ShimuraVarieties:V4

| Node | Verdict | Evidence and proof boundary |
| --- | --- | --- |
| `ShimuraVarieties:V4/geometric-artin` | verified | The CM source p.21 uses inverse arithmetic reciprocity. Inversion is a homomorphism because the target is abelian; it preserves kernel and norm compatibility. Native Lean tests cover this supplied-homomorphism conversion, while actual ideles, continuity and cyclotomic reciprocity remain mathematical obligations. |
| `ShimuraVarieties:V4/reflex-norm` | verified | SVI p.114 gives restriction of the marked cocharacter followed by torus norm, with the printed sum corrected to a multiplicative product. Its split, principal and field-change APIs agree. Current RG Part II G_m norm does not yet supply the arbitrary-torus cocharacter norm extension. |
| `ShimuraVarieties:V4/reciprocity-finite-action` | verified | Milne descent pp.3–4 gives the finite torus Galois action. Principal ideles, connected infinite ideles and continuity kill the Artin kernel at finite level. The full-tower output retains closure of T(Q); the stronger CM norm-kernel equality is not asserted for every torus. |
| `ShimuraVarieties:V4/canonical-model` | corrected | Corrected the p.115 locator to Definition 12.10. The condition quantifies over every actual D4 special pair and finite-adelic representative, with its true reflex field and geometric Artin action. Construction/extensionality APIs and the noncanonical split K(5) example prevent an empty-subset substitute. |
| `ShimuraVarieties:V4/torus-model` | corrected | Removed the unnecessary R09.3 descent dependency: AGHMP p.416 and current ModularCurves 0D already supply the finite-continuous-Galois-set/finite-étale-scheme construction and morphisms. The actual torus action, real cyclotomic K(5) example and coarse/stack distinction are retained. |
| `ShimuraVarieties:V4/aghmp-stack-comparison` | corrected | Replaced generic R09.4/R09.5 requests with the existing SF.1 quotient-stack, algebraicity, coarse and presentation nodes. Finite étale torus schemes are affine and satisfy their hypotheses; common neat refinement gives a free finite étale torsor. AGHMP pp.415–416 retains non-neat inertia and excludes arbitrary infinite-unit torus stacks. |
| `ShimuraVarieties:V4/special-existence` | verified | SVI 13.3 constructs rational regular semisimple approximants inside the open compact-mod-centre Cartan locus. Their tori give actual special points near any domain point. The arithmetic real-density and torus-conjugacy specialization exceeds structural RG Layer 7 and remains explicitly requested. |
| `ShimuraVarieties:V4/hecke-density` | verified | SVI 13.5 uses real density of rational component-preserving points, then the diagonal quotient relation, to obtain algebraic density in each component. This is not adelic strong approximation or density of one arithmetic domain orbit. For a torus the finite Hecke orbit is the whole finite set. |

### ShimuraVarieties:V5

| Node | Verdict | Evidence and proof boundary |
| --- | --- | --- |
| `ShimuraVarieties:V5/weight-one-algebraization` | verified | SVI 14.8 supplies the target. The current A5 contract gives analytic polarized families, without a converse algebraization theorem; V3 Borel and independent M3 generic moduli charts supply that step. The proof does not import M4 canonical existence, which consumes V5. |
| `ShimuraVarieties:V5/cm-abelian-variety` | verified | SVI 14.9 and CM preliminaries support a full degree-2g commutative CM action on the actual abelian variety, including products. The homological type and compatible Rosati involution are retained. Seven APIs and three tests distinguish full CM from a scalar or insufficient-degree action. |
| `ShimuraVarieties:V5/cm-tate-rank-one` | verified | The full-degree CM action gives rank-one rational Betti and finite-adelic Tate modules; CM 1.7 distinguishes maximal-order integral freeness from a general nonmaximal order. Quasi-isogeny faithfulness is imported through the read Hom/Tate contracts, not inferred from an arbitrary scalar matrix. |
| `ShimuraVarieties:V5/cm-number-field-model` | verified | SVI 10.3 supports number-field descent with finitely specified CM action, polarization and level after finite extension. The CM rigidity/spreading proof is a concrete refinement rather than a statement for all complex abelian varieties. The field must define the action before E-linear Galois arguments. |
| `ShimuraVarieties:V5/cm-potential-good-reduction` | verified | The existing R11 semistable-extension and square-zero-inertia nodes, corroborated by Conrad pp.9,17–18,23–24, repair the SVI inertia error. Rank-one multiplication in reduced E⊗Q_ℓ kills the unipotent action, and NOS gives potential good reduction. No virtual pro-p absolute-inertia claim is used. |
| `ShimuraVarieties:V5/cm-frobenius` | corrected | Replaced the stronger positive-characteristic Hom request by existing A4 good-reduction comparison and A6 finite-rank, scalar-extended Hom injectivity, normal-base extension and integral characteristic-polynomial nodes. The centralizer dimension bound gives C=E without Tate surjectivity. CM Corollary 1.5 p.6 has a newly recorded F/E misprint; Rosati gives ππbar=q. |
| `ShimuraVarieties:V5/shimura-taniyama` | verified | SVI 10.10 and CM 2.1 give the normalized valuation/type-counting formula. The ramified statement retains ord_v(q), while the later prime-generation argument can use good unramified primes. Integral eigenspace splitting is localized at the chosen prime, and product CM algebras use the torus norm interface. |
| `ShimuraVarieties:V5/cm-ideal-reciprocity` | verified | CM 3.2 requires a continuous ray-class comparison and enough good primes to generate every class. The packet retains arithmetic Artin for this ideal formula, finite excluded-prime control and an explicit prime-generation request. Equality at a few Frobenius elements is not treated as sufficient. |
| `ShimuraVarieties:V5/main-cm` | verified | CM 3.10 fixes the geometric Artin convention and a supplied idele for the unique E-linear quasi-isogeny. Lemmas 3.6–3.12 remove the closure ambiguity only in the CM norm situation. Changing the lift changes the quasi-isogeny by its rational scalar; generic torus lift equality is not assumed. |
| `ShimuraVarieties:V5/cm-polarization-level` | verified | CM 3.11(c) gives the χ_cyc/N similitude in the displayed quasi-isogeny convention. The Rosati relation and actual Tate twist yield the polarization identity. Applying it to the actual symplectic level orbit, with quasi-isogeny retained, is stronger than an unpolarized isogeny-class comparison. |
| `ShimuraVarieties:V5/siegel-special-cm` | verified | SVI 14.9–14.11 identifies Siegel special points with full CM objects through the torus Mumford–Tate criterion. Product CM algebras are necessary to cover all points. The target imports the actual Siegel datum and polarized Hodge/endomorphism inputs rather than defining a new type of special point. |
| `ShimuraVarieties:V5/siegel-canonical` | verified | SVI 14.12 and its existence proof use the rational generic polarized moduli model, actual adelic level and full CM theorem on every special point. Independent M3 uniformization does not assume M4 canonical existence. V4 verifies the field Q and polarization-sensitive reciprocity, then finite quotients give all levels. |

### ShimuraVarieties:V6

| Node | Verdict | Evidence and proof boundary |
| --- | --- | --- |
| `ShimuraVarieties:V6/hodge-inheritance` | verified | SVI 14.14 uses suitable-level closed images, dense special points and disjoint special reflex fields to descend a subdatum. The imported V8 disjointness result was checked as foundational rather than dependent on V6/V7 existence. Arbitrary complex subvarieties do not descend by mere containment in a model. |
| `ShimuraVarieties:V6/hodge-canonical` | verified | The D4 Hodge-type witness provides the symplectic embedding. Siegel existence followed by subdatum inheritance gives the target, and conditional V8 uniqueness compares candidate embeddings only after canonicity is established. No absolute-Hodge-cycle route or general-existence theorem is silently assumed. |
| `ShimuraVarieties:V6/connected-tower` | verified | The 1983 Appendix p.263 uses adjoint S-maps and congruence-completed rational symmetry, not an S-map into the simply connected cover. The pro-object and its levelwise mapping API are well specified. Deligne connected Galois-extension/coherence data remains a named refinement; a bare inverse-limit point set cannot reconstruct the full model. |
| `ShimuraVarieties:V6/connected-full-equivalence` | verified | SVI 14.15 states reconstruction using the connected canonical structure with its completion/Galois extension. The packet retains finite components and torus reciprocity, and shares the exact extension/gluing refinement with connected-tower. Forgetting that symmetry invalidates the proposed equivalence. |
| `ShimuraVarieties:V6/connected-products` | verified | SVI 14.16(a) supports products of the connected canonical objects with product congruence completions and coherent Galois action. The reflex norm gives special-pair compatibility. The full product reflex field is a compositum, while the connected extension formulas remain a shared proof refinement. |
| `ShimuraVarieties:V6/central-isogeny-descent` | verified | SVI 14.16(b) must start with the G₁ model, as E4 records. Finite effective quotient images of the completion kernel give the target connected tower. A central isogeny identifies adjoint S-maps without constructing a full S-map lift to the semisimple cover; completion/coherence proof inputs remain explicit. |
| `ShimuraVarieties:V6/abelian-canonical` | verified | SVI pp.127–128 applies products and central-isogeny descent to the Hodge witness at connected derived level, then reconstructs full components with reciprocity. The statement keeps the target reflex field rather than identifying it with the witness. This branch is independent of V7 general conjugation. |

### ShimuraVarieties:V7

| Node | Verdict | Evidence and proof boundary |
| --- | --- | --- |
| `ShimuraVarieties:V7/simple-connected-reduction` | verified | Milne 1983 3.9 and the connected appendix reduce the marked comparison to semisimple simply connected almost-Q-simple data. Restriction of scalars and the real Cartan condition require the recorded RG Part II arithmetic extension. Central components are restored through V6, not discarded. |
| `ShimuraVarieties:V7/auxiliary-cm-splitting` | verified | Milne 1983 6.4 uses a totally real extension making the compact special torus split over a quadratic CM field. The real conjugation action on the character lattice supports the CM splitting-field construction. The adjoint marked torus is pulled back to the cover, and the embedded-tower comparison remains required. |
| `ShimuraVarieties:V7/rank-one-subdata` | verified | Milne 1983 3.10 constructs the reductive subgroup containing the torus and the ±α root groups. Its derived A₁ cover carries the projected adjoint S-map, without a full-datum lift. The precise polarized A₁/CM marked-comparison bridge remains a gap rather than an inference from existence alone. |
| `ShimuraVarieties:V7/rank-one-central-separation` | verified | Milne 1983 Proposition 4.3 and Corollary 4.4 give the centre and adelic-intersection identities. The rational quotient is retained in the torus calculation. Root-lattice and cohomological interfaces belong to the recorded reductive supplier extensions and force the residual marked adjustment to be rational. |
| `ShimuraVarieties:V7/conjugated-datum` | verified | Milne–Shih pp.280–281 and Milne 1983 section 1 define the contracted-product twist from the Serre torsor and marked adjoint cocharacter. The torus is unchanged under the inner action and the distinguished finite-adelic trivialization is retained. CM.S owns the missing extension construction; the SL₂ test correctly avoids an impossible full S-map lift. |
| `ShimuraVarieties:V7/kazhdan-uniformization` | verified | Milne 1983 3.2 states the Hermitian uniformization target for arbitrary complex conjugation. The packet explicitly leaves the exceptional E₆/E₇/mixed-D primary analytic proof to refinement. This theorem is an input to weak comparison, not an axiom assuming the desired full conjugation theorem. |
| `ShimuraVarieties:V7/weak-conjugation` | verified | Milne 1983 sections 2–3 recover an arithmetic group and adelic comparison using ranked S-arithmetic rigidity and corrected centre cohomology. The Platonov–Rapinchuk source gives semisimple perfection, not literal reductive simplicity. The missing passage to the marked-torus adjustment is recorded as E12 and its own gap. |
| `ShimuraVarieties:V7/marked-conjugation` | verified | Milne 1983 sections 4–5 compare tangent characters and the embedded A₁ comparisons, then remove the residual central adjustment. The marked point and distinguished adelic map specify uniqueness. The A₁ and density proof interfaces remain explicit, so weak comparison alone is not treated as marked conjugation. |
| `ShimuraVarieties:V7/completed-conjugation-equivariance` | verified | Milne 1983 Proposition 6.1 and Milne–Shih section 8 require compatible totally real extensions and congruence-completion density. The annotated deletion of an extra generator family is respected. The precise density argument remains recorded; current author comments on real A₁ generation do not restore an unconditional rational generation claim. |
| `ShimuraVarieties:V7/special-independence` | verified | Milne 1983 6.3–6.5 compares marked tori after simultaneous splitting and inducts on real Weyl length. Compact normalizers, noncompact A₁ reflection changes and norm/weak-approximation inputs are distinct. The transitive comparison and auxiliary-choice independence remain conditional on those precisely requested interfaces. |
| `ShimuraVarieties:V7/conjugation-cocycle` | verified | Milne 1983 section 7 normalizes the reflex-field-fixing cocharacter class and uses special-independent transitions to obtain the composition law. Full components and special reciprocity are reconstructed. The cocycle theorem is kept separate from the continuity criterion needed for effective descent. |
| `ShimuraVarieties:V7/finite-rigidifying-points` | verified | Milne descent Lemma 2.2 and Theorem 2.3 use finite automorphisms and a finite subset of a dense special Hecke orbit. The exact ALS normalizer-finiteness extension is requested. Zero-dimensional levels use all geometric points, and open reciprocity stabilizers give a finite field fixing the rigidifying set. |
| `ShimuraVarieties:V7/continuous-descent` | verified | Milne descent Theorem 1.1 and Corollary 1.2 require splitting over a finitely generated extension. Spread the variety and rigidifying points, then compare descent maps on that set. The packet correctly uses this criterion rather than the older continuity-free lemma corrected in Remark 1.3(c). |
| `ShimuraVarieties:V7/general-canonical` | verified | Milne descent Theorem 2.3 combines the continuous canonical cocycle with effective quasi-projective descent, then compatible maps and finite quotients. The special action and auxiliary-choice independence were established beforehand. It is a justified target-level endpoint with recorded supplier/proof leaves, not an implemented existence theorem. |

## Validation

- The blueprint checker reports **0 errors and 0 warnings**: 69 nodes, 58 API items, 29 tests, 41 planets, 19 gaps, 18 requests, eight planned and zero closed stages.
- Every node occurs exactly once in the independent review ledger. There are 61 verified and eight corrected entries, with no unverifiable or added entries.
- Cross-file checks match all 69 mathematical statements, all 58 API names/roles/statements and all 29 test names/kinds/statements in the reader and suggested omission manifest. Source locators/matches, prerequisite lists, requests, refinement records and source-finding verdicts also agree with the packet.
- Source-findings and version validators pass. All eleven PDF digests were independently matched; the primary OCR limitations are retained.
- The suggested file elaborates with only the 23 `sorry` warnings described above. Native Lean bodies are unchanged.
- `git diff --check` passes. Changes are limited to this issue's packet, reader, suggested file, review report and WORKERS-required handoff. The remote submission result is recorded on the pull request.

## Questions and actions for the orchestrator

1. Apply the CA.0 and PR196/PR279 ownership proposals through the owning jobs, choosing CA.0 or real milestone stage identifiers for the gluing/bundle edges and updating the stated external consumers. The packet does not claim these foreign edits have happened.
2. Route the narrowed eighteen requests to their owners. Reuse the existing R09.7 SNC, SF.1 quotient/stack and A4/A6 nodes instead of commissioning duplicate results. Keep the AA effective-domain and positive-component specialization distinct from the already specified arithmetic reduction and integral lifts.
3. Schedule the nineteen explicit refinements from the accepted coverage lists. A legible primary Baily–Borel copy is still needed for estimates and the complete section-ring proof; the exact boundary definition itself is now resolved. The Borel, Deligne connected-extension, CM.S, Kazhdan and exceptional marked-torus arguments retain precise proof obligations.
4. Preserve the distinction between the effective level quotient-action subgroup and the full deck group when aligning the atlas V1 target. Retain the connected adjoint S-map convention and completion/Galois data when restoring advanced Lean signatures.
5. At assembly, place V8's existing disjoint-special-reflex-field and conditional uniqueness foundation with the V4 canonical lane, preserving existing node identifiers by aliases. Keep actual tower applications separate; no new copy of those foundational proofs is needed.
6. Retain the source-version scope and all fifteen source-finding verdicts. E15 corrects only a clear symbol misprint in the read author copy; it does not change the Frobenius target or supply missing number-field spreading.

No additional revision is requested for the corrected packet. The [handoff](../handoff/REV-ShimuraVarieties--V0~2.md) records the completed review and the owner/refinement work that remains.
