# Independent review: Automorphic forms on reductive groups, revision 5

**Verdict: accepted as a complete target-level plan.** Job `REV-AutomorphicFormsOnReductiveGroups~5`, issue #10125; Codex session `codex-YK1DXK`, 17 October 2026. This session authored none of the five blueprint inputs. The reviewed fifth revision is `e5af35bad`, submitted in #10132, with the fourth review's corrections already incorporated. This is a completed independent review, with direct corrections described below.

The fifth revision correctly limits scalar-mismatch vanishing to a field, or to coefficients on which the scalar difference acts injectively. Its ℤ/8ℤ example is valid: the distinct units 1 and −1 have the same action on the nonzero value 4. Both added examples in Suggested are proved without `sorry`. The transformation-law example deliberately violates the overlap compatibility required by the main central-character carrier; it tests why scalar inequality alone is insufficient and does not assert a compatible nonzero form with incompatible data.

Acceptance means that every stated target has its mathematical contract and dependency/proof route at the granularity of PROTOCOL §§0–2. All seven stages remain **planned**, zero closed; all 100 implementation statuses remain **unchecked**. The 43 supplier requests and 23 explicit proof/supplier refinements remain. This verdict does not establish proof closure, implementation, a cycle-free combined supplier graph or readiness to package.

## Scope and direct corrections

| Item | Result |
|---|---|
| Nodes | All 100 inspected: 26 definitions, 25 constructions, 49 theorems |
| Per-node verdicts | 88 verified; 12 ownership annotations corrected; stable identifiers retained |
| API / Checks / planets | 311 / 214 / 30; no target or Check removed |
| Pinned baseline | All 57 cited declaration statements read in their source context |
| Sources / source issues | 36 source records and all 19 issue records inspected; fresh reading distinguished below |
| Status | Complete plan; seven planned stages; 43 requests and 23 refinements |
| Suggested | Light real-bodied definitions and representative signatures; 377 lines |

Every node's statement, hypotheses, proof sketch, prerequisites, acceptance clauses, API and Checks was read. The per-node ledger below records the mathematical scope checked. A mechanical comparison separately checks that these contracts are represented in the reader. The two existing supplier-import proof steps appear as supplier-contract paragraphs, rather than numbered steps.

The direct changes concern ownership, not the fifth revision's mathematics. The current open AS proposal #925 at `64380dd10f4e9f85e4b0253a6cf1aad53b336cf2` already states overlapping adelic LF, real representation, globalization and tensor contracts in §§0.11 and 0.48–0.50. WORKERS places the ALS/AF bundle in tier 11, AL in tier 12 and AS in tier 13. Adding AS.0 as an AF prerequisite would point upward. The packet, reader and Suggested comments now make the single earlier owner and the required consumer redirects explicit:

1. AF.0 exports its adelic test carrier and support/level LF topology. AS retains the general nuclear-space theory and the nuclearity/distribution enhancement of that carrier.
2. AF.1 exports the shared Harish-Chandra, normalized real induction, tempered/discrete-series and Langlands foundations to AS, using the earlier ALS real-point prefix. The specialized GL_n Weil/LLC and Vogan targets and the explicit GL₂/GSp₄ compatibility targets retain their stated scopes.
3. AF.1 exports the SAF/globalization foundation and its morphism, exactness, induction and realization comparisons to AS/AL. A second common GL_n globalization foundation must not be constructed in AL.
4. AF.2 exports number-field algebraic restricted tensors, Flath/local-factor uniqueness and the specified Hilbert-realization comparison to AS/AL. Its finite-corner and archimedean PBW refinements remain explicit; AS's function-field extension is outside AF's scope.

These annotations affect twelve existing nodes and do not add another construction, new stage dependency or new request. Four precise `upstreamNotes` identify the open proposal sections for maintainer reconciliation. The upstream proposals themselves were not changed or reviewed as jobs. Existing higher-tier spectral/cohomological application requests remain recorded integration obligations, so this acceptance expressly does not certify packaging order or the combined stage graph. The reader's R7 consumer list now includes `AF.4/bhr-large-weight`, matching the packet. Its status and provenance paragraphs now identify this completed fifth review. Three older native-prototype scope paragraphs now include the packet’s explicit README-only qualification; their mathematical content is unchanged.

## Mathematical checks

The fourth review's five corrections remain sound. With `R(y)f(g)=f(gy)`, the translated level is `yJy⁻¹`, verified by the retained proved S₃ example. The GL₂ `Sym^{k−2}` dimension formula is scoped to `k≥2`. The local BHR threshold fixes the central parameter before choosing R, whereas the arithmetic root-wall threshold precedes weights, representations and degrees. Ordinary algebraic-modular stabilizer finiteness uses arithmetic discreteness and the discrete rational centre in addition to compactness modulo the split real centre. The central-quotient class set is a quotient of AA's ordinary finite class set; effective-stabilizer finiteness and coefficient descent remain separate obligations.

All three BHR contracts remain explicit in the reader. BCGP21, arXiv:1812.09269v3, §3.10, Theorem 3.10.1 pp.70–71 and proof pp.72–73, requires an actual discrete automorphic occurrence, including residual occurrences, with the stated central normalization. The arithmetic condition permits zero root pairings and bounds every nonzero pairing of `(k−1,l−2)`; converting it to the source's sufficient inequalities can change the numerical threshold. Nonunitary central character requires the weighted quotient norm or specified unitary transport.

Pilloni's cleared author edition, pp.107–108, fixes the local parameter and component conventions; the specialization immediately after Theorem 15.2.2.1 supports the corrected large-negative inequality. Pitale–Schmidt, arXiv:0809.0482v1, §§2.1–2.4 pp.3–7, separates holomorphic discrete series (`l′≥3`), the limit (`l′=2`) and the lowest-weight case outside both (`l′=1`). The H⁰ implication quantifies arbitrary irreducibles on the chosen component, without a large-weight or arithmetic assumption. Essential temperedness is required for the all-degree three-case classification. Geometric coherent comparison retains the source's degree and non-Eisenstein restrictions.

Calegari–Geraghty, arXiv:1907.08691v1, §§2.0.1–2.0.2 pp.6–9, confirms the unrestricted split-torus lattice, parity-constrained compact-Cartan lattice, compact/noncompact roots and the lengths 0,1,2,3 of the minimal representatives. The source's displayed longest-element wording does not identify the full type-C₂ longest element correctly; the packet's corrected distinction remains. The split-central Hodge stabilizer is not compact, and the compact-pair comparison retains central balancing.

The central-character algebraic-form extension is explicitly broader than BCGP25's definite unitary setting. BCGP25, arXiv:2502.20645v1, §5.7 pp.130–133, was read afresh: the coefficient covariance uses the inverse level action, and Definition 5.7.2 gives the small-level condition. It does not prove the extension's general effective-stabilizer finiteness. The packet correctly requests that arithmetic input and does not infer it from finite class number.

## Libraries and supplier boundaries

The implementation pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The actual 57 cited statements were read, rather than inferred from names. The reviewed library-audit entries for all seven AF stages were read. `ContRepresentation` does not provide joint smooth Fréchet actions; `GroupLieAlgebra` does not provide the algebraic-point tangent comparison; low-degree Lie cohomology does not provide the all-degree relative complex. The existing tensor/direct-limit and finite-dimensional Schur APIs do not prove Flath. Highest-weight Lie theory does not impose the integral algebraic-group character lattice or integrate the representation.

Current read-only TauCetiRoadmap main was checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The inventory of all nine post-snapshot roadmaps was screened. Existing DifferentialGeometry forms/de Rham theory, RealAlgebraicGeometry connected-cell finiteness, OperatorTheory functional analysis and IntegralLattices quadratic-lattice targets are not replanned. Current algebraic Hecke characters permit the finite-order sign component; current adjoint Kostant-lattice stability does not supply arbitrary coefficient Hopf/coaction integration. CompactGroups and LieGroups roadmap material supplies the upstream writing/target comparison.

| Proposal checked | Head / state | AF boundary |
|---|---|---|
| RG Part II #785 | `f24efef61443870dd47b64fd4de9828b0a685501`, open | Point topology, Weil restriction and local models/decompositions; global spreading-out remains a stronger request |
| AA #792 | `241d5d6a9b30d24354b5867ceb0a9146cb0418b9`, open | Adeles, quotient measures, heights, arithmetic class finiteness and level geometry |
| SR #793 | `74400cd9c0a533f704148df1193bff16a1f2b021`, merged 14 October | Finite-place smooth/Hecke/Jacquet/Satake foundations; general coefficient admissibility uses finite generation |
| ALS #871 | `e7e16145f2be8db4cddbda88b2ccab63f1bb52fd`, open | F.1, F.5–F.7 and §4.5 shared foundations, full-Levi Kostant and characteristic-zero descent |
| AS #925 | `64380dd10f4e9f85e4b0253a6cf1aad53b336cf2`, open | Spectral occurrence/completeness and existing nested-integration contracts; foundation overlaps require the AF→AS redirects above |

These are source/planned-owner contracts, not declarations available at the implementation pins. The ALS overlapping AF identifiers retain convention-identification and stronger compatibility APIs. The four historical restructuring proposals are preserved; current ownership annotations and tier directions govern the new AS reconciliation. External prefix splits and historical application requests still require maintainer integration. No queue, atlas registry, owner packet or upstream tree was edited.

## Source provenance and remaining limits

Fresh primary-source reading in this session includes Getz's 2015 notes pp.16–19 and 30–38; Bernstein–Krötz arXiv:0812.1684v3 pp.1–3 and 20–23; Wockel arXiv:1401.1037v1 pp.11–14; Harder–Raghuram arXiv:1405.6513v2 pp.17–19; and the BCGP21, BCGP25, Pilloni, Pitale–Schmidt and Calegari–Geraghty locations above. Wockel's finite-component/quasi-complete comparison and Harder–Raghuram's coefficient, parity, normalized induction and component degree conventions were checked against their actual scope. The public PDFs inspected retain their recorded source versions; inherited provenance for the remaining source records is not recast as fresh full reading.

The cleared Corvallis I volume was read in place: Flath, printed pp.179–182, Theorems 1–4, separates algebraic finite-corner factorization from Hilbert completion and permits sums of tensors. Borel–Jacquet, printed pp.189–197, §§1–4, separates growth, central finiteness, reconstruction, cuspidality and square integrability. Its compact-type averaging projector requires the dimension factor, not the reciprocal. The cleared Pilloni text was likewise read in place. No cleared file, passage or extracted source text was copied to the repository or scratch space.

All nineteen source-issue records were inspected against their use in the contracts. The preceding independent verdicts, eighteen confirmed and E8 rejected, are retained with their attribution; this session does not claim to have reread all nineteen original locations or to be an errata job. No new source-error finding is promoted here. Repository prose is an account of the target contracts in the worker's words, with locators, not a source excerpt or section-by-section source summary.

The retained refinements include the relative Ext resolution, homogeneous quotient comparison, Harish-Chandra reconstruction and rapid-decay proofs, globalization/classification proof interiors, coherent components, original BHR arithmetic input, coefficient integration/lattices, rational descent, imaginary-order Maass Bessel branch, effective central stabilizers and automorphic constituent extraction. Each has an explicit contract or missing input. Elaborating representative Suggested statements does not discharge any of them.

## Validation

- Packet validator: `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json`, zero errors and zero warnings.
- Suggested: `lean-check research/blueprint/suggested/AutomorphicFormsOnReductiveGroups.lean`, exit 0; 30 warnings, all `declaration uses sorry`. Both revision-5 coefficient examples and the retained finite-permutation example are proved. The review changes only the introductory Lean comment; the declaration text is unchanged. Memory was checked above 20 GiB before elaboration; no language server or Lake build/update/cache command was used.
- Independent structural checks: 100 unique stable IDs, all 100 per-node verdicts, 311 API items, 214 Checks, 30 planets within the per-stage cap; all implementation statuses unchecked; seven planned stages; internal node DAG acyclic.
- Packet/reader comparison: every node statement, hypothesis, proof step, acceptance clause, API statement and Check is represented, as are the intended BHR contracts and the ownership annotations. Request consumers agree.
- `git diff --check` and the submission deliverable-path check pass. Details are recorded in the handoff.

## Per-node ledger

`Verified` concerns the suitability and scope of the planned contract, not a completed proof. `Corrected` identifies an ownership annotation added in this review. The packet contains this same complete ledger in `review.checked`.

| Node | Verdict | Check |
|---|---|---|
| `AF.0/smooth-adelic-function` | verified | Finite-level invariance is uniform in the archimedean variable; slice smoothness does not replace that condition. |
| `AF.0/adelic-test-functions` | corrected | Recorded AF.0→AS test-topology export; local convolution remains SR-owned and compact support permits finite sums of elementary tensors. |
| `AF.0/adelic-schwartz-space` | verified | Both derivative directions and every height power occur in the Schwartz condition; one-sided bounds would be weaker. |
| `AF.0/moderate-growth` | verified | Height comparison changes the allowed exponent; the exponential example separates polynomial from unrestricted growth. |
| `AF.0/uniform-moderate-growth-space` | verified | One derivative-independent exponent is required; the retained S₃ example verifies the conjugation yJy⁻¹. |
| `AF.0/growth-translation-differentiation` | verified | The inverse adjoint action in translated seminorms matches right translation and the finite-level convention. |
| `AF.0/convolution-to-uniform-growth` | verified | Differentiation acts on the test kernel through the principal anti-automorphism; absolute integrability precedes Fubini. |
| `AF.0/finite-hecke-action` | verified | The normalized compact-open idempotent agrees with volume-weighted coset sums and commutes with the real action. |
| `AF.1a/gk-pair` | verified | The pair includes the differentiated compact inclusion and adjoint compatibility, rather than unrelated Lie and group data. |
| `AF.1a/gk-module` | verified | Local compact-orbit finiteness and differentiated covariance are retained under the stated subquotient and tensor operations. |
| `AF.1a/relative-lie-cochain-complex` | verified | The ALS import uses horizontal full-K invariants and the all-degree differential, including disconnected components. |
| `AF.1a/relative-cohomology-functoriality` | verified | Compact invariants give exactness in the locally finite category; the relative projective resolution is a separate input. |
| `AF.1a/differentiable-cochains` | verified | The continuous/differentiable comparison uses the specified finite-dimensional coefficients and an actual cochain inclusion. |
| `AF.1a/invariant-forms-complex` | verified | Existing DG forms are imported; quotient tangent evaluation and the Maurer–Cartan comparison remain explicit obligations. |
| `AF.1a/van-est-isomorphism` | verified | The comparison retains naturality and cup products; Wockel's theorem does not supply the entire quotient-form adapter. |
| `AF.1a/cartan-iwasawa-malcev` | verified | The reductive case has an owner; the stronger finite-component general Lie-group assertion retains its source-proof gap. |
| `AF.1a/van-est-acceptance` | verified | Compact, vector-group and compact-dual examples test different parts of van Est, including component invariance. |
| `AF.1/real-points-lie-group` | verified | The ALS real-point foundation is identified with the actual algebraic embedding and differentiated action. |
| `AF.1/real-reductive-group` | verified | The compact subgroup is chosen through the Cartan datum; arbitrary compact subgroups do not satisfy the requested decomposition. |
| `AF.1/k-finite-vectors` | verified | Finite orbit span is algebraic; density and averaging require the additional continuous complete setting. |
| `AF.1/admissible-gk-module` | corrected | Made HC foundations a single AF.1 export to AS; finite multiplicities and finite generation are not interchangeable definitions. |
| `AF.1/infinitesimal-character` | verified | The rho shift and central Lie directions are explicit; disconnected invariance needs the stated algebraic action. |
| `AF.1/harish-chandra-admissibility` | verified | The finite-infinitesimal-fibre theorem is separate from admissibility and embedding, as in Bernstein–Krötz §4. |
| `AF.1/principal-series` | corrected | Assigned the common induction foundation to AF.1 for AS consumption; covariance, compact picture and SL₂ checks fix normalization. |
| `AF.1/casselman-embedding` | verified | The embedding is a compatible-module injection; Jacquet nonvanishing and vector separation are retained proof refinements. |
| `AF.1/sf-representation` | corrected | Assigned the common SAF carrier to AF.1 for AS consumption; joint smoothness and seminorm growth exceed ContRepresentation. |
| `AF.1/g-continuous-norms` | verified | A norm must yield a continuous completed action; polynomial compact-type estimates and Sobolev comparisons remain substantial. |
| `AF.1/casselman-wallach-globalization` | corrected | Assigned the globalization equivalence to AF.1 for AS/AL consumption; uniqueness, morphisms and the fixed-realization comparison remain explicit. |
| `AF.1/dixmier-malliavin` | verified | Factorization concerns actual smooth vectors and convolution, with the original analytic proof still recorded as unread. |
| `AF.1/real-reductive-representation-theory` | corrected | Clarified the AF.1→AS classification interface; irreducibles are compatible-module isomorphism classes with twists and duals. |
| `AF.1/tempered-square-integrable` | corrected | Kept coefficient integrability on the specified central quotient and assigned its shared foundation to AF.1, before AS applications. |
| `AF.1/discrete-series` | corrected | Assigned shared discrete-series classification to AF.1; compact Cartans, compact Weyl equivalence and nondegenerate limits are distinguished. |
| `AF.1/langlands-classification` | corrected | Assigned shared Langlands classification to AF.1; positive standard quotients and Weyl-equivalent standard data retain their actual scope. |
| `AF.1/weil-group-real` | verified | The real Weil group has the nonsplit j² relation; its two-dimensional irreducibles are not direct-product characters. |
| `AF.1/archimedean-llc-gln` | verified | The GL_n correspondence uses real/complex Langlands data; higher local-factor identities remain separate AL contracts. |
| `AF.1/gl2-real-discrete-series` | verified | The GL₂ two-ray model has the stated Casimir and O₂ exchange; a Lie module alone is not its integrated realization. |
| `AF.1/vogan-generic-unitary-dual` | verified | The generic unitary GL_n classification retains the strict complementary-series interval and its non-tempered examples. |
| `AF.2/automorphic-form` | verified | The ALS foundation consists of actual rational-invariant, finite-level, compact/centre-finite functions with growth conditions. |
| `AF.2/automorphic-forms-uniform-growth` | verified | Common-exponent derivative growth requires the reconstruction kernel, rather than merely an approximate identity. |
| `AF.2/smooth-automorphic-forms` | verified | Fixed level and central ideal determine the specified smooth pieces; an unsupported global strict-LF assertion is avoided. |
| `AF.2/harish-chandra-finiteness` | verified | Finite level, compact types and a cofinite central ideal are all needed for the finite-dimensionality statement. |
| `AF.2/adelic-classical-bijection` | verified | The AA component decomposition must transport invariance and heights; it is not an unrestricted product identity. |
| `AF.2/automorphic-forms-module` | verified | The compact-type projector has the dimension factor, and the archimedean action uses the supported distribution algebra. |
| `AF.2/automorphic-representation` | verified | Finite-type admissible subquotients define automorphic representations; closed spectral occurrence is additional structure. |
| `AF.2/restricted-tensor-product` | corrected | Recorded the AF.2→AS/AL tensor export; the directed-colimit carrier allows finite sums and nonzero distinguished vectors. |
| `AF.2/spherical-dimension-one` | verified | Spherical invariants may vanish; local hyperspecial models alone do not establish global almost-everywhere good reduction. |
| `AF.2/flath-factorization` | corrected | Recorded Flath as an AF.2 export to AS/AL; finite corners and the archimedean Hecke comparison retain their separate refinements. |
| `AF.2/nongeneric-automorphic` | verified | The split GL₂ constant module supplies the automorphic, noncuspidal, nongeneric counterexample. |
| `AF.2/holomorphic-sl2-forms` | verified | Holomorphy, parallel weight and fractional-ideal Fourier indexing are specified; rational structures require the chosen number field. |
| `AF.3/unipotent-quotient-compact` | verified | The unipotent quotient is arithmetic and compact, with compatible probability measure rather than an integral over the whole group. |
| `AF.3/constant-term` | verified | Constant terms use the rational quotient, preserve right actions and have the appropriate Levi/parabolic left invariance. |
| `AF.3/constant-term-transitivity` | verified | The existing nested-integration supplier contract is retained; rational conjugation and maximal-standard sufficiency are AF compatibility targets. |
| `AF.3/cusp-form` | verified | Cuspidality is a common kernel of rational proper constant terms; the Hilbert version requires closed almost-everywhere maps. |
| `AF.3/anisotropic-cuspidal` | verified | With no proper rational parabolics, the cuspidality condition is vacuous; the chosen central quotient remains relevant. |
| `AF.3/cusp-form-rapid-decay` | verified | Real rapid decay and its adelic transport are separated; the original analytic estimate remains a named proof gap. |
| `AF.3/cusp-forms-square-integrable` | verified | Square integrability is asserted after central reduction with the stated unitary character, not over the unrestricted centre. |
| `AF.3/cuspidal-spectrum-discrete` | verified | Discrete cusp occurrences use the imported spectral embedding; finite multiplicity and admissibility are not inferred from an arbitrary union. |
| `AF.3/cuspidal-automorphic-representation` | verified | The cuspidal representation is tied to the actual cusp module and its unitary realization, retaining occurrence and central data. |
| `AF.3/sl2-generation` | verified | The holomorphic lowest-weight vector generates the intended discrete-series module, with the k=2 boundary distinguished. |
| `AF.3/sl2-fourier-vanishing` | verified | Fourier constant-term vanishing is transported through the adelic/classical dictionary with the stated cusps and level. |
| `AF.3/maass-cusp-forms` | verified | The Laplacian, Casimir sign and Hecke factor agree; imaginary Bessel order and the numerical spectral dataset retain their limits. |
| `AF.4/algebraic-weight` | verified | Algebraic weights include the reductive integral character lattice; semisimple Lie highest weights alone do not integrate them. |
| `AF.4/infinitesimal-character-of-weight` | verified | The coefficient infinitesimal character includes rho and central coordinates, with the dual-sign convention retained. |
| `AF.4/c-l-algebraic` | verified | C/L conversion uses the GL_n normalization; GL₁ parity and half-integral shifts test the distinction. |
| `AF.4/cohomological-representation` | verified | Relative cohomology uses actual algebraic coefficients and a fixed compact group, retaining the ALS foundation identification. |
| `AF.4/wigner-lemma` | verified | The central-character obstruction is an Ext/cohomology statement; its relative resolution is not provided by Schur's lemma alone. |
| `AF.4/l0-q0-invariants` | verified | The compact-centre degree invariants are kept distinct from the full disconnected Hodge stabilizer. |
| `AF.4/borel-wallach-tempered-range` | verified | The tempered degree range retains its real-group and coefficient hypotheses and the appropriate exterior central contribution. |
| `AF.4/vogan-zuckerman` | verified | Cohomological induction uses a theta-stable parabolic and the stated unitary parameter; classification proof interiors remain open. |
| `AF.4/gln-tempered-cohomological` | verified | The GL_n tempered/cohomological description keeps purity and parity conditions, including real component characters. |
| `AF.4/clozel-purity` | verified | Purity remains a GL_n cuspidal conclusion using the separate genericity input, rather than a claim for all reductive groups. |
| `AF.4/hermitian-positive-system` | verified | Compact and noncompact roots are distinguished; the full Hodge stabilizer contains the split centre and is not compact. |
| `AF.4/coherent-relative-cohomology` | verified | The Hodge complex requires its datum and central balancing; geometric coherent comparison keeps its degree/localization restrictions. |
| `AF.4/gsp4-discrete-series` | verified | GSp₄ compact-Cartan parity, central conversion, discrete series and the two noncompact limits are all retained. |
| `AF.4/bhr-coherent-cohomology` | verified | The contributing coherent degree uses the fixed component; full disconnected-group vanishing is not imported from the flawed source claim. |
| `AF.4/mirkovic-tempered-coherent` | verified | Essential temperedness enters the all-degree coherent classification; the unconditional H⁰ implication is separately specified. |
| `AF.4/bhr-large-weight` | verified | All three BHR contracts are explicit: arithmetic discrete occurrence with a uniform root-wall bound, fixed-central two-limit data, and arbitrary-irreducible lowest-weight classification. |
| `AF.4/harris-limits-gsp2g` | verified | Limits require noncompact-wall data and the corrected coefficient conventions; compact walls are not treated as pairs of limits. |
| `AF.4/holomorphic-ds-sp2n-unn` | verified | The holomorphic-series boundary distinguishes genuine discrete series, limits and lower-weight modules outside both classes. |
| `AF.4/coefficient-lattices` | verified | Integral coefficient stability needs an actual Hopf/coaction model; an adjoint Kostant lattice alone is insufficient. |
| `AF.4/rationality-field` | verified | The fixed-field definition of rationality does not itself construct a model over that field. |
| `AF.4/clozel-rationality` | verified | GL_n rational descent is separated from the explicitly conditional general-group statement and uses the actual cohomological comparison. |
| `AF.4/torsion-hecke-eigenclasses` | verified | A torsion eigenclass is nonzero and carries a character; reduction requires nonzero image, and a nonfaithful class does not recover the character uniquely. |
| `AF.5/gl1-dictionary` | verified | The GL₁ dictionary permits finite-order sign data on components and uses the existing algebraic Hecke-character foundation. |
| `AF.5/gl2-classical-to-adelic` | verified | Adelization retains determinant scaling, the fixed weight and rational/finite-level conventions. |
| `AF.5/gl2-dictionary` | verified | The GL₂ coefficient system is dualized in the stated convention; discrete-series and arithmetic central twists are tracked separately. |
| `AF.5/gl2-hecke-normalisation` | verified | The raw double-coset Hecke operator includes the determinant normalization and inverse-level character transport. |
| `AF.5/algebraic-modular-forms` | verified | Ordinary algebraic forms use compactness modulo the split centre together with discrete rational centre and arithmetic discreteness for stabilizers. |
| `AF.5/algebraic-modular-forms-structure` | verified | Evaluation yields stabilizer invariants; base change requires invertible stabilizer orders or trivial stabilizers, beyond finite class number. |
| `AF.5/transport-compatibilities` | verified | Restriction of scalars and central twists preserve the specified arithmetic data; product automorphy needs constituent extraction, not identity evaluation alone. |
| `AF.1a/absolute-lie-cochain-complex` | verified | Absolute cochains and differential signs agree with ALS; coefficient actions and the disconnected comparison are retained. |
| `AF.4/kostant-parabolic-cohomology` | verified | The ALS full-Levi Kostant/descent theorem is imported with left cosets, dot action and central weights checked; no mod-p analogue is asserted. |
| `AF.2/finite-corner-tensor-factorization` | verified | Finite-corner generation handles arbitrary submodules, and algebraic tensor irreducibility uses the stated scalar-field hypotheses. |
| `AF.2/archimedean-hecke-algebra` | verified | The supported bi-K-finite distribution carrier, principal anti-involution and PBW quotient are specified; their analytic comparison is still a proof refinement. |
| `AF.1/normalized-real-parabolic-induction` | corrected | Assigned common general parabolic induction to AF.1 for AS consumption; the integrated model precedes CW comparison and fixes compact-picture covariance. |
| `AF.2/central-translation-finiteness` | verified | Central translation finiteness uses the supplied real classification and central action; a general smooth union is not thereby finite dimensional. |
| `AF.5/central-character-algebraic-modular-forms` | verified | Verified the revision-5 field/injective-difference distinction and the nonzero value 4 over ℤ/8ℤ; mismatched data remain outside the compatible carrier. |
| `AF.4/local-stable-lattice` | verified | The local stable lattice uses a specified integral algebraic model and actual local point action, rather than extrapolating adjoint stability. |
| `AF.1/gl2-algebraic-weight-model` | verified | The real-bodied Sym^{k-2} model has dimension k-1 for k≥2 and is kept separate from algebraic-group integration. |
| `AF.4/cohomological-with-coefficient` | verified | The coefficient-aware cohomological predicate retains the chosen algebraic representation and its actual relative complex. |
