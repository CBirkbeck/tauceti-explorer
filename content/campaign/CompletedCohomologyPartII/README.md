# Roadmap: Completed cohomology, homology and arithmetic towers — Part II

## Ownership and scope

Construct the reusable completed-cohomology machinery for towers of arithmetic locally symmetric spaces and finite-level Shimura varieties, in arbitrary reductive-group dimension. This is a substantial successor to the finite-level cohomology suppliers, not an extension of the GL₂ p-adic local Langlands correspondence. CompletedCohomologyAndLocalGlobalCompatibility R31 owns the modular/Shimura-curve application and its Banach local–global theorem. ArithmeticLocallySymmetricSpaces ALS.6 and TorsionCohomologyInfrastructure TC.2 consume this construction; neither is a prerequisite of its early stages.

The generic coefficient/derived-limit owner is ArithmeticGaloisDuality R02.1–R02.3/D7; completed algebras and their topology come from PadicMeasuresIwasawaAlgebras L1. The application here proves tower-specific finiteness, comparison and continuity. Smooth local representations come from SmoothRepresentationsOfLocalGroups; locally analytic vectors are an additional functor, not the definition of completed cohomology.

## Conventions

Fix a rational prime p, a finite extension E/Q_p, its valuation ring O and uniformizer ϖ, and compact tame level Kᵖ. In particular O/ϖˢ is finite; arbitrary complete local coefficient rings require separately proved hypotheses. Let K_p range over compact open subgroups of the local group with transition maps for inclusions and conjugations. Record whether each map on cohomology is pullback, trace/corestriction, or dual pushforward. For ordinary coefficients use the conventional module

`H̃ⁱ(Kᵖ,O) = lim_s colim_Kp Hⁱ(Y(KᵖK_p),O/ϖˢ)`.

Keep this degreewise completion distinct from the cohomology of the derived object `Rlim_s colim_Kp RΓ(Y(KᵖK_p),O/ϖˢ)`. They agree only after the appropriate Mittag–Leffler/derived-limit proof. Ordinary, compactly supported, boundary, Borel–Moore and interior cohomology are separate constructions; an image defining interior cohomology need not commute with limits. Coefficient local systems and group actions retain integral lattices and central character conventions.

<a id="cc-0"></a>

## CC.0. Finite-level towers and support data

**Dependencies:** ArithmeticLocallySymmetricSpaces ALS.0–ALS.4 for arithmetic quotients, finite-level complexes and coefficient systems; the relevant classical étale/singular comparison for a Shimura application. No ALS.6 or TC.2.

Construct the indexing categories of levels and their cofinal normal/pro-p sequences. Specify actual finite covering correspondences, composition identities and conjugation maps. At levels with stabilizers use the stack/orbifold or derived group-cohomology model and retain torsion; passing to a neat cofinal tower requires a proof and does not erase stabilizers at descended levels. For compact support choose compatible compactifications or the functorial `j!` model and construct its trace maps. Compare singular, cellular and étale finite-coefficient models only with the precise finite-type/characteristic hypotheses.

<a id="cc-1"></a>

## CC.1. Torsion colimits and the smooth group action

**Dependencies:** CC.0; SmoothRepresentationsOfLocalGroups SR.0.

Construct the filtered colimit at fixed s in modules and derived modules. Prove independence under cofinal restriction, exactness where used, and the action of the full local group by conjugating levels. Show that each torsion class has an open stabilizer and that the action is smooth. Construct commuting tame Hecke operators from double correspondences with explicit pullback/trace normalization. Prove the Mackey and restriction/corestriction identities needed for later descent, including degree factors; do not invert them integrally.

<a id="cc-2"></a>

## CC.2. Completion, derived inverse limits and topology

**Dependencies:** CC.1; ArithmeticGaloisDuality R02.1–R02.3/D7.

Construct the inverse systems in s and their topological inverse limit, its O-module topology, separatedness and completeness. Construct the derived inverse limit of complexes and the Milnor exact sequence; exhibit the possible lim¹ term rather than commuting completion and cohomology formally. Prove sufficient surjectivity/Mittag–Leffler criteria at each use. Compare reduction of the completed module with its finite-coefficient counterpart under explicit torsion/control hypotheses, and record counterexample tests when these fail. After inverting p construct the natural unitary Banach module when the integral lattice satisfies the required completeness and boundedness conditions. Prove continuity of group and Hecke actions, not just algebraic equivariance.

<a id="cc-3"></a>

## CC.3. Continuous duals and completed homology

**Dependencies:** CC.2; PadicMeasuresIwasawaAlgebras L1.

Construct continuous O-linear and Pontryagin duals with their correct coefficient targets and compact/discrete topologies. Identify the dual of the smooth torsion colimit as a projective system and construct completed homology with the corresponding transfer direction. Prove its module structure over O[[K₀]] for a compact open K₀, and distinguish left modules from the opposite action arising by duality. Establish biduality only in its compact/discrete or admissible category, and prove compatibility with localisation/completion rather than assuming continuous duals commute with all base change.

<a id="cc-4"></a>

## CC.4. Finite-level chain models and the completed tower complex

**Dependencies:** CC.0–CC.3; ArithmeticLocallySymmetricSpaces ALS.3–ALS.4; DeformationAndDerivedPatchingAlgebra P7 for the already-constructed perfect-complex language.

Build cellular complexes on finite CW or Borel–Serre models and equivariant lifted cell complexes on a cofinal torsion-free tower. Prove their comparison with singular/étale cochains and the compatibility of all refinement maps. Under a finite-cell compact quotient hypothesis and a compact p-adic analytic K₀, produce bounded complexes of finite free/projective O[[K₀]]-modules in the source's homological convention. Separate a finite projective complex from projectivity of its individual homology groups. Explain the replacement used in the presence of torsion stabilizers or noncompact spaces, and preserve boundary chains rather than assuming a compact quotient. Prove that derived finite-level coinvariants recover the stated finite-level complex; underived invariants are not a substitute.

<a id="cc-5"></a>

## CC.5. Noetherian finiteness and admissibility

**Dependencies:** CC.3–CC.4; PadicMeasuresIwasawaAlgebras L1.

Use the noetherian completed algebra of a compact p-adic analytic group and the actual finite-cell tower model to prove finite generation of completed homology. Prove the dual admissibility criterion and deduce admissibility of completed cohomology in the resulting torsion/unitary Banach categories. State the finite-generation, separatedness and finiteness-of-invariants hypotheses explicitly. No admissibility theorem for arbitrary profinite groups, arbitrary towers or arbitrary complete coefficient rings is exported. Keep finite generation distinct from freeness, projectivity, Cohen–Macaulayness and any cohomological concentration statement.

<a id="cc-6"></a>

## CC.6. Descent and classical comparison

**Dependencies:** CC.2–CC.5; ArithmeticGaloisDuality D7 for continuous Hochschild–Serre; ordinary finite-level coefficient theory from CC.0.

Construct the continuous Hochschild–Serre/descent spectral sequence and its edge maps comparing tower cohomology and fixed-level cohomology. Give the derived invariants formulation and prove functoriality for Hecke maps. For algebraic coefficient systems, construct the classical comparison maps via finite-level evaluation and prove their hypotheses and degree ranges. Only the GL₂ R31 application identifies locally algebraic vectors through its additional local–global theorem. General completed cohomology does not canonically recover every classical form from degree-zero invariants, nor does torsion disappear after declaring a weight regular.

<a id="cc-7"></a>

## CC.7. Compact-support and boundary triangles

**Dependencies:** CC.0–CC.4; ArithmeticLocallySymmetricSpaces ALS.4 and ALS.5:finite-level-duality for finite-level boundary geometry and duality maps. The later ALS.5 automorphic comparison and ALS.6 reexport are not inputs.

Pass the finite-level support triangle `RΓ_c → RΓ → RΓ_boundary` through the derived tower construction, prove exactness and construct its connecting morphisms. Relate these derived limits to conventional degreewise completed cohomology with their lim¹ and torsion errors. Define completed interior cohomology as the specified image and prove each comparison separately. Export localisation-compatible triangles to ALS.6 and TC.2. Non-Eisenstein boundary vanishing, Igusa concentration and compactification-specific geometry are additional arithmetic theorems, not properties of the abstract limit functor.

<a id="cc-8"></a>

## CC.8. Shimura, Galois and Hecke adapters

**Dependencies:** CC.1–CC.7; the selected finite-level Shimura tower and its canonical-model comparison.

Identify the generic completed object with the finite-level modular, Siegel, unitary and Hilbert tower models used by its consumers. Transport finite-level Galois and tame Hecke actions, prove their continuity and commutation with all transition maps, and construct localisation at a specified residual Hecke ideal. Compare with Scholze's §4.2 convention, including its chosen support and lattice. This stage supplies the topological object; automorphic-section comparisons, torsion Galois determinants, vanishing, and Banach local–global compatibility remain respectively TC/IHG/IG/R31 theorems. Export named comparison isomorphisms rather than a second completed-cohomology carrier for each group.

## Sources and acceptance tests

Emerton, *On the interpolation of systems of eigenvalues attached to automorphic Hecke eigenforms*, Inventiones 164 (2006), 1–84, Theorem 0.1 and the continuous-cohomology construction, supplies the proved rational admissibility/descent branch. The integral CC.2–CC.5 package retains the additional topology and torsion arguments; it is not obtained by erasing the tensor with E.

The finite-level/limit construction and GL₂ comparison are in Emerton's 2011 manuscript, §5.1, Appendices A–C and Theorem 1.2.1; the latter is an unpublished, hypothesis-qualified application, not the arbitrary-group theorem. The general compact-support tower and automorphic comparison interface is Scholze, torsion paper §4.2. Calegari–Emerton, *Completed cohomology—a survey*, §1.1 Theorem 1.1 and §1.2 boundary discussion supplies the precise general target, finite-simplicial/analytic-group hypotheses and torsion-corrected duality sequences. It explicitly defers the full proof to a then-in-preparation work: this campaign must prove CC.3–CC.7's cellular/noetherian/duality contracts and does not count that deferral as an acquired proof. Its later codimension and concentration conjectures are not imports.

Test a finite constant tower, a normal Z_p tower with finite CW quotient, nontrivial lim¹ behavior, degree-zero invariants versus derived invariants, and a modular-curve boundary class. The implementation must prove the transfer-normalization and level-refinement checks in addition to compiling the companion Suggested.lean.

## Implementation handoff: Limit order and finite-level recovery

**Stages:** CC.0, CC.1, CC.2, CC.3, CC.4, CC.5, CC.7, CC.8. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

For the actual tower construct the diagram RΓ(Y_K,O/ϖ^s), with restriction, trace and conjugation maps, then filtered colimit in K and derived inverse limit in s. Keep its cohomology distinct from degreewise completed cohomology until the Milnor sequence is controlled. Build finite-cell completed chain models and prove derived coinvariants recover each finite level.

**Acceptance and consumer contract.** Test the constant tower, a Z_p tower and a nonvanishing lim¹ example. Check the opposite action in continuous duality and the boundary connecting morphism. Finiteness of homology over O[[K₀]] uses both finite-cell geometry and the p-adic analytic group theorem; no generic profinite version is inferred. CC.8 exports these same objects to TC and R31.
