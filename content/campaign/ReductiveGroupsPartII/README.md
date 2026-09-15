# Reductive groups, Part II: local structure and arithmetic models

## Scope and ownership

Develop the local structure of connected reductive groups over nonarchimedean local fields, including nonsplit groups, their buildings and integral models. The existing ReductiveGroups roadmap owns group schemes, root data, tori, parabolics, rational representations and reductive models over general bases. This Part II constructs the valued and topological structures required for local representation theory, Shimura levels and local shtukas. A root datum alone does not supply a building or a parahoric group scheme.

Use arbitrary nonarchimedean local fields E, with finite residue field of cardinality q and residue characteristic p. Results using mixed characteristic say so. General schemes, descent and quotients are supplied by AlgebraicModuliForArithmeticGeometry. LocalFieldsRamification supplies valuations and unramified extensions. Group schemes and their E-points remain different objects.

## Conventions

Use normalized absolute value |uniformizer|=q⁻¹. Distinguish the reduced building from the enlarged building, which retains the real vector space of the split center. A parahoric is the integral points of the **connected** smooth Bruhat–Tits model; the full facet stabilizer can be larger. Hyperspecial subgroups are only asserted for unramified groups and suitable vertices. Fix positive roots only for an identified maximal split torus and minimal parabolic. Transport statements under changes of these choices.

## Milestones

### RG2.0. Topologies on rational points

Construct the topology on X(E) for finite-type E-schemes from affine charts, prove independence of charts, functoriality and compatibility with products and closed/open immersions. Prove local compactness and Hausdorffness for separated finite-type schemes, and the topological group axioms for G(E). For affine models over O_E, prove compactness of integral points and that congruence kernels give a neighborhood basis when the model is smooth. Verify directly for GL_n that integral points are GL_n(O_E), not all integral matrices with nonzero determinant.

### RG2.0a. Weil restriction and the Deligne torus

Own restriction of scalars for affine finite-type schemes along a finite locally free base map, and its finite-separable-field specialization. Define the functor on points by T ↦ Hom over S′ from T×S S′ to X. On a free affine chart construct its representing algebra by expanding generators and relations in a basis; prove the universal property, basis independence, descent across changes of trivialization and preservation of finite type. Prove finite presentation when X/S′ is finitely presented, in particular over the relevant noetherian/field bases; finite type alone over an arbitrary base does not suffice. Affine representability is sufficient for the reductive-group and Deligne-torus consumers; arbitrary nonaffine schemes require a separately proved representability hypothesis, not an assertion that all Weil restrictions are schemes. Source: Stacks [restriction of scalars](https://stacks.math.columbia.edu/tag/05Y8) and its affine relative-morphism construction.

Construct the adjunction, evaluation map, products, composition and base-change isomorphisms with coherence. Transport group laws; for a finite separable field extension prove the splitting-field product description and descend smoothness, connectedness, reductivity and the torus property. Treat inseparable extensions separately: the reductivity conclusion is not asserted there. For C/R construct S=Res(C/R) G_m, identify S(R)=C×, S_C=G_m×G_m with conjugation exchanging the factors, and construct norm and weight maps with the chosen character/cocharacter convention. ShimuraData:D0 and adelic restriction-of-scalars comparisons import this construction, not an unexplained constant named S.

Acceptance: Res of affine space, GL_1 for a quadratic extension, the norm torus kernel, and the C/R character-lattice calculation. The scheme construction precedes any building or Shimura theorem.

### RG2.1. Relative roots and valued root data

Construct relative roots from a maximal E-split torus, relative Weyl group, root subgroups and filtrations indexed by their actual valuation sets. Include multipliable roots and nonsplit root groups. Establish commutator estimates, conjugation by the torus and compatibility under unramified extension. Build the affine root system and apartment from the valued datum. Absolute roots remain supplied by ReductiveGroups.

### RG2.2. Buildings and group action

Glue apartments by the Bruhat–Tits equivalence relation; prove well-defined affine transition maps, the building axioms, the G(E)-action, apartment existence for pairs of points and the relation between reduced and enlarged buildings. Prove independence of auxiliary root parametrizations. Develop facets, closure order, fixers, compactness modulo center and the fixed-point statement for bounded subgroups with its hypotheses. Construct the GL_n model from homothety classes of norms/lattice chains and identify the SL_2 tree as a validation example.

### RG2.3. Parahoric and congruence group schemes

For a facet construct the smooth affine O_E-group scheme with connected special fiber and the prescribed root-group charts. Prove its characterization by integral points, generic fiber G, connected reductive quotient of the special fiber, pro-unipotent radical and reduction map. Identify pro-p congruence subgroups and prove their compact openness. Prove compatibility for nested facets and unramified base change; record the distinctions between connected parahorics, fixer group schemes and hyperspecial models.

### RG2.4. Decompositions and double cosets

Prove Iwasawa decomposition using an appropriate special maximal compact subgroup. Prove the Cartan and Iwahori–Bruhat decompositions in their exact generality, with the correct relative cocharacter lattice, dominance conditions and stabilizers. Derive finiteness of compact-open double coset decompositions and index formulas. Supply rank-one and nonsplit examples showing why the split simply connected formula cannot be used universally.

### RG2.5. Integral dual data

Construct a pinned split dual group over ℤ from the dual root datum and the continuous finite-image action on its pinning induced by the E-form of G. Supply the semidirect L-group with its projection and action law, its change of pinning equivalence and Levi inclusions. LanglandsParameterStacks owns spaces of Weil parameters; this layer owns the group and functorial duality data only. Prove compatibility with products, central isogenies, restriction of scalars and the split torus/GL_n examples. Square roots used in normalized Satake are coefficient choices, not part of the integral dual group.

## Acceptance and sources

Each construction must carry base-change and transport lemmas, rather than only existence. The GL_n lattice building, a nonsplit torus and an unramified unitary group test all advertised distinctions. Consumers obtain topological groups, compact opens, parahoric models and dual groups from this owner.

Primary references: Bruhat–Tits, *Groupes réductifs sur un corps local* [I](https://archive.numdam.org/item/10.1007/BF02715544.pdf) and [II](https://www.numdam.org/item/10.1007/BF02700560.pdf); II is the scheme-theoretic source, not merely a building reference. Casselman's [notes](https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf), §1, are a guide to the representation-theoretic interface; the author's [corrections warning](https://personal.math.ubc.ca/~cass/research/publications.html) means their KTK statement must be checked against Bruhat–Tits. Suggested Lean shapes are in Suggested.lean; the README is definitive.

## Completion contracts added on 2026-09-15

**Applies to:** `RG2.0a`, `RG2.1`, `RG2.2`, `RG2.3`, `RG2.4`, `RG2.5`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Construct root-group valuation filtrations in the nonsplit and multipliable-root cases before gluing apartments. For each facet give the map from its connected parahoric model into the fixer group scheme and identify the possible component quotient. Weil restriction of affine groups uses finite locally free representability, while preservation of reductivity is transported only through the finite-separable field splitting argument.

### Producer–consumer contract

Export the topology, parahoric O_E-model, connected special-fiber reductive quotient, and cocharacter/Weyl data used in each Cartan decomposition. A hyperspecial model is additional unramified data. The dual pinning and Weil action are constructed from the root datum, with no square root of q built into the group.

### Acceptance and source route

Use the SL_2 tree, a nonsplit torus and a ramified group without a hyperspecial subgroup; compare a full facet stabilizer with its connected parahoric.

**Source route:** Bruhat–Tits I/II; Stacks 05YF representability; FS dual-group consumers. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
