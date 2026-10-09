# Handoff: independent review of smooth representations

Issue #494; Codex session `codex-4W4iPD`; completed 2026-10-09. Review accepted as a complete target-level pass: 100 nodes (55 verified, 44 corrected, one added), 83 pinned anchors checked, 34 source findings confirmed. All eight stages are planned and none is closed. The packet, suggested file and review report contain all results needed after scratch deletion.

## What is complete

- Independent cited-source and hypothesis audit, all pinned declarations and consumed supplier contracts, current read-only upstream overlap check, all-node dependency/API/test/planet checks, and the center red-team input.
- Clear errors corrected in place; countable Schur added before admissibility; support/finite-length and unit/adjunction proof cycles removed.
- Source/version removed for unread Lusztig text; generic presentation now uses read HKP03 §§7.3–7.5. Eight new source findings E27–E34 recorded with independently checked reasons and version scope.
- Reader remains untouched because this issue does not authorize editing it.

## Required reader/package synchronization

Update the reader’s mathematical statements, API and tests from the corrected packet, using these exact affected ids. Do not copy source passages or present conditional gaps as proved.

- `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/is-smooth`: Replaced the generic continuity-assuming Lean compatibility example by concrete finite-unit positive and indiscrete-topology negative tests, and synchronized the packet test.
- `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-character`: Corrected the codomain of complex powers of the norm.
- `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-invariants`: All-degree filtered-colimit comparison uses PC10, rather than the low-degree PC4 contract.
- `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/k-injective-resolutions`: Distinguished the K-injective definition, Hom comparison and derived-functor computation tags.
- `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/dg-enhancement`: Corrected Stacks tags and kept equivariant K-flat replacements conditional; the Hom construction itself uses K-injectives.
- `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/compact-generation`: Imported current DGAInfinity Layers 5–6 instead of an undeclared generic compact-generator theorem; removed the artificial coefficient restriction on the thick-closure equality.
- `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-smooth-dual`: Made the already recorded equivariant K-flat/tensor gap explicit in the derived smooth-dual statement, including the cofinal good-level hypothesis for admissible biduality.
- `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-hecke-algebra`: Retained the opposite convention in the good-level specialization API as well as the main statement.
- `SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra`: Corrected the convolution anti-involution to the pinned Mathlib modular-character convention. Qualified the no-unit claim by nonzero coefficients and added a non-unimodular inversion test.
- `SmoothRepresentationsOfLocalGroups:SR.1/locally-unital-algebra`: Excluded the zero-ring exception in the product non-example.
- `SmoothRepresentationsOfLocalGroups:SR.1/corner-irreducibles`: Corrected the direction of the corner adjunction map.
- `SmoothRepresentationsOfLocalGroups:SR.1/l-adic-separatedness`: Corrected the ℚ_ℓ boundary example.
- `SmoothRepresentationsOfLocalGroups:SR.1/positive-hecke-homomorphism`: Marked the already recorded general-Levi proof gap in the theorem statement itself; the torus/normalizer special cases remain unconditional.
- `SmoothRepresentationsOfLocalGroups:SR.1/pro-iwahori-torus`: The kernel assertion requires nonzero localized coefficients; a zero ring cannot distinguish torus cosets.
- `SmoothRepresentationsOfLocalGroups:SR.1/bernstein-presentation`: Replaced inaccessible Lusztig locators by the read generic presentation in HKP03; no unread source is proof support.
- `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-hecke-centre`: Supplied an arbitrary-coefficient PBW proof; base change alone does not preserve the center. Replaced unread Lusztig support.
- `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`: Specified a compatible extension from GL₂(ℤ_p) to Z·GL₂(ℤ_p) in the depth-zero compact-induction example.
- `SmoothRepresentationsOfLocalGroups:SR.2/frobenius-reciprocity`: Replaced a false Hom-dimension counterexample by a compact ℤ_p unit obstruction to a natural left adjunction.
- `SmoothRepresentationsOfLocalGroups:SR.2/l-sheaf-model`: Defined the sheaf by locally constant equivariant sections and applied smoothening only to global sections; uniform right smoothness does not satisfy sheaf gluing.
- `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`: Removed an unsupported arbitrary-ring finite-generation claim; its complex version follows later from noetherian without a circular proof.
- `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`: Aligned W_L\W/W_M with Q\G/P and the displayed graded functors; the sheaf orbits on P\G are represented by w⁻¹.
- `SmoothRepresentationsOfLocalGroups:SR.2/principal-series-jacquet`: Restricted the torus-character formulation to split G and added direct cuspidal-support/finite-length inputs for the constituent and length consequences.
- `SmoothRepresentationsOfLocalGroups:SR.3a/compact-representations`: Distinguished central corner idempotents from central elements of the full Hecke algebra, and repaired the separation-lemma positivity step.
- `SmoothRepresentationsOfLocalGroups:SR.3a/cuspidal-representations`: Specified a compatible extension from GL₂(ℤ_p) to Z·GL₂(ℤ_p) in the depth-zero compact-induction example.
- `SmoothRepresentationsOfLocalGroups:SR.3a/harish-chandra-compactness`: Replaced an undefined compact-mod-centre-free assertion by the central lattice and compact-intersection argument; Schur must be available before admissibility.
- `SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles`: Moved the nonroutine countable Schur argument to its own earlier key theorem; corrected the nonirreducible/nonadmissible boundary example.
- `SmoothRepresentationsOfLocalGroups:SR.3a/hecke-algebra-decomposition`: Specified the finite-generation input as a Hilbert basis, avoiding a false free dominant-monoid claim.
- `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-support`: Removed the hidden dependence on finite length: existence and uniqueness of support precede finite fibers.
- `SmoothRepresentationsOfLocalGroups:SR.3/finite-length`: Added the direct cuspidal-support input and moved the finite-fiber consequence here; the support/length ordering is acyclic.
- `SmoothRepresentationsOfLocalGroups:SR.3/generic-irreducibility`: Separated the read unitary-existence argument from the missing uniform Zariski-openness/rational-intertwiner input; the discrete-series extension is conditional, with direct geometric-lemma, first-adjunction and universal-family inputs.
- `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting`: Specified the semilinear stabilizer action and cocycle; a central twisted F-algebra would give the wrong center.
- `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition`: Made the faithfulness proof use an irreducible quotient of a cyclic subobject; an arbitrary smooth kernel need not contain an irreducible subobject.
- `SmoothRepresentationsOfLocalGroups:SR.3/noetherian`: Added the direct ordinary block-center input for Z-admissibility, using the first-adjunction proof rather than second adjointness.
- `SmoothRepresentationsOfLocalGroups:SR.3/universal-unramified-twist`: Recorded the inverse universal character in HKP03 (1.5.2); retaining the tautological character requires transporting the Laurent-ring action by inversion. Explained finite free invariant spaces using compact subgroups and the lattice, rather than unspecified finite-index corrections.
- `SmoothRepresentationsOfLocalGroups:SR.3/centre-compatibilities`: Added the admissibility input to the product classification of irreducibles.
- `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`: Only absolute values descend through a unitary central character; qualified the finite-length exponent criterion.
- `SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification`: Marked the previously recorded tempered-classification input as conditional in the theorem statement.
- `SmoothRepresentationsOfLocalGroups:SR.3/borel-casselman-block`: Restricted the asserted torus block to split G supported by the planned affine Hecke presentation; removed an incidental automorphic application as proof support and distinguished Borel’s admissible equivalence from the all-smooth splitting.
- `SmoothRepresentationsOfLocalGroups:SR.3/steinberg`: Excluded the torus exception from the zero spherical-invariant assertion.
- `SmoothRepresentationsOfLocalGroups:SR.3/isotypic-quotient-regular`: Fixed right/left dual orientations and replaced a false single-vector description of all regular-module maps by the compatible averaging family/full-dual argument; required unimodularity.
- `SmoothRepresentationsOfLocalGroups:SR.2a/stabilization`: Replaced products by direct sums in projective-generator presentations, and justified induction commuting with these sums by the finite invariant formula.
- `SmoothRepresentationsOfLocalGroups:SR.2a/jacquet-lemma-smooth`: Specified averaging, rather than inclusion, as the shrinking-level compatibility.
- `SmoothRepresentationsOfLocalGroups:SR.2a/second-adjunction-unit`: Removed the hidden unit/adjunction proof cycle; this node constructs only the big-cell map independently. Renamed the construction around its actual big-cell scope and corrected the general-Levi acceptance example.
- `SmoothRepresentationsOfLocalGroups:SR.2a/second-adjointness`: Moved counit and triangle identities here and replaced the incorrect five-lemma reduction by a left-exact kernel comparison.

Add `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/countable-schur` with its countable-at-infinity, irreducible, complex hypotheses and without admissibility. It supplies early scalar central characters.

Retain the full named omission ledger in the Suggested file until the stated supplier types exist. The typed declarations and `sorry` examples are proposals, not completed formalizations. The source issue table and per-node review ledger in the packet are the authoritative reviewed locators.

## Remaining proof obligations

- **Uniqueness of Whittaker models and Rodier heredity for general quasi-split groups**: whittaker-functionals defines generic representations and proves the GL_2 case; multiplicity one of Whittaker functionals for irreducible representations of a general quasi-split G (Gelfand–Kazhdan, Shalika) and the heredity of genericity under parabolic induction (Rodier) are not proved in the sources read. Gan–Savin use both for exceptional groups without proof. A source with a complete proof must be read before these are planned.
- **Harish-Chandra's classification of tempered representations**: Konno's proof of the Langlands classification takes as input Harish-Chandra's result that every irreducible tempered representation is a direct summand of a representation unitarily induced from a discrete series (Waldspurger 2003, Proposition III.4.1); its proof uses the Plancherel theory, which no stage in scope plans. langlands-classification is planned modulo this input.
- **Projectivity of discrete series in the tempered category**: Discrete series are projective and injective in the category of tempered representations (Meyer's Schwartz-algebra method); no Schwartz algebra or tempered category is planned here, and no source with a complete proof was read.
- **Degenerate Whittaker models and wave-front sets**: Mœglin–Waldspurger degenerate Whittaker models, used by Gan–Savin for the exceptional groups, are not planned; the source was not read.
- **Bushnell's localisation proof of second adjointness and the Bushnell–Kutzko Hecke-algebra embeddings**: Bushnell (J. London Math. Soc. 63 (2001)) was not obtained in a public copy, and Bushnell–Kutzko 1998 (Allen et al. [BK98, Cor. 6.12]) was not read. The normaliser/torus single-coset calculation is planned, but a proof of the general positive Levi Hecke embedding by transfer of structure constants remains missing. Second adjointness follows Bernstein’s route; neither unread source is claimed as read proof support.
- **Equivariant K-flat replacements and derived tensor/internal Hom**: The pinned libraries contain neither total tensor products of smooth complexes nor equivariant K-flat replacement. Stacks Section 20.26 (Tag 06Y7) supplies the non-equivariant definition and tensor criterion. The suggested file states concrete smooth tensor complexes, direct-sum totalisation, the acyclic-tensor K-flat predicate, replacement data and the derived internal-Hom adjunction. A complete equivariant construction and proof that replacements remain smooth are still missing; K-injective resolutions alone do not provide them.
- **Enhanced degree-zero Bernstein centre comparison**: The ordinary SmoothRep centre is planned as a compatible family of corner centres. To identify this with Fargues–Scholze’s π₀End(id), construct the dg/enhanced natural transformation object and prove that restriction to the heart induces an isomorphism in degree zero. The unenhanced triangulated CatCenter can have additional transformations and is not used as a substitute. This is the remaining early-owner input for RT-AREA-geomlanglands/9 and the higher ES0 comparison.
- **Nonsplit Iwahori block extension**: The present torus-character and affine-Hecke presentation is split. Extend it to the nonsplit relative root datum, minimal Levi and unequal Hecke parameters before asserting the analogous general Iwahori block equivalence. Borel76 treats a broader semisimple setting, but that extension of the packet’s supplier/API chain is not planned here.
- **Generic algebraic openness and rational intertwining operators**: The cuspidal unitary existence argument is read and planned. Bernstein92 Theorem 27, p. 86, obtains an open locus for each compact-open level and then shrinks the level; a single Zariski-open locus needs uniform generation or another argument. Konno03 Lemma 4.1 and Corollary 4.3 (pp. 400–402, 405–407) use rationality of normalized intertwining operators and Langlands classification, including the recorded tempered input. A complete independent algebraic-openness/rationality proof was not read. Generic-irreducibility and its downstream uses are conditional on this input.

## Supplier and ownership actions

- Keep PC10’s all-degree filtered-colimit and transfer contract, together with PC12’s cup product. The earlier PC4 low-degree contract does not provide the derived-Hecke product.
- DGAInfinity Layers 5–6 own arbitrary-ring derived Morita and compact=thick representables. SmoothRep owns the compact projective generators and their generation proof.
- RG2.1 must supply the torsion-free compact-generated quotient lattice, finite-index central image and compact central intersection. RG2.4 supplies unimodularity, Cartan/Iwasawa decompositions and a Hilbert basis for the dominant monoid including central lattice generators. Do not assume that monoid is free.
- General topology/root/parabolic/Iwahori types and coset enumerations remain RGPartII requests. General l-sheaf and cuspidal/inertial/affine-quotient carriers are specified locally as the packet’s constructions, with named uninstantiated contracts in the suggested file.
- Apply the packet’s retained restructuring proposals: SR.0:abelian-category → SR.1 → SR.0:derived-extension → SR.2 → SR.3a → SR.3 → SR.2a. Keep the early dg model independent of the higher EnhancedDerivedSheaves stage; do not create a reverse dependency.
- RT-AREA-geomlanglands/9 remains open at the enhanced-center comparison. Ordinary center/corner separatedness is planned here; ES0/ES1/ES7 must not infer the enhanced comparison from it.

## Checks and provenance

The report lists every baseline anchor and all consumed source locators. Pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; pinned Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current upstream read-only heads: TauCetiRoadmap `094dd0a7ca814cab4f0dbb8c1778c567ea1cc0c2`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Untracked drafts were excluded from current-main duplicate evidence.

Packet checker: zero errors/warnings. Suggested file: `lean-check` exit 0, only `sorry` warnings. Final graph, ledger coverage, name/omission accounting, source verdicts and deliverable paths checked. No formal proof or closure is claimed. Once this job’s PR is open and its submission check passes, this run stops without another claim.
