# Independent package review: PotentialAutomorphyInfrastructure, revision 3

**Verdict: needs_changes.** The fixing review is complete. The package preserves the accepted targets and now has explicit repairs to its integral Kostant hypotheses, residual Iwahori assertions, supplier references and Galois-cohomology interface. Three mathematical closure requirements remain: the two primary ordinary transport lemmas; the classification and maximality exports for extremely weak systems; and the conditional inputs to the locally symmetric-space supplier. These are described precisely below. This is a completed review, not a checkpoint of a package-writing job.

Reviewer: Codex, session `codex-JnyGZE`, job #9231. Review date: 2026-10-14. I did not author any of the three package rounds. The accepted packet and its source adjudications were not edited.

## Standard and coverage

I read WORKERS, PACKAGE_REVIEW, UPSTREAM_GUIDE and the applicable blueprint and expansion protocols, the previous review, the accepted packet and the package. The ClassicalGroups and LieHighestWeight README models in the atlas are byte-identical to their current upstream counterparts; their characteristic-zero scope is materially different from the integral coefficient problem here. Their suggested files illustrate the representative-signature form, but the binding 2026-10-12 rule excludes their older sorry-bodied carrier constructions from this package.

All 123 accepted nodes have corresponding named README targets: 29 definition nodes and 94 theorem nodes. The arithmetic variants, extra closure targets and their Checks remain in the README. There are 134 numbered subsections and 32 `Define` targets, including the new nonabelian cocycle interface. Each definition has at least three discriminating Checks and is declared in the suggested file or named in its closing comment. A name-presence scan is a coverage check; the statement and hypothesis audit is recorded separately below.

The previous review's demand for every arithmetic signature, all 122 API declarations and all 90 tests in Lean is superseded by PACKAGE_REVIEW's binding 2026-10-12 shape instruction. Missing arithmetic carriers are therefore not themselves grounds for rejection. The README retains those statements. The 546-line suggested file has real-bodied light definitions, nine theorem declarations and 35 examples. It has no sorry-bodied data definition, arbitrary proposition standing for an arithmetic conclusion, or construction of unavailable arithmetic carriers. `metadata.toml` remains the single fitting line `topic = "math.NT"`.

## Repairs applied

1. **Integral Kostant and formality.** §§1.2–1.3 now require the local field to be unramified over Q_p. The arithmetic targets of Layer 1 also retain ACC §4's standing field assumptions. The ramified quadratic example shows why the proof's distinct residual embedding characters cannot be used in that generality: the integral tensor product has nilpotents after reduction. This is a counterexample to that separation argument, not a claim that every ramified version of Kostant theory is false.
2. **Closed-alcove supplier.** §0.4 now names the simplicity and Ext¹-vanishing inputs for the closed bottom alcove, including its endpoint. The strict duality target in §0.6 remains distinct. The GL₂ Steinberg weight `(p−1,0)` tests the endpoint; `(p,0)` tests failure of unrestricted integral duality. The Layer 1 route consumes these local targets rather than assigning integral highest-weight theory to a characteristic-zero roadmap.
3. **Residual Iwahori assertions.** §5.3 now selects the square root of q congruent to 1, requires nonzero Laurent-torus roots, requires a nonzero module for the nonzero spherical projection, and requires a polynomial split into distinct roots for the two final comparison maps. Separability alone does not suffice. The F₂₅/F₅ module below is an explicit counterexample to the old last claim. Zero modules and the opposite square root give separate negative controls.
4. **Auxiliary CM ownership.** §2.6 consumes its own §2.5 `auxiliary_cm_extension_prescriptions`, replacing the nonexistent upward `PL.0/auxiliary-cm-extensions` dependency.
5. **Continuous nonabelian H¹.** §2.10 now defines the continuous cocycle quotient needed for forms, with its action, equivalence relation, pointed set and API. Its three checks distinguish homomorphisms, conjugacy classes and invalid cocycles. The existing Mathlib Čech H¹ and current Tau Ceti abelian continuous H¹ are cited with their actual carriers. No commutative group structure is imposed on nonabelian H¹.
6. **Actual ALS contracts.** Supplier references now distinguish ALS.5a duality from ALS.5b automorphic comparison. The finite-cell route records ALS.2.4's triangulability hypothesis; the rational comparison records the exact Franke and Galois inputs. Those conditional exports cannot silently discharge unconditional arithmetic targets.
7. **Support and trace directions.** The conventions specify spectral deformation-ring support through a nilpotent Hecke quotient; they do not invent an action of that ring on the original cohomology. §3.29 spells out the trace as a sum over the larger group modulo its contracted subgroup. The suggested retract docstring correctly calls `r ≫ i` the summand projector.
8. **Form and attribution.** The suggested file uses the prescribed single `import Mathlib`. A source-issue identifier in the large-image discussion was replaced by its mathematical counterexample. Bibliography entries and explicit gap paragraphs distinguish source statements actually checked from unread primary leaves. No source passage was added.

## Remaining requirements

### R1: ordinary transport primary statements

The BLGGT definition of ι-ordinarity and its normalization were checked, and Qian's application identifies the Steinberg input. This does not verify the exact statement of Geraghty's Lemma 5.2 or the nonsplit base-change/descent statement of Lemma 5.7. Author, publisher and indexed primary-copy routes did not yield a readable copy with those lemmas. The older indexed thesis is not interchangeable with the published numbering.

To close R1, read those primary statements, record their exact hypotheses and the normalization of every U^(j), and verify the bridge to the package's definition. In §3.46 the missing contract is the valuation of U^(j) on the Iwahori-fixed line of the indicated twisted Steinberg representation. In §3.47 it is both directions of ι-ordinarity under nonsplit soluble base change, with the labelled weights pulled back correctly. The split local case does not prove the nonsplit case. The README marks the two unresolved routes explicitly; §§5.21 and 5.23 depend on the second one.

### R2: extremely weak system classification and maximality

The current compatible-system supplier has the weakened carrier. It does not export everything required by §§2.8–2.12 and their descendants. Its §1.9 converse assumes a de Rham character, while the rank-two reducibility argument starts with an E-rational semisimple abelian representation before de Rhamness has been established. Its §§1.18–1.20 use rational weak compatibility, with stronger member hypotheses.

The first missing export is Henniart's locally algebraic classification in the exact E-rational abelian generality used by ACC Lemma 7.1.1. The second is Larsen's hyperspecial maximality in the rationalized extremely weak setting used by ACC Lemma 7.1.3. The primary statements were not read and are not certified here. The Larsen–Pink author copy supplies the separate unramified-monodromy input without a full-member Hodge assumption; it does not supply maximality. Close R2 by checking the two primary leaves and adding source-qualified contracts for this generality, including coefficient restriction and the common connected-component field. Do not substitute the stronger weakly compatible carrier or assert full-residue-field SL₂ image.

### R3: conditional arithmetic-space exports

ALS.2.4 explicitly assumes triangulability of the rounded compact manifold with boundary. ALS.5b.8–ALS.5b.9 explicitly assume `FrankeInput` and the relevant `GaloisInput`; the Galois attachment owner is named by this package. The original supplier table omitted these conditions. I repaired the table and the finite-cell route, but the unconditional package targets still need the triangulability and Franke inputs discharged by their owners for the spaces and coefficients in use.

The affected uses include §0.1, finite-cell perfectness and tower reconstruction, the perfect-complex duality application, and the rational nonzero amplitude/automorphic realization in Layer 5. Neatness, trivial stabilizers, and free diamond action do not prove triangulability or Franke's comparison. ACC's applications identify the required inputs, but a conditional ALS export is not a gap-free chain to them. The correction must preserve the lifting conclusions rather than adding the desired comparison as an arbitrary assumption to each end theorem. No supplier package was edited by this review.

### Disposition of the other accepted gap entries

The absent integral highest-weight owner is addressed by the local `IntegralDualWeylModule`, closed-alcove and splitting targets, whose sources were checked. The absent arithmetic signatures are handled by the new binding Lean shape. The PGL₂-form leaf is now a named target with a sourced continuous nonabelian H¹ interface, in addition to Weil restriction and split-group theory. Uniform arithmetic freeness, minimal-rank bounds and reconstruction remain named application verifications; their prerequisite chain is affected by R3. Ordinary Satake-image transfer retains its separate polynomial-law target and O-flat argument, rather than assuming surjectivity onto the entire GLₙ Hecke algebra. A planned theorem is not an implemented theorem; none of these dispositions claims formalization.

## Source verification

Restricted sources were read in place under the library's clearance. No restricted file, extracted passage or image was copied. Public primary copies were used for the other checks. This review does not claim to have independently rechecked all 77 accepted source-issue adjudications.

The additional sample was chosen reproducibly with `random.Random('codex-JnyGZE').sample(nodes, 15)` from the accepted packet. Every row below was checked in the primary text; printed and author-PDF pagination are kept distinct.

| Sample target | Primary locator checked | Scope confirmed |
| --- | --- | --- |
| Taylor–Wiles arithmetic levels | ACC §6.5.1, (6.5.6)–(6.5.7), pp. 1064–1065 | Original levels persist away from Q; the trace index and Hecke image maps are retained. |
| Hida weight specialization | ACC Corollary 6.6.6, pp. 1077–1078 | Derived specialization and coefficient twist, with its Hecke action. |
| Local-condition reduction | ACC §6.5.1, pp. 1062, 1068–1069; (6.6.4), p. 1077 | Distinct types agree after reduction; compatible actions are required. |
| Relative Bruhat cells | ACC §5.3, pp. 1003–1004 | Relative versus absolute lengths and the open upper-length union. |
| Ordinarily automorphic | [Qian, primary NSF copy](https://par.nsf.gov/servlets/purl/10388233), Definition 1.3, journal p. 1241 / PDF p. 3 | The automorphic witness is ι-ordinary; local Galois ordinarity alone does not define it. |
| Unipotent exterior cohomology | ACC Lemma 4.2.2(1), p. 970 | Continuous cohomology of the additive integral unipotent group. |
| Ordinary good-level lifting | ACC Theorem 6.6.2, p. 1075; proof pp. 1080–1081 | Whole-inertia characters, torsion-unit condition and support at the lifting point. |
| Fontaine–Laffaille descent | ACC §6.5.12, proof of Theorem 6.1.1, pp. 1071–1074 | Field construction, preserved residual hypotheses and soluble descent. |
| Integral model comparison | ACC §2.1.2, pp. 910–911; §2.2; §6.5.1, pp. 1064–1069 | Groupoid and coefficient comparisons; freeness is not asserted at arbitrary non-neat levels. |
| Arithmetic component dimensions | ACC proof of Theorem 6.5.4, pp. 1069–1070; proof of Theorem 6.6.2, pp. 1080–1081 | Dimension subtraction, component hypotheses and the two different support conclusions. |
| Density-one crystalline large image | [BCGNT author paper](https://www.ma.imperial.ac.uk/~tsg/Index_files/SatoTate.pdf), Lemma 6.1.5, author p. 59 | Prime-field image and density-one intersection with crystalline members. |
| Taylor–Wiles Hecke locality | ACC (6.5.10), p. 1066 | Localized selected-root block and quotient-locality statement. |
| Rank-two trichotomy | ACC Lemma 7.1.2, pp. 1086–1087 | Strong irreducibility, Artin up to twist, or quadratic induction; not exclusive alternatives. |
| Ordinary support | ACC proof of Theorem 6.6.2, pp. 1080–1081 | Support at the specified point; no unconditional full ordinary support. |
| Unipotent invariants acyclicity | ACC Lemma 5.2.7(1), p. 995 | Acyclicity for injectives in the stated smooth monoid category. |

Further primary checks addressed the closure leaves and consequential conventions:

| Source | Exact locations and result of checking |
| --- | --- |
| ACC, [author paper](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | §4 standing hypotheses, p. 965; Lemmas 4.2.2–4.2.3, pp. 970–972: unramified embeddings and closed-alcove use. §5.2.1 and Lemmas 5.2.2–5.2.4, p. 992: smooth monoid categories. §5.3, pp. 1007–1008: trace sum, orientation and twist. Lemma 7.1.3, pp. 1087–1089: forms and the cited classification/maximality leaves. |
| Jantzen, *Representations of Algebraic Groups*, second edition | II.5.5–II.5.6 and following remark, pp. 220–221: closed-alcove simplicity and Ext¹ vanishing. The strict integral duality route is distinguished from the closed endpoint. |
| [Newton–Thorne](https://arxiv.org/pdf/1511.04913) | §2.2.7, pp. 12–14; Proposition 2.10 and Corollary 2.11, pp. 13–14: induced integral lattice, base change and Levi splitting. |
| Platonov–Rapinchuk–Rapinchuk, *Algebraic Groups and Number Theory*, volume 1, 2023 | §1.3.2, pp. 23–24: cocycles and pointed H¹; Theorem 2.15, p. 78: classification of forms; §2.2.4, pp. 87–89: product automorphisms and the permutation/inner decomposition. |
| [Chenevier](https://arxiv.org/pdf/0809.0415) | Theorem 2.12, p. 28, and Theorem 2.22, p. 34: semisimple determinant reconstruction and the henselian multiplicity-free generalized matrix algebra. Henselianity and residual hypotheses are retained. |
| [Khare–Thorne](https://www.repository.cam.ac.uk/handle/1810/254249) | §5, pp. 25–27: q=1 residual Iwahori presentation and spherical comparison. The package's final split-root restriction and nonzero-module restriction are necessary; see the computed counterexamples below. |
| [Zelevinsky](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0/) | Theorem 4.2, p. 184: the linked-segment criterion specialized to unramified singleton segments. Equal root magnitudes exclude the forbidden ratio. |
| [BLGGT, published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf) | §2.1, pp. 537–538: normalized ordinary operators; Appendix A.2, pp. 600–601: soluble local prescriptions, cyclic splitting and the CM specialization. |
| Qian | Proof of Lemma 4.3, journal p. 1273 / NSF PDF p. 35: constant-weight slope and citation of the primary Steinberg input. This confirms the use of Geraghty, not his unread lemma. |
| [Larsen–Pink, author paper](https://people.math.ethz.ch/~pinkri/ftp/LP2.pdf) | Definition 6.5, author p. 14, Proposition 8.9 and Theorem 9.1, author p. 18: compatibility/connectedness and unramified monodromy. The different maximality input remains R2. |
| Geraghty; Henniart; Larsen | Primary exact ordinary lemmas, abelian classification and maximality remain unverified, respectively R1 and R2. Bibliographic identification and another paper's citation are not primary verification. |

## Prerequisites and duplication

I read the actual foundational declaration statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: retract, functorial map, derived-category localization, support, characteristic polynomial, Goursat, permutation composition, block exchange, finite-field PSL₂ simplicity, linear disjointness, Galois extensions and simple groups. Finite-dimensionality is separate from `IsGalois`; `IsSimpleGroup` includes nontriviality; PSL₂ simplicity requires at least four field elements. The suggested file imports no Tau Ceti module and therefore exercises only its Mathlib-based cores.

The expected pinned Tau Ceti commit is `f790474821cf4256814db967cb154e7af3d0c369`. Current-library checks used `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current roadmap checks used `0d144d044dacebca17b654695b6f1ad58f159b27`. Searches used mathematical objects and inspected the declarations behind relevant hits. I checked the nine newer roadmaps and the four Completed directories as well as the directly relevant earlier roadmaps. No new duplicate target was removed.

The current local-field solvability declaration `TauCeti.LocalFieldsRamification.isSolvable_algEquiv` is already a boundary deferral. Its hypotheses are finite extension of nonarchimedean local fields with compatible valuations. Current continuous H¹ is abelian; current Čech H¹ has a different carrier. Integral SL₂ Weyl lattices, Chevalley-root divided-power stability and a GL₂ Shimura Hecke multiplication table do not supply the integral GLₙ induced coefficient lattice, unipotent Kostant formality or residual GLₙ Iwahori algebra. IntegralLattices concerns quadratic lattices; OrthogonalSpinGroups' quaternion and Clifford groups do not classify PGL₂ forms. ProfiniteArithmetic's compatible characters do not implement higher-rank Galois-compatible systems. RestrictedProducts remains the ambient adelic supplier.

The SR.1.4, SR.1.5, SR.6.5, IHG §2.3 and RG2.0a–RG2.4 contracts were checked by their contents, not just headings. The package keeps the arithmetic monoid evaluation refinement, Hecke-image summand, congruence depths and place-indexed cells rather than replanning their general theories. P9's actual support contract uses spectral support and permits smaller components; the arithmetic equidimensional conclusion is justified separately. All remaining owner edges go to lower tiers or existing Tau Ceti roadmaps. The erroneous PL edge was removed. The ownership move is recorded in the handoff.

## Adversarial mathematics pass

The following table records the sweep of every numbered subsection, including its defining properties, named API and identities. “Retained” means that the tried instance did not require a correction; it does not certify a formal proof or verify every source in that subsection. An arithmetic existence hypothesis is not fabricated merely to instantiate a test: rows distinguish a computed local model from an excluded hypothesis or an unresolved supplier. The convention rows cover conditions shared across targets. The separate definition-check audit verifies the three-or-more Checks requirement.

| Statement or convention | Instances tried and computed consequence | Result |
| --- | --- | --- |
| Coefficients, Frobenius, weights | O/ϖ differs from O/p for ramified O; reversed row `(2,0)` gives ordinary unit factors `1,u⁻²`. | Retained ϖ, geometric Artin and reverse indexing. |
| Dual degree convention | n=2, f=2: `[2,5]` reflects to `[3,6]`; O/ϖ has an Ext¹ contribution. | Derived dual retained, not integral ordinary Hom. |
| Good-level profiles | R empty is allowed; p=2 fails the higher-rank bounds; auxiliary residue characteristics must differ. | No relaxation of good-level hypotheses. |
| Spectral support | I nilpotent preserves Spec but may act nontrivially; C=0 has empty support. | Clarified support and nonzero requirements. |
| 0.1 | Zero coefficients compare to zero; non-neat p-stabilizers do not give free cells. | Retained groupoid case; R3 recorded. |
| 0.2 | Identity retract works; identity maps with multiplication by 1 and 2 fail equivariance. | Projector direction retained and docstring corrected. |
| 0.3 | n=0 has an empty row; `(2,1),(-3,-4)` give `(4,3,2,1)`. | Reversal and cross-block dominance retained. |
| 0.4 | λ=0 is rank one; GL₂ `(0,1)` gives zero; Sym^p mod p has the p-th-power submodule. | Closed-alcove API and Steinberg endpoint added. |
| 0.5 | Trivial coefficient splits trivially; rank-two standard restricts to its Levi summand and complement. | Integral direct summand retained, without full semisimplicity. |
| 0.6 | `(p−2,0)` is inside; `(p,0)` fails integral symmetric-power duality. | Strict bound retained separately from the closed API. |
| 0.7 | GL₂ diagonal `(ϖ,1)` gives an index q; evaluation at 1 is a projection, not an equivariant section. | δ inverse and nonequivariant splitting retained. |
| 0.8 | Identity level and trivial U reduce to the coefficient map; nontrivial U requires invariants. | Retained level and coefficient domains. |
| 0.9 | Zero module has the zero retract; non-dominant unitary row lies outside the statement. | Retained dominance and Satake equivariance. |
| 0.10 | Trivial coefficients recover the unweighted map; a non-Galois-type ideal cannot use Siegel localization. | Non-Eisenstein and image conditions retained. |
| 0.11 | R empty recovers unramified Satake; R not conjugation-stable uses the distinct parahoric branch. | Trivial-coefficient restriction retained. |
| 0.12 | Rank-zero additive group gives H⁰=O/ϖ^m and Hⁱ=0 for i>0; Z_p has exterior degrees 0 and 1. | Dual exterior action retained. |
| 1.1 | n=0 has one shuffle of length 0; n=1 has lengths 0,1; internal block transposition fails. | Left-coset inverse convention retained. |
| 1.2 | Ramified quadratic K has nilpotents after integral tensor reduction; closed-alcove endpoint may occur. | Unramified K and closed-alcove prerequisite repaired. |
| 1.3 | Trivial unipotent complex is degree 0; ramified embeddings need not separate mod ϖ. | Unramified hypothesis restored. |
| 1.4 | Zero localized cohomology remains zero; split and unramified field assumptions are needed. | Standing arithmetic assumptions propagated. |
| 1.5 | Zero weight table fails CTG; two rank-one conjugate sums 0 and 1 satisfy the table predicate. | No automatic CTG from dominance. |
| 1.6 | n=1 has no strictly decreasing within-row pair; the perturbation target is n≥2. | Rank restriction and one-embedding perturbation retained. |
| 1.7 | Zero middle-degree localization gives a zero image; equality of images is weaker than surjectivity to all GLₙ Hecke. | Scope retained; standing assumptions restored. |
| 1.8 | Missing auxiliary p-adic degree inequality does not meet the shift hypotheses. | Good-level and weight bounds retained. |
| 1.9 | Repeated residual constituent violates multiplicity-free; single absolutely irreducible block is the henselian case. | Product-image proof leaf retained. |
| 1.10 | Nilpotent ideal 0 is allowed; a nonzero nilpotent acts before quotient and cannot be cancelled. | Nilpotent exponent and quotient target retained. |
| 1.11 | Torsion-only cohomology may be invisible rationally; mod-p concentration cannot be inferred from it. | Integral and rational hypotheses distinguished. |
| 1.12 | n=2, f=2 sends degree 2 to 5 under dimension-7 duality. | ALS.5a direction and coefficient dual retained. |
| 1.13 | Trivial twist does not automatically make weights CTG; p=2 violates the stated higher-rank bounds. | Character choice and arithmetic assumptions retained. |
| 1.14 | m=1: C={3}, D={0} is recovered; equal or overlapping blocks fail the disjoint cardinality checks. | Positive m, separation and both union sizes retained. |
| 1.15 | A zero degree contributes no characteristic identity; reflected nonzero degrees use the same residual ideal. | Degree and localization conditions retained. |
| 1.16 | n=1 uses the character branch; higher rank requires the FL bound and unramified p-field. | Separate branches retained. |
| 2.1 | K=Q is identity; restriction to the residual splitting field can destroy irreducibility. | Normal-closure disjointness retained. |
| 2.2 | F′=F is identity; overlapping residual-cyclotomic fields need not preserve images. | Does not promise decomposed genericity from this lemma alone. |
| 2.3 | E=F is identity; reducible restricted representation can yield noncuspidal base change. | Restricted irreducibility and every-finite-place contract retained. |
| 2.4 | Scalar residual Frobenius with nontrivial cyclotomic class tests the extra coset; trivial class does not. | Split test and joint images retained. |
| 2.5 | Degree N=1 is identity; insoluble local data are excluded from soluble prescriptions. | Three distinct construction branches retained. |
| 2.6 | Trivial local prescription does not by itself prove all good-level degree conditions. | Own auxiliary-field dependency replaces PL. |
| 2.7 | Splitting at p is a local identity; arbitrary nonsplit extension requires ordinary transport. | Construction separated from R1's automorphic conclusion. |
| 2.8 | Two identical character summands are allowed reducible members; a single de Rham member is not supplied. | R2 classification gap made explicit. |
| 2.9 | Quadratic induction and finite projective image may overlap. | Alternatives retained as nonexclusive; depends on R2. |
| 2.10 | Γ=1 has one class; C₂→C₂ has two; C₂→S₃ has identity/transposition classes and rejects a 3-cycle. | Nonabelian pointed H¹ added; product forms remain sourced targets. |
| 2.11 | Finite/torus monodromy is not the strongly irreducible case; adjoint central scalars disappear. | Strong irreducibility and PGL₂ forms retained. |
| 2.12 | Quadratic residue-field extension can enlarge coefficients without enlarging projective image. | Prime-field large image retained; R2 maximality remains. |
| 2.13 | Empty index set has trivial compositum and order 1; duplicate fields require selecting one representative. | Finite Galois, simple nontrivial group and subfamily conclusion retained. |
| 2.14 | Sym⁰ is trivial; repeated Frobenius ratios fail genericity for higher powers. | Rank-one and distinct-ratio cases separated. |
| 2.15 | Disjoint subfamilies use independent simple factors; a repeated extension is not an independent factor. | Original F,F₁ kept in the final ACC application. |
| 2.16 | Quadratic character agrees only at density 1/2; in mod ℓ, ℓ repeated characters have zero trace. | Density one and characteristic polynomials retained. |
| 2.17 | T empty is weak automorphy; T′ subset T preserves the witness; an omitted prescribed prime is not controlled. | Quantification over every v in T retained. |
| 2.18 | χ₂=χ₁|·| is reducible and has unequal root magnitudes; equal magnitudes avoid linking. | Normalized induction and ratio criterion retained. |
| 2.19 | T empty gives no extra finite-prime guarantee by itself; purity supplies the missing local upgrade. | CM and purity assumptions retained. |
| 2.20 | Finite exceptional primes do not change density; two density-one sets still have density-one intersection. | Prime-field image retained; R2 affects its input. |
| 2.21 | Roots 2,3 give Sym² roots 4,6,9 and determinant 216; m=0 gives repeated HT weights. | Determinant exponent and regularity condition retained. |
| 2.22 | Multisets {1,0} and {0,1} agree; {0,0} fails weight zero. | Multiset carrier retained. |
| 2.23 | diag(1,−1) is odd; identity over Q is not; no real places gives a vacuous condition. | Characteristic-zero and determinant sign retained. |
| 2.24 | Character-sum case is reducible at every member only after classification; it cannot follow from a name. | R2 dependency retained. |
| 2.25 | A CM-induced rank-two system can have reducible Sym². | Strong irreducibility hypothesis retained. |
| 2.26 | Quartic twist with coefficients Q(i), inert ℓ, keeps projective image inside PGL₂(F_ℓ). | Own-word explanation excludes full-residue-field SL₂ claim. |
| 3.1 | b=0 has trivial diamonds; a nonzero parameter in a field generates the unit ideal, giving the whole group. | Generic matrix scope distinguished from arithmetic uniformizers. |
| 3.2 | Trivial module is smooth; translation on all functions Z_p→F_p is not, while locally constant functions are smooth. | Monoid carrier differs from the imported group category. |
| 3.3 | Valuations (1,0) contract upper unipotents; (0,1) do not; n=0 is trivial. | Inequality direction and ϖ versus p retained. |
| 3.4 | U=0 gives zero ordinary part; invertible U gives all; nilpotent U gives zero. | Arithmetic Hecke image separated from generic projector supplier. |
| 3.5 | Rank-one weight 2 gives τ(u)²; uniformizer powers act by 1. | Unit-only lowest-weight normalization retained. |
| 3.6 | λ=(2,0) gives unit powers 1,u⁻²; replacing ϖ by 3ϖ changes the rank-one value 2 to 6. | Inverse weights, ε exponent and coordinate choice retained. |
| 3.7 | Nilpotent monoid action localizes to zero; invertible action survives; m=0 is excluded. | Algebraic localization distinguished from an arbitrary projector. |
| 3.8 | Trivial torus invariants recover the module; nontrivial subgroup still requires the stated action. | Domains and quotient actions retained. |
| 3.9 | Zero injective is acyclic; arbitrary noninjective modules need not be. | Injective and smooth-monoid hypotheses retained. |
| 3.10 | Exactness of ordinary localization does not make every module injective. | Separate preservation-of-injectives statement retained. |
| 3.11 | Borel intersection equals the expected subgroup at identity level. | Restriction and ordinary action use the indicated levels. |
| 3.12 | Degree-zero injective model yields underived comparison; general complexes require RΓ. | Bounded-below/derived conditions retained. |
| 3.13 | λ=0 recovers unweighted completed cohomology; zero coefficients give zero. | Good level, coefficient ring and Hecke image retained. |
| 3.14 | Zero completed object has zero ordinary object; ordinary localization retains invertible torus action. | Derived ordinary construction retained. |
| 3.15 | Trivial weight gives the unweighted comparison; nontrivial weight uses the explicit ·p action. | Coefficient normalization retained. |
| 3.16 | Equal depths give identity; b>c is not an admissible tower index. | Level inequalities and derived tensor retained. |
| 3.17 | Weight 0 specializes identically; torsion coefficients still require derived control. | Weight control is not inferred from rational cohomology. |
| 3.18 | n=1 torus gives direct character control; arbitrary nonordinary eigenvalues do not survive. | Ordinary and integral scope retained. |
| 3.19 | Split p-adic factor gives GL₂ₙ; conjugate operator at i=2n uses U₀/U₂ₙ. | Inverse central operator and conjugation indexing retained. |
| 3.20 | Empty away-from-S tensor is the coefficient algebra; inverse central operator must remain invertible. | Satake map targets the correct ordinary algebra. |
| 3.21 | λ̃=0 is the unweighted boundary object; c=b=0 is excluded by c≥1. | Boundary and interior carriers kept distinct. |
| 3.22 | Equal levels give identity; mixed coefficients still use the stated ordinary action. | Good level and derived comparison retained. |
| 3.23 | One degree-two place, n=1: longest relative length 1, absolute length 2. | Place weighting and open union of full cells retained. |
| 3.24 | Empty cell domain gives zero functions; identity cell evaluation has the stated stabilizer. | Compact support is modulo P, not absolute compactness. |
| 3.25 | Threshold beyond longest length gives zero; threshold 0 gives the full induced object. | Filtration direction retained. |
| 3.26 | An injective coefficient gives the claimed exact invariant filtration; invariants are not generally exact. | Acyclicity hypotheses retained. |
| 3.27 | Zero injective gives zero higher invariants; unrestricted modules do not. | Compact-cell injective acyclicity retained. |
| 3.28 | Noncompact quotient functions are killed by sufficiently large positive torus powers. | Ordinary comparison retained, not equality before localization. |
| 3.29 | Contracted subgroup H⊆N_w gives trace ∑ over N_w/H; index one gives identity. | Trace domain and direction made explicit. |
| 3.30 | Evaluation at w, rather than at 1, gives N_w invariants. | Equivariance uses conjugation by w. |
| 3.31 | Zero Lie space gives 1; adjoint scalar p gives 1; unit −1 at p=2 gives −1. | Inverse determinant divided by norm retained. |
| 3.32 | Longest w has shift 0; w=1 has shift −n²f. | Absolute length and inverse torus twist retained. |
| 3.33 | Longest-cell contribution has zero shift; other cells need orientation and τ inverse. | Does not discard unramified orientation factors. |
| 3.34 | A nonequivariant section still permits a Hecke-equivariant quotient map. | No unwarranted equivariant splitting. |
| 3.35 | Image of Satake may be proper even when the boundary comparison is surjective onto that image. | Target remains the Satake image. |
| 3.36 | n=1 is excluded; unchanged zero weight is not automatically CTG. | Rank and perturbation hypotheses retained. |
| 3.37 | Zero middle cohomology gives zero image; image quotient does not equal the whole GLₙ algebra. | Nilpotence and image scope retained. |
| 3.38 | f=1 has zero-dimensional connected determinant torus; f=2 has dimension 1. | Congruence-unit lattice and component distinction retained. |
| 3.39 | f=1 removes the central torus factor; arbitrary non-neat action need not give a product model. | Neat-level and component choices retained. |
| 3.40 | Equal neat level gives identity; shrinking uses a specified finite index. | Index divisibility conditions retained. |
| 3.41 | f=1 has no exterior degree shift; f=2 has one extra degree. | Determinant exterior pairing and dual degree retained. |
| 3.42 | Polynomial identities on group elements do not automatically determine a polynomial law after base change. | Separate flat polynomial-law transfer remains named. |
| 3.43 | Rank-one case is character theory; higher rank needs full inertia and the specified nilpotent quotient. | Scope retained; no Satake-surjectivity shortcut. |
| 3.44 | Arbitrary uniformizer changes raw U eigenvalues; normalized unit-eigenvalue condition is invariant. | BLGGT normalization retained. |
| 3.45 | No ordinary automorphic witness means the predicate fails even if a local Galois flag exists. | Automorphic and Galois ordinarity distinguished. |
| 3.46 | Constant weight c subtracts jc from the U^(j) valuation. | Primary valuation contract remains R1. |
| 3.47 | Split p-adic base change is identity; nonsplit restriction uses Artin/norm compatibility plus a primary lemma. | Split proof retained; nonsplit R1 recorded. |
| 3.48 | Rank-one flag is the whole representation; upper-triangular residual form alone is not the lifted flag. | Full flag and character data retained. |
| 4.1 | χ=1 compares identically; distinct characters trivial mod ϖ coincide only after reduction. | Compatible reduced actions retained. |
| 4.2 | Nilpotent ideal 0 is allowed; finite nonzero nilpotent ideal cannot be ignored on modules. | Quotient deformation action retained. |
| 4.3 | Zero ordinary complex reconstructs to zero; c=1 gives the initial finite quotient. | Derived limit reconstruction and R3 prerequisite retained. |
| 4.4 | n=2, μ=(2,0): ν+w₀μ=(0,3); inverse twist is essential. | Shift, reversal and coefficient action retained. |
| 4.5 | Equal weights give identity; μ=0 still has nontrivial ν in rank two. | Weight independence follows after the specified twist. |
| 4.6 | λ=μ is self-specialization; a character outside the permitted weight quotient cannot be used. | Exact coefficient character and derived specialization retained. |
| 4.7 | Zero localized Hida image cannot witness a nonzero lifting point. | Quotient action and uniform nilpotent bound retained. |
| 4.8 | Dimension algebra gives dim R∞=dim S∞−ℓ₀; lower-dimensional components need separate bounds. | Component hypotheses retained. |
| 4.9 | Zero C violates nonzero characteristic-zero fibre; nilpotent ideals do not preserve module lengths. | Spectral support and maximal-component scope clarified. |
| 5.1 | Q empty recovers K; n=2 and q≡1 mod p give index q+1≡2. | Prime-to-p trace inverse is used only for p>n. |
| 5.2 | Reordering distinct roots changes the selected torus block; repeated roots break the selection hypotheses. | Ordered roots and FL q factors retained. |
| 5.3 | Zero M; opposite q square root; separable irreducible X²−2 over F₅. | Nonzero, normalization and split-root restrictions repaired. |
| 5.4 | Split distinct roots give a proper selected maximal ideal; coincident roots do not give the same argument. | Selected-block hypotheses retained. |
| 5.5 | Δ=1 is identity augmentation; nontrivial diamonds require derived tensor over O[Δ]. | No underived coinvariant substitution. |
| 5.6 | Zero localization has no residue eigenvalues; locality refers to the nonzero selected block. | Exact (6.5.10) localization retained. |
| 5.7 | Trivial Δ recovers the unframed finite-level action; nontrivial Δ must match the deformation map. | Diamond linearity retained. |
| 5.8 | Q₀ empty is the base complex; ranks cannot be inferred from arbitrary non-neat groupoids. | Uniform arithmetic verification retained; R3 recorded. |
| 5.9 | Equal reduced complexes need equal images in the reduced derived category, not just after forgetting scalars. | Common mod-ϖ image and quotient actions retained. |
| 5.10 | n=2,f=2: ℓ₀=3, dual interval `[3,6]`; rational nonzero fibre is essential. | Degree correction retained; conditional ALS amplitude flagged R3. |
| 5.11 | Nilpotent quotient has the same underlying spectrum; this is not integral R=T. | Full spectral support, not a fictitious module action. |
| 5.12 | Identical automorphic lift is a witness; a noncrystalline lift fails the input. | Weight, good-level and unramified output retained; R3 affects realization. |
| 5.13 | Scalar residual Frobenius with q_v≠1 gives H²=0; q_v=1 fails that vanishing argument. | Full endomorphism trace pairing uses no division by n. |
| 5.14 | Q empty gives the original ordinary Hida complex; ordinary root products omit FL's q factor. | Distinct normalization retained. |
| 5.15 | Δ=1 is identity; nontrivial Δ uses derived augmentation before weight specialization. | Order of comparisons retained. |
| 5.16 | Trivial diamond action specializes to the base map; arbitrary map need not be diamond-linear. | Compatibility conditions retained. |
| 5.17 | χ=1 is the untwisted tower; common mod-ϖ comparison does not supply rank bounds by itself. | Fixed ultrafilter and full input verification retained; R3 affects freeness. |
| 5.18 | Unsupported lifting point gives no automorphic conclusion. | Point support retained, without full ordinary support. |
| 5.19 | Whole-inertia exponent includes i−1; trivial residual inertia does not remove torsion-unit compatibility. | Full good-level hypotheses retained; R3 affects realization. |
| 5.20 | Identity base change is harmless; restriction that destroys residual irreducibility invalidates descent. | Disjointness and FL field construction retained. |
| 5.21 | Split p-adic step preserves the local definition; nonsplit ordinary descent remains R1. | No assertion that field construction proves ordinary transport. |
| 5.22 | n=1 uses rank-one classification; n≥2 uses p>n² and the strong residual conditions. | Both branches and precise unramified output retained. |
| 5.23 | n=1 is separate; n≥2 requires p>n, full local flags and the scalar cyclotomic coset. | End theorem retained; R1 and R3 remain upstream proof leaves. |

For §5.3's nonsplit counterexample take n=2, q=11, k=F₅, and M=F₂₅ with γ²=2. Let t₁ multiply by γ, t₂ by −γ, and the transposition act by the fifth-power Frobenius. Frobenius exchanges the two torus actions. The central polynomial is X²−2, separable and irreducible over k. The torus has one maximal ideal on this module, fixed by S₂. Its localized module has dimension 2, while k[S₂]⊗M has dimension 4, so the first claimed comparison cannot be an isomorphism. The spherical operator is `1+Frob`, whose image is the one-dimensional fixed field, so the second claimed comparison also fails. After extension to F₂₅ the two ordered-root blocks separate. The repaired statement requires that separation over the actual residue field.

For the square-root control use k=F₅ and roots 1,2. With the chosen square root congruent to 1, spherical coefficients are e₁=3,e₂=2. Choosing the root congruent to −1 changes the degree-one torus normalization and labels the torus roots −1,−2. Thus merely adjoining either square root is insufficient for the displayed same-root identification. For the zero-module control, support is empty, so it is not contained in the discriminant vanishing locus; nevertheless the spherical image is zero. This forces a nonzero-module hypothesis.

## Suggested-signature spot checks

These checks compare the advertised mathematical core against its actual Lean scope. Arithmetic adapters absent at the pins remain README targets rather than counterfeit declarations.

| Signature | Comparison |
| --- | --- |
| `EquivariantRetract` and `idempotent` | Inclusion/retraction equations and `r ≫ i` direction agree; no ring laws are claimed for a generic indexed family. |
| `UnitaryLeviWeight.dominant_iff` | Requires positive n and antitone input rows; cross-block inequality is `−b₀≥a₀`. |
| `KostantShuffle.minimal_representative` | Inverse increases on each block; block-preserving factor multiplies on the left. |
| `CTGWeight` | Quantifies over the supplied weight table; the README's algebraic adapter is not falsely claimed as implemented. |
| `shifted_partition_recovery` | Positive m, equal cardinalities, separation and both disjoint union sizes are present. |
| `simple_galois_composita` | Finite-dimensional and Galois hypotheses are separate, Δ is finite and simple, and empty J is allowed. |
| `PositiveTorusMonoid` | Descending valuations contract the upper unipotent group; generic U is a commutative group. |
| `IwahoriLevelTower.diamondQuotient` | Local coefficient ring, admissible b,c and quotient-unit carrier match the matrix core; arithmetic valuation assumptions are not pretended. |
| `RelativeBruhatCells.open_union` | Finite place set and nontrivially normed fields; uses full subrings, not compact integral cells. |
| `OrdinaryGaloisCharacters` | Zero-based i, exponent −i, reversed weight, unit diamond character and U_(i+1)/U_i agree. Continuity/Galois passage is explicitly absent. |
| `BruhatOrientationCharacter` | Nonzero determinant supplied by units; p-adic norm is nonzero; the p=2 sign is retained. |
| `TaylorWilesArithmeticLevels.trace_scalar` | Local maximal ideal is generated by ϖ, the residue quotient is finite, and q≡1 mod p; Lean states index arithmetic, not a constructed cohomological trace. |

## Validation and limits

`lean-check` on the absolute suggested-file path exited 0 at the shared pinned Mathlib build: **47 warnings, all `declaration uses sorry`; zero other warnings and zero errors**. More than 20 GB memory was available and one check ran at a time. Later changes to that file only wrapped the closing comment and corrected a projector docstring; its declarations are unchanged. This is elaboration of representative signatures, not a proof of their mathematical truth.

`scripts/check_sorry_data.py` exited 0. `scripts/check_blueprint.py` on the unchanged accepted packet reported zero errors and zero warnings. The packet counts remain 123 nodes, 29 definitions, 94 theorems, 122 API items, 90 tests, seven recorded gaps and 36 requests. Package/report/handoff intake and final diff validation are recorded in the PR and handoff. No packet, campaign document, supplier package or current read-only checkout was changed.

The repairs are suitable to retain. Acceptance must wait for R1–R3's exact closure contracts; compilation and target-name presence do not discharge them.
