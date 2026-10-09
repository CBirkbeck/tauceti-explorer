# BP-ArithmeticGaloisRepresentations--R01.2

Issue #7956; author Codex; session codex-VCe1mF. This is a completed blueprint pass, not a checkpoint or an implementation. The claim was confirmed by the swarm bot. No other job was claimed.

## Result

The packet has 18 target-level nodes: 5 definitions, 10 constructions, 1 comparison, 1 theorem and 1 application. It includes 89 API items, 45 discriminating tests, 6 planets and 16 declarations verified in the pinned libraries. Every node has implementation status unchecked. The packet status is complete; its only stage, ArithmeticGaloisRepresentations:R01.2, is planned, not closed. There is one supplier-binding gap and four precise supplier requests.

The reader is definitive. It states the local/global comparison, embedding coherence, residual fundamental-character fields of values, finite-residue-field quasi-unipotence, scalar and intrinsic monodromy, corrected Weil action, operations on WD objects, both semisimplifications, special-block classification and separating examples. It identifies every retained parent target and supplies APIs and tests for each new definition or construction. Sources are described in our own words, with section, theorem and printed-page locators; no source passages were copied.

The current WORKERS.md and detail.json require target-level planning. That supersedes the issue's older request for a node for every auxiliary lemma. Those refinements are incorporated into proof sketches and APIs. This part uses new IDs and refines the principal parent nodes without changing the accepted parent packet. The parent is therefore not replaced by this smaller packet in isolation.

## Validation

The following passed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisRepresentations--R01.2.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/ArithmeticGaloisRepresentations--R01.2.lean`: exit zero; every warning is a placeholder-proof warning. The build uses Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Memory was checked before elaboration. No build, cache fetch, project setup or language server was started.
- Cross-file audit: all 89 named API items occur as declarations in the Lean file and in the reader; all 45 test labels occur in both; all nodes remain unchecked.
- Exact rational two-dimensional matrix checks: geometric Frobenius conjugates N by q inverse; the Fτ and τF conjugators have their respective coefficients; swapping those coefficients fails; coordinate rescaling uses the inverse scalar.

Elaboration checks signatures, not proofs. In particular the file does not prove Grothendieck's theorem by accepting its unique-existence witness.

## Remaining supplier binding and assembly

The pinned build lacks the genuine local Weil-group carrier and the current tame-character implementation. The suggested file consequently exposes a general linear-algebra interface parameterized by W, arithmetic degree and q. It states compactness of inertia and surjectivity of degree where needed. Its monodromy selector requires the full unique-existence statement; its corrected-action constructor requires the open corrected-kernel consequence. The mathematical local-field theorem and these consequences remain explicit targets in the reader and accepted parent. No unknown proposition carrier or substitute Weil-group definition is introduced.

An assembly or signature-integration follow-up must:

1. Bind W and degree to ClassFieldTheory Layer 9's WeilGroup, weilDegree, weilToAbsolute and inertiaToWeil. Use the Weil topology and its open embedding of the original profinite inertia topology; openness of inertia alone does not determine the right topology.
2. Bind the completion comparison to NumberFieldArithmetic Layer 5.6's finite decompositionHom, its bijectivity and completionCongr conjugation/residue comparison. The absolute inverse-limit comparison and its Krasner injectivity argument retain their arithmetic parent owner.
3. Bind the residual adapters to LocalFieldsRamification Layers 2 and 4. Current Tau Ceti already constructs the finite Kummer and ℓ-adic tame characters; transport their values to the selected unramified residue field and coefficient field. For general residue degree f, choose an unramified extension whose absolute residue degree is divisible by n; do not demand a residue-p^n extension when f does not divide n.
4. Instantiate the local monodromy theorem on the genuine carrier and the bundled R01.1 continuous objects, and state the categorical exact-equivalence operations using those supplier types. The reader inventories the supplier-dependent signatures omitted from the prototype.
5. Replace the parent's bundled WD carrier/API signatures by these refinements. Preserve its ancillary Euler-factor, purity, epsilon-factor, monodromy-filtration and arithmetic-example targets and their existing gaps. Use the six planets chosen here instead of the union of the parent and part selections. No ancillary gap is claimed closed by this pass.

The four requests in the packet are for these existing suppliers, not for a second construction of their objects. No ownership move to or from a higher-tier roadmap was needed. The accepted LPV.1 owner supplies nilpotent-filtration linear algebra; R01.2 retains its WD stability comparison.

## Conventions requiring preservation

Arithmetic Frobenius has degree 1; r(Φ)N=qNr(Φ). Geometric F has degree −1. The unnormalised Sp(n) has weights 1, ω, …, ω^(n−1) and N sends each basis vector to the next one. Bushnell–Henniart's normalisation is translated by twisting its irreducible factor.

Frobenius semisimplification changes r by the inverse degree power of the commuting unipotent Jordan factor and retains N. Categorical semisimplification has N=0 and semisimple r; only its isomorphism class is canonical. Sp(2) distinguishes them. An unramified nontrivial unipotent Frobenius with N=0 distinguishes the full representation from its Frobenius semisimplification. The source's side-dependent change-of-Frobenius conjugator and inverse tame-coordinate scaling are essential; the packet references the parent's already confirmed E202 and E250 rather than duplicating those errata.

## Sources and current-library audit

Read Deligne, *Les constantes des équations fonctionnelles des fonctions L*, §3.12, p. 533, and §§8.1–8.6, pp. 566–570, from the public IAS PDF. Definition 8.4.1 is on p. 568; Definition 8.4.2 and Lemme 8.4.3 are on p. 569. Read the tame-character and fundamental-character results in Serre, *Propriétés galoisiennes des points d'ordre fini des courbes elliptiques*, §§1.3–1.8, pp. 264, 266–268, from the scanned public PDF. The packet records public URLs, access date and PDF hashes.

Read the maintainer-cleared Bushnell–Henniart book directly: §28.7, pp. 185–186; §§31.1–31.2, pp. 200–201; §§32.2–32.7, pp. 203–208. Its §31.2 exercise supplies the special-block classification source the parent lacked; §32.5 supplies the finite-residue-field quasi-unipotence proof and §32.6 the corrected-action choice comparison. No book file, extracted book text or passage was saved in the repository or scratch. Tate's Corvallis Part II chapter was not available as a cleared source and was not read; no classification claim relies on having read it. The cleared alternative resolves that source need.

The read-only current Tau Ceti audit used commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, with Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a. Its Character and PadicCharacter modules already export inertiaKummerCharacter, the power transition, inertiaTameCharacter, quotientWildInertiaSubgroupEquiv, inertiaPadicTameCharacter and arithmetic-Frobenius equivariance. These are documented separately from the pinned baseline and never planned again. Current LocalFieldsRamification, ClassFieldTheory, NumberFieldArithmetic and LocalGaloisGroups interfaces were checked for duplication. LocalGaloisGroups does not supply a second WD theory. The relevant links were audited; no upstream roadmap or link file was edited.

The next action is independent review of the complete pass, followed by assembly and the precisely listed supplier binding. No scratch artifact is required to resume.
