# PAPER-FINTZEN-21 — Types for tame p-adic groups

Status: **partial checkpoint**, by Codex, session codex-a71f92, 22 September 2026. Refs #1105.

The complete 39-page [accepted author manuscript, arXiv1810.04198v2](https://arxiv.org/pdf/1810.04198v2), including proofs, footnotes and bibliography, has been read. The [Annals landing page](https://annals.math.princeton.edu/2021/193-1/p04) establishes the published title, author, volume, pages and DOI; the published full text was not obtained. Accordingly, this is not a claim that every manuscript line agrees with the published article. All main-paper locators below and in the JSON refer to v2, dated 3 November 2020.

The extraction has 161 mathematical items: 52 definitions, 15 constructions and 94 theorem items. There are 134 API contracts, 201 planned tests (at least three per definition/construction), 337 directed dependency edges and six routes. Six items reuse exact pinned library declarations, ten import already-planned layers, and all 145 missing items have exactly one route. These counts measure the current inventory, not a certificate of source closure. Nine explicit gaps prevent completion.

## Mathematical endpoint and conventions

Let k be a nonarchimedean local field of arbitrary characteristic, G a connected reductive k-group split by a tame extension, and p its residue characteristic. Under p not dividing the absolute Weyl-group order, Theorem6.1 constructs a contained functional datum in every smooth irreducible complex representation. Theorem7.12 strengthens this to occurrence of a Kim–Yu s-type. Theorem8.1 proves exhaustion of supercuspidals by Yu's construction. Corollary8.3 characterizes supercuspidality for a **maximal** contained datum by minimal terminal-facet dimension and anisotropy of the terminal center modulo Z(G). The two implications are separate items.

The plan retains the distinctions that drive the proof:

- The additive character has conductor the maximal ideal P, not the valuation ring. Functionals have negative depth when the representation character has positive depth. Extension valuations retain the base normalization.
- Buildings are enlarged unless stated otherwise. A point fixer, its connected parahoric and a reduced-point fixer are different groups; the last need only be compact modulo center.
- An almost stable functional has a geometrically closed coadjoint orbit. Almost strong stability also constrains its leading graded reduction. Genericity requires exact depth even for central functionals, whose root-value conditions would otherwise be vacuous.
- Proposition3.12 changes the point: congruence of the generic replacement is at the nearby x', not automatically at the original x.
- The initial datum representation is on the terminal **derived** parahoric quotient and is not assumed cuspidal. Cuspidality is proved later for a different multiplicity factor.
- Length zero, the possible equality G_1=G_2, and the torus case are explicit branches. A torus has trivial Weyl group, so the hypothesis does not imply odd p there; the non-torus finite-Heisenberg argument must not be used at p=2.

## Proof chain and coverage

Section2's five separate root-prime consequences are inventoried. The existing reductive/root infrastructure supplies carriers, not an unproved theorem that every desired lattice calculation follows from good primes.

Section3 passes from invariant bilinear forms and semisimple representatives to centralizer Levis, depth control and generic approximation. Its coroot projection uses prime-to-p saturation. Rational destabilizing cocharacters are needed over the finite perfect residue field; this must not become an extra perfectness assumption on k. The exact equal-characteristic extension of the cited characteristic-zero depth estimate remains a closure task.

Section4's extended, truncated, contained and maximal data are distinct objects. The chain is recovered from successive centralizers, with terminal centralizer equal to that of the sum. Every one of these definitions has an API and boundary tests.

Section5's bracket isomorphism, filtration shift, three error-removal conclusions and the conclusions of each successive correction are separated. In particular, preserving an earlier scalar action and preserving an isomorphism class of an auxiliary subgroup action are not conflated. The half-depth iteration needs explicit termination and filtration gaps.

Section6 minimizes a continuous depth function on a building modulo the relevant action. Openness, closedness, continuity and attainment are separate inputs. Instability would lower the minimum after a rational cocharacter displacement. Positive depth extends the truncated datum, while depth zero selects a finite-quotient constituent. Strict decrease at the next positive depth and properness already at the second centralizer step are recorded explicitly, not hidden in the termination claim.

Section7 first extends toral characters, using positive-depth exactness for tame tori, and then constructs the Heisenberg–Weil tensor κ. The factor ρ is the multiplicity space Hom over K_0+ from κ into a compatible compact constituent, with its conjugation action and evaluation isomorphism. It is **ρ**, not the naive character untwist of the original constituent, whose finite-quotient constituents are cuspidal. The proof uses a corrected Weil restriction formula including a quadratic determinant character. The final type theorem additionally requires the Kim–Yu generic building-embedding condition: a minimal nonnegative defect and a small central displacement provide it. Constructing κ alone proves neither that condition nor the type theorem.

Section8 uses the covering Levi: supercuspidality forces it to equal G. One then passes to the reduced-point inducing group, obtains the required depth-zero supercuspidal factor, applies corrected Yu irreducibility and uses Frobenius reciprocity. The [published construction companion](https://compositio.nl/Content/prize2025_Fintzen.pdf) was read completely, including its Sp10 counterexample to older intertwining claims. Its replacement proof uses the surviving first-half intertwining reduction and a cuspidal fixed-vector contradiction; it does not restore the false dimension-one assertion.

Selected [Kim–Yu passages](https://arxiv.org/abs/1612.04204) were read at proof level: generic embeddings, the definition of a cover, D1–D5, the type/cover theorem and the enhanced equivalence criterion. With a smaller initial compact subgroup the construction can give an S-type for several inertial classes; the maximal compact input is retained for the single s-type application. Selected [Kaletha passages](https://www.math.uni-bonn.de/people/kaletha/spt.pdf) supply tame torus exactness and the separate §3.5 equivalence argument without HM hypothesis C. The relevant [author errata, §6](https://www.math.uni-bonn.de/people/kaletha/errata.pdf) was checked: the invalid later §3.7.4 prime-bound removal must not be confused with §3.5.5.

## Ownership decisions

The current audit snapshot is 773eabf7e534aacedc2f32338ac6b746e0be08b7; the exact reviewed-coverage blob and document blobs are in the JSON. The full Smooth representations, Reductive groups Part II, Metaplectic and upstream Reductive groups documents were read, with relevant stage descriptions. Reviewed AUDIT-04/REV-AUDIT-04 and AUDIT-15/REV-AUDIT-15 evidence was inspected. Pending audits are not accepted evidence.

| Route | Owner | Items | Boundary |
| --- | --- | ---: | --- |
| Source | ReductiveGroupsPartII, RG2.1–3 | 18 | Real/dual/mixed filtrations, tame descent, building and generic-embedding adapters |
| Source | SmoothRepresentationsOfLocalGroups, SR.0–3 | 4 | Basic local representation interfaces; no new integral-coefficient foundation |
| Source | MetaplecticAutomorphicForms, MP.0 | 1 | One shared algebraic Heisenberg carrier |
| Part II | ReductiveGroupsPartIICoadjointStability | 30 | Additional coadjoint stability, genericity, root-prime and lattice results |
| Part II | MetaplecticPartIIFiniteWeil | 7 | Odd finite-field Schrödinger/Weil theory and corrected restriction formulas |
| Part II | SmoothRepresentationsPartIITameTypes | 85 | Data, minimization, types, corrected construction and exhaustion |

The Metaplectic document's analytic local-field scope is characteristic zero. Its finite-field extension is therefore a distinct continuation; no automatic specialization of an analytic oscillator representation is assumed. Only the common algebraic Heisenberg carrier belongs in MP.0. The finite representation branch exports its results to tame types.

The upstream Reductive algebraic groups roadmap is an immutable prerequisite. General tori, derived groups, roots and parabolics are imported, not re-planned. Local building adapters are defined for tame Levi chains independently of the representation datum, preventing a cycle through the type-exhaustion theorem.

A current screen of 44 peer paper route inventories found related but distinct continuations: Newton cocenters, parahoric centers, unitary spherical theory, GLn newforms, torsor and semiglobal group results. They do not justify duplicating the generic building or Heisenberg infrastructure. The specialized Heisenberg group in PAPER-MERKURJEV-SCAVIA-26 needs comparison with the shared carrier, not a second generic definition. All proposed new route IDs remain candidates pending independent review.

### Design briefs

#### Reductive algebraic groups, Part II: coadjoint stability and generic functionals

Begin after Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), the first prerequisite, importing its Lie, torus, derived-group, root and dynamic-parabolic APIs rather than rebuilding them. Import Reductive groups, Part II: local structure and arithmetic models (ReductiveGroupsPartII) for Moy–Prasad lattices and tame building descent, and Root systems (tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems) for finite root combinatorics. For a connected reductive group over a nonarchimedean local field, tame splitting and p not dividing the absolute Weyl order, prove Lemma2.2's separate prime consequences, invariant bilinear forms, closed coadjoint centralizers, and generic-functional depth/stability. Prove Proposition3.12 exactly: every nonzero almost strongly stable X at x admits an arbitrarily nearby x' and a generic representative congruent at x', with both points in its centralizer building. Construct rational residue-field destabilizing cocharacters, root projections and the depth-shifting bracket isomorphism first. Perfectness belongs to the residue field, not an assumed perfect local field. Include equal-characteristic examples and the exact-depth guard for central functionals. General roots and parabolics remain imports; the continuation owns only these additional stability/prime/lattice interfaces.

#### Metaplectic groups, Weil representations and automorphic theta kernels, Part II: finite Heisenberg–Weil representations

Begin after Metaplectic groups, Weil representations and automorphic theta kernels (MetaplecticAutomorphicForms), the first prerequisite, importing MP.0's single algebraic Heisenberg carrier generalized to fields with 2 invertible. This is a finite-field representation branch, not an assertion that characteristic-zero analytic oscillator results specialize automatically. Import existing finite representation, group algebra, induction and Maschke APIs from Mathlib and tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction. For finite-dimensional symplectic F_p-spaces with p odd and a fixed nontrivial central character, construct Schrödinger modules, prove finite Stone–von Neumann uniqueness, construct the normalized Weil action of Sp(V), and prove the corrected Gérardin parabolic induction and isotropic-invariant formulas with the quadratic determinant character. Include zero symplectic dimension and prime 3. Test that the determinant-twisted GL2 permutation module on F_p² has no invariants whereas the untwisted module has two. Export these formulas to tame types; do not build global theta kernels, local character formulas or an unrelated new Heisenberg group. Compare the special finite Heisenberg group used in PAPER-MERKURJEV-SCAVIA-26 with the shared constructor.

#### Smooth representations of local groups, Part II: tame types and supercuspidal exhaustion

Begin after Smooth representations of local groups (SmoothRepresentationsOfLocalGroups), the first prerequisite, importing SR.0–3 for the smooth complex category, type Hecke convention, compact induction, Jacquet functors, admissibility and Bernstein blocks. Import ReductiveGroupsPartII for buildings and filtrations, ReductiveGroupsPartIICoadjointStability for generic approximation, and MetaplecticPartIIFiniteWeil for the corrected finite Weil formulas; the last two are candidate suppliers, not yet accepted layers. For k of arbitrary characteristic, G connected reductive and tamely split, and residue p not dividing the absolute Weyl-group order, prove every smooth irreducible complex G(k)-representation contains a functional datum (Theorem6.1), then a Kim–Yu s-type (Theorem7.12), and every irreducible supercuspidal arises from Yu's construction (Theorem8.1). Prove both directions of Corollary8.3 for a maximal datum: supercuspidality is equivalent to minimal terminal-facet dimension and anisotropic terminal center modulo Z(G). Build the depth-minimizing recursion, character extensions, tensor multiplicity factor, genuine depth-zero cuspidality and zero embedding-defect argument. Keep bare data, types and compact-mod-center inducing data distinct. Use Fintzen's corrected Yu irreducibility proof, not Yu14.1/14.2, and close all source gaps before acceptance. Handle n=0, G_1=G_2, tori and the finite Weil quadratic sign explicitly; this is not a modular-coefficient or residue-two generalization.

## Library evidence and tests

Exact statements were read at Mathlib 082e2d3 and Tau Ceti f790474: IsNonarchimedeanLocalField, normalizedValuation and its zero extension, AddChar, Representation, invariant submodules and finite Maschke splitting. The JSON records full pins, files, lines and the limits of each match. Smoothness is not supplied by the algebraic representation carrier; conductor is not supplied by AddChar; compact constituent selection is not supplied merely by finite Maschke.

Pinned searches identified no exact advanced tame-type, Moy–Prasad or finite Heisenberg–Weil package. This is a scoped negative search, not an exhaustive semantic absence proof. The missing statuses require rechecking against new accepted audits before design.

Planned tests distinguish plausible incorrect definitions: zero versus finite depth, conductor P versus o, plus indices, central genericity, the empty datum, point versus reduced fixer, the determinant sign, admissibility versus smoothness and a cover versus a contained representation. They are not Lean-executed.

Finite Python diagnostics passed:

- Heisenberg inverses, centers, commutators and all associativity triples for the three-coordinate model at p=3,5: 1,972,808 triples.
- For p=3,5,7,11, every vector of F_p², including zero, has a GL2 stabilizer of nonsquare determinant. Thus the determinant-twisted permutation model has no invariants; its untwisted model has two orbits and two invariant functions. All 204 vectors were checked against the finite matrix actions.
- The GL2 off-diagonal bracket matrix was nondegenerate for all 178 ordered distinct scalar pairs at those primes.
- All 648 rational parameter cases satisfied the selected strict error-depth inequalities.
- The C2 diagonal-action example confirms that a preselected smaller-group line need not lie inside a larger-group irreducible constituent.

These checks do not prove the general statements. Their reproducible recipes are the displayed Heisenberg law in the JSON, exhaustive finite matrix enumeration, and the C2 matrices diag(1,−1). For the rational checks take r=i/2 (1≤i≤8), d=j/8 with r/2≤d<r, ε=(r−d)/m (3≤m≤11); verify r−2d−2ε>−d and 2(r−d−ε)+d>r.

## Source issues and remaining work

Seventeen records are proposed for independent review, with short printed fragments, versioned locators, reasons and correction searches. No review verdict has been self-assigned.

E1–E4 and E6–E10 concern manuscript indices, signs or subgroup notation. E5 is a constituent-selection proof gap: the witness may need replacing by a compatible projection, and preservation of every datum constraint needs proof. This is not a claimed counterexample to the theorem. E11–E14 record known corrections in Kim–Yu, Gérardin, Kim and Yu as identified by the read Fintzen sources; the unread originals are explicitly distinguished. E15 isolates the zero-vector case omitted by a basis-choice sentence in the published companion. E16 corrects compactness wording in the selected Kaletha passage. E17 records an author-corrected prime-hypothesis issue outside the present target, to prevent accidental import.

“New” means no correction was located in the searches recorded on 22 September; it does not certify novelty, nor establish persistence into the Annals published version. Nothing is sent to an author.

The prerequisite list names the unclosed original sources, not merely broad topics. Resume with published-version comparison, then the compatible-projection repair, then the exact BT/MP/AR/Adler/Kempf and finite-Weil/cover dependencies. Some assertions in the inventory intentionally expose a required proof adapter rather than claim it has been closed. Do not change status to complete until the nine JSON gaps have been addressed or precisely discharged with evidence.

No Lean file was requested, authored or compiled for this paper-only job. Nothing is claimed formalized.
