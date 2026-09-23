# Independent review: Lie groups and the Lie algebra correspondence

**Accepted after corrections.** Reviewer **Codex — codex-7e92bd**, 23 September
2026, job `REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups`,
[issue #128](https://github.com/CBirkbeck/tauceti-explorer/issues/128).
The original author was **ChatGPT Pro — cgp-14f035649b9f**,
[issue #61](https://github.com/CBirkbeck/tauceti-explorer/issues/61).
This is an independent review, not a self-review.

Retain 13 original links and all 11 overlap recommendations. Remove one valid
but duplicate Haar dependency, referencing its CompactGroups packet instead.
Add one inferred link from LieGroups9 to AF.1a, restricted to the real reductive
cases where global Cartan decomposition supplies the needed contraction.
The final packet has **14 links, 11 overlaps and 217 other-roadmap screening
records**. No upstream roadmap is rewritten or represented as implemented.

## Reading and evidence

Read all **34 distinct original endpoint/overlap stage descriptions in full**,
including all ten LieGroups stages, and the original handoff. Also read 13
candidate stages in full: ShimuraData D1/D5, AF.4/AF.1a, ALS.2, ReductiveGroups2,
SpinRepresentations2/5/7, UniversalCovers4, LieHighestWeight7, AlgebraicTopology6
and HeegaardFloer F0. These are mathematical roadmap contracts; this review
neither certifies their proofs nor imports their embedded library assertions.

Consulted `data/library-coverage.json` and the audit catalogue. No LieGroups
coverage rows or result with LieGroups as an audited roadmap were found in the
checked snapshot; neighboring audit references are not a LieGroups implementation
certificate. This review makes no new claim that a Lean declaration exists or is
missing. In particular PBW and the differential-operator identification are
linked as existing roadmap targets, not scheduled again as independent projects.

Of the 28 original quotations, **18 were not raw verbatim substrings** because
line breaks or indentation had been normalized. All matched after whitespace
normalization. Restored the raw text and its exact line locators before removing
the duplicate entry. Added three quotations for the new edge and 37 for the
overlap checks. All **66 final evidence entries** are exact substrings of their
named raw README files. The original handoff's claim that all 28 already matched
raw line ranges was too strong.

Checked 33 input files byte-for-byte against GitHub main, including the original
packet, atlas, coverage file, relevant READMEs, sibling packets, current additional
roadmap definitions and validator. Fingerprints are recorded below. The packet's
original author provenance remains historical, clearly distinguished from this
review's current inputs.

## Every original link and the addition

`LG` denotes LieGroups, `LHW` LieHighestWeight, `CG` CompactGroups, `GT`
GeometricTopology, and `Spin` SpinRepresentations. Numbers refer to layers;
full stable IDs and evidence are in the packet.

| Supplier → consumer | Decision and checked contract |
| --- | --- |
| AdoIwasawa5 → LG4 | Keep. Specialize the finite-dimensional characteristic-zero faithful representation to R, choose a basis, and apply Frobenius in the matrix group. The algebraic Casimir-based Weyl/Levi route avoids a cycle through compact integration. Positive-characteristic Ado is unnecessary. |
| LHW3 → LG5 | Keep. General-field PBW provides the filtration and ordered basis after specialization to R. It does not require the arbitrary Lie group to have semisimple Lie algebra. The differential-operator isomorphism still needs the symbol/filtration comparison. |
| LHW4 → LG8 | Keep. The semisimple highest-weight classification identifies the constructed section module. The weight must be a character of the chosen group's Borel; holomorphic integration and descent through a central kernel are additional steps. |
| CG0 → LG6 | Remove only as a duplicate. The finite nonzero normalized Haar measures on both G and T are the correct input. The same arrow is now in the CompactGroups packet, so `alreadyRecorded` retains it with its current blob. The Weyl density and factor remain LG6's theorem. This does not accept the rest of the sibling packet. |
| HopfRinow1 → LG0 | Keep. The general boundaryless C1 Banach-manifold inverse-function prefix applies to the finite-dimensional real exponential after its derivative is proved to be the identity. Neither geodesic completeness nor equality with the Riemannian exponential is used. |
| LG1 → Spin3 | Keep. Differentiate conjugation in the real Clifford-unit group and compare with the bivector commutator. Spin owns its polar-form normalization. The complex version requires a complex-linearity comparison; this is not an arbitrary-field analytic theorem. |
| LG3 → Spin3 | Keep. The smooth double-cover homomorphism can be differentiated once Spin supplies the smooth structures and local-covering comparison. Its abstract Clifford group construction is independent of these analytic steps. |
| LG3 → AF.1 | Keep. Differentiate the compact-group action on finite-dimensional K-stable pieces and pass to the locally finite union; extend scalars to the complex Lie algebra. Fréchet globalization and differentiation of infinite-dimensional actions need separate analysis. |
| LG5 → AF.0 | Keep. The enveloping-algebra/left-invariant-operator comparison supplies the archimedean operator algebra for uniform moderate growth. AF.0 owns continuity, seminorms, growth estimates and the right-action/opposite/sign convention. |
| LG9 → ALS.0 | Keep, clarify handedness. Under actual global Cartan hypotheses, K×p identifies K\G with p. Inversion supplies the G/K convention, and radial contraction gives contractibility. Reductive-center corrections, components, arithmetic stabilizers and neatness remain ALS work. |
| LG7 → ShimuraData D2 | Keep only the stated compact-real-form existence milestone. The algebraic-to-analytic group comparison and Cartan positivity criterion are still needed. The false assertion that a noncompact real G is itself maximal compact is not an input. |
| LHW9 → LG8 | Keep. The reductive classification adds the central weight to the semisimple highest weight. Only central weights integrating to actual group characters and descending through the chosen quotient qualify. This is not complete reducibility of all reductive Lie-algebra modules. |
| LG5 → GT8 | Keep. The cover prefix supplies the smooth universal covering group of SL2(R), used for the SL2-tilde geometry. The metric, maximal isometry group and carrier comparison are separate GT constructions; the cover theorem does not prove geometrization. |
| LG4 → GT10 | Keep. The named general constant-rank smooth Frobenius prefix supplies the distribution/flat-chart equivalence. It must be available for arbitrary finite-dimensional manifolds, independently of Ado/Lie III. Leaves, tautness and Euler classes remain GT work. |
| **LG9 → AF.1a** | **Add, inferred**, marked `addedBy` with this job. Global Cartan decomposition supplies the smooth contraction in real reductive cases, explicitly including the GL_n(C)/U(n) acceptance example. AF.1a's more general finite-component Lie-group theorem needs an additional argument; its cochain maps, resolutions, coefficient topology, component action and cup compatibility are not supplied by this edge. |

All retained directions are supplier to consumer. The existing explicit
classifications for Ado, PBW and highest-weight identification remain; the
remaining matches are conservatively inferred. The new edge is absent from
other link packets and the recorded world. The checker finds no cycle.

## Every overlap

| Original overlap | Decision and ownership boundary |
| --- | --- |
| HopfRinow1 / LG0,4 | Rescope. Reuse the shared inverse-function/local-flow prefix. LieGroups owns completeness of left-invariant fields and its one-parameter law; HopfRinow owns geodesic completeness. Additional general-flow work beyond upstream scope extends its existing owner through Part II. |
| CG5,6 / LG6,7 | Keep. Generic compact-group Peter–Weyl and Schur theory precede Lie classification. Complexification must not become a prerequisite for generic Peter–Weyl. Distinguish density/closure of finite coefficient sums from every function being a finite sum. |
| LHW3,9 / LG5 | Rescope. PBW stays with LHW, the left-invariant-operator comparison with LG. Restrict scalar central action to finite-dimensional complex irreducibles or supplied infinitesimal-character hypotheses. No duplicate PBW development is planned. |
| ClassicalGroups3 / LG6,7 | Keep. The algebraic torus (C*)^n is not the compact torus (S1)^n. A character-lattice/integration/central-quotient comparison is required. The disconnected O_n extension problem stays separate from Lie-algebra classification. |
| ReductiveGroups3,7 / LG2,8 | Keep. Fppf quotient representability and positive-characteristic subgroup schemes are not analytic closed-subgroup theorems. A specified characteristic-zero analytification comparison can connect the two owners. |
| LG8 / D3 / AutomorphicBundles B0 | Rescope. Full flags and Borel-character line bundles do not supply arbitrary partial flags or vector bundles from parabolic representations. Extra analytic G/P geometry belongs in a LieGroups Part II extension. D3 owns Hodge parabolics, the Borel embedding and reflex-field descent; ReductiveGroupsPartII owns generic torsor-associated bundles; B0 owns its coefficient descent comparison. |
| LG9 / RG2.4 | Keep. Real and nonarchimedean Cartan/Iwasawa decompositions have different groups, compact subgroups and valuation data. A shared theorem name is not a dependency. |
| LG7 / D2 | Rescope as an upstream correction request. Separate compact-group complexification from noncompact real forms, with continuous source maps, holomorphic target maps and actual global group hypotheses. New scope extends through Part II; this review does not replace upstream Layer 7. |
| LG3,4 / AC.3 | Rescope. Global nilpotent BCH and the exponential diffeomorphism need an extension beyond local BCH, routed to LieGroups Part II. Rational Malcev bases, lattices, filtrations and coordinate-height/complexity bounds remain AdditiveCombinatorics work. |
| LG7,9 / BorelRegulators R.3 | Rescope. The extra compact-dual construction for a specified symmetric pair needs k+i p, actual groups/subgroups and central quotients; route it to LieGroups Part II. Stable cohomology and arithmetic ranges remain BorelRegulators work. AF.1a is the existing van Est supplier. |
| LG2,6,8 / ALS.0 / GN.4 / AC.3 | Rescope. A shared closed-H homogeneous-quotient extension needs a Hausdorff smooth G/H, submersion, local sections, tangent quotient and action compatibility. Route beyond-upstream work to LieGroups Part II. Normality is necessary for quotient-group structure. Discrete translations on G are free even with torsion; stabilizers on G/K are separate. Measures and dynamics remain with the arithmetic consumers. |

The original proposals repeatedly said to add units to or split existing Tau Ceti
layers. Clarified these as existing-owner correction requests or Part II
extensions under PROTOCOL section 15. No new roadmap ID or presumed implemented
API is invented here.

Three elementary checks confirm the source cautions. In LG2's displayed sequence
criterion, t_n=0 and X_n=X make the right side true even for H={1}, although only
X=0 belongs to its Lie algebra; require nonzero t_n. For the one-dimensional
abelian real Lie algebra acting on R² by J=[[0,-1],[1,0]], J²=-I gives no real
invariant line, yet J is a nonscalar central action. Finally, a noncompact real
group cannot be a maximal compact subgroup. These requests were already noticed
by the original author; acceptance of delimited links does not certify their
uncorrected source statements. The exponential derivative's division by ad X
also needs its entire power-series interpretation, since ad X need not be
invertible. Generic difference-quotient proofs must not take limits inside a
nonclosed subgroup without another argument.

## Completeness screen

Searched all ten focal stages against **2,007 stage descriptions and 218 roadmap
texts**, using exponential/flow/IFT, adjoint/bivector, closed subgroup/homogeneous
quotient, differentiation/BCH, Frobenius/integration, universal cover/enveloping
algebra, maximal torus/Weyl integration, compact form/complexification, flags and
Cartan/Iwasawa/compact-dual terms. The 217-entry ledger covers every *other*
current roadmap exactly once. Search hits are screening evidence, not a claim
that unrelated books or every whole document were read.

| Focal layer(s) | Completeness outcome |
| --- | --- |
| 0–1 | The generic IFT input and Spin adjoint comparison are already present. ReductiveGroups2 is algebraic, while ShimuraData D1's adjoint example is an algebraic representation of the Deligne torus; neither creates an unconditional real-analytic arrow. |
| 2 | The homogeneous quotient needed by arithmetic consumers is an extension proposal, not a theorem supplied by embedded-subgroup charts alone. Profinite closed subgroups and infinite-dimensional diffeomorphism groups are different contracts. |
| 3–4 | Local BCH is not the global rational nilmanifold interface; AC.3 remains an overlap. Frobenius of distributions matches GT10; arithmetic Frobenius and Frobenius algebras are vocabulary collisions. Spin5 routes its differentiation comparison through Spin3 already linked here. |
| 5 | UniversalCovers0/1→LG5 remain recorded in their sibling packet. Spin2/7 construct particular double covers and prove connectivity separately, so universal-cover existence does not prove their simple connectivity. AF.4's rational structures and general infinitesimal-character theory do not follow from finite-dimensional Schur alone. LHW7 is stronger semisimple central-character theory, not required to define the arbitrary-group differential-operator carrier. |
| 6 | RootSystems1→LG6 already exists; Haar normalization is now a sibling duplicate. Spin5's half-weight character evaluation still needs its chosen group character lattice, not just a generic compact torus theorem. The fixed-point/degree proof of torus exhaustion lacks a precise supplier: AlgebraicTopology6 imports degree from HeegaardFloer, whose F0 passage states Sard/Fredholm rather than this fixed-point contract. Preserve that unresolved request. |
| 7–8 | Compact-real-form supply to D2 is retained. Partial flags/automorphic bundles need the explicit extensions above; ShimuraData D5 reuses its own datum constructions. RootSystems2→LG8 is already recorded. |
| 9 | Add the AF.1a reductive-case contraction link. ALS.0 remains an existing consumer. ALS.2's Levi spaces reuse that symmetric-space interface; their boundary gluing and nilmanifold fibrations need further arithmetic data. RG2.4 remains a nonarchimedean overlap, not an arrow. |

Five sibling arrows are recorded with source packet/blob provenance in
`alreadyRecorded`: the two RootSystems arrows, the two UniversalCovers arrows,
and the Haar arrow. Only the last was removed from this packet; the mathematical
dependency is preserved. The review does not accept or alter those sibling jobs.

## Validation and limits

Changed only the link packet and this report. Preserved all 13 retained original
endpoint pairs and their confidence labels, and all 11 overlap endpoint lists.
The review object records one duplicate removal and one new edge; the latter
also carries `addedBy`.

* `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups.json`: **0 errors, 0 warnings**.
* `python3 research/blueprint/intake.py check-files research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups.json research/blueprint/reviews/REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups.md`: **2 files, 0 problems**.
* Exact raw-substring checks for all 66 quotations, current source hashes, unique
  examined IDs, retained endpoints, duplicate exclusion and scope checks passed.

No Lean deliverable is required or changed, and no compilation is claimed.
No git commands were run. Submission uses the GitHub API. The remaining source
corrections, general quotient construction, compact-dual and partial-flag
comparisons, degree input and nonreductive AF.1a contraction remain real proof or
ownership obligations. The accepted verdict concerns the documented links and
scope recommendations, not completion of those mathematical constructions.

## Input fingerprints

The packet hash below is the original review input, before this review's edits.

| Input | SHA-256 |
| --- | --- |
| `content/campaign/AdditiveCombinatorics/README.md` | `cba3707cbfc60130dc36ef826474df22020ab66555523c71d1afa4a450d7cc55` |
| `content/campaign/ArithmeticLocallySymmetricSpaces/README.md` | `e08c8acacd68d8f7793a6f65e9f8925901ec1214927a6d675304607f601999ac` |
| `content/campaign/AutomorphicBundles/README.md` | `78427b9e67f1a0638f35af54b66fb4a6df6bb8fd0d72f1220089c16db87551ad` |
| `content/campaign/AutomorphicFormsOnReductiveGroups/README.md` | `4e6ae7140d07ec04153f23f893104305a28cddb3dc8e88894522f02dc6fd0bc3` |
| `content/campaign/BorelRegulators/README.md` | `e527ad629fbd0b6553fe20da6a8430ef64ec9bda701d78a5c51eed652545ff83` |
| `content/campaign/GeometryOfNumbersAndQuadraticArithmetic/README.md` | `57f8b849bc9b1f57959720e5c79db4ccb1c3d95305b455aa91f3e03029731398` |
| `content/campaign/ReductiveGroupsPartII/README.md` | `0753d181fb761edbd5688777896b40f2d131c4af1ad49f43847cd4b84cddf423` |
| `content/campaign/ShimuraData/README.md` | `288531ce0c46b80166f4688a70b84e92e13d0685e475a5308d3cfeed416c9976` |
| `content/tau-ceti/GeometricTopology/README.md` | `89dae39e7ec3ac1484718e77154e5f8350b59cf0be3e0523c25f226ac28f97b3` |
| `content/tau-ceti/HopfRinow/README.md` | `428e9e97279c173646e34a605516bdccc5e2ccaa841a89c77171c615d1d965c7` |
| `content/tau-ceti/ReductiveGroups/README.md` | `b6888bb0f65d0f4a7686c047ee2d3204d019fb3e6c35fc0bd83b531ef10b4c1b` |
| `content/tau-ceti/RepresentationTheory/AdoIwasawa/README.md` | `3115472bff07b45e46316d62353d8fc75d7c0bcad4f862fd01d6e44e8df1dc43` |
| `content/tau-ceti/RepresentationTheory/ClassicalGroups/README.md` | `9bfaeef36584d5bf627e5df74a637abcc0620da5e1f0459460282f4741141622` |
| `content/tau-ceti/RepresentationTheory/CompactGroups/README.md` | `42a5bbc72d27856cf88d1692a0dfb2e5dbe56d5da544a1a92c33f395734a0522` |
| `content/tau-ceti/RepresentationTheory/LieGroups/README.md` | `fe49bc9f716eb31a0e117f4c40aa7da36f4ca14be0434e6ff1453c043c45ebff` |
| `content/tau-ceti/RepresentationTheory/LieHighestWeight/README.md` | `bae7b8e787f0aa2e6f952bceca0dc43be2e7fdc6c6ca5cee5b954476ea69434d` |
| `content/tau-ceti/RepresentationTheory/SpinRepresentations/README.md` | `7cc5096a10684cd9cf1ef6069c12d9eb8de034fd032900cfef1c33267732221d` |
| `content/tau-ceti/UniversalCovers/README.md` | `fbe227b0c3a1c352d6058e216db431c69444affe6b5f2ee0aa352909a751ddb6` |
| `data/atlas.json` | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |
| `data/library-coverage.json` | `6fe73095d574e7f98497e0dcc0eeec3a9ab0a2c04b4eed98ded8e678a3adea7a` |
| `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_CompactGroups.json` | `c7f0aaf1f56e65dad43a5512c406f6dd74a6b5870c10a3bfcf9cdffd5afbfaea` |
| `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups.json` | `7d901fed4e57fe3ed0b71de9e914297f3c068ffa9a3dc77ffc543313f372a42d` |
| `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_RootSystems.json` | `81428ee5abd4b1b98ef5fe5f6c8f72303fcb4e67219b03fb64c1ac1d089f6d67` |
| `research/blueprint/links/tauceti_TauCetiRoadmap_UniversalCovers.json` | `866e1a3f219d0fa909b516f3e171ac5c48a0683dbfcf26fae2ee751498a31e40` |
| `research/blueprint/roadmaps/AnalyticHabiroStack.json` | `b6ebaa83923f6ffbbbc5b73495c5527847f1d5fdbba72f3fe305d26ede7aba94` |
| `research/blueprint/roadmaps/AnalyticStacks.json` | `8bf2ae0bc22842249e90d3012a02d4a3c8f0e21d00a79d66cbba449b28f70fc8` |
| `research/blueprint/roadmaps/MordellLawrenceVenkatesh.json` | `9e3a4bb41dcec200da9d585ebb7ae48ad86f2586bd49db05dd78d7f1f991ccf4` |
| `research/blueprint/roadmaps/QWittVectors.json` | `020face16ac29a185f65ba97df49e789f0ce2bb2f08987138e463da590bdcfeb` |
| `research/blueprint/roadmaps/RingStacksAndTransmutation.json` | `dee6c46a99899e6099477de16d6425177379bef1755eb58323d3f1655280f31c` |
| `research/blueprint/roadmaps/SolidAnalyticRings.json` | `9de5144b60ea47695a1cd8c470e429c95edc80676028170daddef3124da90907` |
| `scripts/check_links.py` | `68e601f58203c828c4e746061a6a119d8dbc5c7a3c181f8a8207d99d075ebe89` |
| `content/tau-ceti/AlgebraicTopology/README.md` | `f894faf00311049f7032eb488d43c75bcfeffbafc528010e72b9b679ca0bef3f` |
| `content/tau-ceti/HeegaardFloer/README.md` | `a442c388e741c9070d26e0faf8b073097c9d2e85fa784d1ba085bf85a0a68174` |
