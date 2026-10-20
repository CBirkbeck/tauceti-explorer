# PKG-PadicLocalLanglandsForGL2Qp — completed package

Worker: Codex, session `codex-OMsPub`, 2026-10-20. Refs #10774.
Claim confirmed by the claim bot for comment 6280909579.

## Deliverables and validation

The package contains the full six-layer README, a representative Suggested.lean,
and `topic = "math.NT"`. Only those three files and this handoff are changed.
The packet, reader document and earlier suggested file are unchanged.

The README preserves all 65 accepted targets, all 167 named API entries and all
102 named tests, together with the additional acceptance examples, hypotheses,
proof sketches and source locators. Three general targets are supplier contracts
rather than duplicate layer targets: the Fontaine equivalence, rank-one Robba
modules, and general admissible unitary Banach representations. The generic
analytic-vector functor is also a supplier contract; the GL₂ algebraic-vector
decomposition remains a layer target. Thus there are 62 numbered subsections.
Internal cross-references have explicit anchors, and all resolve.

The layer correspondence is:

| Accepted target group | Package location |
| --- | --- |
| R30.1, excluding the two general Fontaine/rank-one targets | §§1.1–1.7 |
| R30.2, excluding the general Banach target, including finite length | §§2.1–2.9 |
| R30.3, including family stability and Fontaine's heart | §§3.1–3.11 |
| R30.4, including Artinian coefficients and filtration independence | §§4.1–4.11 |
| R30.5 | §§5.1–5.14 |
| R30.6 | §§6.1–6.10 |

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicLocalLanglandsForGL2Qp.json`: zero errors and warnings.
- `python3 research/blueprint/intake.py check-files` on all four deliverables: zero problems.
- Mechanical name comparison: zero missing API/check names; six layers; zero broken internal links.
- `git diff --check`: clean.
- `lean-check` on the package Suggested.lean: exit 0, with only three warnings that declarations use `sorry`.

The Lean scaffold uses Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. It has real matrix-coordinate and
smooth-representation predicates, three theorem targets, and eight proved
examples. The theorem targets are algebraic generation by the mirabolic, centre
and Weyl element, the mirabolic/scalar intersection, and the finite-residue-field
finite-length theorem. `Subgroup.closure` here is algebraic subgroup generation.
The integral torsion finite-length theorem remains separately stated in full in
the README; the smaller Lean signature does not replace it. No period ring,
completion, deformation ring or other heavy carrier is postulated in Lean.

The package is complete as a roadmap deliverable. This is not a claim of
formalisation or proof closure: the accepted plan has 18 explicit gaps and all
six stages are planned rather than closed. Their mathematical content is retained
as the supporting targets and conditional comparisons listed below.

## Current upstream ownership check

Read the current upstream roadmaps at
`0d144d044dacebca17b654695b6f1ad58f159b27` and the current Tau Ceti library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, without building either checkout.
Read AdicSpaces and RepresentationTheory/ModularInduction as the two full style
models, and checked the relevant smooth-representation, class-field and
determinant-law interfaces. There is no dedicated library-coverage entry for this
roadmap; the library search was therefore made by mathematical structure and
operations as well as names.

Searched the nine roadmaps newer than the atlas snapshot and the additional
Completed roadmaps named in WORKERS.md. No second owner of Colmez gluing, the
Montreal functor, the GL₂ block dictionary or the case-specific Breuil–Mézard
arguments was found. General local Galois groups, topology and functional
analysis remain with their existing owners.

Specific reuse decisions:

- Current `SmoothRepresentationsOfLocalGroups` SR.0/SR.2 supplies the smooth
  category, induction and enough injectives. SR.0d.1 does not prove the locally
  admissible fixed-central-character envelope theorem; §§2.1–2.3 retain that GL₂
  theorem instead of inferring it from Grothendieckness.
- Current `TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic`
  and `.Module` provide `completedGroupAlgebra`, `IsCompactModule`, the extended
  action and continuity over compact coefficient rings. They already cover
  O_L and compact open H. No second completed group algebra is planned.
- Current categorical `IsEssentialMono` and `IsEssentialEpi`, together with
  injective/projective objects, supply the envelope vocabulary. An ordinary
  module projective cover is not a substitute in the compact representation
  category.
- The checked checkout has no PadicMeasuresIwasawaAlgebras directory. Its atlas
  description is not evidence of an implemented O_L completed-algebra theory.
  Its Layer 5 contract here concerns the additional compact Nakayama and
  inverse-system exactness results.
- `IntegralHeckeAndGaloisDeterminants` Layers 0–1 owns determinant laws and the
  universal Cayley–Hamilton construction. §5.4 only specialises these to a block,
  with the dyadic fixed-determinant contract explicit.
- General Fontaine, overconvergence and rank-one results are deferred to PG.0–4
  and PG.7. General distributions, analytic vectors and Banach duality are
  deferred to ND.1–2 and ND.6. Classical type objects are imported from R16;
  §§1.7 and 4.4 retain the additional normalisation and p-adic/dyadic comparisons.
- The Caraiani–Newton ordering does not assign this roadmap one of the 94 tiers.
  In particular, global completed cohomology and modularity lifting are consumers,
  not proof-closing imports. The known supercuspidal global comparison and the
  all-residual patching arguments are explicit mathematical inputs. No theorem
  from those consuming roadmaps is added as a prerequisite. The R08 type-ring
  interface constructed from Langlands in §5.12 is distinguished from the
  independently supplied universal lifting/type-ring constructors used earlier.

No upstream files were edited. These ownership distinctions are in the package
boundaries and exact supplier contracts, without removed-target stubs.

## Source checks and corrections made while packaging

Public source files were read directly. No cleared book was needed. The table
records a reproducible sample of the checked statements; page numbers refer to
the versions identified in the package bibliography.

| Source and locator | Check and effect |
| --- | --- |
| Colmez, COLMEZ10, introduction §§4–6, pp.8–12 | Covariant Fontaine functor, contravariant D(Π), further Tate dual in V(Π), and canonical lattices distinguished. |
| Colmez, COLMEZ10, §I.3.2, pp.33–35 | D^♮ versus D^♯ and trivial-module controls retained; torsion residue pairing corrected to L/O. |
| Colmez, COLMEZ10, Proposition II.2.15, pp.60–61; Theorem II.3.3 and Lemma II.3.6, pp.63–64 | Unsaturated specialisation distinguished from saturation; family closedness does not supply missing density. |
| Colmez, COLMEZ08TRI, §0.1 footnote 1 and Theorem 0.5, pp.1,5 | Rank-two parameter classification keeps p≠2. |
| Kedlaya–Pottharst–Xiao, arXiv:1203.5718v3, Proposition 6.2.8 and Corollary 6.2.9, pp.58–59; Theorem 6.2.14, pp.61–62 | Added the all-prime rank-one source, including exceptional cohomology. This resolves the rank-one part of the plan's dyadic sourcing issue, not the separate rank-two classification. |
| CDP14, Theorems 1.1, 1.3, 1.4 and 1.8, §§1.1–1.4, pp.1–6 | All-prime nonordinary correspondence, residual finite length and completion classification kept distinct. The completion parameter locus may be empty. |
| CDP14, Theorem 2.21, p.14, and its reference [27, Theorem 1.1.1] | Banach Schur is a separate supporting theorem, not CDP Theorem 2.1. |
| Colmez–Dospinescu, CD14, §0.1, pp.3–4; Proposition 0.6 and Theorem 0.7, p.6 | Density/exactness of analytic vectors separated from coherent-lattice existence for universal completion. |
| Dospinescu, DOSPINESCU15, Theorems 1.2–1.3 and Proposition 1.4, pp.3–5 | p≥5, nonordinary Banach meaning of supersingular, fixed central character and de Rham-extension hypotheses retained. |
| Kisin, KISIN09, (1.2.2), p.648 | Correct exceptional mod-p exact-sequence orientations; source disagreements are not copied into the package. |
| Kisin, KISIN09, Hypothesis (1.2.6), Theorem (1.2.8), pp.649–650 | Scalar semistable type is finite Steinberg, not the trivial crystalline K-type. |
| Paškūnas, PASKUNAS15, Theorem 1.1, pp.2–3 | Scalar endomorphism and prime hypotheses retained; source determinant ψ is ψε in the package convention. |
| Paškūnas, PASKUNAS15, Theorems 2.42–2.44, p.16; Proposition 4.14, p.23; Corollary 6.5, p.31 | Actual projective-dimension inequality stated; K-projectivity, Cohen–Macaulayness and the intermediate crystalline exception not dropped. |
| Hu–Tan, HU-TAN15, Theorem 1.3, p.4 | Split distinct-character residual representations, p≥5. |
| Tung, TUNG21A, Theorem 1.2, p.4; Corollary 4.6, p.14 | Odd-prime all-residual theorem separated from its global patching inputs. |
| Tung, TUNG21B, Theorem 8.0.1 and Corollary 8.0.2, p.38 | The local all-residual dyadic result is Corollary 8.0.2; Theorem A is a global modularity statement. |
| Paškūnas–Tung, PASKUNAS-TUNG21, Theorems 1.1–1.4 and Corollary 1.5, pp.2–4 | Finiteness and generic-fibre equivalence distinguished from an integral isomorphism at p=2. |
| CDN–Kisin, CDNKISIN, Theorem 4.1 and Remark 4.2, pp.13–15 | Artinian de Rham criterion restricted to quotients of the specified absolutely irreducible fixed-determinant deformation neighbourhood. |
| BCDT01, §1.3, author pp.10–12, journal pp.854–856 | Complete admittance families, normaliser scalar, Cartier-dual and peu/très ramifié conventions retained. Nonzero-cycle matching is an extra hypothesis. |
| Dospinescu–Le Bras, DLB17, Theorems 1.2 and 1.4, pp.4,6 | Supercuspidal and sufficiently high covering-level hypotheses, geometric function/differential representations and filtration dependence distinguished. |

The newly fetched Kisin published PDF served by Harvard DASH has SHA-256
`a83952883cc72dba0c955efe6c11d13abfa1298fd308e4780e00f247b0b6756b`,
different from the packet's stored source hash. The package identifies this
version and uses its printed journal pages; it does not change the packet hash.
Other original source downloads matched their recorded hashes. KPX14 is an
additional source, not a replacement for the rank-two theorem.

The accepted plan's nine source-issue records are carried forward in mathematical
form, without changing those records:

1. Paškūnas 2016 Theorem 2.37 states cycle equalities; the preprint's prose
   introducing them is inconsistent. The published statement corrects the prose.
2. Its §2.C determinant is ψε under the surrounding inertia convention.
3. Emerton's Theorem 3.3.22 and §7.4 use different determinant exponents; the
   Emerton–Colmez convention comparison remains an explicit obligation.
4. CDP's reference to Emerton 3.2.22 is read as 3.3.22 in the checked author file.
5. Colmez III.3.2 reverses the two exceptional mod-p sequence orientations.
6. CDN–Kisin Remark 1.1 repeats that orientation issue; Kisin (1.2.2) gives the
   augmentation-compatible orientation used here.
7. Nakamura Appendix B.18's finite-dimensional-subquotient wording is too strong:
   the needed statement excludes subobjects and quotients separately.
8. Gee–Kisin Appendix B.1 corrects the scalar n=p−2 multiplicities to 1, 2, 4
   for ramified nonsplit, unramified nonsplit and split classes respectively.
9. Gee–Kisin B.1–B.2 also corrects the ordinary smoothness and low-weight
   crystalline exception in Kisin §1.7; the package retains those corrections.

## Adversarial mathematical pass

| Statements tested | Instances and result |
| --- | --- |
| Group coordinates and centre | w²=1, w∉B, integral unipotents, arbitrary unit diagonal, scalar intersection P∩Z={1}; the corresponding Lean examples are proved. BCDT's different normaliser element has square −ℓ. |
| Character and Tate-dual conventions | ε(p)=1, ε(u)=u; R(ε) has φ=1, R(x) has slope 1 and is not étale. D(Π(D))=Ď, but V(Π(D))=V(D) after the second Tate dual. |
| Coefficient duality | Integral/torsion/rational pairings have values O, L/O, L respectively. Ramified O requires the inverse-different scalar adapter; the circle-valued dual is not silently substituted. |
| Length and admissibility | Steinberg is admissible, simple as a representation, and infinite-dimensional; compact induction need not be admissible. The zero representation and a wrong scalar character test the retained predicates. |
| Exceptional residual series | r=0 and r=p−1 have opposite extension orientations; at p=2 the signs merge, not the two r parameters. |
| Lattices, fibres and completions | Zero module, trivial rank-one D, raw versus saturated quotient, closed rational subspace versus integral compact lattice; completion existence is not asserted for arbitrary locally convex objects. |
| Hodge–Tate and K-type normalisation | Weights (0,1) give Alg=1; (0,2) gives the standard two-dimensional factor; repeated weights fail the distinct-weight hypothesis. Scalar semistable/crystalline K-types have dimensions p and 1. |
| Type rings and cycles | Empty locus gives zero ring; framed dimensions 5/4/4 and scalar-endomorphism unframed dimensions 2/1/1; no division by 2 or dyadic determinant-variable splitting. Equal multiplicities do not identify cycles. |
| Morita variance | Ordinary End(P) composition gives right Hom modules and left P; tensor evaluation is in that order; duality reverses the endomorphism ring. |
| Deformations and global arguments | Tangent injectivity plus dense field-valued points does not identify nonreduced rings. The Artinian criterion retains its deformation-neighbourhood hypotheses. All-component automorphy is not a consequence of local blocks. |
| Filtrations and geometry | Filtration locus may be empty; distinct filtrations can give the same algebraic vectors but different completions. The Steinberg projective-line family includes an N=0 endpoint, removed when N≠0 is fixed. |

## Remaining mathematical proof obligations and review entry points

These are retained targets/inputs from the accepted plan, not unfinished package
files. An independent reviewer should check them before treating the roadmap as
proof-closed. No source-free assertion is promoted to a proved theorem.

| Plan gap | Precise package continuation |
| --- | --- |
| G1 | §§4.2, 4.5, 4.6, 5.11–5.12: supercuspidal smooth-factor comparison has a global proof; retain its comparison input at consumers. |
| G2 | §1.6 and §4.8: rank-two dyadic parameter/classification and analytic comparison remain additional targets. The rank-one portion is sourced to PG.7/KPX14. |
| G3 | §5.14: prove BCDT admitted-weight/nonzero-cycle matching for each residual class, and the extended-type branch-sensitive comparison. Acceptability is a separate patching assertion. |
| G4 | §§1.7, 4.2: reconcile MF, V, determinant exponents and induction order before identifying Emerton's B(V) with Colmez's Π(V). |
| G5 | Supplier contracts and §§1.5, 2.3, 3.1: O_L-linear Amice/convolution and inverse-different Pontryagin-duality adapters. |
| G6 | §§2.1–2.3: locally admissible finite-length theorem and envelopes inside the actual fixed-character representation category. |
| G7 | §§2.5, 3.11: coherent analytic lattice and universal completion existence, not just the universal property. |
| G8 | §§3.6–3.8: residual-case schematic density, or the separate CDP characteristic-zero inputs including Schur, residual finite length and infinitesimal character. |
| G9 | §§3.9, 5.7–5.9: representability, schematic closure and comparison on nonreduced Artinian rings. |
| G10 | §§3.10–3.11: analytic freeness/overconvergent comparison for Fontaine's heart, beyond a formal ψ-cohomology identity. |
| G11 | §4.4: p-adic K-type occurrence and multiplicity one; p=2 independence of reduced multiplicities under the allowed type choices. |
| G12 | §§5.1, 5.3: Gabriel block decomposition and pseudocompact Morita equivalence, with right-module/opposite-ring and Ind-completion conventions. |
| G13 | Supplier contract and §5.10: dyadic fixed-determinant type rings with pointwise property and exact dimensions, without splitting determinant variables. |
| G14 | §5.11: apply the stated projective-dimension inequality to the actual generator; prove R-flatness, restricted K-projectivity and Cohen–Macaulayness. |
| G15 | §4.10: all-prime infinitesimal action and differential-period calculation over Artinian coefficients; do not substitute the p≥5 extension theorem. |
| G16 | §5.13: fundamental-character, Cartier-dual and peu/très ramifié predicates and their Serre-weight comparison. |
| G17 | §§6.3, 6.5: globalisation, arithmetic patching and automorphy of every component remain explicit proof inputs. |
| G18 | §§4.11, 6.9: filtration-independent N_rig action and intersection theorem, then Drinfeld covers, isotypic projectors and geometric de Rham comparison. |

Resume with independent package review; no second job is claimed in this run.
No suspicious instructions were encountered in the external source data.
