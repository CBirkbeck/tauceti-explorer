# Independent review: Automorphic forms on reductive groups, revision 4

**Completed review; verdict: accepted at target level.** Job `REV-AutomorphicFormsOnReductiveGroups~4`, issue #10110; Codex session `codex-2RmeW7`, 17 October 2026. This worker authored none of the four blueprint inputs. The reviewed fourth revision is commit `e7e31fb6e`, submitted in #10122. This is a finished review, with direct corrections to the packet, reader and suggested file.

The fourth revision resolves the previous review's BHR specification blocker. All three conclusions now have full mathematical contracts in the reader: arithmetic essential temperedness, a local two-limit classification, and the arbitrary-irreducible lowest-weight/nonvanishing classification. Their quantifiers, coefficients, root bounds, central normalization and component conventions are explicit. The current WORKERS rule of 12 October places targets with unavailable pinned carriers in the README. It therefore does not require an artificial native automorphic-occurrence or cohomology carrier in Suggested. The elementary root-wall predicate is correctly distinguished from the arithmetic theorem.

Acceptance is of a completed target-level plan under PROTOCOL §§0–2. All seven stages remain **planned**, zero closed, and every implementation status remains **unchecked**. The 43 requests and 23 explicit source-proof/supplier refinements remain. No theorem is claimed formalized, and this verdict does not declare the combined supplier stage graph acyclic.

## Review scope

| Item | Result |
|---|---|
| Nodes | All 100 reviewed: 26 definitions, 25 constructions, 49 theorems |
| Per-node ledger | 95 verified; 5 corrected directly; identifiers preserved |
| API / specified Checks | 311 / 213; one discriminating translation Check added |
| Planets | 30, at most six per stage |
| Baseline | All 57 actual declaration statements read at the recorded pins |
| Sources | 36 records; fresh reading distinguished below from inherited provenance |
| Source findings | All 19 examined in the contracts; preceding eighteen confirmed/one rejected verdicts retained |
| Requests / gaps | 43 / 23 retained with their actual statement and scope restrictions |
| Coverage | Seven planned, zero closed; packet status complete |
| Suggested | 364 lines; light real-bodied definitions and representative signatures/examples |

Every node's statement, hypotheses, proof route, prerequisites, API, Checks and acceptance clauses were inspected. The ledger below records the specific mathematical convention or scope checked. Structural validation and a separate synchronization pass establish that every node statement, hypothesis, proof route, acceptance clause, API statement, test statement and BHR intended contract is represented in the reader. The two supplier-import proof steps appear as explicit supplier-contract paragraphs rather than numbered proof steps.

## Corrections made directly

1. **Translated finite level.** In `AF.0/uniform-moderate-growth-space`, the API used the opposite conjugation from its convention `R(y)f(g)=f(gy)`. The correct level is `y_f J y_f^{-1}`. The suggested theorem already had this direction. A new S₃ Check takes J fixing 2, y=(0 1 2), j=(0 1), and f(g)=g(2): the correct conjugate has translated value 0 and the opposite conjugate has value 2. The added Lean example proves these evaluations without `sorry`.
2. **GL₂ coefficient dimension.** The `Sym^{k-2}` acceptance clause and `algWeight_gl2_dim` Check now require `k≥2`, so the intended dominant polynomial highest weight and dimension `k-1` are defined in their stated range.
3. **BHR local quantifier.** The intended local declaration now fixes central parameter c before choosing R, matching the node's hypotheses. It no longer inadvertently asserts one R uniformly over every c. The arithmetic contract has its own uniform bound chosen before the weight, representation and cohomological degree.
4. **Ordinary algebraic modular forms.** The stabilizer proof route now explicitly uses compactness modulo A_∞ together with the discrete-rational-centre hypothesis and arithmetic discreteness. Compactness modulo the real centre alone cannot make rational integral central stabilizers finite.
5. **Central-character algebraic modular forms.** The statement/proof now deduces central class-set finiteness by quotienting AA's ordinary finite class set. Effective stabilizer finiteness and coefficient descent still require their separate requested theorem; they do not follow just from a finite set of representatives.

The reader's stale closing claim that BHR parts (i) and (iii) were still unspecified has been removed. Its status and reading-provenance paragraphs now identify this independent review. No source issue has been reclassified on the strength of a secondary citation.

## BHR contract check

BCGP21, arXiv:1812.09269v3, §3.10, Theorem 3.10.1 pp.70–71 and its proof pp.72–73, distinguishes the arithmetic regularity input from the local H⁰ implication. The review directly read pp.70,72–73. Pilloni, author edition p.108, Theorem 15.2.2.1 and the following specialization, distinguishes the two limits; p.107 supplies the parameter and component conventions. Pitale–Schmidt, arXiv:0809.0482v1, §§2.1–2.4 pp.3–7, characterizes the irreducible lowest-weight module and the discrete/limit boundary. Calegari–Geraghty, arXiv:1907.08691v1, §§2.0.1–2.0.2 pp.6–9 and §5.3 pp.21–23, fixes the roots, coefficient conversion and chamber conventions.

- Part (i) quantifies an actual **discrete automorphic occurrence**, including residual occurrences, for the totally real GSp₄ setting and the fixed BCGP central normalization. It uses the actual AS embedding/multiplicity contract and a weighted central-quotient norm or its unitary transport. It does not infer ordinary full-centre L² from the nonunitary character.
- Its semisimple parameter is `(k-1,l-2)`. The four positive-coroot values are `x-y,x,x+y,y`; zero pairings are allowed and every nonzero pairing exceeds the bound. The threshold precedes all weights and representations. Converting to BCGP's sufficient inequalities changes the threshold; no equality of numerical constants is asserted.
- Part (ii) fixes c and its parity convention and uses the corrected large-negative inequality `-a≥R`. Pilloni's later `k=-a-1` specialization supports the sign correction. It quantifies arbitrary irreducible essentially unitary local representations, rather than assuming a supplied discrete/limit model.
- Part (iii) quantifies arbitrary irreducible admissible modules on the selected Hodge component. H⁰ implies the holomorphic discrete series for `l>2` or holomorphic limit for `l=2`, without an arithmetic or large-weight assumption. Essential temperedness is required for the three-case all-degree classification and one-dimensionality. The full disconnected group carries the separate antiholomorphic partner; the local calculation does not enlarge BCGP's geometric comparison beyond its stated degree/localization restrictions.

The original BHR arithmetic proof and original Schmid/Mirković/translation proof interiors remain explicitly unverified proof refinements. The contract review does not remove them. The `l=1` lowest-weight example and the distinction between compact and noncompact roots are useful negative controls, rather than a replacement for those proofs.

## Baseline and ownership

The packet's pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 57 cited declaration statements were read with their surrounding parameters. The Mathlib checkout used for the check is at its recorded pin. All ten cited Tau Ceti source modules in the shared environment were byte-compared with the pinned Git objects. This establishes the sources inspected, rather than assuming current main has the same contracts.

The existing carriers are used within their actual scope: `ContRepresentation` gives continuity of each operator, not a joint smooth Fréchet action; `GroupLieAlgebra` is not the algebraic/analytic tangent bridge; the existing Lie cohomology API supplies low degrees, not the all-degree relative complex; `PiTensorProduct`/`Module.DirectLimit` do not supply Flath factorization; Schur requires the finite-dimensional/algebraically closed scalar argument; compact averaging has its completeness assumptions; semisimple Verma/highest-weight machinery does not integrate all algebraic reductive representations. Existing modular-form slash/Hecke operators require the recorded determinant scalar and inverse-level character transport.

The reviewed library-coverage entries for AF.0–AF.5 and AF.1a were checked before judging the new targets. Current read-only TauCetiRoadmap main was `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The current roadmap/Suggested inventory, including all nine post-snapshot roadmaps, was screened for overlap. The relevant DifferentialGeometry, RealAlgebraicGeometry, OperatorTheory and IntegralLattices interfaces were checked. CompactGroups and LieGroups reader examples were also inspected for upstream form. No existing general forms, CAD, compact averaging, highest-weight, lattice or operator theory is replanned here; the AF-specific compatibility and classification targets remain distinct.

The supplier heads recorded in revision 4 still match the inspected pull requests:

| Supplier | Inspected head | Actual imported scope |
|---|---|---|
| ArithmeticLocallySymmetricSpaces #871 | `e7e16145f2be8db4cddbda88b2ccab63f1bb52fd` | ALS.F.1, F.5–F.7 and ALS.4 §4.5: real-point foundations, cochains/invariant forms, automorphic/cuspidal interfaces, algebraic coefficients/Wigner and full-Levi Kostant/descent |
| AutomorphicSpectralTheory #925 | `64380dd10f4e9f85e4b0253a6cf1aad53b336cf2` | §0.51 nested integration; §§4.1–4.6 discrete occurrences including residual terms, onto transform and central transport; §4.10 cuspidality has its separate hypotheses |

These are roadmap contracts, not declarations present at the pins. AF identifiers for overlapping foundations now mean identification of their actions/conventions and a finer API, not a second construction. ALS and AF are in the same authorized bundle. SR's upstream package has merged; AA and RG supplier work remains subject to its exact export scope. Local reductive models do not supply global smooth reductive spreading-out, and neither a library audit nor an owner's acceptance supplies an absent exact export.

The internal graph has 100 nodes and 225 internal prerequisite edges and is acyclic. The existing four restructuring proposals are retained as integration history. The current supplier-contract paragraphs take precedence over older owner directions in those proposals. Unsplitted ALS/AS/AF stage boundaries still have the documented cycles; the recorded early-prefix/application splits must be integrated before a combined stage graph is certified. No queue, atlas, owner packet or upstream checkout was changed by this review.

## Source findings and limits

All nineteen source-issue records were checked against their use in the target contracts. Their earlier independent verdicts remain eighteen confirmed and E8 rejected. This is not a claim to have reread all nineteen original source locations in this session. Fresh checks include the Calegari–Geraghty compact-root/chamber/coefficient issues, Pilloni's empty chamber and large-negative sign issues, and Corvallis normalization/tensor claims. In particular, the genus-two minimal representatives have lengths 0,1,2,3, and the alleged E8 counterexample is still invalid. The original-source findings of the preceding reviews remain attributed to those reviews.

Borel–Jacquet, Corvallis I §§1.1–1.5, printed pp.189–191, was read in the cleared volume in place: the compact-type projector normalization is dimension, not reciprocal dimension, and the growth/central-finiteness conditions have different roles. Flath, printed pp.179–182, was read in place: the finite-corner generation argument handles arbitrary submodules, the restricted tensor product allows finite sums, and its unitary Hilbert factorization is a separate theorem. No cleared file or passage was copied into the repository or scratch space.

The original proof gaps are substantive future formalization work, not evidence that the specified targets are absent. They include the relative Ext resolution, homogeneous quotient comparisons, Harish-Chandra reconstruction and spectral kernels, globalization/classification proof interiors, coherent component conventions, algebraic highest-weight integration, rational descent, Maass imaginary-order Bessel functions, automorphic product constituent extraction and effective stabilizers. Each remains attached to the relevant node/stage; none is declared discharged merely because Suggested elaborates.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/AutomorphicFormsOnReductiveGroups.lean`: **exit 0**, 30 warnings, all exactly `declaration uses sorry`. The new finite permutation example is proved. Memory was checked before each elaboration, with more than 20 GiB available; no language server or build/update/cache command was used.
- Packet/reader synchronization: all 100 nodes' statements, hypotheses, proof routes, acceptance, 311 API statements, 213 Checks and the BHR intended contracts agree. Counts, internal DAG and per-node review coverage were checked independently of the packet validator.
- `git diff --check`: passed.
- Submission file validation is recorded in the handoff. No source excerpts, local filesystem paths or admitted data definitions are introduced.

## Per-node review ledger

`Verified` means the target's mathematical statement, route and recorded limits are suitable for this plan. It does not mean a proof or implementation is complete. The packet carries the same full ledger in `review.checked`.

| Node | Verdict | Check |
|---|---|---|
| `AF.0/smooth-adelic-function` | verified | Finite-level invariance and smooth archimedean slices are separate conditions; AA supplies the adelic product and ALS supplies real-point smoothness. |
| `AF.0/adelic-test-functions` | verified | The finite-place carrier imports SR convolution; compact support gives finite sums of tensors, while completeness and LF topology remain proof obligations. |
| `AF.0/adelic-schwartz-space` | verified | Schwartz bounds include both left and right derivatives and a two-sided height; polynomial Haar integrability remains an AA analytic input. |
| `AF.0/moderate-growth` | verified | Polynomial height comparison changes the growth exponent; constants and exponential escape distinguish the predicate. |
| `AF.0/uniform-moderate-growth-space` | corrected | Corrected translated level to y_f J y_f^{-1}; the proved S₃ example rejects the opposite conjugation. One exponent controls all derivatives. |
| `AF.0/growth-translation-differentiation` | verified | The inverse-adjoint seminorm formula agrees with R(y)f(g)=f(gy); rational left invariance and finite-level conjugation are distinct. |
| `AF.0/convolution-to-uniform-growth` | verified | Moving differentiation to the test factor introduces the principal anti-automorphism; the common growth exponent follows only after absolute integrability. |
| `AF.0/finite-hecke-action` | verified | Normalized Haar idempotents and finite right-coset sums agree; the finite-place action commutes with the differentiated archimedean action. |
| `AF.1a/gk-pair` | verified | The pair includes an injective differentiated compact inclusion and actual adjoint covariance; ALS.F.5 supplies the shared foundation. |
| `AF.1a/gk-module` | verified | Local K-finiteness is not countability; compatible Lie and compact actions survive kernels, quotients and finite coefficient tensors. |
| `AF.1a/relative-lie-cochain-complex` | verified | Horizontal K-invariant cochains use the all-degree alternating differential; disconnected K-invariance is stronger than Lie invariance alone. |
| `AF.1a/relative-cohomology-functoriality` | verified | Exactness uses locally finite compact complete reducibility; the relative Koszul resolution and Ext comparison remain explicit proof refinements. |
| `AF.1a/differentiable-cochains` | verified | The inclusion compares actual continuous and differentiable cochain complexes with the stated finite-dimensional coefficient assumptions. |
| `AF.1a/invariant-forms-complex` | verified | DG supplies forms and exterior differentiation; AF retains homogeneous-quotient evaluation and the Maurer–Cartan/relative-differential comparison. |
| `AF.1a/van-est-isomorphism` | verified | The differentiation map has naturality and cup compatibility; Wockel's comparison is distinguished from the invariant-form/Poincaré argument. |
| `AF.1a/cartan-iwasawa-malcev` | verified | The reductive case imports Cartan decomposition; the finite-component general Lie-group structure proof is still a named source gap. |
| `AF.1a/van-est-acceptance` | verified | Compact averaging, vector-group exterior classes and the compact-dual U(n) calculation have different inputs; component actions are tested separately. |
| `AF.1/real-points-lie-group` | verified | The algebraic-point embedding and tangent compatibility refine ALS.F.1; current real algebraic CAD supplies component finiteness. |
| `AF.1/real-reductive-group` | verified | A maximal compact comes from a Cartan involution; an arbitrary compact subgroup would not yield the decomposition or component conclusion. |
| `AF.1/k-finite-vectors` | verified | Orbit-span finiteness is algebraic; density and projectors require the continuous complete setting and the correct Haar character normalization. |
| `AF.1/admissible-gk-module` | verified | Admissibility means finite-dimensional K-multiplicities; finite generation and central finiteness are stated separately before their theorem-level equivalence. |
| `AF.1/infinitesimal-character` | verified | The centre character uses the rho shift; disconnected compact stability needs the inner algebraic action or an invariant character hypothesis. |
| `AF.1/harish-chandra-admissibility` | verified | Admissibility and finite infinitesimal-character fibres retain the real-reductive scope; embedding alone does not prove finite fibres. |
| `AF.1/principal-series` | verified | The normalized covariance, compact picture and SL₂ parity/Casimir checks are compatible; the inducing representation is finite dimensional here. |
| `AF.1/casselman-embedding` | verified | The injection is a compatible-module morphism; Jacquet nonvanishing and separation of vectors remain the original-proof obligation. |
| `AF.1/sf-representation` | verified | Smooth Fréchet actions include joint continuity and seminorm growth; the pinned ContRepresentation alone does not supply this structure. |
| `AF.1/g-continuous-norms` | verified | A G-continuous norm requires a genuinely continuous completion; Sobolev equivalence and polynomial K-type estimates are nontrivial targets. |
| `AF.1/casselman-wallach-globalization` | verified | Globalization includes recovery and morphism extension; the independent classification/goodness reduction is not replaced by embedding alone. |
| `AF.1/dixmier-malliavin` | verified | Factorization concerns smooth vectors and actual convolution; the unread Dixmier–Malliavin proof is recorded rather than silently supplied by a citation. |
| `AF.1/real-reductive-representation-theory` | verified | Irreducibles are isomorphism classes of compatible modules, with contragredient and twist operations; this is a scoped classification interface. |
| `AF.1/tempered-square-integrable` | verified | Integrability is on the stated central quotient with a unitary realization; essential square integrability allows the specified norm twist. |
| `AF.1/discrete-series` | verified | Compact-Cartan existence and nondegenerate limit parameters are distinguished; quotienting by compact Weyl conjugacy avoids false uniqueness. |
| `AF.1/langlands-classification` | verified | Normalized standard modules have unique irreducible quotients in the positive chamber; general-group proofs remain distinct from checked GL_n statements. |
| `AF.1/weil-group-real` | verified | The real Weil group is nonsplit with j²=-1, and its induced two-dimensional parameters are not characters of a direct product. |
| `AF.1/archimedean-llc-gln` | verified | The real and complex GL_n correspondences use Langlands data; higher local factors remain AL exports and are not reconstructed here. |
| `AF.1/gl2-real-discrete-series` | verified | Compact-basis raising/lowering coefficients give Casimir k(k-2)/4; full O(2) exchanges the two half-lines. |
| `AF.1/vogan-generic-unitary-dual` | verified | The generic unitary dual retains the strict complementary interval and GL_n scope; it does not assert temperedness of all unitary representations. |
| `AF.2/automorphic-form` | verified | Rational invariance, archimedean smoothness, finite level, K-finiteness, central finiteness and growth are actual function conditions. |
| `AF.2/automorphic-forms-uniform-growth` | verified | Common-exponent derivative growth needs the Harish-Chandra reconstruction kernel; an arbitrary approximate identity is insufficient. |
| `AF.2/smooth-automorphic-forms` | verified | The smooth automorphic carrier has fixed-level/central-ideal pieces and a separate globalization comparison; no unsupported global strict-LF assertion is used. |
| `AF.2/harish-chandra-finiteness` | verified | Fixed level, compact type and cofinite central ideal are essential to finite dimensionality; reduction and reconstruction proofs remain explicit. |
| `AF.2/adelic-classical-bijection` | verified | AA's finite component decomposition transports the actual rational invariance and height bounds; it is not a formal unrestricted product equality. |
| `AF.2/automorphic-forms-module` | verified | The Hecke action uses the archimedean distribution algebra and d_sigma times the conjugate character projector, not its reciprocal. |
| `AF.2/automorphic-representation` | verified | An irreducible subquotient lies in a finite-type admissible piece; the full union is not asserted admissible, and spectral occurrences are extra structure. |
| `AF.2/restricted-tensor-product` | verified | The restricted tensor product is a linear directed colimit of finite tensors; vectors may be sums and need not be pure tensors. |
| `AF.2/spherical-dimension-one` | verified | Spherical fixed vectors have dimension at most one, including zero; global reductive spreading-out is not supplied by a local hyperspecial example. |
| `AF.2/flath-factorization` | verified | Finite corners and local compatible modules give algebraic factorization; the separate unitary Hilbert factorization is not substituted for it. |
| `AF.2/nongeneric-automorphic` | verified | The constant representation is automorphic but noncuspidal on split GL₂ and has no nontrivial Whittaker coefficient. |
| `AF.2/holomorphic-sl2-forms` | verified | Hilbert holomorphy and parallel weight are explicit; rational structure is over a suitable number field, with fractional-ideal Fourier indexing. |
| `AF.3/unipotent-quotient-compact` | verified | Unipotent characteristic-zero filtrations reduce compactness to the additive quotient; probability measure and integration in stages come from AA. |
| `AF.3/constant-term` | verified | The constant term integrates over N(F)\\N(A), not N(A); it preserves right actions, and its parabolic target has the correct left invariance. |
| `AF.3/constant-term-transitivity` | verified | AS §0.51 supplies normalized integration in stages; AF retains rational conjugation and maximal-standard-parabolic sufficiency. |
| `AF.3/cusp-form` | verified | Cuspidality is the common kernel of actual proper rational constant terms; the L² version uses almost-everywhere maps and a closed subspace. |
| `AF.3/anisotropic-cuspidal` | verified | Anisotropy modulo the centre excludes proper rational parabolics; compactness is the separate AA arithmetic quotient theorem. |
| `AF.3/cusp-form-rapid-decay` | verified | Rapid decay is on Siegel sets modulo the split centre with fixed central character; the original Fourier/integration-by-parts proof remains a gap. |
| `AF.3/cusp-forms-square-integrable` | verified | Unitary central-quotient square integrability follows from decay and volume; density additionally consumes discreteness and central-finite smooth vectors. |
| `AF.3/cuspidal-spectrum-discrete` | verified | Corrected smoothing kernels and compact operators supply discreteness, orthogonality and finite multiplicity; pointwise decay alone cannot do so. |
| `AF.3/cuspidal-automorphic-representation` | verified | Cuspidal occurrences include a Hilbert embedding and smooth compatible-module comparison; nonunitary twists use a separately stated convention. |
| `AF.3/sl2-generation` | verified | Bruhat reduction gives t(c)w rather than w; conjugating upper to lower unipotents still proves elementary generation. |
| `AF.3/sl2-fourier-vanishing` | verified | Fourier uniqueness, local unipotent averaging and strong approximation prove vanishing at nonzero parallel weight; the constant term is treated separately. |
| `AF.3/maass-cusp-forms` | verified | The classical Maass carrier precedes adelization; p^{-1/2} normalization, Casimir sign and the unproved imaginary Bessel branch remain visible. |
| `AF.4/algebraic-weight` | corrected | Restored k≥2 to the GL₂ Sym^{k-2} dimension Check. Integral character lattices and algebraic integration are not supplied by Lie classification alone. |
| `AF.4/infinitesimal-character-of-weight` | verified | The highest-weight character is chi_{lambda+rho}; strict-chamber uniqueness and duality include the full central parameter. |
| `AF.4/c-l-algebraic` | verified | C/L integrality uses the specified GL_n half-determinant twist; no general twisting element is assumed without an integral-character supplier. |
| `AF.4/cohomological-representation` | verified | Cohomological means a nonzero relative group with an algebraic coefficient; full compact and identity-component conventions remain distinct. |
| `AF.4/wigner-lemma` | verified | ALS.F.7 supplies Wigner's central-character obstruction; the differentiated contragredient sign and compact-central obstruction are both retained. |
| `AF.4/l0-q0-invariants` | verified | Ranks are absolute complexified Lie ranks and q₀ uses the symmetric-space dimension; real and complex places have different contributions. |
| `AF.4/borel-wallach-tempered-range` | verified | The tempered range and binomial dimensions retain the correct pair, coefficient and component assumptions; the original proof remains a refinement. |
| `AF.4/vogan-zuckerman` | verified | The fundamental Cartan may have a split part; Hermitian Hodge formulas require the additional compact-centre scope. |
| `AF.4/gln-tempered-cohomological` | verified | The real GL_n classification retains the odd-dimensional sign choice and component action; purity/genericity are separate inputs to essential temperedness. |
| `AF.4/clozel-purity` | verified | Cuspidal GL_n purity first removes the real central norm twist; the generic unitary classification then excludes complementary exponents by algebraicity. |
| `AF.4/hermitian-positive-system` | verified | The noncompact holomorphic roots do not determine the compact positive root; the explicit GSp₄ lattice and central parity are fixed separately. |
| `AF.4/coherent-relative-cohomology` | verified | The noncompact Hodge stabilizer must be quotiented by A_∞ after tensor-central balance; the compact-pair complex cannot accept it unchanged. |
| `AF.4/gsp4-discrete-series` | verified | The four GSp₄ chambers, shifted coherent parameter and contragredient convention agree with the Calegari–Geraghty coordinates. |
| `AF.4/bhr-coherent-cohomology` | verified | The contributing degree and dimension are retained without extending Harris's false full-disconnected-group vanishing statement. |
| `AF.4/mirkovic-tempered-coherent` | verified | Temperedness is a hypothesis of the Mirković discrete/limit criterion; the original proof remains distinct from Harris's recorded statement. |
| `AF.4/bhr-large-weight` | corrected | All three BHR contracts are specified: uniform arithmetic root-wall bound, fixed-central local two-limit criterion and arbitrary-irreducible H⁰/tempered degree classification. Corrected the intended local quantifier to fix c before R. |
| `AF.4/harris-limits-gsp2g` | verified | The rational character space accommodates rho; minimal Levi-coset representatives have lengths 0,1,2,3 in genus two, so E8 remains rejected. |
| `AF.4/holomorphic-ds-sp2n-unn` | verified | Scalar holomorphic lowest K-type has the strict discrete-series bound and the separate limit boundary for the two classical families. |
| `AF.4/coefficient-lattices` | verified | Local compact-group orbit sums yield stable lattices; almost-everywhere integral coaction and the other-place tensor factors remain global obligations. |
| `AF.4/rationality-field` | verified | The field of rationality is defined by finite-part Aut(C) stabilizers; descent to a model is a theorem, not part of the definition. |
| `AF.4/clozel-rationality` | verified | GL_n has a model over its rationality field under Clozel's hypotheses; the general-group statement only gives the explicitly conditional finite extension. |
| `AF.4/torsion-hecke-eigenclasses` | verified | Eigenclasses must be nonzero; finite-field characters have maximal kernel without surjectivity, and reduction is useful only with nonzero image. |
| `AF.5/gl1-dictionary` | verified | GL₁ irreducible subquotients are Hecke characters; generalized central translates may include polynomial logarithms before taking irreducibles. |
| `AF.5/gl2-classical-to-adelic` | verified | Adelization has the stated slash, inverse nebentypus and rotation convention; existing modular forms are imported with their determinant normalization. |
| `AF.5/gl2-dictionary` | verified | The modular/automorphic inverse uses Cauchy–Riemann and polynomial cusp growth; boundedness of y^{k/2}\|f\| is not asserted for Eisenstein forms. |
| `AF.5/gl2-hecke-normalisation` | verified | The raw adelic operator is p^{1-k/2} times classical T_p and unitary normalization gives a_p/p^{(k-1)/2}; pinned Hecke maps need that scalar bridge. |
| `AF.5/algebraic-modular-forms` | verified | Gross rational and continuous p-adic coefficient actions are different conventions; finite generation does not force an open kernel. |
| `AF.5/algebraic-modular-forms-structure` | corrected | Separated class-set finiteness from stabilizer finiteness; the proof now explicitly uses the compact-mod-A_∞ and discrete-rational-centre hypotheses, not compactness modulo centre alone. |
| `AF.5/transport-compatibilities` | verified | Weil restriction uses the actual point/Lie comparison; product constituent extraction and central generalized-character decomposition are separate proof tasks. |
| `AF.1a/absolute-lie-cochain-complex` | verified | All-degree absolute Chevalley–Eilenberg cochains extend the existing degrees zero through two, preserving the bracket-first differential sign. |
| `AF.4/kostant-parabolic-cohomology` | verified | ALS.4.5 owns Kostant's full-Levi splitting/descent theorem; AF retains dot-action, left-coset and coefficient comparisons, without an integral formula. |
| `AF.2/finite-corner-tensor-factorization` | verified | The native corner handles arbitrary submodules; Schur needs algebraic closure plus finite dimension before the commutant is scalar. |
| `AF.2/archimedean-hecke-algebra` | verified | Bi-K-finite distributions supported on K have the U(k)-balanced PBW description; convolution and nondegenerate-module equivalence remain analytic targets. |
| `AF.1/normalized-real-parabolic-induction` | verified | General normalized real induction is independent of globalization and precedes Langlands classification; compact-picture estimates provide the SF structure. |
| `AF.2/central-translation-finiteness` | verified | Central translates stay in one finite-dimensional fixed-type space; Artinian joint-character decomposition uses finiteness, not differential centrality alone. |
| `AF.5/central-character-algebraic-modular-forms` | corrected | Clarified that central class-set finiteness follows by quotienting AA's ordinary finite class set. Effective stabilizers and coefficient descent remain separately requested. |
| `AF.4/local-stable-lattice` | verified | A compact subgroup has a finite orbit of a lattice because its setwise stabilizer is open; commensurability and conjugation retain full-span hypotheses. |
| `AF.1/gl2-algebraic-weight-model` | verified | The compact-Cartan triple differs from the split diagonal triple; boundary coefficients vanish and the Casimir computation keeps the correct sign. |
| `AF.4/cohomological-with-coefficient` | verified | A supplied finite coefficient uses the actual tensor relative complex; Wigner compares the contragredient infinitesimal character, not the undualized one. |
