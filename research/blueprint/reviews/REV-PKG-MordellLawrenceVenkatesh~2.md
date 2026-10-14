# REV-PKG-MordellLawrenceVenkatesh~2

Verdict: **accepted after fixes**. Issue #7939; independent reviewer Codex, session `codex-NgYz6n`; 2026-10-14. This worker did neither package-author job. This is a completed fixing review, not a checkpoint.

## Scope and governing standard

Read WORKERS, PROTOCOL, the expansion protocol, UPSTREAM_GUIDE, PACKAGE_REVIEW, the complete issue, the previous package review and the revision handoff. Read the complete input README and Suggested.lean and compared the accepted 146-node plan, its hypotheses and supplier inventory. Upstream models were current ReductiveGroups and Completed/EffectiveBounds; representative signatures were also read in LocalGaloisGroups.

The maintainer's 2026-10-12 README/Lean shape overrides the issue's older 200 KB ceiling and the first review's demand for exhaustive Lean APIs. The full mathematics stays in the README; only light definitions and representative signatures whose carriers exist at the pins belong in Lean. Consequently the previous review's missing-heavy-carrier signatures are not defects under the governing standard. The compact file is 785 lines, with 45 theorems and 23 examples. Its omission inventory distinguishes absent carriers from unselected signatures and explicitly identifies partial complement/orthogonality consequences.

## Checks and result

| Check | Result |
| --- | --- |
| Upstream form | Opening Summary, mathematical scope, conventions, supplier contracts, twelve ordered layers, full statements, locators and worked examples. No process narrative in the reader. |
| Accepted-plan fidelity | All 146 input targets are supplied locally or by an explicit owner; newly explicit adapters close the source-to-target chains. Two omitted arithmetic targets were restored. No packet was edited. |
| Definitions | All 34 definition/construction sections have named API outlines and at least three discriminating Checks; computational, degenerate and negative instances were inspected, not just counted. |
| Source sample | Deterministic random sample of 15 original targets, plus additional corrected foundations; source texts opened and locators checked. No author-marked unverified locator was present. |
| Current ownership | Compared current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, Completed roadmaps, and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; mathematical variants and removals below. |
| Lean | Final `lean-check` exited 0: 70 warnings, all declaration-uses-`sorry`; zero errors and zero other warnings. Ten signature checks recorded below. |
| Metadata | Exactly `topic = "math.NT"` and newline. |
| Own words | No source passage, source file or source-by-section digest added. Derivations are identified as such where a source supplies context rather than the full generality. |
| File intake | `intake.py check-files` on all deliverables and handoff: zero problems. |
| Packet validation | `scripts/check_blueprint.py` on the unchanged input: zero errors, zero warnings; 146 nodes, 79 recorded gaps, 76 supplier requests. These are the historical packet's planning status, not defects silently converted to implemented results. |

The README has 165 target sections: LV.0 26; LV.1 17; LV.2 11; LV.3 19; LV.4 5; LV.5 26; LV.6 10; LV.7 9; LV.8 14; LV.9 12; LV.10 10; LV.11 6. Compared with the accepted plan, the added sections spell out unit-group/orbit/closure and symplectic structure inputs, surface prerequisites, finite dimension descent, and normalization/component/Jacobian adapters. The input's semisimple trace theorem, local rank-one algebraicity and Strassmann theorem are explicit supplier deferrals. Their mathematical uses remain, but duplicate targets do not.

## Corrections and ownership decisions

- Restored integral Weil-polynomial finiteness (1.1) and the finite Frobenius test set (1.2). The latter now spells out stable lattices, the paired image algebra of rank at most `2d²`, its finite mod-p unit image, bounded-ramification Hermite finiteness, Chebotarev representatives and Nakayama, before importing trace rigidity. Faltings's finiteness proof uses both. The weight-zero CM quotient example shows why integrality is necessary.
- Removed a proposed semisimple trace target: ArithmeticGaloisRepresentations §1.8 already states it over every characteristic-zero field. Stable lattices are §1.6. Removed the local algebraicity target: PadicHodgeTheory R06.2 already supplies its rank-one statement. Renumbered LV.1 and repaired references. Strassmann remains only a boundary input from EffectiveDiophantineMethods ED.4.
- Removed the basic affine-group carrier/order/Frobenius-group development and redundant cardinality theorem; current `GroupTheory/SpecificGroups/Affine/` supplies these. Retained the permutation-image and prime-field cycle/normalizer statements. Distinguish the full cycle partition in prose from Mathlib's nontrivial `cycleType`.
- Removed Sp connectedness and root-subgroup generation from the proposed structure target. Current `TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra` and `TauCeti.GLSymplecticFin.eq_top_of_root_subgroups` supply them; arbitrary-form transport uses current symplectic bases. The unused LefschetzPencils Lie-generation dependency was removed. Kept the characteristic-zero geometric centre/normal-subgroup specialization.
- Removed the basic subgroup-closure/image construction, owned by ArithmeticGaloisRepresentations §7.6. Kept finite-index invariance, normality and connected generation. Avoid the false identification of algebraic-product Zariski topology with point-set product topology.
- Removed the boundary-collar target supplied by current Brown collaring and GeometricTopology Layer 1. Kept annular neighbourhoods/cutting, with gluing compatibility on a descending homeomorphism.
- Preserved genuine variants: nonsymmetric perfect finite pairings (current FiniteBilinearModule is symmetric); all-field Lagrangian criteria (current Geometry.Symplectic.Lagrangian is real); prescribed whole Lagrangian bases (current symplectic-basis existence does not prescribe that basis); topological-surface duality (AlgebraicTopology's supplied formulation is smooth); global Mackey/degree-factor induction (the local PadicHodge comparison is an input). Each retained variant states the difference.
- Corrected orbit schemes to the reduced locally closed geometric orbit, not the scheme-theoretic image closure or only rational points. Transporters are functorial over all algebras.
- Connected transvection sets give centres in their span; only spanning the nondegenerate ambient space gives all Sp. Products/ideals/Goursat require nonabelian simple Lie factors; the abelian hyperplane counterexample is recorded.
- Corrected the low-degree homotopy sequence to pointed sets, asphericity to oriented finite-type surfaces except the sphere, the Hamstrom locator to FM §1.4.3, and the hyperbolic/free-group centre proof's separate cases.
- Replaced arbitrary product projection in dimension descent by a finite splitting extension. Corrected Riemann existence's equivalence to finite étale analytic covers, while keeping the separate branched normalization assertion.
- Scoped the relative kernel/Prym construction to smooth characteristic-zero bases, constant kernel dimension and a scaled-idempotent endomorphism; mapped the smooth/proper identity-component argument to AlgebraicModuliForArithmeticGeometry §7.9 `spaceSectionComponentCriterion`. No generic-fibre Hilbert-polynomial shortcut remains. Restricted polarizations are not necessarily principal. Abel–Jacobi homology comparison states the basepoint choice and translation independence.
- Corrected disconnected primitive-homology dimensions to the sum of component genera. Matched arbitrary signed primitive representatives between README and Lean. Fixed the positive natural representative and coprimality conditions in the short-orbit signature; exponents 1–7 suffice even when order is exactly eight.
- Added missing docstrings and negative controls, including complex conjugation, zero transvection, empty generating tuples, negative filtration jumps, empty peripheral surjections and trivial-subgroup averaging. All definitions retain real data bodies; `sorry` occurs only in proofs or proof fields.

## Supplier closure and order

Walked each target's Needs against the local pins, earlier targets and named supplier contracts. The extra explicit targets supply the previously unnamed steps; no `FoundationsAndLibraryIntegration` or `UPSTREAM:` identifier remains. The current/new-roadmap sweep includes all nine named post-snapshot roadmaps and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts; OperatorTheory is inspected through its component files, since it has no root Suggested.lean. The finite quadratic/symmetric-pairing, real symplectic, pro-p peripheral and Frobenius-norm objects in those roadmaps do not supply the distinct retained statements here.

MordellLawrenceVenkatesh is outside the 94-roadmap Caraiani–Newton order. Its listed in-order arithmetic/geometric suppliers lie at tiers through 17; it must follow their consumed portions. The Faltings dependency is specifically R28.1 Hermite finiteness, not the later isogeny stage which consumes LV.1. This is a directed stage contract: R28.1 → LV.1 → R28.4, not permission to import R28.4 while constructing LV.1. The downstream Faltings trace citation should point to ArithmeticGaloisRepresentations §1.8; its Weil/test-set citations should point to 1.1–1.2 here. The handoff records that routing. Shared S-unit and Mordell end declarations remain with their stated owners; this roadmap supplies independent Lawrence–Venkatesh proofs.

## Public-source checks

Sample selected before edits by `random.Random(7939)` over the 164 original target headings. Original 1.6, 1.10 and 1.13 are now 1.8, 1.11 and 1.14; other sampled numbers are unchanged. The table records results in this reviewer's own words.

| Target | Source opened and locator confirmed | Result |
| --- | --- | --- |
| 0.18 | [Milne, Algebraic Groups](https://www.jmilne.org/math/CourseNotes/iAG200.pdf), Prop. 1.58 p.32, Def. 9.5 p.142, (9.40) p.148 | Geometric orbit and functorial transporter clarified. |
| 8.10 | [LV v3](https://arxiv.org/pdf/1807.02721v3), §7.2 pp.35–36 | Scaled idempotent and connected kernel; the family argument requires the separate component supplier. |
| 1.8 | [Milne, CFT](https://www.jmilne.org/math/CourseNotes/CFT.pdf), I Thm.1.1 and §1.11 pp.20–24 | Local units identify inertia in the abelian extension. |
| 1.14 | LV Lemma 2.9 p.13 | Determinant gives the half-weight identity. |
| 0.16 | [Milne, Lie Algebras](https://www.jmilne.org/math/CourseNotes/LAG.pdf), type C pp.94–95 and automorphisms p.100; Algebraic Groups Cor.22.120 p.418 and Sp forms p.482 | Simplicity/type and geometric automorphism input; algebraic closure retained for lifting inner point automorphisms. |
| 5.24 | [Hatcher](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), Prop.1.33 p.61, Prop.1.34 p.62 | Based lifting and uniqueness; unbased existence uses conjugate subgroups. |
| 0.8 | LV §8.3 p.42 | Affine cycle types agree. |
| 11.3 | LV Thm.5.4 proof p.27 | The H¹ dual pairing has inverse Frobenius multiplier. |
| 1.11 | LV Lemma 2.8 proof p.12 | Detailed reciprocity/unit-log derivation, not a separate verbatim general theorem in the source. |
| 3.18 | LV Lemma 3.3 p.19 and Prop.5.3 proof p.29 | Common-series closure and full-monodromy density. |
| 3.1 | LV Lemma 6.4 p.33 | Source uses the isotropic-dimension criterion; label the all-field criterion an own linear-algebra derivation. |
| 9.1 | LV §8.2 p.39 | Degree-q affine cover versus its Galois closure. |
| 0.2 | LV Lemma 2.1 proof p.9 | Coordinate idempotent decomposition. |
| 5.22 | [Farb–Margalit](https://pagine.dm.unipi.it/~a019210/Farb%20Magalit_Primer%20on%20Teichmuller%20theory.pdf), Thm.6.4 p.177 | Integral symplectic representation is onto. |
| 10.10 | LV §8.2.3 p.41 and §5 p.26 | Primitive homology identifies the reduced Prym and full monodromy. |

Additional passages opened for corrected targets: LV pp.20,31 (linear and semilinear orbit bounds); Gallier–Xu Appendix E Thm.E.1 p.160 and Thm.E.3 pp.161–163 (Schönflies and compact triangulation); Hatcher Thms.3.30 p.241, 3.43 p.254, Prop.3.38 p.250, Thm.4.41 p.376, Prop.4.48 p.379, Prop.1B.2 p.88 and Ex.1B.14 pp.93–94; Farb–Margalit Thm.1.2 p.21, centralizers p.23, §4.2.3 pp.104–105, §1.4.3 Thm.1.14 p.45; [SGA1](https://arxiv.org/pdf/math/0206203) XII Prop.2.1 p.242, Prop.2.4/Cor.2.6 pp.243–244, Thm.5.1 p.251, Prop.5.3 p.254 and Thm.5.4 p.255; [Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf) I Prop.10.1 proof p.42, Prop.18.5 p.73, III Thm.2.5 p.93. The new finite-test proof was checked against [Deligne, Bourbaki](https://www.numdam.org/item/SB_1983-1984__26__25_0.pdf) Thm.3.1 p.40 and [Faltings](https://math.uchicago.edu/~drinfeld/Deligne%27s_conjecture_Manin_conf/Faltings_argument/Faltings.pdf) Satz 5 pp.362–363. Printed page numbers are used throughout, not PDF offsets. Only public source copies were used; no cleared-library book was needed.

## Ten Lean signature comparisons

| Signature | README comparison |
| --- | --- |
| `finrank_semilinearCentralizer_le` | 0.4: bijective φ, finite positive automorphism order and exactly the stated fixed field; selected bound, not the stronger equality. |
| `cycleType_of_affineLinearPart_ne_one` | 0.8: prime q and nonidentity linear coefficient; omits the unique fixed point as Mathlib requires. |
| `card_generatingTuples` | 0.11: N≥1, k may be zero for the exact formula; k≥2 only for the separate lower bound. |
| `card_sq_le_of_isotropic` | 0.12: finite group, perfect biadditive pairing, no symmetry assumed. |
| `finrank_le_half_of_minimal` | 0.13: reducibility, nondegenerate symmetric/alternating similitude form and minimal positive invariant dimension are present. |
| `symplecticTransvection_smul` | 0.14: scaled centre squares its scalar in the parameter; agrees in characteristic two. |
| `FiniteFiltration.hodgeDegree_shift` | 1.13: decreasing integer indexing includes negative jumps; shift adds n·dimension. |
| `sizeV_le_of_fibres` | 7.1: point-weighted ratio, positive constant fibre cardinality and nonempty target. |
| `exists_surjective_lift` | 9.10: r≥2, N≥1 and genuinely surjective integral lift; r=1 counterexample excluded. |
| `card_fixed_le` | 11.4: N≡2 mod4, perfect alternating pairing, unit multiplier represented by u≥1, and indices 1–7. |

## Adversarial mathematics pass

Every target, together with its stated conventions, identities and API, was examined against the following instances. Rows indicate retained valid scope as well as corrections; this is a mathematical statement audit, not a claim that sorry proofs establish truth. Changes are detailed above and in the target's own Checks.

| Target | Instances and result |
| --- | --- |
| 0.1 Splitting of a finite separable extension after base change to a splitting field | Split Q(i) over C into two factors; a nonsplitting field is excluded. |
| 0.2 Idempotent decomposition of a module over a split étale algebra | Empty and singleton idempotent index sets; the empty unital module is zero. |
| 0.3 The centralizer of a semilinear automorphism | Conjugation on C excludes multiplication by i; identity on E² gives M₂(E). |
| 0.4 Dimension of the centralizer of a semilinear automorphism (LV20 Lemma 2.1) | V=0 and E/F quadratic; bijectivity and the exact fixed field are necessary. |
| 0.5 The unit group of a finite-dimensional algebra as an algebraic group | Dual numbers give Gm×Ga via (a,b/a); the zero algebra has the trivial unit group. |
| 0.6 Frobenius centralizers over unramified extensions of a p-adic field | Unramified degrees f and r; the fixed field of σ^f is K, not Qp. |
| 0.7 The faithful affine permutation action of a prime field | Aff(2) and Aff(3); faithfulness uses a≠0, and the carrier is a permutation image. |
| 0.8 Cycle types of elements of Aff(q) | Translation, identity and multiplication by 2 on F₅; fixed points are absent from Mathlib cycleType. |
| 0.9 Aff(q) is centre-free, has trivial centralizer and is self-normalizing in Sym(𝔽_q) | q=2 has nontrivial centre; retain q≥3 for the trivial-centralizer claim. |
| 0.10 The commutator-product map on Aff(q)^{2s} (LV20 Lemma 2.11) | s=1 and trivial linear-part tuple; nontrivial commutator forces a translation. |
| 0.11 Counting generating tuples of ℤ/N | N=1,k=0 and N=2,k=0; J₂(6)=24, and the lower bound requires k≥2. |
| 0.12 Isotropic subgroups for a perfect pairing on a finite abelian group | Trivial group, a symplectic plane over F₂, and a nonperfect zero pairing. |
| 0.13 Minimal subrepresentations of a representation with an invariant form up to similitude | Reducible two-dimensional representation; exclude the irreducible case and require nondegeneracy. |
| 0.14 Symplectic transvections | v=0,r=0 and characteristic 2; the matrices for e and f fix the pairing order. |
| 0.15 Finite-index, normality and connectedness properties of subgroup closures | Finite-index cyclic subgroup and normal conjugates; Zariski products need algebraic morphisms. |
| 0.16 The symplectic Lie algebra in characteristic zero | n=1 gives sl₂; n=0 and characteristic 2 are excluded, and pointwise innerness needs algebraic closure. |
| 0.17 Centre and geometric normal subgroups of the symplectic group | Sp₂ has centre ±1; the theorem concerns geometric closed normal subgroups. |
| 0.18 Orbit maps, transporters and dimensions of orbit closures | Trivial action and a finite-field orbit; use the geometric orbit and transporter functor. |
| 0.19 The Zariski closure of the powers of a transvection | v=0 and characteristic p fail the Ga-immersion/density argument; require v≠0 and char 0. |
| 0.20 Two transvections with nonzero pairing (LV20 Lemma 2.13) | The standard symplectic plane and orthogonal independent vectors; divide only by a nonzero pairing. |
| 0.21 Transvections along a connected intersection graph (LV20 Lemma 2.14) | A disconnected symplectic basis and a connected set with degenerate span; full Sp needs spanning. |
| 0.22 Two-factor Goursat dichotomy for simple Lie algebras | Diagonal and full product of sl₂; both projections and nonabelian simplicity are explicit. |
| 0.23 Ideals in a finite product of nonabelian simple Lie algebras | Empty product and diagonal in s×s; diagonal is not an ideal for nonabelian s. |
| 0.24 Goursat's lemma for simple Lie algebras (Ribet) | N=0,1,3 and the abelian hyperplane x+y+z=0; exclude abelian simple factors. |
| 0.25 A closed subgroup of Sp(V) × Sp(V) with surjective projections and an unbalanced unipotent pair | Diagonal subgroup and (transvection,1); characteristic 0 prevents a negative unipotent. |
| 0.26 Zariski-closed subgroups of Sp(V)^N (LV20 Lemma 2.12) | N=0,1 and a repeated diagonal factor; pairwise rank witnesses rule out graphs. |
| 1.1 Finitely many integral Weil polynomials | d=0, negative weight, and X²−3; integrality and q>1 control coefficient bounds. |
| 1.2 A finite Frobenius test set | d=1 and the pair of stable lattices; the image algebra has rank at most 2d², then Nakayama applies. |
| 1.3 Faltings's finiteness lemma (LV20 Lemma 2.3) | d=0 and powers of a weight-zero CM character quotient; integrality cannot be omitted. |
| 1.4 CM or totally real fields via complex conjugations | Q, Q(i), and a nonreal cubic field; complex conjugations must agree on all embeddings. |
| 1.5 The largest CM-or-totally-real subfield of a number field | A totally real cubic field and Q(i,√2); the relative index is ≤2, not the absolute degree. |
| 1.6 Friendly places (LV20 Definition 2.7) | Primes 3,5,2 of Q(i); distinguish inert, split and ramified places. |
| 1.7 Functions on embeddings with constant conjugate sum factor through the largest CM subfield (Artin–Weil) | Infinity type (1,0) over Q(i), and Q; the totally real case forces even w. |
| 1.8 The local Artin map on units is onto inertia | Uniformizer versus units; the inertia quotient is identified with compact local units. |
| 1.9 Continuous Galois characters as idele class characters | Trivial character and cyclotomic character; principal ideles are killed and Artin is arithmetic. |
| 1.10 At a friendly place a place-constant function with the conjugation relation takes the value w/2 | Split and inert primes of Q(i); place constancy alone does not imply the half-weight identity. |
| 1.11 Global purity forces the conjugation relation on Hodge–Tate exponents | Cyclotomic inverse and split CM characters; use a finite-index unit subgroup plus a positive integer. |
| 1.12 Pure characters at friendly places (LV20 Lemma 2.8, stated on units) | Cyclotomic inverse at p; the norm formula is asserted on units, not uniformizers. |
| 1.13 The weight of a filtration (LV20 (2.2)) | Negative jump −1, zero-degree line and jumps 0,1; weight excludes the zero space. |
| 1.14 Hodge weight of a pure representation at a friendly place (LV20 Lemma 2.9) | H¹ of an elliptic curve and its determinant; divide only by positive dimension. |
| 1.15 D_dR of an induced representation at a place | L=K and an inert unramified degree-r extension; retain restriction-of-scalars degree factors. |
| 1.16 Hodge weights summed over places above a friendly place (LV20 Lemma 2.10) | L=K and several places above p; sum weighted by [L_u:K_v], not an unweighted average. |
| 1.17 The Galois representation on H¹ of an abelian variety | Zero abelian variety and good elliptic reduction; geometric Frobenius has integral weight-one polynomial. |
| 2.1 Abelian-by-finite families (LV20 Definition 5.1) | π=id and Y′=Y⊔Y; the total fibre is a disjoint union, not a product. |
| 2.2 Good models over rings of S-integers | Legendre good model and a polarization scaled by p; invert the polarization degree. |
| 2.3 Existence of good models after enlarging S | Constant family and nonproper base; spreading out may require enlarging S. |
| 2.4 The de Rham bundle of an abelian-by-finite family | Constant elliptic bundle and two étale factors; pairing perfection needs unit degree. |
| 2.5 Residue disks and their coordinates | Affine-line disk, a zero-dimensional disk and an unramified quadratic factor without base-field sections. |
| 2.6 Formal horizontal sections of an integrable connection with integral coefficients | A=0 and scalar A=−1; factorial denominators and the sign in ∂Φ=−AΦ agree. |
| 2.7 p-adic convergence of formal horizontal sections on the residue disk | exp(z) at p=3 and p=2; convergence on pO requires p>2 and unramified normalization. |
| 2.8 Complex convergence of formal horizontal sections (majorants) | Scalar A=−a/(1−z); the positive majorant has solution (1−Σz/ρ)^(−Mρ). |
| 2.9 p-adic Gauss–Manin transport on a residue disk (LV20 (3.7)) | Constant family and nonconstant Hodge filtration; transport preserves connection, not filtration. |
| 2.10 Complex Gauss–Manin transport and Betti parallel transport (LV20 (3.8)) | Two composable loops and a nonrational complex base point; common K-series need rational data. |
| 2.11 Crystalline Frobenius on the de Rham cohomology of the fibres and its compatibility with Gauss–Manin transport (LV20 (3.9)) | Constant good-reduction fibre and varying filtration; Frobenius is semilinear and transport-compatible. |
| 3.1 Dimension criterion for Lagrangians | Zero space, isotropic line and nonisotropic full plane; the criterion holds in characteristic 2 too. |
| 3.2 Adapted symplectic bases | A prescribed whole Lagrangian basis; arbitrary symplectic-basis existence does not supply it. |
| 3.3 Transitivity on Lagrangian subspaces | Zero space and lines in a symplectic plane; arbitrary characteristic is allowed. |
| 3.4 Symmetric graph charts | A two-dimensional graph and nonsymmetric matrix; graph isotropy is the symmetry equation. |
| 3.5 Arnold chart cover | d=0,1 and a coordinate Lagrangian; some one-of-each-pair chart is transverse. |
| 3.6 The Lagrangian Grassmannian | d=0 and a plane; use rank d on the submodule and quotient and actual isotropy. |
| 3.7 The Lagrangian Grassmannian is smooth, projective and geometrically irreducible of dimension d(d+1)/2 | d=0 gives a point, d=1 gives P¹; dimension is d(d+1)/2 in any characteristic. |
| 3.8 The Lagrangian period variety of a symplectic module over a finite étale algebra | E=k×k with unequal component ranks; total dimension alone is insufficient. |
| 3.9 Geometry of the period variety | Split étale algebra with n factors; dimension multiplies by n and geometric irreducibility persists. |
| 3.10 Complex points of a geometrically connected variety are connected | Disconnected variety excluded; a connected complex smooth curve supplies the comparison setting. |
| 3.11 The algebraic monodromy group of an abelian-by-finite family and full monodromy (LV20 (3.5), (5.1)) | Constant and full-monodromy families; the finite permutation quotient need not lie in G°. |
| 3.12 The p-adic period map on a residue disk | Constant family and a changing Hodge line; pull filtration back by transport inverse. |
| 3.13 The complex period map and its equivariant continuation to the universal cover | Two concatenated paths; opposite-group transport preserves equivariance and the image subgroup. |
| 3.14 The complex and p-adic period maps are given by one tuple of power series over K | K-rational versus arbitrary local base point; common coefficients require the former. |
| 3.15 The Zariski closure of the complex period image contains the monodromy orbit (LV20 Lemma 3.1) | Trivial monodromy and a nontrivial orbit; continue on the universal cover before taking closure. |
| 3.16 A power series vanishing on an open polydisk is zero | Zero-dimensional polydisk and a nonzero monomial; vanishing means the series coefficients vanish. |
| 3.17 Complex and v-adic Zariski closures of a power-series map descend to one K-subscheme (LV20 Lemma 3.2) | Projective coordinates without common zero; extension-field equations reduce degreewise to K-equations. |
| 3.18 Zariski closure of the p-adic period image (LV20 Lemma 3.3) and density under full monodromy | Constant family is not dense in positive-dimensional H; full monodromy makes its orbit dense. |
| 3.19 On a curve, the p-adic period map meets a closed subset not containing its image in finitely many points | Constant period image contained in Z is excluded; curve and strict noncontainment give a nonzero restricted series. |
| 4.1 The fibre representations are crystalline with the de Rham cohomology of the fibre as filtered φ-module | Good reduction at p versus ramification away from p; crystalline does not mean unramified at p. |
| 4.2 The filtered φ-module of a fibre read off from the period map (LV20 (6.6)–(6.7)) | The base point and another point in its disk; the underlying φ-module is fixed, filtration varies. |
| 4.3 Filtrations with isomorphic filtered φ-modules form a Frobenius-centralizer orbit of bounded dimension | One-dimensional module; semilinear commutants are contained in a linear-power centralizer. |
| 4.4 Finiteness criterion on a residue disk of a curve | A singleton orbit and an orbit filling H; require closure dimension strictly below dim H. |
| 4.5 Fibres with good reduction and semisimple Galois representation (LV20 Proposition 3.4, for curves) | Constant family fails the dimension/density hypotheses; apply semisimple finiteness only to the stated subset. |
| 5.1 Surfaces with boundary and punctures | Disk, annulus and punctured torus; orientation and boundary fixing are part of the data. |
| 5.2 The Jordan–Schönflies theorem | Round circle and an arbitrary embedded circle; extension is planar and not a three-dimensional sphere theorem. |
| 5.3 Every compact surface can be triangulated (Radó) | Sphere and disk with boundary; triangulation is finite for compact surfaces, separate from 3-manifold Moise. |
| 5.4 Classification of compact surfaces | Sphere, torus and annulus; genus, boundary count and orientation distinguish types. |
| 5.5 Duality and the intersection form on a compact oriented surface | Disk and annulus; relative and absolute duality maps have different codomains. |
| 5.6 Homology, type and intersection form of an oriented surface | Sphere and a twice-bordered surface; boundary classes have one relation and form the radical. |
| 5.7 Annular neighbourhoods and cutting | Nonseparating and separating cuts; a homeomorphism descends only when it respects glued pairs. |
| 5.8 Oriented simple closed curves | Contractible loop, puncture loop and a transverse pair; essentiality is stated separately. |
| 5.9 The mapping class group | Disk with boundary fixed and a marked puncture; isotopies preserve the stipulated markings. |
| 5.10 Change of coordinates for simple closed curves | Separating curves with unequal complementary genera; their topological types cannot be exchanged. |
| 5.11 Dehn twists | Annular twist and inverse; right/left choices are pinned by the positive twist convention. |
| 5.12 Action of Dehn twists and multitwists on homology | Intersection pair (a,b) and a disjoint curve; the coefficient is î(x,b), hence parameter −1 in ω(b,x). |
| 5.13 Primitive homology classes are represented by simple closed curves | Primitive (1,0) and nonprimitive (2,0); only nonzero primitive classes get essential representatives. |
| 5.14 The homotopy exact sequence of a fibre bundle | π₁(E,F) and π₀(F); low degrees are pointed sets, not uniformly groups. |
| 5.15 Oriented surfaces other than the sphere are aspherical | Sphere fails π₂=0; disk and plane are contractible despite positive Euler characteristic. |
| 5.16 Surface groups of negative Euler characteristic have trivial centre | Closed genus-two group and a punctured free group; torus and rank-one free group are excluded. |
| 5.17 The evaluation fibration of the homeomorphism group | Evaluation at one point and boundary-fixed homeomorphisms; isotopy extension supplies local lifting. |
| 5.18 Contractibility of the identity component (Hamstrom) | Closed genus two versus torus and sphere; use Hamstrom directly, not Teichmüller contractibility. |
| 5.19 The point-pushing homomorphism | Constant loop and reversed loop; transport is inverse to the evaluation-boundary convention. |
| 5.20 The Birman exact sequence and pushes of simple loops | Simple loop with one puncture in its annulus; reversing it reverses the twist quotient. |
| 5.21 Capping boundary circles and forgetting points are surjective on mapping class groups | Capping a boundary circle versus retaining the framing; surjectivity does not assert injectivity. |
| 5.22 Surjectivity of the symplectic representation | Genus one and zero; symplectic transvections generate the integral target, not an abstract field group. |
| 5.23 The configuration fibration of a surface and its fundamental groups | One and two ordered points; the fibre removes the other points and genus≥2 gives π₂=0. |
| 5.24 Lifting homeomorphisms to covers | Nonliftable subgroup and an unbased lift; use conjugacy for existence and centralizers for uniqueness. |
| 5.25 Lifting powers of Dehn twists to finite coverings | One lifted component of degree q; the required twist exponent is divisible by every covering degree. |
| 5.26 Monodromy of families of branched covers over configuration spaces | Constant configuration loop and a pushed branch point; identify actual lifted monodromy, not arbitrary cover automorphisms. |
| 6.1 Reductions for the S-unit equation | A nonsquare solution and an iterated square root; m is the maximal 2-power root-of-unity order. |
| 6.2 The Kummer fields of non-square S-unit solutions | m=8 and a nonsquare t; Kummer order is exactly m, not merely a divisor. |
| 6.3 An auxiliary place inert in a cyclic extension | Generator Frobenius in a cyclic extension; exclude the prescribed finite bad-prime set. |
| 6.4 The Legendre family and its cyclic variant (LV20 §4.2) | t=0,1 fail ellipticity; t=−1 has j=1728 and the discriminant factor is 16. |
| 6.5 Monodromy of the Legendre family | Loops at 0 and 1; the two matrices have opposite off-diagonal signs in the chosen basis. |
| 6.6 A closed subgroup of a product of SL₂'s with surjective projections and factorwise unipotents is everything | One factor and a diagonal in two factors; isolated nontrivial unipotents exclude the diagonal. |
| 6.7 Big monodromy for the cyclic variant of the Legendre family (LV20 Lemma 4.3) | Loops around individual m-th roots; isolate each factor and use product Goursat. |
| 6.8 Generic simplicity of the Legendre curves (LV20 Lemma 4.4) | CM elliptic fibres are exceptional; a hypothetical proper subrepresentation gives an impossible half-weight locally. |
| 6.9 Finiteness in a residue disk (LV20 Lemma 4.2) | Inert factor of degree at least 8; period dimension grows while centralizer dimension does not. |
| 6.10 The S-unit theorem (LV20 Theorem 4.1) | S-unit points include neither 0 nor 1; the proof supplies the shared declaration by its alternate route. |
| 7.1 The proportion of small Frobenius orbits (LV20 Definition 5.2) | Empty set gives 0, a 7-cycle gives 1, an 8-cycle gives 0, and fixed point plus 8-cycle gives 1/9. |
| 7.2 Frobenius orbits on geometric points are the places above v | Split and inert places; orbit length is residue degree, not number of orbits. |
| 7.3 Finite surjective morphisms preserve dimension | A finite field extension versus projection X×Y→X; only a finite morphism preserves closed-set dimension. |
| 7.4 General position for tuples of Lagrangians (LV20 Lemma 6.4) | Three lines in a symplectic plane and d=0; the intersection inequalities are explicit. |
| 7.5 Lagrangians meeting a Frobenius-stable subspace in half its dimension (LV20 Lemma 6.3) | Cyclic splitting field of degree r≥8; project the proper locus through a finite base change. |
| 7.6 Bad points produce a Frobenius-stable subspace with large Hodge filtration (Sublemma in LV20 §6) | The total degree budget and equality threshold; strict size bound supplies a large offending factor. |
| 7.7 Generic simplicity along the family (LV20 Lemma 6.1) | An empty bad locus and a proper exceptional locus; finite residue disks make the global set finite. |
| 7.8 Galois representations really vary in the family (LV20 Lemma 6.2) | r=8,d=1 gives 8>4; local-factor projection remains dense and its centralizer orbit is proper. |
| 7.9 Rational points on the base of an abelian-by-finite family (LV20 Proposition 5.3) | Constant family lacks full monodromy; empty point sets are harmless and the strict size condition is retained. |
| 8.1 The complex points of a curve form a closed surface of the same genus | Genus zero, one and two curves; compactification and comparison agree on 2g-dimensional H₁. |
| 8.2 Surjections nontrivial on a peripheral class and their symmetries (LV20 Lemma 7.4, group part) | Peripheral class {1} gives the empty set; surjectivity and centre-freeness make conjugation free. |
| 8.3 Unique extension of the action to an overgroup | A trivial overgroup and a noncentral target; conjugation determines the unique extension. |
| 8.4 Normalization, finite covers and analytification | Finite étale covers versus branched finite covers; Riemann existence equivalence is the étale one. |
| 8.5 The complex Hurwitz space of G-covers branched at one point (LV20 §7.3) | G trivial gives no peripheral-nontrivial fibre; parameter cover may be empty or disconnected. |
| 8.6 Descent of the Hurwitz covering to K (LV20 Lemma 7.4) | Only one rational point on Y; descent does not require an additional rational base point. |
| 8.7 Hurwitz spaces of G-covers branched at one point (LV20 Proposition 7.1) | G=Aff(3),g=2; 135 parameters and connected curve fibres do not force connected parameter space. |
| 8.8 The idempotents e, e′ and e″ of ℚ[Aff(q)] | H=1 and H=G; averages use nonzero rational denominators and e_H−e_G is idempotent. |
| 8.9 The connected kernel of an endomorphism of an abelian scheme | ε=0 and ε=[n]; smooth reduced base, constant kernel dimension and the component supplier are explicit. |
| 8.10 The reduced relative Prym of a family of Aff(q)-covers | Trivial G-action gives zero Prym; polarization restriction need not stay principal. |
| 8.11 Homology of the Jacobian of a compact Riemann surface | Genus zero and a changed Abel–Jacobi base point; homology is independent of translation. |
| 8.12 Homology of the reduced Prym is the primitive homology of the degree-q cover | q=3,g=2 gives primitive dimension 6; the degree-q quotient differs from the Galois curve. |
| 8.13 The Kodaira–Parshin family (LV20 Definitions 7.2–7.3) | q=3 and q=107 at g=2 give dimensions 3 and 159; use constant fibre dimension on a smooth parameter base. |
| 8.14 The map from Kodaira–Parshin fibres to H¹(Y, ℤ/(q − 1)) (LV20 (5.5)) | q=3,g=2 gives 15 generating tuples with 9 parameters each; quotient the 810 surjections by 6. |
| 9.1 Aff(q)-covers and singly ramified Aff(q)-covers (LV20 §8.2) | Cyclic degree-three monodromy and a disconnected trivial cover fail the Aff(3) condition. |
| 9.2 Primitive homology of a covering | Identity and disconnected double cover; dimension is 2Σg(C)−2g(Y), not a single source genus. |
| 9.3 Transfer complement and symplectic primitive homology | Identity, disconnected double cover and positive degree q; divide only by q≠0 over Q. |
| 9.4 Lifted mapping classes and the monodromy maps Mon (LV20 (8.2)–(8.5)) | Trivial loop and a stabilizing push; unique lifts require the trivial deck centralizer. |
| 9.5 Classes of the preimage circles (LV20 Lemma 8.2) | Different affine cycle types on a nonseparating curve; boundary relations do not create the claimed independence. |
| 9.6 The rank of a lifted twist detects the cycle type (LV20 Lemma 8.3) | Identity and translation cycle types; nilpotent rank is the number of nontrivial lift contributions. |
| 9.7 Liftable curves and their transvections | A liftable curve and a separating one; primitive class is projected with q⁻¹ transfer. |
| 9.8 Liftable-curve monodromy and primitive intersection | One degree-(q−1) lift and one fixed lift; the (q−1)-st twist has parameter −q, not +q. |
| 9.9 Mapping classes of a surface with two boundary circles realize Sp(V, b) (LV20 Lemma 8.4) | Genus h=1 with two boundaries; the radical boundary vector is fixed rather than discarded. |
| 9.10 Primitive integral lift of a cyclic quotient | N=1,r=2 and r=1,N=5; the rank-one primitive lifting assertion is false. |
| 9.11 Normal form of a singly ramified Aff(q)-cover (LV20 Proposition 8.5) | Genus two; the cover is trivial on the genus-(g−1) piece and affine on the torus piece. |
| 9.12 Curves on the torus part of the normal form (LV20 Lemma 8.11) | The two standard torus loops; multiplication and translation give the required distinct cycle types. |
| 10.1 Point-pushing acts non-centrally on each factor (LV20 Lemma 8.6) | A trivial action would be central; the designated push has a nontrivial primitive transvection. |
| 10.2 Distinct covers are distinguished by the cycle type along a simple closed curve (LV20 Lemma 8.8) | Isomorphic covers excluded; a distinguishing curve must separate the conjugacy classes. |
| 10.3 Signed primitive lattice representatives affinely span | r=1 can fail; r≥2 and arbitrary signs still force the differences to span Q^r. |
| 10.4 Primitive vectors avoiding two intersection constraints | One zero linear form would fail; nonzero forms and r≥2 permit arbitrarily large primitive values. |
| 10.5 A connected spanning system of liftable curves (LV20 Lemma 8.10) | A disconnected handle basis is insufficient; the added liftable curves connect and span primitive homology. |
| 10.6 Zariski density on one factor (LV20 Lemma 8.9) | Nonzero twist powers survive finite index; connected spanning centres give all of Sp. |
| 10.7 Zariski density on the product (LV20 Lemma 8.7) | Diagonal product would pass factor density; unequal ranks distinguish every pair. |
| 10.8 Closed normal subgroups of products of symplectic groups | Central projections do not force a factor; require noncentrality in each factor and char 0. |
| 10.9 Zariski density of the point-pushing monodromy (LV20 Theorem 8.1) | Finite-index point-push kernel remains normal; every noncentral factor is included. |
| 10.10 The Kodaira–Parshin family has full monodromy (LV20 §8.2.3) | Homology versus cohomology monodromy; duality preserves the full symplectic image. |
| 11.1 Choice of the prime q (LV20 §5, conditions (i)–(iii)) | g=1 would not give the decay needed; g=2,q=107 gives 64/106²<1/160. |
| 11.2 Choice of the friendly place v (LV20 §5) | CM versus totally real K and an excluded bad prime; Frobenius order is ≥8 after the residue-degree factor. |
| 11.3 The Weil pairing on H¹(Y, ℤ/(q − 1)) and the Frobenius at v | N=2 and an elliptic curve; arithmetic Frobenius multiplier on H¹ is q_v⁻¹. |
| 11.4 Few elements lie in small Frobenius orbits | N=2,g=0 and multiplier of exact order 8; only exponents 1 through 7 need invertibility. |
| 11.5 The size bound (LV20 (5.4)) | g=2,q=107; use generating-tuple cardinality, point-weighted proportions and strict inequality. |
| 11.6 Faltings's theorem (LV20 Theorem 5.4) | Genus zero and one fail the conclusion; proper genus≥2 curve makes all rational points integral. |

## Remaining work

No unresolved package defect remains from this review. Formal implementation and supplier implementation are future work, as for every roadmap. Port with the current supplier boundaries and compact Suggested.lean; do not resurrect the first review's exhaustive-signature requirement or the old size ceiling. The downstream Faltings citation routing in the handoff belongs to its owner and was not edited in this job.
