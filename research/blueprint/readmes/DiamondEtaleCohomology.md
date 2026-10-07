# Étale cohomology of diamonds and its four operations

This roadmap develops the étale cohomology of diamonds and small v-stacks from their sites to the four operations, proper base change, constructibility, dimension bounds and compact generation. Its principal source is Peter Scholze's *Étale cohomology of diamonds* (ECD), §§14 and 16–21, in arXiv:1709.07343v4. It starts with the perfectoid and diamond geometry supplied by `PerfectoidSpaces` and `DiamondsAndVStacks`, the enhanced sheaf theory of `EnhancedDerivedSheaves`, and the classical analytic inputs of `ClassicalAdicEtaleCohomology`.

The main categorical object is the enhanced étale category of a small v-stack, with homotopy category \(D_{\mathrm{ét}}(Y,\Lambda)\). The four operations are pullback, derived pushforward, derived tensor product and internal derived Hom. Their construction retains the distinction between the étale category and the ambient v-derived category, and it supplies the adjunctions and natural comparison maps that subsequent operations require. The geometry of proper and partially proper maps, the canonical compactification and étale extension by zero is developed here. The general exceptional operations belong to `DiamondSixOperations`.

The finiteness results culminate in a conditional compact-generation theorem. If \(Y\) is a spatial diamond, \(\Lambda\) is commutative, and one finite bound controls the cohomology of every étale \(\Lambda\)-module sheaf on \(Y\), then the same bound holds on every quasicompact separated étale test object. The étale derived category is then compactly generated, and its compact objects are the perfect-constructible complexes. For \(\Lambda=\mathbf F_\ell\), these are the bounded constructible complexes. C8 supplies geometric hypotheses that establish such a bound; the hypotheses must be checked in each application. The complete statements, prerequisite chains and remaining source obligations are specified in C8 and C9 below.

The declaration catalogue covers C0–C9 and contains 184 named nodes, with 256 API items and 176 unit tests. Each definition or construction has an interface derived from its uses, together with tests chosen to distinguish it from plausible incorrect definitions. These are specifications for a library. The gaps and supplier contracts collected after the catalogue remain part of the work, and every node retains unchecked implementation status. The suggested Lean file records signatures and explicit interface omissions; the mathematical document is definitive.

## Scope and boundaries

Every imported object or theorem is supplied by its owning roadmap. The boundary is fixed by its actual statement, including coefficient, valuation, size and finiteness hypotheses.

| Owner | Input or continuation | Boundary of this roadmap |
| --- | --- | --- |
| `PerfectoidSpaces` and `DiamondsAndVStacks` | Perfectoid spaces, pro-étale maps and limits; small v-stacks, diamonds, spatial geometry, field-point presentations and the perfectoid sites | C0 constructs the diamond and small-v-stack site comparisons from these inputs. C4 owns ECD §18's properness and canonical compactification, using the preceding spatial geometry. |
| `EnhancedDerivedSheaves` E1–E3 | Enhanced derived categories, replacements, tensor, repleteness, Postnikov completion, descent, adjoints and coherent diagrams | C0–C3 establish the hypotheses and geometric restrictions needed for the diamond étale category. A homotopy-category equivalence alone does not supply enhanced coherence. |
| `ClassicalAdicEtaleCohomology` H1–H4 | Henselian and Zariski–Riemann inputs, invariance under geometric field extension, taut-space definitions, annulus and open-ball calculations | C1 uses the classical field-invariance input, and C4 uses H3's tautness definition. C6 proves the global diamond field-invariance theorem from H2 and C5; this order avoids using the conclusion to obtain its own classical input. |
| `SchemeAndStackFoundations` SF.2 | Proper base change for schemes and the étale topos of a limit of schemes | C5 transports these results through the valued-field and Zariski–Riemann reductions, with its exchange map tracked throughout. |
| Tau Ceti `ProfiniteCohomology` and `ProfiniteProPGroups` | Canonical continuous cohomology, cohomological dimension, Sylow and pro-p structure | C8 proves the diamond quotient comparison and the general valued-field applications. It imports the abstract group theory through the precise requests listed below. |
| `ArithmeticGaloisDuality` R02.1–R02.2 | The all-degree continuous Hochschild–Serre spectral sequence and its coefficient, convergence and edge-map interfaces | C8 proves the dimension inequality by specializing this shared theorem; a five-term sequence does not supply the required all-degree result. |
| Tau Ceti `LocalFieldsRamification`, Layer 4 | The discrete local-field wild/tame theory, including the finite-residue-field Frobenius presentation | C8 retains its general complete-valued-field inertia and Kummer arguments, which allow arbitrary value groups and residue fields. Compare the constructions on their common local-field domain. |
| `DeformationAndDerivedPatchingAlgebra` P7 and Tau Ceti `DGAInfinity`, Layers 5–6 | Perfect complexes of modules, their finite operations, and the thick closure of compact generators | C7 uses the perfect-module theory for sheaves. C9 applies the compact-generator theorem to an enhanced model; it does not reprove the general DG theorem. |
| `AdicEtaleGeometry` and the adic-space extensions | Analytic residue-field valuations and the valuative partial-properness comparison | C8 records the extension needed beyond the existing noetherian analytic scope instead of substituting a narrower geometric theorem. |
| `DiamondSixOperations` | Compactifiability, general exceptional pushforward and extraordinary pullback, and the compactification bound used for proper supports | It consumes the categories, compactification, constructibility and bounds developed here. Étale extension by zero is constructed in C5 before general exceptional pushforward. |
| `AdicCoefficientsAndComparisons`, `FarguesFontaineDiamonds` and the relative period-sheaf developments | Adic coefficient systems, Fargues–Fontaine applications and sheaves depending on an untilt | This roadmap supplies its stated sites and étale categories. A completed structure sheaf requires the extra untilt data supplied by its own owner. |

The [ProfiniteProPGroups link map](../links/tauceti_TauCetiRoadmap_ProfiniteProPGroups.json) identifies the Sylow and pro-p inputs to C8. The [LocalFieldsRamification link map](../links/tauceti_TauCetiRoadmap_LocalFieldsRamification.json) keeps the general valued-field arguments and the discrete local-field specialization with their respective owners. The exact node-level contracts and the remaining ownership proposals are collected in the appendices and handoff.

## Conventions

**Geometry and sites.** Work on perfectoid spaces in characteristic \(p\). Étale and quasi-pro-étale maps use ECD's locally separated convention. Coverings are jointly surjective as maps of v-stacks. The sites are \(Y_{\mathrm{ét}}\) for a locally spatial diamond, \(Y_{\mathrm{qproét}}\) for a diamond, and \(Y_v\) for a small v-stack. The comparison morphisms are

\[
Y_v \xrightarrow{\lambda_Y} Y_{\mathrm{qproét}}
\xrightarrow{\nu_Y} Y_{\mathrm{ét}}.
\]

A geometric stalk uses the closed point of \(\operatorname{Spa}(C,C^+)\), where \(C\) is complete and algebraically closed and \(C^+\) is an open bounded valuation subring. Higher-rank plus rings remain in the tests. Restricting to \(C^+=\mathcal O_C\) would miss hypotheses in the perfect-stalk criterion and the dimension comparisons. Completed residue fields and their compatible embeddings are constructions with specified owners and choice-independence obligations.

**Coefficients.** General sheaf and comparison statements allow the ring specified in each node. Tensor products and perfect-constructible coefficients use a commutative ring. Constructible sheaves use the stated noetherian coefficient hypotheses. The condition that \(n\Lambda=0\) for some integer \(n\) prime to \(p\) appears exactly where required; the degree-zero, quasi-pro-étale and prime-to-p cases of Theorem 16.1 are separate statements. Conditional compactness over a general commutative ring does not acquire a prime-to-p hypothesis unless the geometric argument used to prove its cohomological bound requires one.

**Size and enhancements.** The quasi-pro-étale and v-sites use adequate cutoff cardinals \(\kappa\). Presentability belongs to the categories at a cutoff, with coherent fully faithful transition functors when the cutoff increases. The full large filtered union is not asserted to be presentable. Enhanced categories and their homotopy categories are distinguished throughout. The left completion is the enhanced Postnikov construction, with its convergence and coherence requirements. Ordinary inverse systems of objects do not by themselves construct it.

**Four operations and composition.** Write \(\otimes^L_\Lambda\), \(f^*\), \(Rf_*\), and \(R\mathcal Hom_\Lambda\) for the étale operations. The inclusion into the ambient v-derived category and its right adjoint, the étale coreflection, specify the pushforward and internal Hom where needed. For \(f:Y\to X\) and \(g:Z\to Y\),

\[
(f\circ g)^*\simeq g^*\circ f^*.
\]

Every comparison has its source and target stated explicitly. In particular, an unrestricted v-internal Hom is not identified with the étale internal Hom. The adjunction for étale extension by zero, its base-change map and the open-support triangle are supplied in C5 without assuming general exceptional operations.

**Constructibility.** Strata are spectral-constructible. Perfect local systems are étale-locally constant complexes with perfect values. Over noetherian \(\Lambda\), perfect-constructibility is equivalent to local boundedness and constructible cohomology together with either perfect geometric stalks of every rank or locally bounded Tor amplitude. For general commutative \(\Lambda\), use the stratified definition; it is distinct from having bounded constructible cohomology. The v-descent argument for non-noetherian coefficients is a recorded source obligation; noetherian specializations use the separate route specified in C7.

**Dimension.** Topological dimension and fibre dimension take values in \(\{ -\infty\}\cup\mathbf N\cup\{+\infty\}\), with empty space of dimension \(-\infty\). The topological generating degree of a complete field extension takes values in \(\mathbf N\cup\{+\infty\}\). The modified degree first minimizes that generating degree over further complete algebraically closed valued extensions; the diamond dimension invariant subsequently takes suprema over point presentations. These are different operations. The generating and independent degrees are also distinct. ECD Question 21.4 is not used as a theorem: the finite intermediate-degree result carries its finiteness hypothesis, and its infinite analogue is not assumed.

**Uniform bounds and compactness.** A local finite bound need not be a uniform bound. C9 starts with a single natural number \(N\) controlling all coefficient sheaves on the spatial diamond and transfers it to every quasicompact separated étale test object. Compactness in the enhanced stable category and the coproduct criterion in its triangulated homotopy category are related through the named enhancement contract. The finitely presentable objects of an ordinary category are not silently substituted for enhanced compact objects.

## Layer overview and proof order

| Layer | Main output | Source and ordering |
| --- | --- | --- |
| C0 | Sites, geometric stalks, comparison morphisms, continuity, repleteness and bounded comparisons | ECD §14 through Proposition 14.11; the higher-degree v-comparison source obligation remains explicit. |
| C1 | General base change in its three separate cases | ECD §16, using C0 and the classical geometric-field input before the general étale subcategory is defined. |
| C2 | The left-completed étale category, v-locality, enhanced descent, presentability and coreflection | Prove 14.12 after 16.1; obtain the hyperdescent used by the presentability and adjoint construction. Corollaries 16.5 and 16.8 are placed here. |
| C3 | Pullback, pushforward, tensor, internal Hom and their comparison maps | ECD §17; separate the bounded and finite-cohomological-dimension base-change statements. |
| C4 | Proper and partially proper maps, envelope and canonical compactification | ECD §18, with unique valuative lifts and the quasiseparated target hypothesis in the proper-colimit characterization. |
| C5 | Étale extension by zero, open-support triangle and proper base change | ECD 19.1–19.4, with Theorem 19.2 proved through Lemma 19.4; the exchange map is compared through every reduction. |
| C6 | Algebraically closed base-field invariance | Theorem 19.5: the nonarchimedean case, annulus argument, discrete-to-complete case, then the discrete case. |
| C7 | Constructible and perfect-constructible objects, descent, filtrations and limits | ECD §20: full faithfulness of 20.15, spreading of perfect local systems, 20.16, then essential surjectivity. |
| C8 | Dimension invariants, point quotients, direct-image vanishing and cohomological bounds | ECD §21 and the named valuation and spectral-space inputs; prove the degree-zero direct-image result before using it for compact generation. |
| C9 | Uniform bounds, compact generators and compact-object characterizations | ECD 20.9, 20.10 and 20.17, using C7, the early direct-image result of C8 and the explicit uniform-bound hypothesis. |

There are two shared results with a single proof owner. The acyclicity theorem is `C0/std-etale-acyclic`; the stable identifier `C8/strictly-disconnected-acyclic` exports it, and the C8 direct-image proof cites C0 directly. The finite-field statement `C9/bounded-filtered-compactness` is the specialization of `C7/perfect-constructible-restricted-compactness` through `C7/perfect-constructible-over-field`.

The displayed layer order is a reading order. Before the C7 filtration proofs, establish the three early C8 nodes `point-quotient`, `specialization-stabilizers` and `point-sheaf-equivalence`. Their prerequisites use C0 and the geometric and profinite suppliers, with no return through C7. The later support reduction in C8 can therefore use the C7 filtration without a cycle. The one remaining request within this roadmap promotes the dualizability API of `C7/perfect-local-system` to a named prerequisite lemma for C9. It records an interface-granularity obligation, not an additional assumed theorem.

## Sources and library interface

ECD locators throughout refer to [arXiv:1709.07343v4](https://arxiv.org/pdf/1709.07343v4), dated 14 April 2026. The C8 dimension comparison also uses Caraiani–Scholze's *On the generic part of the cohomology of compact unitary Shimura varieties*, §4.2; Temkin's *Topological transcendence degree*; Conrad's *Completion of algebraic closure*; and the stated Stacks Project results. Kelly–Saito–Tamme's specialization-chain argument explains the route to Scheiderer's spectral-space theorem, while the missing quasi-augmented descent proof remains explicitly recorded. Fargues–Scholze Problem I.11.1 is treated as a question and motivation, not as a proved dimension comparison. The full version and locator register follows the catalogue.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The library register below identifies the exact generic declarations used by the plan. The category and topology vocabulary follows the upstream [AdicSpaces](../../../content/tau-ceti/AdicSpaces/README.md) and [DGAInfinity](../../../content/tau-ceti/DGAInfinity/README.md) roadmaps. The domain-specific sites, cohomology comparisons and enhanced diamond operations are the targets or named imports of this roadmap.

## C0. Sites and bounded comparison

Objects: the étale site Y_ét of a locally spatial diamond, the quasi-pro-étale site Y_qproét of a diamond and the v-site Y_v of a small v-stack (ECD 14.1), with their cutoffs; the derived categories D(Y_ét, Λ), D(Y_qproét, Λ), D(Y_v, Λ); geometric stalks; the comparison morphisms λ_Y : Y_v → Y_qproét and ν_Y : Y_qproét → Y_ét with their pullbacks and adjunctions; and over a strictly totally disconnected X the universal quasicompact separated pro-étale quotient λ∘_X(X′) of a qcqs X′ → X (Lemma 14.5).

Theorems: the topoi are algebraic (14.2), Y_ét has enough points (14.3), λ_Y^∗ and quasi-pro-étale pullbacks commute with all limits (14.4), λ_Y^∗ and ν_Y^∗ are fully faithful with vanishing higher direct images on étale sheaves (14.7, 14.8; the higher vanishing for v-cohomology in degrees ≥ 2 rests on a recorded gap, PAPER-SCHOLZE-17/E46), étale cohomology commutes with cofiltered limits of spatial diamonds (14.9, absolute and relative forms), the v- and quasi-pro-étale topoi are replete (proved by countable lifting towers, as the stage asks), the three derived categories are left-complete in the stated cases (14.11), and pullback is fully faithful on D⁺ for locally spatial diamonds and on all of D for strictly totally disconnected spaces (14.10).

Other roadmaps: DiamondsAndVStacks D0 (topos interfaces, cutoffs; limits of coherent topoi requested), D1 (strictly totally disconnected spaces, Corollary 7.22), D2 (perfectoid sites and Proposition 8.5), D3 (Lemma 9.5, requested as its own node), D4 and D5 (small v-stacks, spatial diamonds, finite-stage comparisons), PerfectoidSpaces P5–P6 (limits, pro-étale calculus), ClassicalAdicEtaleCohomology H2 (Lemma 14.6), EnhancedDerivedSheaves E2 (repleteness, left completion).

Coverage: planned. Remaining: Close the gap on R^iλ_Y∗λ_Y^∗F for i ≥ 2 (PAPER-SCHOLZE-17/E46) by one of the two recorded routes. Receive the DiamondsAndVStacks:D0 contract on limits of coherent topoi (SGA 4 VI 8.7.7) and coherent topoi, and the D3 node for ECD Lemma 9.5. Receive the EnhancedDerivedSheaves:E2 module-coefficient versions of left-completeness and hypercover descent. Lemma-level refinement: the generator and fibre-product checks behind Proposition 14.2 (left to the reader in ECD), the finite-stage covering descent in 14.9, and the cutoff transitions of the derived categories.

Planets: **Étale site of a diamond** (`etale-site`); **Quasi-pro-étale site** (`quasi-pro-etale-site`); **v-site of a small v-stack** (`v-site`); **Continuity of étale cohomology** (`etale-cohomology-continuity`); **Left-completeness of D(Y_v, Λ)** (`left-completeness`); **Comparison of étale, pro-étale and v-cohomology** (`bounded-below-comparison`).

### `etale-site` — The étale site of a locally spatial diamond ★

Declaration `DiamondEtaleCohomology:C0/etale-site` (definition).

Let Y be a small v-stack on Perf that is a locally spatial diamond. The étale site Y_ét is the site whose objects are the étale maps Y′ → Y that are locally separated (Convention 10.2), whose morphisms are maps over Y, and whose coverings are the families {Y′_i → Y′} that are jointly surjective as maps of v-stacks on Perf. Every object Y′ is again a locally spatial diamond, and the topos Y_ét^∼ is the category of étale sheaves on Y.

Construction and proof:

1. Fibre products of étale maps are étale, and a map between two étale Y-objects is étale (ECD Proposition 10.4(ii), DiamondsAndVStacks D3), so Y_ét has all finite limits, computed in small v-stacks; equalizers exist as well.
2. Isomorphisms cover, coverings are stable under base change because surjectivity of maps of v-stacks is (D4), and composites of coverings cover; so the jointly surjective families form a pretopology.
3. An étale map into a locally spatial diamond has locally spatial source (D5 permanence for étale and quasi-pro-étale maps into locally spatial diamonds), so Y_ét consists of locally spatial diamonds.
4. Étale maps are open on underlying spaces, so a family of étale maps is jointly surjective as v-stacks exactly when the images of the |Y′_i| cover |Y′| (the argument at the end of the proof of ECD Proposition 14.3).
5. The étale maps from spatial diamonds form an essentially small generating family (ECD Corollary 11.28, D5; for spatial Y the quasicompact separated étale maps already do, node etale-to-quasi-pro-etale-basis), so Y_ét^∼ is a Grothendieck topos without any cutoff.

Used by:

- ECD Proposition 14.3: points of the étale topos are geometric points
- ECD Proposition 14.8 and Corollary 16.10: étale cohomology and the étale pushforward Rf_ét∗ are computed on Y_ét
- DiamondEtaleCohomology:C7: constructible sheaves on spatial diamonds are étale sheaves
- DiamondEtaleCohomology:C8/strictly-disconnected-acyclic: étale cohomology of strictly totally disconnected spaces
- DiamondSixOperations:S1: étale sheaves are the coefficients of the exceptional pushforward

API:

| name | role | statement |
|---|---|---|
| `etaleSite` | constructor | For a locally spatial diamond Y, the Grothendieck topology on the category of locally separated étale maps Y′ → Y whose covering sieves are those generated by jointly surjective families. |
| `etaleSite.mem_iff_surjective_points` | characterisation | A family of étale maps {Y′_i → Y′} in Y_ét generates a covering sieve if and only if the images of the \|Y′_i\| cover \|Y′\|. |
| `etaleSite.hasFiniteLimits` | instance | Y_ét has all finite limits, computed as fibre products and equalizers of small v-stacks over Y. |
| `etaleSite.over_equiv` | equivalence | For an étale map U → Y in Y_ét, the slice (Y_ét)/U is equivalent to U_ét as a site. |
| `etaleSite.pullback` | functoriality | A map f : Y → Z of locally spatial diamonds gives the continuous functor Z_ét → Y_ét, Z′ ↦ Z′ ×_Z Y, which preserves finite limits; hence a morphism of sites f_ét : Y_ét → Z_ét, with (g ∘ f)_ét = g_ét ∘ f_ét and id_ét = id. |
| `etaleSite.perfectoid_compat` | compatibility | For a perfectoid space X, X_ét is equivalent to the étale site of the perfectoid space X, compatibly with coverings. |
| `etaleSite.adic_compat` | compatibility | For an analytic adic space Z over Z_p, (Z^♢)_ét is equivalent to Z_ét (ECD Lemma 15.6, DiamondsAndVStacks:D6); this item is proved once D6 is available, as in C1, whose stage requires D6. |

Unit tests:

- `etaleSite_geometricPoint` (computation): For Y = Spa(C, O_C) with C algebraically closed, every étale map to Y is a disjoint union of copies of Y, and global sections Y_ét^∼ → Set is an equivalence.
- `etaleSite_chain` (computation): For Y = Spa(C, C⁺) with C algebraically closed, every étale map to Y is a local isomorphism, and Y_ét^∼ is equivalent to the category of sheaves on the totally ordered space |Y|.
- `etaleSite_empty` (degenerate): For Y = ∅ the site has one object and the topos is the terminal category.
- `etaleSite_tilt` (compatibility): For Y = Spa(R, R⁺)^♢ with (R, R⁺) a perfectoid Tate pair, Y_ét is equivalent to Spa(R♭, R♭⁺)_ét.
- `etaleSite_not_qproet` (non-example): For an infinite profinite set S, Spa(C, O_C) × S → Spa(C, O_C) is quasi-pro-étale but not étale, so it is not an object of Spa(C, O_C)_ét.

Acceptance:

- For a perfectoid space X the site X_ét agrees with the étale site of the perfectoid space X, and for an analytic adic space Z over Z_p the site (Z^♢)_ét agrees with Z_ét (ECD Lemma 15.6).

Depends on: `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Sheaf`.

Sources:

- ECD, Definition 14.1(i), p. 81.
- ECD, paragraph after Definition 14.1, p. 81.

### `quasi-pro-etale-site` — The quasi-pro-étale site of a diamond ★

Declaration `DiamondEtaleCohomology:C0/quasi-pro-etale-site` (definition).

Let Y be a diamond. The quasi-pro-étale site Y_qproét is the site whose objects are the quasi-pro-étale maps Y′ → Y that are locally separated (Convention 10.2), whose morphisms are maps over Y, and whose coverings are the families that are jointly surjective as maps of v-stacks on Perf. For every cutoff cardinal κ (ECD Lemma 4.1) Y_qproét,κ is the full subsite of objects Y′ admitting a surjection from a κ-small perfectoid space (equivalently, by the perfectoid basis, the site of κ-small perfectoid spaces quasi-pro-étale over Y, which has the same topos); small sheaves on Y_qproét form the large filtered colimit of the topoi Y_qproét,κ^∼ along the fully faithful restriction functors.

Construction and proof:

1. Every source Y′ of a quasi-pro-étale map to Y is a small v-sheaf (D3, D5), fibre products of quasi-pro-étale maps are quasi-pro-étale and maps between quasi-pro-étale Y-objects are quasi-pro-étale (ECD Proposition 10.4(ii), D3), so finite limits exist.
2. Jointly surjective families form a pretopology by the same argument as for Y_ét.
3. For cutoff cardinals κ ≤ κ′ the inclusion Y_qproét,κ ⊂ Y_qproét,κ′ induces fully faithful functors on sheaf topoi which preserve cohomology (DiamondsAndVStacks D2, cutoff independence, ECD §8.2), and small sheaves are those defined at some κ.

Used by:

- ECD Lemma 14.4 and Proposition 14.7: the comparison λ_Y between v- and quasi-pro-étale topoi
- ECD Theorem 16.1: pro-étale pushforward f_qproét∗ is compared with v-pushforward
- PrismaticCohomology:PR.8: quasi-pro-étale coefficients of a diamond

API:

| name | role | statement |
|---|---|---|
| `qproetSite` | constructor | For a diamond Y and a cutoff cardinal κ, the Grothendieck topology on κ-small locally separated quasi-pro-étale maps Y′ → Y with jointly surjective coverings. |
| `qproetSite.restrict_fullyFaithful` | functoriality | For κ ≤ κ′ the induced functor on sheaf topoi is fully faithful and commutes with cohomology. |
| `qproetSite.over_equiv` | equivalence | For a quasi-pro-étale U → Y, the slice of Y_qproét at U is equivalent to U_qproét. |
| `qproetSite.pullback` | functoriality | A map f : Y′ → Y of diamonds gives a finite-limit-preserving continuous functor Y_qproét → Y′_qproét by base change, hence f_qproét, functorial in f. |
| `qproetSite.etale_le` | compatibility | Every object of Y_ét is an object of Y_qproét when Y is locally spatial, and Y_ét → Y_qproét preserves fibre products and coverings. |
| `qproetSite.std_basis` | characterisation | The strictly totally disconnected perfectoid spaces quasi-pro-étale over Y form a basis of Y_qproét. |

Unit tests:

- `qproetSite_geometricPoint` (computation): For Y = Spa(C, O_C) with C algebraically closed, S ↦ Spa(C, O_C) × S identifies profinite sets with the quasicompact separated objects of Y_qproét, so small sheaves on Y_qproét are condensed sets.
- `qproetSite_empty` (degenerate): For Y = ∅ every cutoff topos is the terminal category.
- `qproetSite_etale_object` (compatibility): A locally separated étale map Y′ → Y is an object of both Y_ét and Y_qproét, and a jointly surjective étale family covers in both.
- `qproetSite_not_v` (non-example): For an extension C ⊊ C′ of algebraically closed perfectoid fields, Spa(C′, O_C′) → Spa(C, O_C) is a v-cover but not quasi-pro-étale, so it is not an object of Spa(C, O_C)_qproét.

Acceptance:

- For a strictly totally disconnected X, small sheaves on X_qproét are the sheaves on the coherent site of quasicompact separated pro-étale maps (node perfectoid-bases-and-coherent-subsites).

Depends on: `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondsAndVStacks:D2/cutoff-independence`, `DiamondsAndVStacks:D0/cutoff-cardinal`, `DiamondsAndVStacks:D4/diamond`, `mathlib:CategoryTheory.GrothendieckTopology`.

Sources:

- ECD, Definition 14.1(ii), p. 81.
- ECD, paragraph after Definition 14.1, p. 81.

### `v-site` — The v-site of a small v-stack ★

Declaration `DiamondEtaleCohomology:C0/v-site` (definition).

Let Y be a small v-stack on Perf. The v-site Y_v is the site whose objects are all maps Y′ → Y from small v-sheaves Y′, whose morphisms are maps over Y, and whose coverings are the jointly surjective families (as maps of v-stacks on Perf); for perfectoid spaces X and {X_i → X} this means a v-cover. For every cutoff cardinal κ there is the subsite Y_v,κ of small v-sheaves over Y admitting a surjection from a κ-small perfectoid space (equivalently, by the perfectoid basis, the site of κ-small perfectoid spaces over Y, with the same topos), and small sheaves on Y_v form the large filtered colimit of the topoi Y_v,κ^∼.

Construction and proof:

1. Fibre products of small v-sheaves over the small v-stack Y are small v-sheaves (DiamondsAndVStacks D4), so Y_v has finite limits.
2. Jointly surjective families form a pretopology; for perfectoid spaces it is the v-topology of D2.
3. Cutoff independence and fully faithful transition functors as for Y_qproét (D2).

Used by:

- ECD Definition 14.13: D_ét(Y, Λ) is a full subcategory of D(Y_v, Λ)
- ECD Proposition 17.3: hyperdescent for D(Y_v, Λ)
- AdicCoefficientsAndComparisons:L0: repleteness of Y_v in the κ-cutoff form

API:

| name | role | statement |
|---|---|---|
| `vSite` | constructor | For a small v-stack Y and a cutoff cardinal κ, the Grothendieck topology on κ-small maps from small v-sheaves to Y with jointly surjective coverings. |
| `vSite.restrict_fullyFaithful` | functoriality | For cutoff cardinals κ ≤ κ′ with Y κ-small (or after choosing a κ-small presentation of Y), the induced functor on sheaf topoi is fully faithful and commutes with cohomology. |
| `vSite.perfectoid_basis` | characterisation | Strictly totally disconnected perfectoid spaces over Y form a basis of Y_v, so restriction to perfectoid objects is an equivalence of topoi of small sheaves. |
| `vSite.over_equiv` | equivalence | For a small v-sheaf U → Y, the slice of Y_v at U is U_v. |
| `vSite.pullback_zeroTruncated` | functoriality | A 0-truncated map f : Y′ → Y gives the base-change functor Y_v → Y′_v, a morphism of sites f_v, functorial in f. |
| `vSite.representable_isSheaf` | characterisation | For every object Y′ → Y the representable presheaf is a sheaf (subcanonicity, DiamondsAndVStacks D2 and D4). |

Unit tests:

- `vSite_empty` (degenerate): For Y = ∅ every cutoff topos is the terminal category.
- `vSite_subcanonical` (characterisation): For a small v-sheaf Y′ → Y, the presheaf Hom_Y(−, Y′) is a sheaf on Y_v.
- `vSite_perfectoid_compat` (compatibility): For a perfectoid space X, the restriction of X_v to perfectoid objects is the v-site of DiamondsAndVStacks D2, with the same covering families.
- `vSite_not_qproet` (non-example): For an extension C ⊊ C′ of algebraically closed perfectoid fields, {Spa(C′, O_C′) → Spa(C, O_C)} covers in the v-site but is not a family of quasi-pro-étale maps.

Acceptance:

- Restriction to the perfectoid spaces over Y is an equivalence of topoi of small sheaves.

Depends on: `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`, `DiamondsAndVStacks:D2/cutoff-independence`, `DiamondsAndVStacks:D0/cutoff-cardinal`, `mathlib:CategoryTheory.GrothendieckTopology`.

Sources:

- ECD, Definition 14.1(iii), p. 81.
- ECD, paragraph after Definition 14.1, p. 81.

### `cutoff-derived-categories` — Derived categories of the quasi-pro-étale and v-sites through cutoffs

Declaration `DiamondEtaleCohomology:C0/cutoff-derived-categories` (construction).

Fix a ring Λ. For a topos T, D(T, Λ) is the derived category of sheaves of Λ-modules and D⁺, D⁻, D^b ⊂ D(T, Λ) are the cohomologically bounded below, above and bounded subcategories. For a diamond Y, resp. small v-stack Y, D(Y_qproét, Λ), resp. D(Y_v, Λ), is the filtered colimit over cutoff cardinals κ of D(Y_qproét,κ, Λ), resp. D(Y_v,κ, Λ), along fully faithful transition functors; the canonical t-structures and truncations are compatible with the transitions.

Construction and proof:

1. For κ ≤ κ′ the restriction of module sheaves from κ′ to κ is exact, with res ∘ ext ≅ id for the extension functor ext (D2 cutoff independence); hence ext is fully faithful and t-exact on derived categories.
2. Take the filtered colimit of categories; truncations, shifts and cones are computed at any cutoff containing the data.

Used by:

- ECD Proposition 14.10: fully faithful embeddings of D⁺(Y_ét, Λ) into D(Y_qproét, Λ) and D(Y_v, Λ)
- ECD Lemma 17.1: presentability is proved at an adequate cutoff D(Y_v,κ, Λ)

API:

| name | role | statement |
|---|---|---|
| `cutoffDerived.transition_fullyFaithful` | functoriality | For κ ≤ κ′ the transition functor D(Y_v,κ, Λ) → D(Y_v,κ′, Λ) is fully faithful and commutes with shifts, cones and canonical truncations. |
| `cutoffDerived.ofCutoff` | constructor | Every object of D(Y_v, Λ) comes from D(Y_v,κ, Λ) for some cutoff κ, and Hom groups are computed at any common cutoff. |
| `cutoffDerived.tStructure` | structure | The canonical t-structure on D(Y_v, Λ), with H^i computed at any cutoff, and the subcategories D⁺, D⁻, D^b. |
| `cutoffDerived.pullback` | functoriality | λ_Y^∗, ν_Y^∗ and f_v^∗ for 0-truncated f induce t-exact functors on these derived categories, compatible with the transitions. |
| `cutoffDerived.transition_products` | other | For κ ≤ κ′ the transition functor commutes with countable products and with R lim of sequences (κ′-small objects are κ-cofiltered limits of κ-small ones and cf(κ) > ω, and products are exact by repleteness). |

Unit tests:

- `cutoffDerived_zeroRing` (degenerate): For Λ = 0 every D(Y_v, Λ) is the zero category.
- `cutoffDerived_cohomology_transition` (characterisation): For A ∈ D(Y_v,κ, Λ) and κ ≤ κ′, H^i of the image of A in D(Y_v,κ′, Λ) is the image of H^i(A).
- `cutoffDerived_set_generated` (compatibility): If Y_v,κ is fixed, D(Y_v,κ, Λ) is Mathlib's DerivedCategory of the Grothendieck abelian category of sheaves of Λ-modules on Y_v,κ.
- `cutoffDerived_not_one_topos` (non-example): The category of all small sheaves of Λ-modules on Y_v has no set of generators when Y ≠ ∅, so D(Y_v, Λ) is not the derived category of a single Grothendieck abelian category.

Acceptance:

- For κ ≤ κ′ and A, B ∈ D(Y_v,κ, Λ), Hom computed in D(Y_v,κ, Λ) and in D(Y_v,κ′, Λ) agree, and H^i(Y_v, A) does not depend on κ.

Depends on: `DiamondsAndVStacks:D2/cutoff-independence`, `DiamondsAndVStacks:D0/cutoff-cardinal`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `mathlib:DerivedCategory`.

Sources:

- ECD, paragraph before Proposition 14.10, p. 86.

### `algebraic-topoi` — The étale, quasi-pro-étale and v-topoi are algebraic

Declaration `DiamondEtaleCohomology:C0/algebraic-topoi` (theorem).

The categories of small sheaves on Y_ét, Y_qproét and Y_v, for Y a locally spatial diamond, a diamond and a small v-stack respectively, are algebraic topoi (at each cutoff for the last two). If Y is 0-truncated (a small v-sheaf), an object of any of these sites is quasicompact, resp. quasiseparated, in the topos-theoretic sense if and only if it is quasicompact, resp. quasiseparated, as a small v-stack on Perf.

Construction and proof:

1. ECD leaves the proof to the reader. Generating families (qcqs objects, stable under fibre products, ECD p. 40 and D0): for Y_ét the étale maps Y′ → Y with Y′ a spatial diamond (they include the quasicompact separated étale maps into spatial opens of Y and generate because étale sources are locally spatial, Corollary 11.28; fibre products of spatial diamonds are spatial, D5); for Y_qproét the affinoid, or the strictly totally disconnected, perfectoid spaces quasi-pro-étale over Y (stable under fibre products by D1, pro-étale maps over a strictly totally disconnected base); for Y_v the affinoid perfectoid spaces over Y (κ-small), not the strictly totally disconnected ones, which are not stable under fibre products (PAPER-SCHOLZE-17/E46). The quasicompact separated étale maps alone do not generate when Y is not quasiseparated.
2. These generators are quasicompact objects, fibre products of two of them over a quasiseparated object are quasicompact, and they are stable under fibre products in the qcqs subsites; this is the criterion for an algebraic topos (D0's coherent-topos interface, SGA 4 VI 2.3), as in D2 for the perfectoid sites.
3. For 0-truncated Y, compare the topos notions with quasicompactness of small v-sheaves through the covering characterization: an object is quasicompact iff every covering family has a finite subcover, which for small v-sheaves is ECD's quasicompactness. Quasiseparatedness: for 0-truncated Y, an object Y′ is quasiseparated in the topos iff Y′_1 ×_{Y′} Y′_2 is quasicompact for affinoid (resp. spatial étale) Y′_i → Y′, which by the quasicompact case is quasiseparatedness of the small v-sheaf Y′.

Acceptance:

- The proof is written out here because the source omits it; the generating families named in the first step are the ones the proofs of ECD 14.4 and 14.8 use.

Depends on: `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `DiamondsAndVStacks:D2/perfectoid-sheaf-topoi-are-algebraic`, `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C0/quasi-pro-etale-site`, `DiamondEtaleCohomology:C0/v-site`, `DiamondEtaleCohomology:C0/etale-to-quasi-pro-etale-basis`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D0`, `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`.

Sources:

- ECD, Proposition 14.2, p. 82.
- ECD, proof of Proposition 14.2, p. 82.

### `geometric-stalk` — Stalks of étale sheaves at geometric points

Declaration `DiamondEtaleCohomology:C0/geometric-stalk` (construction).

Let Y be a locally spatial diamond and y ∈ |Y|. Choose a quasi-pro-étale map ȳ : Spa(C(y), C(y)⁺) → Y with C(y) algebraically closed, C(y)⁺ ⊂ C(y) an open and bounded valuation subring, mapping the closed point to y. For a sheaf F on Y_ét put F_ȳ = colim_{ȳ → U ∈ Y_ét} F(U). The index category is cofiltered over U, and F ↦ F_ȳ is pullback along ȳ_ét followed by global sections on Spa(C(y), C(y)⁺)_ét; it is a point of the topos Y_ét^∼.

Construction and proof:

1. ȳ exists: choose a quasi-pro-étale surjection X → Y from a strictly totally disconnected space (D5) and a point x over y; the localization at x of the component Spa(C, C⁺_0) of x is a pro-constructible generalizing subset, hence pro-étale over X. Equalizers exist in Y_ét, so the colimit is filtered.
2. The presheaf pullback of F along ȳ_ét, evaluated at Spa(C(y), C(y)⁺), is colim_{ȳ→U} F(U); since every covering of Spa(C(y), C(y)⁺) splits, sheafification does not change this value, so F_ȳ = Γ(Spa(C(y), C(y)⁺), ȳ_ét^∗F).
3. Every surjective étale map to Spa(C(y), C(y)⁺) splits and Spa(C(y), C(y)⁺) is connected, so global sections there are exact and commute with colimits; with finite limits this makes F ↦ F_ȳ a point.

Used by:

- ECD Proposition 14.3: a section vanishing at all stalks vanishes
- ECD Theorem 19.2, proof: an isomorphism in D⁺(X_ét, Λ) is checked after pullback to all Spa(C, C⁺) → X
- ECD Proposition 20.12: geometric stalks of perfect-constructible complexes are perfect

API:

| name | role | statement |
|---|---|---|
| `geometricStalk` | constructor | The stalk functor F ↦ F_ȳ from Y_ét^∼ to sets (and to Λ-modules for sheaves of Λ-modules). |
| `geometricStalk.eq_pullback_sections` | characterisation | F_ȳ ≅ Γ(Spa(C(y), C(y)⁺)_ét, ȳ^∗F), naturally in F. |
| `geometricStalk.exact` | other | The stalk functor commutes with all colimits and finite limits; on sheaves of Λ-modules it is exact. |
| `geometricStalk.toPoint` | compatibility | The stalk functor is the fibre functor of a point of the site Y_ét in the sense of Mathlib's GrothendieckTopology.Point. |
| `geometricStalk.map` | functoriality | For f : Y′ → Y, y′ ∈ \|Y′\| and geometric points ȳ′ over y′ and ȳ over f(y′), (f_ét^∗F)_ȳ′ ≅ F_ȳ. |
| `geometricStalk.of_constant` | simp | The stalk of the constant sheaf with value M is M. |
| `geometricStalk.indep` | characterisation | For two geometric points ȳ, ȳ′ (quasi-pro-étale maps from geometric field pairs whose closed points map to y), F_ȳ ≅ F_ȳ′: both are the stalk at the closed point of the pullback to the chain of generalizations of y. |

Unit tests:

- `geometricStalk_closedPoint` (computation): For Y = Spa(C, C⁺) with C algebraically closed and y the closed point (ȳ = id), F_ȳ = F(Y).
- `geometricStalk_constant` (degenerate): For every y the stalk of the constant sheaf M is M.
- `geometricStalk_isPoint` (compatibility): geometricStalk is the fibre functor of a GrothendieckTopology.Point of Y_ét.
- `geometricStalk_generic_vs_global` (non-example): For Y = Spa(C, C⁺) of rank 2 with open generic point j : {η} ⊂ Y and M ≠ 0, the sheaf j_!M has F(Y) = 0 but F_η̄ = M; so stalks at generalizations are not global sections.

Acceptance:

- For Y = Spa(C, C⁺) and y the closed point the stalk is global sections; for an étale U → Y and a lift of ȳ to U, (F|U)_ȳ = F_ȳ.

Depends on: `DiamondEtaleCohomology:C0/etale-site`, `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `mathlib:CategoryTheory.GrothendieckTopology.Point`.

Sources:

- ECD, Proposition 14.3, p. 82.
- ECD, proof of Proposition 14.3, p. 82.

### `etale-site-enough-points` — The étale topos of a locally spatial diamond has enough points

Declaration `DiamondEtaleCohomology:C0/etale-site-enough-points` (theorem).

Let Y be a locally spatial diamond. For every y ∈ |Y| the stalk functor F ↦ F_ȳ at a geometric point ȳ over y is a point of Y_ét^∼, and a section s ∈ F(Y) of a sheaf F on Y_ét is zero if and only if s_ȳ = 0 for all y ∈ |Y|. Hence a map of étale sheaves is an isomorphism iff it is so on all stalks F_ȳ, y ∈ |Y|.

Construction and proof:

1. The stalk is a point by node geometric-stalk.
2. If s_ȳ = 0 for all y, choose for each y an étale neighbourhood ȳ → U_y with s|U_y = 0. Étale maps are open, so the U_y jointly cover |Y|, hence form an étale cover (node etale-site), and s = 0 by the sheaf property.

Acceptance:

- For Y = Spa(C, C⁺) the points are indexed by the totally ordered set |Y|, and stalkwise isomorphism reduces to isomorphism of sheaves on |Y|.

Depends on: `DiamondEtaleCohomology:C0/geometric-stalk`, `DiamondEtaleCohomology:C0/etale-site`, `mathlib:CategoryTheory.GrothendieckTopology.Point`.

Sources:

- ECD, Proposition 14.3, p. 82.
- ECD, proof of Proposition 14.3, p. 82.

### `comparison-morphisms` — The comparison morphisms λ_Y and ν_Y and the relative pullbacks

Declaration `DiamondEtaleCohomology:C0/comparison-morphisms` (construction).

For a diamond Y there is a morphism of sites λ_Y : Y_v → Y_qproét, and for a locally spatial diamond Y a morphism of sites ν_Y : Y_qproét → Y_ét; the underlying functors go the other way (an étale map is quasi-pro-étale, a quasi-pro-étale map has a small v-sheaf as source) and preserve finite limits, so they define morphisms of topoi with pullbacks ν_Y^∗ : Y_ét^∼ → Y_qproét^∼ and λ_Y^∗ : Y_qproét^∼ → Y_v^∼ on small sheaves, right adjoints ν_Y∗, λ_Y∗, units and counits. A map f : Y′ → Y of locally spatial diamonds (resp. diamonds, resp. a 0-truncated map of small v-stacks) induces f_ét, f_qproét, f_v, and the squares f_v ∘ λ_{Y′} = λ_Y ∘ f_qproét and f_qproét ∘ ν_{Y′} = ν_Y ∘ f_ét commute up to canonical isomorphism.

Construction and proof:

1. The inclusion functors Y_ét → Y_qproét → Y_v (on objects) preserve fibre products and terminal objects and send coverings to coverings, so they are continuous and give morphisms of sites (Mathlib's continuous-functor API).
2. Pullback functors on small sheaves are obtained at each cutoff and are compatible with the transition functors.
3. Base change along f commutes with the inclusions, which gives the commuting squares, and the units and counits are those of the adjunctions.

Used by:

- ECD Lemma 14.4, Propositions 14.7 and 14.8: full faithfulness and vanishing of higher direct images for λ_Y and ν_Y
- ECD Theorem 16.1: the commutative square of sites used for the base change morphism
- ECD Corollary 17.2: R_Yét = R(ν ∘ λ)∗ on D⁺(Y_v, Λ)

API:

| name | role | statement |
|---|---|---|
| `lambdaY` | constructor | The morphism of topoi λ_Y : Y_v^∼ → Y_qproét^∼ for a diamond Y, with λ_Y^∗ ⊣ λ_Y∗. |
| `nuY` | constructor | The morphism of topoi ν_Y : Y_qproét^∼ → Y_ét^∼ for a locally spatial diamond Y, with ν_Y^∗ ⊣ ν_Y∗. |
| `lambdaY_pullback_finiteLimits` | other | λ_Y^∗ and ν_Y^∗ preserve finite limits and all colimits. |
| `comparison_square_v` | functoriality | For f : Y′ → Y of diamonds, f_v^∗ ∘ λ_Y^∗ ≅ λ_{Y′}^∗ ∘ f_qproét^∗, compatible with composition of maps. |
| `comparison_square_et` | functoriality | For f : Y′ → Y of locally spatial diamonds, f_qproét^∗ ∘ ν_Y^∗ ≅ ν_{Y′}^∗ ∘ f_ét^∗, compatible with composition. |
| `comparison_slice` | compatibility | For U → Y étale (resp. quasi-pro-étale), the restriction of ν_Y (resp. λ_Y) to the slice at U is ν_U (resp. λ_U). |
| `comparison_derived` | functoriality | The derived pullbacks λ_Y^∗, ν_Y^∗ on D(−, Λ) and the derived pushforwards Rλ_Y∗, Rν_Y∗, with the derived adjunctions. |

Unit tests:

- `comparison_geometricPoint` (computation): For Y = Spa(C, O_C), ν_Y^∗ sends a set M to the condensed set of locally constant maps S ↦ C(S, M), i.e. the discrete condensed set.
- `comparison_empty` (degenerate): For Y = ∅ both λ_Y and ν_Y are the identity of the terminal topos.
- `comparison_perfectoid` (compatibility): For a perfectoid space X, the perfectoid spaces pro-étale over X form a basis of X_qproét, so X_qproét^∼ ≃ X_proét^∼, and under this equivalence ν_X is the comparison morphism X_proét → X_ét of DiamondsAndVStacks D2.
- `comparison_nu_not_essSurj` (non-example): For Y = Spa(C, O_C), the sheaf S ↦ C(S, Z_p) (continuous maps to Z_p) on Y_qproét is not in the essential image of ν_Y^∗, whose image consists of discrete condensed sets.

Acceptance:

- λ_Y^∗ and ν_Y^∗ commute with restriction to slices and with pullback along maps of (locally spatial) diamonds, compatibly with composition; for Y = Spa(C, O_C), ν_Y^∗ of a set M is the discrete condensed set M.

Depends on: `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C0/quasi-pro-etale-site`, `DiamondEtaleCohomology:C0/v-site`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Adjunction`.

Sources:

- ECD, paragraph after Proposition 14.3, p. 82.

### `perfectoid-bases-and-coherent-subsites` — Perfectoid bases and coherent subsites over a strictly totally disconnected space

Declaration `DiamondEtaleCohomology:C0/perfectoid-bases-and-coherent-subsites` (lemma).

Let Y be a small v-stack. Strictly totally disconnected perfectoid spaces over Y form a basis of Y_v, and if Y is a diamond, strictly totally disconnected perfectoid spaces quasi-pro-étale over Y form a basis of Y_qproét. If X is a strictly totally disconnected perfectoid space, then X_qproét^∼ ≃ X_qproét,qc,sep^∼ for the site of quasicompact separated pro-étale maps X′ → X, and X_v^∼ ≃ X_v,qcqs^∼ for the site of qcqs representable X′ → X; both subsites consist of qcqs objects, are stable under fibre products, and the topoi are coherent.

Construction and proof:

1. Every perfectoid space has a universally open pro-étale cover by strictly totally disconnected spaces (D1, ECD 7.18), and every small v-sheaf or diamond is covered by perfectoid spaces, quasi-pro-étale in the diamond case (D4, D5).
2. Over strictly totally disconnected X, quasi-pro-étale maps from qcqs sources are pro-étale and locally separated; quasicompact separated pro-étale objects are stable under fibre products (D1, P6), and qcqs representable objects of X_v likewise.
3. A site of qcqs objects closed under fibre products has a coherent topos (D0).

Acceptance:

- For X strictly totally disconnected, restriction from X_qproét to X_qproét,qc,sep is an equivalence of topoi of small sheaves, and every object of X_qproét,qc,sep is quasicompact and quasiseparated in the topos.

Depends on: `DiamondsAndVStacks:D1/universally-open-std-cover`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`, `PerfectoidSpaces:P6/pro-etale-stability-and-limits`, `DiamondsAndVStacks:D4/atlas-characterisation-of-diamonds`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `DiamondEtaleCohomology:C0/quasi-pro-etale-site`, `DiamondEtaleCohomology:C0/v-site`, `DiamondsAndVStacks:D0`.

Sources:

- ECD, proof of Lemma 14.4, p. 83.

### `separated-pro-etale-hull` — The universal separated pro-étale quotient λ∘_X(X′)

Declaration `DiamondEtaleCohomology:C0/separated-pro-etale-hull` (construction).

Let X be a strictly totally disconnected perfectoid space and X′ → X a map from a qcqs perfectoid space. There is a quasicompact separated pro-étale map λ∘_X(X′) → X with a factorization X′ → λ∘_X(X′) → X such that every map from X′ to a separated pro-étale perfectoid space over X factors uniquely through λ∘_X(X′). The map X′ → λ∘_X(X′) is surjective; in particular, a surjection X′_2 → X′_1 of quasicompact separated perfectoid spaces over X gives a surjection λ∘_X(X′_2) → λ∘_X(X′_1).

Construction and proof:

1. By ECD Corollary 7.22 (D1), quasicompact separated pro-étale perfectoid spaces over X are equivalent to spectral maps T → |X| for which T → |X| ×_{π0 X} π0 T is a pro-constructible generalizing embedding.
2. For X′ → X quasicompact separated, let T be the image of |X′| → |X| ×_{π0 X} π0 X′; it is of this form, and the corresponding λ∘_X(X′) has the universal property because maps to separated pro-étale objects are determined on these spectral data.
3. Surjectivity of X′ → λ∘_X(X′) holds by construction, and functoriality of T gives the statement for X′_2 → X′_1.

Used by:

- ECD proof of Lemma 14.4: (λ_X^∗F)(X′) = F(λ∘_X(X′)) for strictly totally disconnected X′
- ECD Theorem 16.1: the final statement compares cohomology over λ∘_X(X̃) ×_X Y′ and X̃ ×_X Y′
- ECD Theorem 14.12, proof: reduction to λ∘_X(X′) = X

API:

| name | role | statement |
|---|---|---|
| `sepProetHull` | constructor | The object λ∘_X(X′) of X_qproét,qc,sep with the map X′ → λ∘_X(X′) over X. |
| `sepProetHull.lift` | universal-property | For a separated pro-étale Z → X and g : X′ → Z over X, the unique map λ∘_X(X′) → Z through which g factors. |
| `sepProetHull.lift_comp` | universal-property | The lift composed with X′ → λ∘_X(X′) is g, and any map λ∘_X(X′) → Z with this property equals the lift. |
| `sepProetHull.surjective` | other | X′ → λ∘_X(X′) is surjective. |
| `sepProetHull.map` | functoriality | A map X′_2 → X′_1 over X induces λ∘_X(X′_2) → λ∘_X(X′_1), functorially, and surjections go to surjections. |
| `sepProetHull.of_proetale` | simp | If X′ → X is itself quasicompact separated pro-étale then λ∘_X(X′) = X′. |
| `sepProetHull.spectral_image` | characterisation | \|λ∘_X(X′)\| is the image of \|X′\| → \|X\| ×_{π0 X} π0 X′. |

Unit tests:

- `sepProetHull_self` (degenerate): λ∘_X(X) = X.
- `sepProetHull_geometricPoints` (computation): For X = Spa(C, C⁺) and X′ = Spa(C′, C′⁺) with algebraically closed C, C′, λ∘_X(X′) is the pro-constructible generalizing subspace of X formed by the generalizations of the image of the closed point of X′ (an open subset when C⁺ has finite rank); it is X exactly when X′ → X is surjective (cf. PAPER-SCHOLZE-17/E91).
- `sepProetHull_profinite` (computation): For X′ = X × S with S profinite, λ∘_X(X′) = X × S.
- `sepProetHull_not_identity` (non-example): For a nontrivial extension C ⊊ C′ of algebraically closed fields, Spa(C′, O_C′) → Spa(C, O_C) is not pro-étale, yet its hull is Spa(C, O_C).

Acceptance:

- For X′ → X already quasicompact separated pro-étale the hull is X′; for geometric points it is the pro-constructible generalizing subspace of generalizations of the image of the closed point (open when C⁺ has finite rank).

Depends on: `DiamondsAndVStacks:D1/topological-classification-of-pro-etale-maps`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `PerfectoidSpaces:P6/pro-etale-map`.

Sources:

- ECD, Lemma 14.5, p. 83.
- ECD, Lemma 14.5(i), p. 83.

### `separated-pro-etale-hull-fibre-products` — The hull commutes with fibre products of strictly totally disconnected spaces

Declaration `DiamondEtaleCohomology:C0/separated-pro-etale-hull-fibre-products` (theorem).

Let X be strictly totally disconnected and X′_1 → X′_3 ← X′_2 a diagram of strictly totally disconnected perfectoid spaces over X. Then λ∘_X(X′_1 ×_{X′_3} X′_2) → λ∘_X(X′_1) ×_{λ∘_X(X′_3)} λ∘_X(X′_2) is an isomorphism.

Construction and proof:

1. Surjectivity: reduce to connected spaces, X = Spa(C, C⁺) and X′_i = Spa(C_i, C_i⁺) (the printed X_i is a misprint, PAPER-SCHOLZE-17/E44). Restrict to the pro-constructible generalizing subspace (open if C⁺ has finite rank) where all λ∘_X(X′_i) = X, then to the smaller of the two images in the chain Spa(C_3, C_3⁺), so that X′_i → X′_3 and X′_3 → X are surjective; then |X′_1 ×_{X′_3} X′_2| → |X′_1| ×_{|X′_3|} |X′_2| → |X| is surjective (the image description of ClassicalAdicEtaleCohomology H2's surjectivity criterion for the two reductions; surjectivity of |X′_1 ×_{X′_3} X′_2| → |X′_1| ×_{|X′_3|} |X′_2| from DiamondsAndVStacks D4). ECD p. 83 calls Spa(C, (C⁺)′) → Spa(C, C⁺) an open immersion; it is the inclusion of a pro-constructible generalizing subspace (DiamondEtaleCohomology/E8).
2. Isomorphism: with the same reductions it remains that X′_1 ×_{X′_3} X′_2 is connected, which is ECD Lemma 14.6, owned by ClassicalAdicEtaleCohomology H2 (geometric connectedness under extension of geometric points).

Acceptance:

- Concrete instance: for X = Spa(C, C⁺) and geometric points X′_1 = X′_2 = Spa(C′, C′⁺) surjecting onto X′_3 = X, the fibre product Spa(C′, C′⁺) ×_X Spa(C′, C′⁺) is connected and has hull X.

Depends on: `DiamondEtaleCohomology:C0/separated-pro-etale-hull`, `ClassicalAdicEtaleCohomology:H2/geometric-connectedness-of-perfectoid-base-change`, `ClassicalAdicEtaleCohomology:H2/surjectivity-criterion-for-field-pair-extensions`, `DiamondsAndVStacks:D1/components-of-totally-disconnected`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`.

Sources:

- ECD, Lemma 14.5(ii), p. 83.
- ECD, proof of Lemma 14.5(ii), p. 84.

### `v-pullback-formula` — Values of λ_X^∗ on strictly totally disconnected objects

Declaration `DiamondEtaleCohomology:C0/v-pullback-formula` (lemma).

Let X be strictly totally disconnected and F a sheaf on X_qproét,qc,sep (equivalently on X_qproét). Then λ_X^∗F on X_v,qcqs is the sheafification of the separated presheaf X′ ↦ F(λ∘_X(X′)), and for strictly totally disconnected X′ ∈ X_v,qcqs, (λ_X^∗F)(X′) = F(λ∘_X(X′)).

Construction and proof:

1. The universal property of λ∘_X identifies λ_X^∗F with the sheafification of X′ ↦ F(λ∘_X(X′)) (the printed site X_qproét,ét,sep is a misprint for X_qproét,qc,sep, PAPER-SCHOLZE-17/E45).
2. Surjectivity of hulls (Lemma 14.5(i)) makes the presheaf separated; compatibility with fibre products of strictly totally disconnected spaces (Lemma 14.5(ii)) and the refinement of covers by strictly totally disconnected ones show that sheafification does not change values on strictly totally disconnected X′.

Acceptance:

- For F = ν^∗ of a constant sheaf M on X_ét and X′ strictly totally disconnected over X, (λ_X^∗F)(X′) = C(π0 λ∘_X(X′), M).

Depends on: `DiamondEtaleCohomology:C0/separated-pro-etale-hull`, `DiamondEtaleCohomology:C0/separated-pro-etale-hull-fibre-products`, `DiamondEtaleCohomology:C0/perfectoid-bases-and-coherent-subsites`, `DiamondEtaleCohomology:C0/comparison-morphisms`.

Sources:

- ECD, proof of Lemma 14.4, p. 84.

### `pullback-preserves-limits` — λ_Y^∗ and quasi-pro-étale pullbacks commute with all small limits

Declaration `DiamondEtaleCohomology:C0/pullback-preserves-limits` (theorem).

Let Y be a diamond. Then λ_Y^∗ : Y_qproét^∼ → Y_v^∼ commutes with all small limits. If f : Y′ → Y is any map of diamonds, then f^∗ : Y_qproét^∼ → Y′_qproét^∼ commutes with all small limits.

Construction and proof:

1. The statements are quasi-pro-étale local on Y and Y′, so assume Y = X and Y′ = X′ strictly totally disconnected and work on the coherent subsites X_qproét,qc,sep and X_v,qcqs.
2. By the formula (λ_X^∗F)(X′) = F(λ∘_X(X′)) on strictly totally disconnected X′, which form a basis of X_v,qcqs, and since evaluation commutes with limits, λ_X^∗ commutes with limits. The same argument applies to f^∗.

Acceptance:

- Concrete instance: for Y = Spa(C, O_C), λ_Y^∗ of an infinite product of condensed sets is the product of the pullbacks.

Depends on: `DiamondEtaleCohomology:C0/v-pullback-formula`, `DiamondEtaleCohomology:C0/perfectoid-bases-and-coherent-subsites`, `DiamondEtaleCohomology:C0/comparison-morphisms`.

Sources:

- ECD, Lemma 14.4, p. 82.
- ECD, proof of Lemma 14.4, p. 84.

### `v-pullback-fully-faithful` — λ_Y^∗ is fully faithful

Declaration `DiamondEtaleCohomology:C0/v-pullback-fully-faithful` (theorem).

Let Y be a diamond. Then λ_Y^∗ : Y_qproét^∼ → Y_v^∼ is fully faithful: for every small sheaf F on Y_qproét the unit F → λ_Y∗λ_Y^∗F is an isomorphism.

Construction and proof:

1. The unit statement is local in Y_qproét, so assume Y = X strictly totally disconnected.
2. For X′ ∈ X_qproét,qc,sep, (λ_X∗λ_X^∗F)(X′) = (λ_X^∗F)(X′) = F(λ∘_X(X′)) = F(X′) by the formula of node v-pullback-formula (λ∘_X(X′) = X′ for such X′). These X′ form a basis of X_qproét (the printed 'X_qproét = X_qproét' and λ_Y are misprints, PAPER-SCHOLZE-17/E89), so the unit is an isomorphism.

Acceptance:

- For Y = Spa(C, O_C), small sheaves on Y_qproét are condensed sets, and λ_Y^∗ embeds them fully faithfully into small v-sheaves on Y.

Depends on: `DiamondEtaleCohomology:C0/v-pullback-formula`, `DiamondEtaleCohomology:C0/separated-pro-etale-hull`, `DiamondEtaleCohomology:C0/perfectoid-bases-and-coherent-subsites`.

Sources:

- ECD, Proposition 14.7, p. 84.

### `v-pullback-higher-vanishing` — Vanishing of higher direct images R^iλ_Y∗λ_Y^∗F for étale F

Declaration `DiamondEtaleCohomology:C0/v-pullback-higher-vanishing` (theorem).

Let Y be a locally spatial diamond and F a sheaf of abelian groups (resp. groups) on Y_qproét that comes via pullback from Y_ét. Then R^iλ_Y∗λ_Y^∗F = 0 for all i > 0 (resp. for i = 1). The statement is not claimed for arbitrary sheaves on Y_qproét.

Construction and proof:

1. Reduce to H^i(X_v, λ^∗F) = 0 for i > 0, X strictly totally disconnected and F pulled back from X_ét.
2. Let i be minimal with a nonzero class α; kill it on an affinoid perfectoid v-cover X′ → X and represent it by a Čech cocycle on the (i+1)-fold fibre product. Write X′ as a cofiltered limit of rational subsets X′_j of finite-dimensional perfectoid balls over X: for X′ = Spa(R′, R′⁺) over X = Spa(R, R⁺), finite subsets of R′⁺ give maps to perfectoid balls B^n_X, and the rational subsets containing the image of X′ cut out by inequalities valid on X′ have limit with space |X′| (PerfectoidSpaces P5, limit-underlying-space-homeomorphism; DiamondsAndVStacks D0, pro-constructible subsets) and ring the completed colimit, which is (R′, R′⁺). The fibre powers of X′ are affinoid perfectoid but not strictly totally disconnected, so the formula of node v-pullback-formula does not apply to them. Instead, for affinoid perfectoid Z over X and F = ν^∗G, (λ_X^∗F)(Z) = Γ(Z_ét, G|_Z), by the comparison square f_v^∗λ_X^∗ ≅ λ_Z^∗f_qproét^∗ for f : Z → X (node comparison-morphisms) and the unit isomorphisms of nodes v-pullback-fully-faithful and quasi-pro-etale-pullback-fully-faithful. By node etale-cohomology-continuity (j = 0), applied to the fibre powers of X′ = lim_j X′_j, the Čech complex of λ^∗F for X′ → X is the filtered colimit of the Čech complexes for X′_j → X, so the cocycle and its cocycle identity descend to some X′_j.
3. By ECD Lemma 9.5 (owned by DiamondsAndVStacks D3) X′_j → X splits, so α = 0.
4. For i ≥ 2 the passage from α to a Čech cocycle needs vanishing of the intermediate v-cohomology of the fibre powers of X′, which the source does not show (PAPER-SCHOLZE-17/E46). The case i = 1, hence the statement for sheaves of groups, is complete; the higher case is recorded as a gap with two repair routes: vanishing of the étale groups for a suitable X′, or a hypercover form of the approximation-and-splitting step. The latter needs an input not in ECD: either compatibility of λ∘_X with the finite limits forming the matching objects of a strictly totally disconnected v-hypercover, or a choice of hypercover for which λ∘_X(X_•) is a quasi-pro-étale hypercover of X. Lemma 14.5(ii) alone does not give this: the matching object (cosk_1 X_•)_2 is a limit over X_0 ×_X X_0, which is not strictly totally disconnected, and over X = Spa(C, O_C) with X_0 = Spa(C_0, O_{C_0}) the map λ∘(X_2) → (cosk_1 λ∘X_•)_2 can fail to be surjective.

Acceptance:

- The proof route for i ≥ 2 must close the gap recorded for PAPER-SCHOLZE-17/E46 before the theorem is used in degrees ≥ 2.

Depends on: `DiamondEtaleCohomology:C0/v-pullback-formula`, `DiamondEtaleCohomology:C0/v-pullback-fully-faithful`, `DiamondEtaleCohomology:C0/quasi-pro-etale-pullback-fully-faithful`, `DiamondsAndVStacks:D3/descended-subsets-are-cut-out-by-functions`, `DiamondsAndVStacks:D3`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `DiamondEtaleCohomology:C0/etale-cohomology-continuity`, `DiamondEtaleCohomology:C0/comparison-morphisms`, `PerfectoidSpaces:P5/limit-underlying-space-homeomorphism`, `DiamondsAndVStacks:D0/pro-constructible-subsets`.

Sources:

- ECD, Proposition 14.7, p. 84.
- ECD, after Proposition 14.7, p. 84.
- ECD, proof of Proposition 14.7, p. 85.

### `etale-to-quasi-pro-etale-basis` — Pro-objects of quasicompact separated étale maps form a basis of Y_qproét

Declaration `DiamondEtaleCohomology:C0/etale-to-quasi-pro-etale-basis` (lemma).

Let Y be a spatial diamond and Y_ét,qc,sep ⊂ Y_ét the full subcategory of quasicompact separated étale maps. Then Y_ét,qc,sep is an essentially small basis of Y_ét, so Y_ét,qc,sep^∼ ≃ Y_ét^∼. The functor Pro(Y_ét,qc,sep) → Y_qproét, “lim” Ỹ_j ↦ lim Ỹ_j, is fully faithful and its essential image is a basis of Y_qproét; for a sheaf F on Y_ét and Ỹ = lim Ỹ_j, (ν_Y^∗F)(Ỹ) = colim_j F(Ỹ_j).

Construction and proof:

1. Étale maps are locally separated (Convention 10.2) and quasicompact separated étale maps form a basis (ECD Corollary 11.28, D5).
2. Full faithfulness of Pro(Y_ét,qc,sep) → Y_qproét follows from the finite-stage comparison ECD Proposition 11.23(iii) (D5), as in the affinoid pro-étale case ECD Proposition 7.10 (PerfectoidSpaces P6).
3. Basis: choose a universally open quasi-pro-étale strictly totally disconnected X → Y with X ∈ Pro(Y_ét,qc,sep) (ECD 11.24, D5); for quasi-pro-étale Y′ → Y, X ×_Y Y′ covers Y′ and is covered by spaces affinoid pro-étale over X, which lie in Pro(Y_ét,qc,sep).
4. The formula for ν_Y^∗F follows from the limit description as in ECD Proposition 8.5.

Acceptance:

- For Y affinoid perfectoid, Pro(Y_ét,qc,sep) contains Pro of the affinoid étale site, and the comparison specializes to ECD Proposition 7.10.

Depends on: `DiamondsAndVStacks:D5/local-structure-of-etale-maps`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondsAndVStacks:D5/universally-open-presentation`, `PerfectoidSpaces:P6/pro-etale-pro-category-equivalence`, `DiamondsAndVStacks:D2/pro-etale-etale-comparison-and-structure-sheaves`, `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C0/quasi-pro-etale-site`, `DiamondEtaleCohomology:C0/comparison-morphisms`.

Sources:

- ECD, proof of Proposition 14.8, p. 85.

### `quasi-pro-etale-pullback-fully-faithful` — ν_Y^∗ is fully faithful with vanishing higher direct images

Declaration `DiamondEtaleCohomology:C0/quasi-pro-etale-pullback-fully-faithful` (theorem).

Let Y be a locally spatial diamond. Then ν_Y^∗ : Y_ét^∼ → Y_qproét^∼ is fully faithful: for every sheaf F on Y_ét the unit F → ν_Y∗ν_Y^∗F is an isomorphism, and if F is a sheaf of abelian groups (resp. groups) then R^iν_Y∗ν_Y^∗F = 0 for all i > 0 (resp. for i = 1).

Construction and proof:

1. Assume Y spatial. Replace ν_Y by Pro(Y_ét,qc,sep) → Y_ét,qc,sep using node etale-to-quasi-pro-etale-basis.
2. Then argue as in ECD Proposition 8.5 (DiamondsAndVStacks D2): by node etale-to-quasi-pro-etale-basis, (ν^∗F)(Ỹ) = colim_j F(Ỹ_j) on the basis Pro(Y_ét,qc,sep), which gives the unit isomorphism. Every covering of Ỹ = lim Ỹ_j in Y_qproét is refined by a cofiltered limit of quasicompact separated étale coverings descended to a finite stage (D5 finite-stage comparison), so Čech complexes of ν^∗F on the basis are filtered colimits of étale Čech complexes; the Čech-to-derived comparison (D0) gives H^i(U_qproét, ν^∗F) = H^i(U_ét, F) for U ∈ Y_ét,qc,sep, whose sheafification on Y_ét is 0 for i > 0.

Acceptance:

- For strictly totally disconnected Y and a quasicompact open U ⊂ Y, H^i(U_qproét, ν^∗F) = H^i(U_ét, F) = 0 for i > 0.

Depends on: `DiamondEtaleCohomology:C0/etale-to-quasi-pro-etale-basis`, `DiamondsAndVStacks:D2/pro-etale-etale-comparison-and-structure-sheaves`, `DiamondEtaleCohomology:C0/comparison-morphisms`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`.

Sources:

- ECD, Proposition 14.8, p. 85.
- ECD, proof of Proposition 14.8, p. 85.

### `etale-cohomology-continuity` — Étale cohomology commutes with cofiltered limits of spatial diamonds ★

Declaration `DiamondEtaleCohomology:C0/etale-cohomology-continuity` (theorem).

Let Y_i, i ∈ I, be a cofiltered inverse system of spatial diamonds with inverse limit Y, and assume I has a final object 0. Let F_0 be an étale sheaf on Y_0 with pullbacks F_i to Y_i and F to Y. Then colim_i H^j(Y_i, F_i) → H^j(Y, F) is an isomorphism for j = 0 if F_0 is a sheaf of sets, for j = 0, 1 if it is a sheaf of groups, and for all j ≥ 0 if it is a sheaf of abelian groups. Relative form: for i_0 ∈ I and f_i : Y → Y_i, f_{i,i_0} : Y_i → Y_{i_0}, one has R^q f_{i_0∗}F = colim_{i→i_0} R^q f_{i,i_0∗}F_i on (Y_{i_0})_ét, in the same range of q as the absolute statement (q = 0 for sheaves of sets, q ≤ 1 for sheaves of groups, all q for abelian sheaves).

Construction and proof:

1. Transition maps between spatial diamonds are qcqs, and Y is a spatial diamond (D5).
2. Replace each étale site by its quasicompact separated part. By ECD Proposition 11.23(iii) (D5), the quasicompact separated étale objects over Y form the 2-colimit of those over the Y_i; finite jointly surjective families descend to a finite stage because |Y| = lim |Y_i| and quasicompact opens of a cofiltered limit of spectral spaces come from a finite stage (PerfectoidSpaces P5). So Y_ét,qc,sep^∼ is the limit of the fibred coherent topos (Y_i)_ét,qc,sep^∼.
3. Apply the theorem on cohomology of a cofiltered limit of coherent topoi with coherent transition maps (SGA 4 VI 8.7.7), requested from DiamondsAndVStacks D0, the owner of the ordinary topos interfaces. The relative form follows by applying the absolute form to the systems Y_i ×_{Y_{i_0}} U for quasicompact separated étale U → Y_{i_0}.

Acceptance:

- Concrete instance (ECD proof of 19.5(ii)): H^i of a perfectoid annulus is the colimit of H^i of the annuli Y′_{n,L} over finite extensions L of k((t^{1/p^∞})).

Depends on: `DiamondEtaleCohomology:C0/etale-to-quasi-pro-etale-basis`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondEtaleCohomology:C0/algebraic-topoi`, `PerfectoidSpaces:P5/quasicompact-opens-in-limits-of-spectral-spaces`, `DiamondsAndVStacks:D0`.

Sources:

- ECD, Proposition 14.9, p. 86.
- ECD, proof of Proposition 14.9, p. 86.

### `std-etale-acyclic` — The étale topos of a strictly totally disconnected space

Declaration `DiamondEtaleCohomology:C0/std-etale-acyclic` (lemma).

Let X be a strictly totally disconnected perfectoid space. Then X_ét^∼ is equivalent to the topos of sheaves on |X|, every étale cover of a quasicompact open U ⊂ X splits, and H^i(U_ét, F) = 0 for all i > 0, all sheaves of abelian groups F and all quasicompact open U; in particular these U form a basis of X_ét of objects with vanishing higher cohomology.

Construction and proof:

1. Quasicompact opens U of a strictly totally disconnected space are strictly totally disconnected (pro-constructible generalizing subsets, D1 api) and every étale cover of such U splits (D1, definition). For an étale V → X and v ∈ V, the local structure of étale maps (DiamondsAndVStacks D5, ECD 11.31) gives opens V′ ∋ v and U ∋ f(v), U quasicompact (hence strictly totally disconnected), with V′ → U a quasicompact open immersion into a finite étale W → U; a finite étale cover of a strictly totally disconnected U splits on a finite clopen cover of U (it splits over each component Spa(C, C⁺) and spreads out, D1), so V′ is near v isomorphic to an open of U. Hence V ↦ |V| identifies X_ét^∼ with Sh(|X|), also for Λ-modules and compatibly with pullback.
2. If every cover of U splits, a sheaf surjection is surjective on U-sections, so Γ(U, −) is exact and H^i(U, F) = 0 for i > 0.

Acceptance:

- This is the proof owner for étale acyclicity of strictly totally disconnected spaces in ECD §14. The stable C8/strictly-disconnected-acyclic identifier exports this result, and C8/qpetale-direct-image cites this C0 node directly; no second proof is planned.

Depends on: `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondsAndVStacks:D1/components-of-totally-disconnected`, `DiamondEtaleCohomology:C0/etale-site`, `mathlib:CategoryTheory.Sheaf.H`, `DiamondsAndVStacks:D5/local-structure-of-etale-maps`.

Sources:

- ECD, proof of Proposition 14.10, p. 86.
- ECD, Definition 20.1(i), p. 113.

### `quasi-pro-etale-topos-replete` — The quasi-pro-étale topos of a diamond is replete

Declaration `DiamondEtaleCohomology:C0/quasi-pro-etale-topos-replete` (theorem).

Let Y be a diamond and κ a cutoff cardinal. The topos Y_qproét,κ^∼ (hence the category of small sheaves on Y_qproét) is replete: for every sequence of epimorphisms of sheaves ⋯ → F_2 → F_1 → F_0, the map lim_n F_n → F_0 is an epimorphism.

Construction and proof:

1. Strictly totally disconnected spaces quasi-pro-étale over Y form a basis (node perfectoid-bases-and-coherent-subsites), and every covering of such X in Y_qproét is refined by a single affinoid pro-étale surjection X_1 → X with X_1 strictly totally disconnected (D1: universally open strictly totally disconnected covers; quasicompact separated pro-étale maps over X are affinoid pro-étale).
2. Countable lifting tower: lift s_0 ∈ F_0(X) along affinoid pro-étale surjections X_{n+1} → X_n with lifts s_{n+1} ∈ F_{n+1}(X_{n+1}); X_∞ = lim X_n is affinoid pro-étale over X (cofiltered limits of affinoid pro-étale maps, PerfectoidSpaces P6), κ-small for an adequate κ, and X_∞ → X is surjective (inverse limit of surjective spectral maps), hence a covering in Y_qproét.
3. The sections s_n|X_∞ give a section of lim F_n lifting s_0. ECD instead uses the basis of strictly w-local spaces with extremally disconnected π0, on which every pro-étale cover splits; the tower argument avoids that input and is the one the stage text asks for.
4. Surjectivity of X_∞ → X: the fibres over a point of X are nonempty pro-constructible subsets, compact Hausdorff in the constructible topology, so their cofiltered limit is nonempty (Mathlib TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system).

Acceptance:

- Repleteness, not only left-completeness, is what AdicCoefficientsAndComparisons and the hypercover descent of C2 use.

Depends on: `DiamondEtaleCohomology:C0/quasi-pro-etale-site`, `DiamondEtaleCohomology:C0/perfectoid-bases-and-coherent-subsites`, `EnhancedDerivedSheaves:E2/replete-topoi`, `DiamondsAndVStacks:D1/universally-open-std-cover`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`, `PerfectoidSpaces:P6/affinoid-pro-etale-cofiltered-limits`, `PerfectoidSpaces:P6/kappa-small-cofiltered-limits`, `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `mathlib:TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`, `PerfectoidSpaces:P5/limit-underlying-space-homeomorphism`.

Sources:

- ECD, proof of Proposition 14.10, p. 86.

### `v-topos-replete` — The v-topos of a small v-stack is replete

Declaration `DiamondEtaleCohomology:C0/v-topos-replete` (theorem).

Let Y be a small v-stack and κ a cutoff cardinal. The topos Y_v,κ^∼ (and hence the category of small sheaves on Y_v) is replete: for every sequence of epimorphisms of sheaves ⋯ → F_2 → F_1 → F_0, the map lim_n F_n → F_0 is an epimorphism.

Construction and proof:

1. Countable lifting tower: given s_0 ∈ F_0(X) with X affinoid perfectoid over Y, choose inductively affinoid perfectoid v-covers X_{n+1} → X_n and lifts s_{n+1} ∈ F_{n+1}(X_{n+1}) of s_n|X_{n+1}, using that every v-cover of an affinoid perfectoid space is refined by one affinoid perfectoid space.
2. X_∞ = lim_n X_n is affinoid perfectoid (cofiltered limits of affinoid perfectoid spaces, PerfectoidSpaces P5), κ-small for a cutoff κ (P6), and X_∞ → X is a v-cover because an inverse limit of surjective spectral maps of spectral spaces is surjective.
3. The compatible sections s_n|X_∞ give a section of lim F_n over X_∞ lifting s_0, so lim F_n → F_0 is an epimorphism.
4. This is the input [BS15, Proposition 3.3.3] needs; ECD asserts repleteness without proof.
5. Surjectivity of X_∞ → X: the fibres over a point of X are nonempty pro-constructible subsets, compact Hausdorff in the constructible topology, so their cofiltered limit is nonempty (Mathlib TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system).

Acceptance:

- The tower is countable; no choice beyond countable dependent choice of covers is used, and the cutoff κ is fixed in advance so that X_∞ stays κ-small.

Depends on: `DiamondEtaleCohomology:C0/v-site`, `EnhancedDerivedSheaves:E2/replete-topoi`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P5/limit-underlying-space-homeomorphism`, `PerfectoidSpaces:P6/kappa-small-cofiltered-limits`, `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `mathlib:TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`.

Sources:

- ECD, proof of Proposition 14.10, p. 86.

### `left-completeness` — Left-completeness of the v-, quasi-pro-étale and étale derived categories ★

Declaration `DiamondEtaleCohomology:C0/left-completeness` (theorem).

Let Y be a small v-stack and Λ a ring. (i) D(Y_v, Λ) is left-complete: A ≅ R lim_n τ^{≥−n}A for all A. (ii) If Y is a diamond, D(Y_qproét, Λ) is left-complete. (iii) If Y is a strictly totally disconnected perfectoid space, D(Y_ét, Λ) is left-complete.

Construction and proof:

1. (i) and (ii): Y_v,κ^∼ and Y_qproét,κ^∼ are replete (nodes v-topos-replete and quasi-pro-etale-topos-replete), so their derived categories of Λ-modules are left-complete (EnhancedDerivedSheaves E2, BS15 3.3.3, requested there for module coefficients), compatibly with the cutoff transitions. The transition functors commute with R lim of sequences (C0/cutoff-derived-categories API cutoffDerived.transition_products), so R lim τ^{≥−n}A in the colimit category is computed at any cutoff containing A.
2. (iii): X_ét has a basis of objects U with H^i(U, F) = 0 for i > 0 and all F (node std-etale-acyclic); testing A → R lim τ^{≥−n}A on such U shows it is an isomorphism.

Acceptance:

- Concrete instance: for Y = Spa(C, C⁺), D(Y_ét, Λ) = D(|Y|, Λ) is left-complete.

Depends on: `DiamondEtaleCohomology:C0/v-topos-replete`, `DiamondEtaleCohomology:C0/quasi-pro-etale-topos-replete`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `EnhancedDerivedSheaves:E2/left-completion`, `EnhancedDerivedSheaves:E2/postnikov-left-completion`, `DiamondEtaleCohomology:C0/cutoff-derived-categories`, `EnhancedDerivedSheaves:E2`.

Sources:

- ECD, Proposition 14.11, p. 86.
- ECD, before Proposition 14.11, p. 86.

### `bounded-below-comparison` — Bounded-below comparison of étale, quasi-pro-étale and v-cohomology ★

Declaration `DiamondEtaleCohomology:C0/bounded-below-comparison` (theorem).

Let Y be a locally spatial diamond and Λ a ring. The pullback functors ν_Y^∗ : D⁺(Y_ét, Λ) → D⁺(Y_qproét, Λ) and λ_Y^∗ν_Y^∗ : D⁺(Y_ét, Λ) → D⁺(Y_v, Λ) are fully faithful.

Construction and proof:

1. For A ∈ D⁺(Y_ét, Λ), A → Rν_Y∗ν_Y^∗A and ν_Y^∗A → Rλ_Y∗λ_Y^∗ν_Y^∗A are isomorphisms: by bounded-below dévissage it suffices to treat sheaves, where it is the vanishing of higher direct images (nodes quasi-pro-etale-pullback-fully-faithful and v-pullback-higher-vanishing) and the unit isomorphisms.
2. Full faithfulness of derived pullbacks follows from the derived adjunctions.

Acceptance:

- The v-statement in cohomological degrees ≥ 2 inherits the gap recorded for PAPER-SCHOLZE-17/E46 through v-pullback-higher-vanishing; the quasi-pro-étale statement does not.

Depends on: `DiamondEtaleCohomology:C0/quasi-pro-etale-pullback-fully-faithful`, `DiamondEtaleCohomology:C0/v-pullback-higher-vanishing`, `DiamondEtaleCohomology:C0/v-pullback-fully-faithful`, `DiamondEtaleCohomology:C0/comparison-morphisms`, `DiamondEtaleCohomology:C0/cutoff-derived-categories`.

Sources:

- ECD, Proposition 14.10, p. 86.
- ECD, proof of Proposition 14.10, p. 86.

### `unbounded-comparison-std` — Unbounded comparison over strictly totally disconnected spaces

Declaration `DiamondEtaleCohomology:C0/unbounded-comparison-std` (theorem).

If Y is a strictly totally disconnected perfectoid space, the pullback functors ν_Y^∗ : D(Y_ét, Λ) → D(Y_qproét, Λ) and λ_Y^∗ν_Y^∗ : D(Y_ét, Λ) → D(Y_v, Λ) are fully faithful.

Construction and proof:

1. All three derived categories are left-complete (node left-completeness), and the pullbacks are t-exact.
2. For A ∈ D(Y_ét, Λ) write A = R lim τ^{≥−n}A; the unit maps are derived limits of the bounded-below unit isomorphisms (node bounded-below-comparison), and pullback commutes with these Postnikov limits since both sides are determined on cohomology sheaves.

Acceptance:

- Consequence used by DiamondSixOperations: for strictly totally disconnected X, D(X_ét, Λ) = D(|X|, Λ) sits fully faithfully in D(X_v, Λ).
- The statement for λ_Y^∗ν_Y^∗ inherits the gap recorded for PAPER-SCHOLZE-17/E46 through bounded-below-comparison (v-cohomology in degrees ≥ 2); the statement for ν_Y^∗ does not.

Depends on: `DiamondEtaleCohomology:C0/bounded-below-comparison`, `DiamondEtaleCohomology:C0/left-completeness`, `DiamondEtaleCohomology:C0/std-etale-acyclic`.

Sources:

- ECD, Proposition 14.10, p. 86.
- ECD, proof of Proposition 14.10, p. 86.

## C1. General base change, before v-locality

Theorem 16.1 compares the v-pushforward with the quasi-pro-étale pushforward of a sheaf pulled back from the étale site, through the explicitly constructed base change transformations; it holds in degree 0, in all degrees for quasi-pro-étale maps, and in all degrees for prime-to-p torsion, together with a final statement over strictly totally disconnected bases that combines invariance under change of algebraically closed base field with 'pro-étale cohomology = v-cohomology'. The three cases stay separate. Corollaries 16.5 and 16.8, which concern D_ét of small v-stacks, are proved in C2 after Definition 14.13; C1 states 16.4 and 16.9 for complexes whose cohomology sheaves come from the étale site. The derived Corollary 16.4, Proposition 16.6, Corollary 16.7 and the classical base change Corollaries 16.9 and 16.10 follow, on D⁺ or for complexes with étale cohomology sheaves.

Other roadmaps: ClassicalAdicEtaleCohomology H2 (Lemma 14.6, Lemma 16.3 and invariance for affinoid perfectoid spaces), DiamondsAndVStacks D1, EnhancedDerivedSheaves E3 (mates).

Coverage: planned. Remaining: Lemma-level refinement of the reduction in the proof of Theorem 16.1 (fibrewise over π0, filtration by j_!M on a chain) and of the Čech argument in Corollary 16.8 (placed in C2). C1 inherits the C0 gap only through the v-part of Proposition 14.7 in degrees ≥ 2 used to replace v-cohomology by étale cohomology. DiamondsAndVStacks:D6 is named by the stage text only for ECD's use of Lemma 15.6 in the proof of Lemma 16.3; ClassicalAdicEtaleCohomology:H2 proves Lemma 16.3 without it, so no C1 node cites D6.

Planets: **Comparison of v- and pro-étale pushforward** (`v-pushforward-prime-to-p`); **Derived v- vs pro-étale base change** (`derived-v-pushforward-comparison`); **Base change for qcqs maps** (`etale-base-change-sheaves`).

### `base-change-transformations` — The base change transformations comparing étale, quasi-pro-étale and v-pushforwards

Declaration `DiamondEtaleCohomology:C1/base-change-transformations` (construction).

Let f : Y′ → Y be a map of locally spatial diamonds. From the commuting squares f_v ∘ λ_{Y′} ≅ λ_Y ∘ f_qproét and f_qproét ∘ ν_{Y′} ≅ ν_Y ∘ f_ét, construct the base change morphisms λ_Y^∗R^if_qproét∗F → R^if_v∗λ_{Y′}^∗F and ν_Y^∗R^if_ét∗F → R^if_qproét∗ν_{Y′}^∗F, and their derived versions λ_Y^∗Rf_qproét∗ → Rf_v∗λ_{Y′}^∗ and ν_Y^∗Rf_ét∗ → Rf_qproét∗ν_{Y′}^∗; for a cartesian square of locally spatial diamonds (g′ : Y′ → Y over g : X′ → X, f, f′) construct g^∗Rf∗ → Rf′∗g′^∗ on the quasi-pro-étale and on the étale sites. For strictly totally disconnected X and strictly totally disconnected X̃ ∈ X_v with factorization X̃ → λ∘_X(X̃) → X, construct the comparison H^i((λ∘_X(X̃) ×_X Y′)_qproét, F) → H^i((X̃ ×_X Y′)_v, λ_{Y′}^∗F). These transformations are compatible with composition of maps and with restriction to quasi-pro-étale slices.

Construction and proof:

1. Each transformation is the mate of the corresponding commutation isomorphism of pullbacks under the pullback–pushforward adjunctions (EnhancedDerivedSheaves E3, mates and Beck–Chevalley).
2. Pasting of mates gives compatibility with horizontal and vertical composition of squares; restriction to a slice is a special case of base change along a quasi-pro-étale map and is compatible by the same pasting.
3. The cohomology comparison is induced by X̃ ×_X Y′ → λ∘_X(X̃) ×_X Y′ and the pullback λ_{Y′}^∗.

Used by:

- ECD Theorem 16.1: the isomorphism statements in degree 0, for quasi-pro-étale f and for prime-to-p torsion
- ECD Corollaries 16.9 and 16.10: classical base change in cartesian squares
- DiamondEtaleCohomology:C8/qpetale-direct-image: the actual base change transformation on all abelian étale sheaves

API:

| name | role | statement |
|---|---|---|
| `vQproetBaseChange` | constructor | The natural transformation λ_Y^∗ ∘ Rf_qproét∗ ⟶ Rf_v∗ ∘ λ_{Y′}^∗ of functors D(Y′_qproét, Λ) → D(Y_v, Λ), the mate of f_v^∗λ_Y^∗ ≅ λ_{Y′}^∗f_qproét^∗. |
| `etQproetBaseChange` | constructor | The natural transformation ν_Y^∗ ∘ Rf_ét∗ ⟶ Rf_qproét∗ ∘ ν_{Y′}^∗ of functors D(Y′_ét, Λ) → D(Y_qproét, Λ). |
| `squareBaseChange` | constructor | For a cartesian square, g^∗Rf∗ ⟶ Rf′∗g′^∗ on the quasi-pro-étale and on the étale sites. |
| `vQproetBaseChange.comp` | functoriality | For composable f and h, the transformation for f ∘ h is the pasting of those for f and h. |
| `vQproetBaseChange.id` | simp | For f = id the transformation is the identity. |
| `vQproetBaseChange.slice` | compatibility | Restriction to a quasi-pro-étale U → Y carries the transformation for f to that for f ×_Y U. |
| `vQproetBaseChange.cohomology` | characterisation | On cohomology sheaves the derived transformation induces the sheaf-level base change maps in each degree i, and for strictly totally disconnected X it is computed by the cohomology comparison over λ∘_X(X̃) ×_X Y′ and X̃ ×_X Y′. |
| `etQproetBaseChange.comp` | functoriality | For composable f and h, the transformation ν^∗Rf_ét∗ → Rf_qproét∗ν^∗ for f ∘ h is the pasting of those for f and h; for f = id it is the identity. |
| `squareBaseChange.paste` | functoriality | The base change transformation of a horizontal or vertical composite of cartesian squares is the pasting of the transformations of the two squares. |
| `squareBaseChange.iso_of_qproet` | characterisation | If g is quasi-pro-étale, X′_qproét is the slice of X_qproét at X′ and g^∗Rf_qproét∗ → Rf′_qproét∗g′^∗ is an isomorphism on all of D(Y_qproét, Λ) (restriction to slices). |

Unit tests:

- `baseChange_id` (degenerate): For f = id_Y every base change transformation is the identity.
- `baseChange_fold` (computation): For the fold map Y ⊔ Y → Y and F = F_1 ⊔ F_2, R^0f∗F = F_1 × F_2 and the base change morphism in degree 0 is the identity of λ_Y^∗F_1 × λ_Y^∗F_2.
- `baseChange_degree_zero` (characterisation): In degree 0 the transformation λ_Y^∗f_qproét∗F → f_v∗λ_{Y′}^∗F is the mate of the commutation isomorphism; evaluated on strictly totally disconnected X̃ over strictly totally disconnected X it is F((λ∘_X(X̃) ×_X Y′)) → (λ_{Y′}^∗F)(X̃ ×_X Y′).
- `baseChange_ArtinSchreier` (non-example): With p-torsion coefficients the final comparison need not be an isomorphism: for the perfectoid closed disc D over Spa(C, O_C), C ⊊ C′ with strictly larger residue field and F = F_p, the Artin–Schreier class of c′T in H^1(D_{C′}, F_p), for c′ ∈ O_{C′} with residue class outside the residue field of C, is not in the image of H^1(D_C, F_p).

Acceptance:

- The base change transformation is constructed for all f, all i and all coefficients; only the isomorphism statements carry hypotheses.

Depends on: `DiamondEtaleCohomology:C0/comparison-morphisms`, `DiamondEtaleCohomology:C0/separated-pro-etale-hull`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `DiamondEtaleCohomology:C0/cutoff-derived-categories`.

Sources:

- ECD, Theorem 16.1, p. 92.
- ECD, Proposition 16.6, p. 94.

### `strictly-local-reduction` — Reduction of Theorem 16.1 to geometric points and extension by zero

Declaration `DiamondEtaleCohomology:C1/strictly-local-reduction` (lemma).

In the situation of Theorem 16.1 it suffices to prove the final statement for strictly totally disconnected X and X̃, and that statement reduces to: for connected strictly totally disconnected X = Spa(C, C⁺), X̃ = Spa(C̃, C̃⁺) and X′ = Spa(C′, C′⁺) with X̃ → X and X′ → X surjective, and F = j_!M for a quasicompact open V ⊂ X′ with inclusion j and an abelian group M, the map H^i(X′_ét, F) → H^i((X̃ ×_X X′)_ét, F) is an isomorphism (in degree 0, for f pro-étale, or for nM = 0 with n prime to p).

Construction and proof:

1. The isomorphism question is pro-étale local on Y and on Y′, and the sheaf statement follows from the final statement by sheafification; so assume Y = X and Y′ = X′ strictly totally disconnected.
2. Replace quasi-pro-étale and v-cohomology by étale cohomology (Propositions 14.7 and 14.8, nodes of C0). Both sides are the stalks, at points s ∈ S = π0 X̃ ×_{π0 X} π0 X′, of sheaves on the profinite set S; the fibre over s is the cofiltered limit of the quasicompact open and closed preimages of clopen neighbourhoods of s, so its cohomology is the colimit (C0/etale-cohomology-continuity). Hence assume X̃, X, X′ connected; then replace X by the intersection of the images of X̃ and X′, and X̃, X′ by their pullbacks.
3. X′_ét^∼ ≃ Sh(|X′|) with |X′| a chain (C0/std-etale-acyclic). Every sheaf is a filtered colimit of constructible sheaves, each with a finite filtration whose graded pieces are i_!M for V_x ∖ V_y, with 0 → j_{y!}M → j_{x!}M → i_!M → 0 exact; H^i(X′, −) and H^i(W, −), W = X̃ ×_X X′, commute with filtered colimits (both are qcqs with coherent topoi, DiamondsAndVStacks D0). By the long exact sequences and the five lemma it suffices to treat F = j_!M (with nM = 0 in case (iii)); when V ≠ X′ the vanishing of H^0(W, j_!M) depends only on the underlying sheaf of sets, which reduces case (i) to case (iii).

Acceptance:

- The reduction keeps the three cases apart: degree 0, quasi-pro-étale f, and nF = 0 with n prime to p; no case is used to prove another except through the stated reduction of case (i) for V ≠ X′ to case (iii).

Depends on: `DiamondEtaleCohomology:C1/base-change-transformations`, `DiamondEtaleCohomology:C0/v-pullback-fully-faithful`, `DiamondEtaleCohomology:C0/v-pullback-higher-vanishing`, `DiamondEtaleCohomology:C0/quasi-pro-etale-pullback-fully-faithful`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `DiamondsAndVStacks:D1/components-of-totally-disconnected`, `DiamondEtaleCohomology:C0/etale-cohomology-continuity`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`.

Sources:

- ECD, proof of Theorem 16.1, p. 92.
- ECD, proof of Theorem 16.1, p. 93.

### `v-pushforward-degree-zero` — v- and quasi-pro-étale pushforward agree in degree 0

Declaration `DiamondEtaleCohomology:C1/v-pushforward-degree-zero` (theorem).

Let f : Y′ → Y be a map of locally spatial diamonds and F a small sheaf of abelian groups on Y′_qproét that comes via pullback from Y′_ét. Then λ_Y^∗f_qproét∗F → f_v∗λ_{Y′}^∗F is an isomorphism, and for X = Y strictly totally disconnected and X̃ ∈ X_v strictly totally disconnected the map H^0((λ∘_X(X̃) ×_X Y′)_qproét, F) → H^0((X̃ ×_X Y′)_v, λ_{Y′}^∗F) is an isomorphism.

Construction and proof:

1. By node strictly-local-reduction, reduce to F = j_!M on connected X′ with X̃, X′ surjective over X.
2. If V = X′, the claim in degree 0 is that X̃ ×_X X′ is connected, which is ECD Lemma 14.6 (ClassicalAdicEtaleCohomology H2).
3. If V ≠ X′, both sides vanish once the question is reduced to the prime-to-p case (iii) through the underlying sheaf of sets.

Acceptance:

- Remark 16.2 as printed needs the hypothesis that X̃ → X is surjective for λ∘_X(X̃) = X (PAPER-SCHOLZE-17/E91); the node uses the corrected form.

Depends on: `DiamondEtaleCohomology:C1/strictly-local-reduction`, `ClassicalAdicEtaleCohomology:H2/geometric-connectedness-of-perfectoid-base-change`, `DiamondEtaleCohomology:C1/v-pushforward-prime-to-p`.

Sources:

- ECD, Theorem 16.1(i), p. 92.
- ECD, proof of Theorem 16.1, p. 93.

### `v-pushforward-quasi-pro-etale` — v- and quasi-pro-étale pushforward agree for quasi-pro-étale maps

Declaration `DiamondEtaleCohomology:C1/v-pushforward-quasi-pro-etale` (theorem).

Let f : Y′ → Y be a quasi-pro-étale map of locally spatial diamonds and F a small sheaf of abelian groups on Y′_qproét pulled back from Y′_ét. Then λ_Y^∗R^if_qproét∗F → R^if_v∗λ_{Y′}^∗F is an isomorphism for all i ≥ 0, together with the final statement for X = Y strictly totally disconnected and X̃ ∈ X_v strictly totally disconnected.

Construction and proof:

1. After the reductions of node strictly-local-reduction, X′ = X and X̃ → X′ is a surjective map of strictly local perfectoid spaces (connected strictly totally disconnected), so both sides have no cohomology in positive degrees (node std-etale-acyclic).
2. Degree 0 is node v-pushforward-degree-zero.

Acceptance:

- Concrete instance: for f : Spa(C, O_C) × S → Spa(C, O_C) with S profinite and the constant sheaf M, R^if_v∗M = 0 for i > 0 and f_v∗M = C(S, M).

Depends on: `DiamondEtaleCohomology:C1/strictly-local-reduction`, `DiamondEtaleCohomology:C1/v-pushforward-degree-zero`, `DiamondEtaleCohomology:C0/std-etale-acyclic`.

Sources:

- ECD, Theorem 16.1(ii), p. 92.
- ECD, proof of Theorem 16.1, p. 93.

### `v-pushforward-prime-to-p` — v- and quasi-pro-étale pushforward agree for prime-to-p torsion ★

Declaration `DiamondEtaleCohomology:C1/v-pushforward-prime-to-p` (theorem).

Let f : Y′ → Y be a map of locally spatial diamonds and F a small sheaf of abelian groups on Y′_qproét pulled back from Y′_ét with nF = 0 for some integer n prime to p. Then λ_Y^∗R^if_qproét∗F → R^if_v∗λ_{Y′}^∗F is an isomorphism for all i ≥ 0, and for X = Y strictly totally disconnected and X̃ ∈ X_v strictly totally disconnected the map H^i((λ∘_X(X̃) ×_X Y′)_qproét, F) → H^i((X̃ ×_X Y′)_v, λ_{Y′}^∗F) is an isomorphism for all i.

Construction and proof:

1. Reduce to F = j_!M on connected geometric points X′ with X̃ ×_X X′ (node strictly-local-reduction).
2. Apply ECD Lemma 16.3, owned by ClassicalAdicEtaleCohomology H2 (H2/extension-by-zero-over-geometric-field-pairs), with X₁ = X̃, X₃ = X, X₂ = X′ (residue characteristic p > 0, all spaces in Perf): H^i(W_ét, j_!M) = 0 unless V = X′ and i = 0, in which case pullback from X′ gives M. H2 works on the étale site of the perfectoid space W, which is the étale site of W as a locally spatial diamond (C0/etale-site API etaleSite.perfectoid_compat). H2 proves the lemma through Scholze 2012 Corollary 7.18 on perfectoid étale sites, so ECD's appeal to Lemma 15.6 (DiamondsAndVStacks D6) is not needed in C1; the misprint and the affinoid restriction of ECD's proof (PAPER-SCHOLZE-17/E51, E52) are handled there (ClassicalAdicEtaleCohomology/E6, E7). On X′ itself H^i(X′, j_!M) = 0 for i > 0 and H^0 is M or 0 (C0/std-etale-acyclic).

Acceptance:

- The final statement combines invariance under change of algebraically closed base field with 'pro-étale cohomology = v-cohomology' (ECD Remark 16.2, with the surjectivity hypothesis of PAPER-SCHOLZE-17/E91).

Depends on: `DiamondEtaleCohomology:C1/strictly-local-reduction`, `ClassicalAdicEtaleCohomology:H2/extension-by-zero-over-geometric-field-pairs`, `ClassicalAdicEtaleCohomology:H2/invariance-for-perfectoid-affinoids`, `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C0/std-etale-acyclic`.

Sources:

- ECD, Theorem 16.1(iii), p. 92.
- ECD, Lemma 16.3, p. 93.

### `derived-v-pushforward-comparison` — Derived comparison of v- and quasi-pro-étale pushforward ★

Declaration `DiamondEtaleCohomology:C1/derived-v-pushforward-comparison` (theorem).

Let f : Y′ → Y be a map of locally spatial diamonds, and assume f is quasi-pro-étale or nΛ = 0 for some n prime to p. For every A ∈ D(Y′_qproét, Λ) all of whose cohomology sheaves are pulled back from Y′_ét (by DiamondEtaleCohomology:C2/left-completion-comparison this is the subcategory D_ét(Y′, Λ) ⊂ D(Y′_qproét, Λ); the statement here does not use that identification), the base change morphism λ_Y^∗Rf_qproét∗A → Rf_v∗λ_{Y′}^∗A in D(Y_v, Λ) is an isomorphism; more precisely, for X = Y strictly totally disconnected and X̃ ∈ X_v strictly totally disconnected, RΓ((λ∘_X(X̃) ×_X Y′)_qproét, A) = RΓ((X̃ ×_X Y′)_v, λ_{Y′}^∗A).

Construction and proof:

1. The statement is local in Y_qproét, so assume Y = X strictly totally disconnected and prove the finer statement.
2. Both sides commute with the Postnikov limit A = R lim τ^{≥−n}A (C0/left-completeness), reducing to bounded-below A and then to sheaves; apply Theorem 16.1(ii), resp. (iii), according to the hypothesis (the printed reference to (iii) alone is PAPER-SCHOLZE-17/E47).

Acceptance:

- The subcategory of D(Y′_qproét, Λ) is described by its cohomology sheaves, so this node does not depend on the definition of D_ét in C2.

Depends on: `DiamondEtaleCohomology:C1/v-pushforward-quasi-pro-etale`, `DiamondEtaleCohomology:C1/v-pushforward-prime-to-p`, `DiamondEtaleCohomology:C0/left-completeness`, `DiamondEtaleCohomology:C1/base-change-transformations`.

Sources:

- ECD, Corollary 16.4, p. 93.
- ECD, proof of Corollary 16.4, p. 93.

### `etale-qproet-pushforward` — Étale and quasi-pro-étale pushforward agree for qcqs maps

Declaration `DiamondEtaleCohomology:C1/etale-qproet-pushforward` (theorem).

Let f : Y′ → Y be a qcqs map of locally spatial diamonds and F a sheaf of abelian groups on Y′_ét. Then ν_Y^∗R^if_ét∗F → R^if_qproét∗ν_{Y′}^∗F is an isomorphism of sheaves on Y_qproét for all i ≥ 0.

Construction and proof:

1. Étale local on Y, so Y is spatial. By node etale-to-quasi-pro-etale-basis it suffices to check, for Ỹ = lim Ỹ_j in Pro(Y_ét,qc,sep), that H^i((Ỹ ×_Y Y′)_qproét, F) = colim_j H^i((Ỹ_j ×_Y Y′)_ét, F).
2. The left side is H^i((Ỹ ×_Y Y′)_ét, F) by Proposition 14.8 (C0), and continuity (Proposition 14.9, C0) gives the colimit; f qcqs keeps all Ỹ_j ×_Y Y′ spatial.

Acceptance:

- Concrete instance: for a quasicompact open immersion j : U ⊂ Y of spatial diamonds, ν_Y^∗R^ij_ét∗F = R^ij_qproét∗ν_U^∗F.

Depends on: `DiamondEtaleCohomology:C0/etale-to-quasi-pro-etale-basis`, `DiamondEtaleCohomology:C0/quasi-pro-etale-pullback-fully-faithful`, `DiamondEtaleCohomology:C0/etale-cohomology-continuity`, `DiamondEtaleCohomology:C1/base-change-transformations`.

Sources:

- ECD, Proposition 16.6, p. 94.
- ECD, proof of Proposition 16.6, p. 94.

### `derived-etale-qproet-pushforward` — Derived comparison of étale and quasi-pro-étale pushforward

Declaration `DiamondEtaleCohomology:C1/derived-etale-qproet-pushforward` (theorem).

Let f : Y′ → Y be a qcqs map of locally spatial diamonds. For every A ∈ D⁺(Y′_ét, Λ), ν_Y^∗Rf_ét∗A → Rf_qproét∗ν_{Y′}^∗A is an isomorphism in D⁺(Y_qproét, Λ). If Y and Y′ are strictly totally disconnected perfectoid spaces, the same holds for all A ∈ D(Y′_ét, Λ).

Construction and proof:

1. D⁺: dévissage to sheaves and Proposition 16.6.
2. Strictly totally disconnected case: for a quasicompact open U ⊂ Y, U ×_Y Y′ is a quasicompact open of Y′, hence acyclic (C0/std-etale-acyclic), so f_ét∗ is exact and f_qproét∗ is exact on sheaves pulled back from Y′_ét; Rf_ét∗A = f_ét∗A then has Postnikov tower f_ét∗τ^{≥−n}A, ν^∗ is t-exact, and D(Y_qproét, Λ) and D(Y′_ét, Λ) are left-complete (C0/left-completeness), so both sides are R lim of the D⁺ statement.

Acceptance:

- For f the identity the base change morphism is the identity; for strictly totally disconnected Y, Y′ the statement holds for unbounded A, and for general locally spatial Y it is claimed only on D⁺.

Depends on: `DiamondEtaleCohomology:C1/etale-qproet-pushforward`, `DiamondEtaleCohomology:C0/left-completeness`, `DiamondEtaleCohomology:C0/unbounded-comparison-std`, `DiamondEtaleCohomology:C0/std-etale-acyclic`.

Sources:

- ECD, Corollary 16.7, p. 94.

### `qproet-base-change-sheaves` — Base change for quasi-pro-étale pushforward in cartesian squares

Declaration `DiamondEtaleCohomology:C1/qproet-base-change-sheaves` (theorem).

Let g′ : Y′ → Y, f′ : Y′ → X′, f : Y → X, g : X′ → X be a cartesian diagram of locally spatial diamonds and F a small sheaf of abelian groups on Y_qproét pulled back from Y_ét. Then g_qproét^∗R^if_qproét∗F → R^if′_qproét∗g′_qproét^∗F is an isomorphism (i) if i = 0, (ii) for all i ≥ 0 if f or g is quasi-pro-étale, (iii) for all i ≥ 0 if nF = 0 for some n prime to p.

Construction and proof:

1. If g is quasi-pro-étale the statement is formal by passage to slices (C1/base-change-transformations, squareBaseChange.iso_of_qproet).
2. Otherwise reduce to X strictly totally disconnected and evaluate at strictly totally disconnected X̃ quasi-pro-étale over X′; factor X̃ → λ∘_X(X̃) → X. The two sides are H^i(λ∘_X(X̃) ×_X Y, F) and H^i(X̃ ×_X Y, F), whose agreement is the final statement of Theorem 16.1 in the corresponding case, with Proposition 14.7 identifying pro-étale and v-cohomology.

Acceptance:

- Concrete instance of case (ii): base change along a quasi-pro-étale g is restriction to a slice and holds in all degrees with arbitrary coefficients.

Depends on: `DiamondEtaleCohomology:C1/v-pushforward-degree-zero`, `DiamondEtaleCohomology:C1/v-pushforward-quasi-pro-etale`, `DiamondEtaleCohomology:C1/v-pushforward-prime-to-p`, `DiamondEtaleCohomology:C0/v-pullback-fully-faithful`, `DiamondEtaleCohomology:C1/base-change-transformations`, `DiamondEtaleCohomology:C0/v-pullback-higher-vanishing`, `DiamondEtaleCohomology:C0/v-pullback-formula`, `DiamondEtaleCohomology:C0/separated-pro-etale-hull`.

Sources:

- ECD, Corollary 16.9, p. 95.
- ECD, proof of Corollary 16.9, p. 95.

### `qproet-base-change-complexes` — Derived base change for quasi-pro-étale pushforward

Declaration `DiamondEtaleCohomology:C1/qproet-base-change-complexes` (theorem).

In the cartesian diagram of node qproet-base-change-sheaves, assume f or g is quasi-pro-étale, or nΛ = 0 for some n prime to p. Then for every A ∈ D(Y_qproét, Λ) all of whose cohomology sheaves are pulled back from Y_ét, g_qproét^∗Rf_qproét∗A → Rf′_qproét∗g′_qproét^∗A is an isomorphism.

Construction and proof:

1. Everything commutes with Postnikov limits (C0/left-completeness); reduce to bounded-below A and then to the sheaf statement.

Acceptance:

- For f, g not quasi-pro-étale and p-torsion Λ the statement is not claimed (the Artin–Schreier non-example of C1/base-change-transformations).

Depends on: `DiamondEtaleCohomology:C1/qproet-base-change-sheaves`, `DiamondEtaleCohomology:C0/left-completeness`.

Sources:

- ECD, Corollary 16.9, p. 95.
- ECD, proof of Corollary 16.9, p. 95.

### `etale-base-change-sheaves` — Base change for étale cohomology of qcqs maps of locally spatial diamonds ★

Declaration `DiamondEtaleCohomology:C1/etale-base-change-sheaves` (theorem).

Let g′ : Y′ → Y, f′ : Y′ → X′, f : Y → X, g : X′ → X be a cartesian diagram of locally spatial diamonds with f qcqs, and F a sheaf of abelian groups on Y_ét. Then g_ét^∗R^if_ét∗F → R^if′_ét∗g′_ét^∗F is an isomorphism (i) if i = 0, (ii) for all i ≥ 0 if f or g is quasi-pro-étale, (iii) for all i ≥ 0 if nF = 0 for some n prime to p.

Construction and proof:

1. Pull back to the quasi-pro-étale sites with ν^∗, which is fully faithful (C0); there Proposition 16.6 identifies étale and quasi-pro-étale pushforwards for the qcqs maps f and f′, and Corollary 16.9 gives base change.

Acceptance:

- Concrete instance (quasi-pro-étale case, used by C8): for a quasicompact separated quasi-pro-étale j : U → Y, base change of j_ét∗ along any map of locally spatial diamonds holds in all degrees.

Depends on: `DiamondEtaleCohomology:C1/qproet-base-change-sheaves`, `DiamondEtaleCohomology:C1/etale-qproet-pushforward`, `DiamondEtaleCohomology:C0/quasi-pro-etale-pullback-fully-faithful`.

Sources:

- ECD, Corollary 16.10, p. 96.
- ECD, proof of Corollary 16.10, p. 96.

### `etale-base-change-complexes` — Derived base change for étale cohomology on D⁺

Declaration `DiamondEtaleCohomology:C1/etale-base-change-complexes` (theorem).

In the cartesian diagram of node etale-base-change-sheaves (f qcqs), if f or g is quasi-pro-étale or nΛ = 0 for some n prime to p, then g_ét^∗Rf_ét∗A → Rf′_ét∗g′_ét^∗A is an isomorphism for every A ∈ D⁺(Y_ét, Λ).

Construction and proof:

1. A formal consequence of the sheaf statement by bounded-below dévissage.

Acceptance:

- Concrete instance: for a quasi-pro-étale geometric point g = ȳ : Spa(C, C⁺) → X and f qcqs, (Rf_ét∗A)_ȳ = RΓ(Y ×_X Spa(C, C⁺), A) for every A ∈ D⁺(Y_ét, Λ) (case (ii), any Λ).

Depends on: `DiamondEtaleCohomology:C1/etale-base-change-sheaves`.

Sources:

- ECD, Corollary 16.10, p. 96.
- ECD, proof of Corollary 16.10, p. 96.

## C2. The left-completed étale category and descent

After Theorem 16.1, Theorem 14.12 shows that being étale can be checked v-locally, which justifies Definition 14.13 of D_ét(Y, Λ) ⊂ D(Y_v, Λ): the objects whose pullback to every strictly totally disconnected space is étale. It is tested on one cover, detected on cohomology sheaves, left-complete, and for locally spatial Y it is the left completion of D(Y_ét, Λ) (14.14–14.16). The enhanced categories and hyperdescent for D(Y_v,κ, Λ) (17.3) are built at a cutoff, compatibly with change of cutoff and pullback; hyperdescent shows that D_ét lies in one cutoff (17.4), which gives presentability (17.1) and the étale coreflection R_Yét (17.2) with its formula R(ν ∘ λ)∗ on bounded-below objects. Corollaries 16.5 and 16.8, which concern D_ét of small v-stacks, are proved here after Definition 14.13; C1 states 16.4 and 16.9 for complexes whose cohomology sheaves come from the étale site.

Other roadmaps: EnhancedDerivedSheaves E1 (enhanced derived categories), E2 (hyperdescent; module coefficients requested), E3 (adjoint functor theorem; limits of presentable ∞-categories requested), PerfectoidSpaces P6 (κ-small spaces).

Coverage: planned. Remaining: Receive the EnhancedDerivedSheaves:E3 contract HTT 5.5.3.12 for Lemma 17.1 and the E2 module-coefficient hypercover descent for Proposition 17.3. Lemma-level refinement of the BS15 5.3.2 argument for Proposition 14.15 and of the coherent functoriality data under change of cutoff and pullback needed in §22. C2 inherits the C0 gap on R^iλ_Y∗λ_Y^∗F for i ≥ 2 (PAPER-SCHOLZE-17/E46) through C0/bounded-below-comparison and C0/unbounded-comparison-std: the v-part of 14.12(i) for complexes, D⁺_ét(Y) = D⁺(Y_ét), D_ét(X) = D(X_ét), 14.15 and the bounded formula for R_Yét.

Planets: **v-locality of étale complexes** (`v-local-etaleness`); **Étale derived category D_ét** (`etale-derived-category`); **D_ét as a left completion** (`left-completion-comparison`); **Hyperdescent for D(Y_v, Λ)** (`v-hyperdescent`); **Enhanced étale category** (`enhanced-etale-category`); **Étale coreflection R_Yét** (`etale-coreflection`).

### `v-local-etaleness` — Being étale can be checked v-locally ★

Declaration `DiamondEtaleCohomology:C2/v-local-etaleness` (theorem).

Let Y be a locally spatial diamond and f : Y′ → Y a v-cover by a locally spatial diamond Y′. (i) If A ∈ D(Y_qproét, Λ) or A ∈ D(Y_v, Λ) and f^∗A ∈ D⁺(Y′_ét, Λ), then A ∈ D⁺(Y_ét, Λ). (ii) If A ∈ D(Y_qproét, Λ) or A ∈ D(Y_v, Λ), Y and Y′ are strictly totally disconnected, and f^∗A ∈ D(Y′_ét, Λ), then A ∈ D(Y_ét, Λ). Here D⁺(Y_ét, Λ) and D(Y_ét, Λ) are full subcategories through the comparison of C0.

Construction and proof:

1. By left-completeness (C0) reduce to A = F[0] for a sheaf F.
2. F on Y_qproét: for Ỹ = lim Ỹ_j in Pro(Y_ét,qc,sep), F(Ỹ) = colim_j F(Ỹ_j) holds after base change to Y′ and to Y′ ×_Y Y′ by hypothesis, hence on Y since equalizers commute with filtered colimits.
3. F on Y_v: show λ_Y^∗λ_Y∗F → F is an isomorphism; locally X strictly totally disconnected, X̃ → X lifting to X′, and after replacing X by λ∘_X(X̃) assume X′ = X̃ with λ∘_X(X′) = X. Theorem 16.1 in degree 0 (DiamondEtaleCohomology C1, used exactly here) applied to f : X′ → X and the pro-étale sheaf on X′ makes p_1^∗ : F(X′) → F(X′ ×_X X′) an isomorphism, hence F(X) = F(X′).

Acceptance:

- The proof uses Theorem 16.1 only in degree 0; that is the single place where C1 enters.

Depends on: `DiamondEtaleCohomology:C0/left-completeness`, `DiamondEtaleCohomology:C0/unbounded-comparison-std`, `DiamondEtaleCohomology:C0/bounded-below-comparison`, `DiamondEtaleCohomology:C0/etale-to-quasi-pro-etale-basis`, `DiamondEtaleCohomology:C0/separated-pro-etale-hull`, `DiamondEtaleCohomology:C1/v-pushforward-degree-zero`, `DiamondEtaleCohomology:C0/v-pullback-formula`, `DiamondEtaleCohomology:C0/v-pullback-fully-faithful`.

Sources:

- ECD, Theorem 14.12, p. 87.
- ECD, proof of Theorem 14.12, p. 87.

### `etale-derived-category` — The étale derived category D_ét(Y, Λ) of a small v-stack ★

Declaration `DiamondEtaleCohomology:C2/etale-derived-category` (definition).

Let Y be a small v-stack and Λ a ring. D_ét(Y, Λ) ⊂ D(Y, Λ) = D(Y_v, Λ) is the full subcategory of those A such that for every strictly totally disconnected perfectoid space X with a map f : X → Y, the pullback f^∗A lies in D(X_ét, Λ) ⊂ D(X_v, Λ) (the fully faithful embedding of C0/unbounded-comparison-std).

Construction and proof:

1. The condition is stable under shifts, cones and pullback along maps of strictly totally disconnected spaces, so D_ét(Y, Λ) is a full triangulated subcategory.
2. By v-locality (node v-local-etaleness) it may be tested on a single v-cover by strictly totally disconnected spaces (node etale-test-on-one-cover).

Used by:

- ECD §17: the four operations are defined on D_ét
- AdicCoefficientsAndComparisons:L0: the I-adically complete étale category is built from D_ét(Y, Λ/Iⁿ)
- DiamondSixOperations:S1–S6: all exceptional operations take values in D_ét
- DiamondEtaleCohomology:C7: constructible sheaves and perfect-constructible complexes are objects of D_ét
- FarguesFontaineDiamonds:F5: the completed derived equivalence uses D_ét of locally spatial diamonds

API:

| name | role | statement |
|---|---|---|
| `Det` | constructor | The full triangulated subcategory D_ét(Y, Λ) of D(Y_v, Λ), as an object property closed under isomorphisms, shifts and cones. |
| `Det.mem_iff_std` | characterisation | A ∈ D_ét(Y, Λ) iff f^∗A ∈ D(X_ét, Λ) for every map f : X → Y from a strictly totally disconnected perfectoid space. |
| `Det.mem_iff_cover` | characterisation | For one v-cover X → Y by a disjoint union of strictly totally disconnected spaces, A ∈ D_ét(Y, Λ) iff its pullback lies in D(X_ét, Λ). |
| `Det.mem_iff_cohomology` | characterisation | A ∈ D_ét(Y, Λ) iff H^i(A)[0] ∈ D_ét(Y, Λ) for all i (node cohomology-sheaf-criterion). |
| `Det.pullback_mem` | functoriality | For a 0-truncated g : Y′ → Y, g_v^∗ (restriction to the slice) carries D_ét(Y, Λ) into D_ét(Y′, Λ), because a strictly totally disconnected X → Y′ composes to X → Y; arbitrary g are treated in C3/pullback. |
| `Det.std_eq` | compatibility | For strictly totally disconnected Y, D_ét(Y, Λ) is the essential image of D(Y_ét, Λ) = D(\|Y\|, Λ). |
| `Det.plus_eq` | compatibility | For a locally spatial diamond Y, D⁺_ét(Y, Λ) is the essential image of D⁺(Y_ét, Λ). |
| `Det.isTriangulated` | instance | D_ét(Y, Λ) is a triangulated subcategory closed under the canonical truncations, so it carries the induced t-structure. |

Unit tests:

- `Det_zero_ring` (degenerate): For Λ = 0, D_ét(Y, Λ) = 0.
- `Det_empty` (degenerate): For Y = ∅, D_ét(Y, Λ) = 0.
- `Det_geometric_point` (computation): For Y = Spa(C, O_C) with C algebraically closed, D_ét(Y, Λ) is equivalent to D(Λ) via global sections.
- `Det_std` (compatibility): For strictly totally disconnected X, D_ét(X, Λ) is equivalent to Mathlib's DerivedCategory of sheaves of Λ-modules on |X|.
- `Det_condensed_nonexample` (non-example): For Y = Spa(C, O_C) and Λ = Z_p, the v-sheaf X ↦ C(|X|, Z_p) (continuous maps for the p-adic topology) is not in D_ét(Y, Z_p): it is concentrated in degree 0 and not pulled back from Y_ét, whose sheaves take the value C(S, M) with M discrete on Spa(C, O_C) × S.

Acceptance:

- For a locally spatial diamond Y, D⁺_ét(Y, Λ) = D⁺(Y_ét, Λ), and for strictly totally disconnected Y, D_ét(Y, Λ) = D(Y_ét, Λ).

Depends on: `DiamondEtaleCohomology:C0/unbounded-comparison-std`, `DiamondEtaleCohomology:C0/cutoff-derived-categories`, `DiamondEtaleCohomology:C2/v-local-etaleness`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `mathlib:DerivedCategory`.

Sources:

- ECD, Definition 14.13, p. 88.

### `etale-test-on-one-cover` — D_ét is tested on one v-cover and agrees with the étale derived category in two cases

Declaration `DiamondEtaleCohomology:C2/etale-test-on-one-cover` (theorem).

Let Y be a small v-stack. A ∈ D(Y_v, Λ) lies in D_ét(Y, Λ) as soon as its pullback to one v-cover of Y by a locally spatial diamond (e.g. a disjoint union of strictly totally disconnected spaces) does. If Y is a locally spatial diamond, D⁺_ét(Y, Λ) = D⁺(Y_ét, Λ); if Y is strictly totally disconnected, D_ét(Y, Λ) = D(Y_ét, Λ).

Construction and proof:

1. Given a v-cover Y′ → Y with A|_{Y′} ∈ D_ét(Y′, Λ) and a strictly totally disconnected X → Y, choose a strictly totally disconnected X″ with a v-cover X″ → Y′ ×_Y X, quasicompact since X is (D1 universally open strictly totally disconnected covers, D4). Then X″ → X is a v-cover of strictly totally disconnected spaces, A|_{X″} is the pullback of A|_{Y′} and lies in D(X″_ét, Λ), and Theorem 14.12(ii) (node v-local-etaleness) gives A|_X ∈ D(X_ét, Λ). (Y′ ×_Y X need not be a locally spatial diamond when Y is only a small v-stack.)
2. For locally spatial Y and A ∈ D⁺(Y_v, Λ): apply Theorem 14.12(i) to a strictly totally disconnected cover; for strictly totally disconnected Y use part (ii).

Acceptance:

- Concrete instance: for a strictly totally disconnected X, D_ét(X, Λ) = D(X_ét, Λ) = D(|X|, Λ).
- ECD's remark (14.14) that in general D_ét(Y, Λ) ≠ D(Y_ét, Λ) for locally spatial Y is not planned: it needs a locally spatial diamond whose D(Y_ét, Λ) is not left-complete, which no supplier provides.

Depends on: `DiamondEtaleCohomology:C2/v-local-etaleness`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C0/perfectoid-bases-and-coherent-subsites`, `DiamondsAndVStacks:D1/universally-open-std-cover`.

Sources:

- ECD, Remark 14.14, p. 88.

### `etale-derived-left-complete` — D_ét(Y, Λ) is left-complete

Declaration `DiamondEtaleCohomology:C2/etale-derived-left-complete` (theorem).

For every small v-stack Y, the category D_ét(Y, Λ) is left-complete: for A ∈ D_ét(Y, Λ), A ≅ R lim_n τ^{≥−n}A, and every Postnikov tower in D_ét(Y, Λ) has its limit in D_ét(Y, Λ).

Construction and proof:

1. D(Y_v, Λ) is left-complete (C0/left-completeness), so A ≅ R lim_n τ^{≥−n}A for every A. D_ét(Y, Λ) is closed under the canonical truncations, because each pullback f^∗ to a strictly totally disconnected X is t-exact and D(X_ét, Λ) ⊂ D(X_v, Λ) is closed under truncations.
2. Closure under Postnikov limits, without the cohomology-sheaf criterion (which is proved from this node): let (A_n) be a Postnikov tower in D_ét(Y, Λ), A = R lim A_n in D(Y_v, Λ) and f : X → Y with X strictly totally disconnected. f^∗ is restriction to a slice, so it commutes with R lim; f^∗A_n ≅ λ^∗ν^∗B_n for a Postnikov tower (B_n) in D(X_ét, Λ) (full faithfulness and t-exactness, C0/unbounded-comparison-std); with B = R lim B_n in the left-complete D(X_ét, Λ) (C0/left-completeness (iii)), τ^{≥−n}λ^∗ν^∗B = f^∗A_n, so λ^∗ν^∗B = R lim f^∗A_n = f^∗A by left-completeness of D(X_v, Λ). Hence f^∗A ∈ D(X_ét, Λ).

Acceptance:

- For A ∈ D_ét(Y, Λ), the Postnikov tower τ^{≥−n}A lies in D_ét(Y, Λ) and A = R lim τ^{≥−n}A in D(Y_v, Λ).

Depends on: `DiamondEtaleCohomology:C0/left-completeness`, `DiamondEtaleCohomology:C2/etale-derived-category`, `EnhancedDerivedSheaves:E2/postnikov-left-completion`, `DiamondEtaleCohomology:C0/unbounded-comparison-std`.

Sources:

- ECD, Proposition 14.15, p. 88.
- ECD, proof of Proposition 14.15, p. 88.

### `left-completion-comparison` — D_ét of a locally spatial diamond is the left completion of D(Y_ét, Λ) ★

Declaration `DiamondEtaleCohomology:C2/left-completion-comparison` (theorem).

Let Y be a locally spatial diamond. Then D_ét(Y, Λ) is the left completion of D(Y_ét, Λ): the functor D(Y_ét, Λ) → D_ét(Y, Λ) induces an equivalence from the left completion (the left completion of EnhancedDerivedSheaves:E2/postnikov-left-completion, i.e. the homotopy category of lim_n 𝒟(Y_ét, Λ)^{≥−n}, realised as Postnikov towers in the derived category of ℕ-indexed inverse systems; not the 1-category of towers in D(Y_ét, Λ), whose Hom sets omit the lim¹ term) onto D_ét(Y, Λ), compatibly with truncations and with the enhancements and cutoff transitions. In particular the embedding D⁺(Y_ét, Λ) ⊂ D(Y_qproét, Λ) extends to a fully faithful embedding D_ét(Y, Λ) ⊂ D(Y_qproét, Λ), whose image consists of the objects all of whose cohomology sheaves are pulled back from Y_ét.

Construction and proof:

1. As in [BS15, Proposition 5.3.2] (EnhancedDerivedSheaves E2, Postnikov left completion): bounded-below objects agree (node etale-test-on-one-cover), both sides are left-complete, and a Postnikov tower in D(Y_ét, Λ) has its limit in D_ét(Y, Λ).
2. The quasi-pro-étale version follows from left-completeness of D(Y_qproét, Λ) and Proposition 14.10.
3. Enhanced form at an adequate cutoff κ: (A_n) ↦ R lim A_n defines lim_n 𝒟(Y_ét, Λ)^{≥−n} → 𝒟_ét(Y, Λ) ⊂ 𝒟(Y_v,κ, Λ). It is fully faithful on mapping spectra (Map(R lim_m λ^∗ν^∗A_m, λ^∗ν^∗B_n) = Map(λ^∗ν^∗A_n, λ^∗ν^∗B_n) since λ^∗ν^∗B_n ∈ D^{≥−n} and D(Y_v, Λ) is left-complete; this is Map(A_n, B_n) by the D⁺ comparison), essentially surjective by left-completeness of 𝒟_ét (C2/etale-derived-left-complete) and D⁺_ét = D⁺(Y_ét) (C2/etale-test-on-one-cover), and compatible with κ ≤ κ′ (enhancedEt.cutoff_independent).

Acceptance:

- Concrete instance: for Y and Λ = F_ℓ satisfying the uniform bound on the ℓ-cohomological dimension of quasicompact separated étale U → Y used in DiamondEtaleCohomology:C9 (finite cohomological dimension of Y alone does not give left-completeness of D(Y_ét)) the left completion is D(Y_ét, F_ℓ) itself (DiamondEtaleCohomology:C9/ordinary-derived-comparison).

Depends on: `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `EnhancedDerivedSheaves:E2/postnikov-left-completion`, `DiamondEtaleCohomology:C0/bounded-below-comparison`, `DiamondEtaleCohomology:C0/left-completeness`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C2/enhanced-v-derived-category`.

Sources:

- ECD, Proposition 14.15, p. 88.
- ECD, proof of Proposition 14.15, p. 88.

### `cohomology-sheaf-criterion` — Membership in D_ét is detected on cohomology sheaves

Declaration `DiamondEtaleCohomology:C2/cohomology-sheaf-criterion` (theorem).

Let Y be a small v-stack and A ∈ D(Y_v, Λ). Then A ∈ D_ét(Y, Λ) if and only if H^i(A)[0] ∈ D_ét(Y, Λ) for all i ∈ Z.

Construction and proof:

1. All relevant derived categories are left-complete, so assume A bounded below; then A = colim τ^{≤n}A, so assume A bounded; full faithfulness of D_ét ⊂ D(Y_v, Λ) and dévissage reduce to A concentrated in one degree.

Acceptance:

- Concrete instance: for Y = Spa(C, O_C) and Λ = Z_p, the sheaf S ↦ C(S, Z_p) is not in D_ét because its H^0 is not pulled back from Y_ét.

Depends on: `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C0/left-completeness`.

Sources:

- ECD, Proposition 14.16, p. 88.
- ECD, proof of Proposition 14.16, p. 88.

### `qproet-pushforward-etale` — Étale quasi-pro-étale pushforward computes the v-pushforward

Declaration `DiamondEtaleCohomology:C2/qproet-pushforward-etale` (theorem).

Let f : Y′ → Y be a map of locally spatial diamonds, and assume f is quasi-pro-étale or nΛ = 0 for some n prime to p. If A ∈ D_ét(Y′, Λ) is such that Rf_qproét∗A ∈ D_ét(Y, Λ) ⊂ D(Y_qproét, Λ), then Rf_v∗A ∈ D_ét(Y, Λ) ⊂ D(Y_v, Λ) and it agrees with Rf_qproét∗A.

Construction and proof:

1. Identify D_ét(Y′, Λ) inside D(Y′_qproét, Λ) (node left-completion-comparison) and apply the derived comparison of C1 (Corollary 16.4).

Acceptance:

- Stated after D_ét is defined because its hypothesis and conclusion are memberships in D_ét of small v-stacks.

Depends on: `DiamondEtaleCohomology:C1/derived-v-pushforward-comparison`, `DiamondEtaleCohomology:C2/left-completion-comparison`.

Sources:

- ECD, Corollary 16.5, p. 93.
- ECD, proof of Corollary 16.5, p. 94.

### `qcqs-pushforward-preserves-etale` — v-pushforward along qcqs maps preserves étale complexes

Declaration `DiamondEtaleCohomology:C2/qcqs-pushforward-preserves-etale` (theorem).

Let f : Y′ → Y be a qcqs map of small v-stacks. (i) If f is quasi-pro-étale, Rf_v∗A ∈ D_ét(Y, Λ) for every A ∈ D_ét(Y′, Λ). (ii) If nΛ = 0 for some n prime to p, Rf_v∗A ∈ D⁺_ét(Y, Λ) for every A ∈ D⁺_ét(Y′, Λ); if Y and Y′ are locally spatial, then under D⁺_ét = D⁺(−_ét) one has Rf_v∗ = Rf_ét∗.

Construction and proof:

1. Assume Y strictly totally disconnected.
2. (i) Y′ is a qcqs perfectoid space; if separated it is strictly totally disconnected (ECD Lemma 7.19, D1) and Corollaries 16.7 and 16.5 apply; in general use a finite Čech cover by affinoids with separated intersections.
3. (ii) Choose an affinoid perfectoid X′ → Y′ surjective with Čech nerve X′_• → Y′ and g_• : X′_• → Y. Then Rf_v∗A is the limit (totalization) of the cosimplicial object Rg_{n,v∗}(A|X′_n) (PAPER-SCHOLZE-17/E48: A, not C; cosimplicial), each in D^{≥−m}(Y_ét, Λ) for one m by Corollaries 16.7 and 16.4, so the limit lies in D⁺(Y_ét, Λ). For a general qcqs v-stack Y′ repeat with the v-sheaf case.

Acceptance:

- Used by Proposition 17.6 (C3) for case (ii) and by the quasi-pro-étale case of Theorem 19.2 (C5, PAPER-SCHOLZE-17/E95) for case (i).

Depends on: `DiamondEtaleCohomology:C1/derived-etale-qproet-pushforward`, `DiamondEtaleCohomology:C2/qproet-pushforward-etale`, `DiamondEtaleCohomology:C1/derived-v-pushforward-comparison`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `DiamondEtaleCohomology:C2/v-hyperdescent`, `DiamondsAndVStacks:D5/injection-and-finite-etale-permanence`, `DiamondEtaleCohomology:C2/cohomology-sheaf-criterion`.

Sources:

- ECD, Corollary 16.8(i), p. 94.
- ECD, proof of Corollary 16.8, p. 94.

### `enhanced-v-derived-category` — The enhanced v-derived categories at a cutoff and their functoriality

Declaration `DiamondEtaleCohomology:C2/enhanced-v-derived-category` (construction).

For a small v-stack Y, a ring Λ and a cutoff cardinal κ, the ∞-derived category 𝒟(Y_v,κ, Λ) of sheaves of Λ-modules on Y_v,κ is a presentable stable ∞-category with homotopy category D(Y_v,κ, Λ); the transition functors for κ ≤ κ′ and the pullbacks f_v^∗ along 0-truncated maps are colimit-preserving exact functors of ∞-categories, with coherent compatibility data under change of cutoff and composition. For a simplicial small v-stack Y_• with 0-truncated face maps, 𝒟(Y_•,v, Λ) is the ∞-derived category of the simplicial site, with its full subcategory 𝒟_cart(Y_•,v, Λ) of cartesian objects.

Construction and proof:

1. The ∞-derived category of a ringed topos is presentable stable (EnhancedDerivedSheaves E1, dg-nerve of K-injective complexes), and morphisms of ringed topoi give exact colimit-preserving pullbacks with coherence from the enhanced diagram construction (E3).
2. Cutoff transitions are fully faithful on homotopy categories (C0), hence fully faithful as functors of ∞-categories.
3. The simplicial site of Y_• is a diagram of ringed topoi; its ∞-derived category and cartesian subcategory come from E3.

Used by:

- ECD Lemma 17.1: presentability of 𝒟_ét(Y, Λ) is proved inside 𝒟(Y_v,κ, Λ)
- ECD Proposition 17.3: hyperdescent is stated for 𝒟(Y_v, Λ) and 𝒟(Y_•,v, Λ)
- ECD §22: the coherent diagram needed for the exceptional operations (DiamondSixOperations:S2)

API:

| name | role | statement |
|---|---|---|
| `enhancedV` | constructor | The presentable stable ∞-category 𝒟(Y_v,κ, Λ) with an equivalence of its homotopy category with D(Y_v,κ, Λ). |
| `enhancedV.transition` | functoriality | For κ ≤ κ′ a fully faithful colimit-preserving exact functor 𝒟(Y_v,κ, Λ) → 𝒟(Y_v,κ′, Λ), with coherent composition for κ ≤ κ′ ≤ κ″. |
| `enhancedV.pullback` | functoriality | For 0-truncated f, a colimit-preserving exact functor f_v^∗ commuting with transitions, with coherent (f ∘ g)_v^∗ ≃ g_v^∗ ∘ f_v^∗. |
| `enhancedV.simplicial` | constructor | For a simplicial Y_• with 0-truncated face maps, 𝒟(Y_•,v, Λ) and the full subcategory of cartesian objects. |
| `enhancedV.homotopy` | compatibility | Passing to homotopy categories recovers the triangulated categories and derived pullbacks of C0. |
| `enhancedV.augmentation` | functoriality | For an augmented simplicial Y_• → Y with 0-truncated maps and all Y_i κ-small, pullback gives 𝒟(Y_v,κ, Λ) → 𝒟(Y_•,v,κ, Λ) landing in cartesian objects; its right adjoint is the totalization of the termwise pushforwards. |
| `enhancedV.pushforward` | functoriality | For 0-truncated f, the right adjoint Rf_v∗ of f_v^∗, compatible with the cutoff transitions. |

Unit tests:

- `enhancedV_zero_ring` (degenerate): For Λ = 0, 𝒟(Y_v,κ, Λ) is the zero ∞-category.
- `enhancedV_point` (computation): For Y = Spa(C, O_C), mapping spectra from Λ in 𝒟(Y_v,κ, Λ) compute RΓ(Y_v, −); for Λ = F_ℓ (ℓ ≠ p) and the constant sheaf, π_0 Map(Λ, Λ[i]) = F_ℓ for i = 0 and 0 otherwise. (For i ≥ 2 this rests on the gap PAPER-SCHOLZE-17/E46.)
- `enhancedV_homotopy_category` (compatibility): The homotopy category of 𝒟(Y_v,κ, Λ) is D(Y_v,κ, Λ), compatibly with shifts and distinguished triangles.
- `enhancedV_not_set_presentable_uncut` (non-example): For Y ≠ ∅ the colimit over all κ is not presentable: any set of objects lies in some 𝒟(Y_v,κ, Λ), which is closed under colimits, and the representable sheaf of a perfectoid space over Y that is not κ-small does not lie in it.

Acceptance:

- Passing to homotopy categories recovers D(Y_v,κ, Λ) with its triangulated structure, and the transition functors recover those of C0/cutoff-derived-categories.

Depends on: `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `DiamondEtaleCohomology:C0/cutoff-derived-categories`, `DiamondEtaleCohomology:C0/v-site`.

Sources:

- ECD, Lemma 17.1, p. 96.
- ECD, proof of Lemma 17.1, p. 96.

### `v-hyperdescent` — Hyperdescent for the v-derived category ★

Declaration `DiamondEtaleCohomology:C2/v-hyperdescent` (theorem).

Let Y be a small v-stack, Y_• → Y a simplicial v-hypercover by small v-stacks with 0-truncated maps Y_i → Y, and κ a cutoff with all Y_i κ-small. Pullback induces a fully faithful functor 𝒟(Y_v,κ, Λ) → 𝒟(Y_•,v,κ, Λ) whose essential image is the full ∞-subcategory of cartesian objects. These equivalences commute with the transition functors for κ ≤ κ′, so they pass to the colimit 𝒟(Y_v, Λ), and for a 0-truncated g : Y′ → Y they commute with g_v^∗ and the pulled-back hypercover Y_• ×_Y Y′. On homotopy categories D(Y_v, Λ) → D(Y_•,v, Λ) is fully faithful with essential image the cartesian objects.

Construction and proof:

1. Y_v is replete (C0/v-topos-replete), so unbounded cohomological descent along hypercovers holds ([Sta, Tag 0DC7], [BS15, 3.3.6], owned by EnhancedDerivedSheaves E2); full faithfulness on homotopy categories gives it for the stable ∞-categories.
2. Compatibility with κ ≤ κ′ and with g_v^∗: the pullbacks commute with the transitions and with g_v^∗ (C2/enhanced-v-derived-category); the comparison maps are mates of these commutations (EnhancedDerivedSheaves:E3/mates-and-beck-chevalley) and are equivalences because both sides are.

Acceptance:

- Concrete instance: for the Čech nerve of a surjection X → Y from a perfectoid space, D(Y_v, Λ) is the category of cartesian objects on the Čech nerve.

Depends on: `DiamondEtaleCohomology:C0/v-topos-replete`, `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`, `EnhancedDerivedSheaves:E2/hypercover`, `DiamondEtaleCohomology:C2/enhanced-v-derived-category`, `EnhancedDerivedSheaves:E2`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Sources:

- ECD, Proposition 17.3, p. 97.
- ECD, proof of Proposition 17.3, p. 97.

### `etale-category-one-cutoff` — D_ét(Y, Λ) lies in one cutoff

Declaration `DiamondEtaleCohomology:C2/etale-category-one-cutoff` (theorem).

Let Y be a small v-stack and Y_• → Y a simplicial v-hypercover by disjoint unions of strictly totally disconnected spaces. Then D_ét(Y, Λ) = D_ét,cart(Y_•, Λ), the cartesian objects with terms in D(Y_i,ét, Λ); hence D_ét(Y, Λ) ⊂ D(Y_v,κ, Λ) for every cutoff κ such that all Y_i are κ-small.

Construction and proof:

1. By hyperdescent (node v-hyperdescent), D(Y_v, Λ) is the cartesian part of D(Y_•,v, Λ); D_ét corresponds to cartesian objects with étale terms because D_ét is tested on one cover (node etale-test-on-one-cover).
2. Each D_ét(Y_i, Λ) = D(Y_i,ét, Λ) lies in D(Y_i,v,κ, Λ) once Y_i is κ-small.

Acceptance:

- For Y strictly totally disconnected and κ-small, D_ét(Y, Λ) ⊂ D(Y_v,κ, Λ).

Depends on: `DiamondEtaleCohomology:C2/v-hyperdescent`, `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `PerfectoidSpaces:P6/kappa-small-perfectoid-space`.

Sources:

- ECD, Remark 17.4, p. 97.

### `enhanced-etale-category` — The presentable stable ∞-category 𝒟_ét(Y, Λ) ★

Declaration `DiamondEtaleCohomology:C2/enhanced-etale-category` (construction).

For a small v-stack Y there is a natural presentable stable ∞-category 𝒟_ét(Y, Λ) with homotopy category D_ét(Y, Λ): for κ large enough it is the full ∞-subcategory of 𝒟(Y_v,κ, Λ) on the objects of D_ét(Y, Λ); it is closed under all colimits, and its formation is compatible with change of cutoff and with pullback.

Construction and proof:

1. Closure under colimits in 𝒟(Y_v,κ, Λ): cones are clear; filtered colimits commute with canonical truncations and filtered colimits of étale sheaves are étale, so membership follows from the cohomology-sheaf criterion (C2/cohomology-sheaf-criterion).
2. Presentability: by hyperdescent along a hypercover by disjoint unions of strictly totally disconnected spaces (nodes v-hyperdescent and etale-category-one-cutoff), 𝒟_ét(Y, Λ) is a limit of the presentable ∞-categories 𝒟(Y_i,ét, Λ) along colimit-preserving functors, which is presentable ([Lur09, Proposition 5.5.3.12], requested from EnhancedDerivedSheaves E3). Such a hypercover exists, with all Y_i κ-small for κ large enough, since every small v-stack and every small v-sheaf has a v-cover by a disjoint union of strictly totally disconnected spaces (D1, D4).
3. For a disjoint union of strictly totally disconnected spaces, 𝒟(Y_ét, Λ) → 𝒟(Y_v, Λ) is fully faithful (as on homotopy categories) with the same objects as D_ét.

Used by:

- ECD Corollary 17.2 and Lemma 17.5: the adjoint functor theorem produces R_Yét and Rf∗
- ECD Lemma 17.8: the representability criterion produces internal Hom
- DiamondSixOperations:S2: the enhanced D_ét with hyperdescent, functorially in pullback
- FarguesFontaineDiamonds:F5: enhanced exact module-topos derived categories

API:

| name | role | statement |
|---|---|---|
| `enhancedEt` | constructor | The full ∞-subcategory 𝒟_ét(Y, Λ) ⊂ 𝒟(Y_v,κ, Λ), for κ adequate for Y. |
| `enhancedEt.presentable` | instance | 𝒟_ét(Y, Λ) is presentable and stable. |
| `enhancedEt.closed_colimits` | other | 𝒟_ét(Y, Λ) is closed under all small colimits in 𝒟(Y_v,κ, Λ). |
| `enhancedEt.homotopy` | compatibility | Its homotopy category is D_ét(Y, Λ). |
| `enhancedEt.cutoff_independent` | functoriality | For κ ≤ κ′ both adequate, the transition functor restricts to an equivalence of the two 𝒟_ét(Y, Λ). |
| `enhancedEt.descent` | characterisation | For a hypercover Y_• → Y by disjoint unions of strictly totally disconnected spaces, 𝒟_ét(Y, Λ) ≃ lim_{[n]∈Δ} 𝒟(Y_n,ét, Λ). |
| `enhancedEt.pullback` | functoriality | For a 0-truncated f : Y′ → Y and κ adequate for both, f_v^∗ restricts to a colimit-preserving exact functor 𝒟_ét(Y, Λ) → 𝒟_ét(Y′, Λ), commuting with cutoff transitions, with coherent (f ∘ g)^∗ ≃ g^∗ ∘ f^∗ and id^∗ ≃ id. |

Unit tests:

- `enhancedEt_std` (compatibility): For strictly totally disconnected X, 𝒟_ét(X, Λ) ≃ 𝒟(X_ét, Λ), the ∞-derived category of sheaves of Λ-modules on |X|.
- `enhancedEt_point` (computation): For Y = Spa(C, O_C), 𝒟_ét(Y, Λ) ≃ 𝒟(Λ), the ∞-derived category of Λ-modules.
- `enhancedEt_empty` (degenerate): For Y = ∅, 𝒟_ét(Y, Λ) is the zero ∞-category.
- `enhancedEt_not_all_sheaves` (non-example): 𝒟_ét(Y, Λ) is not closed under limits in 𝒟(Y_v,κ, Λ) in general; its limits are computed with the coreflection R_Yét.

Acceptance:

- Presentability is proved at a fixed adequate cutoff; the large colimit over all κ is not claimed to be presentable.
- The source uses hyperdescent (its Proposition 17.3) inside the proof of Lemma 17.1; the node order makes this explicit.

Depends on: `DiamondEtaleCohomology:C2/enhanced-v-derived-category`, `DiamondEtaleCohomology:C2/v-hyperdescent`, `DiamondEtaleCohomology:C2/etale-category-one-cutoff`, `DiamondEtaleCohomology:C0/unbounded-comparison-std`, `EnhancedDerivedSheaves:E3`, `DiamondEtaleCohomology:C2/cohomology-sheaf-criterion`, `DiamondsAndVStacks:D1/universally-open-std-cover`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`.

Sources:

- ECD, Lemma 17.1, p. 96.
- ECD, proof of Lemma 17.1, p. 96.

### `etale-coreflection` — The étale coreflection R_Yét ★

Declaration `DiamondEtaleCohomology:C2/etale-coreflection` (construction).

For every small v-stack Y the inclusion D_ét(Y, Λ) ⊂ D(Y_v, Λ) has a right adjoint R_Yét : D(Y_v, Λ) → D_ét(Y, Λ), the homotopy category of right adjoints at each adequate cutoff, which are compatible with change of cutoff.

Construction and proof:

1. For each κ the inclusion lifts to a colimit-preserving functor 𝒟_ét(Y, Λ) → 𝒟(Y_v,κ, Λ) of presentable ∞-categories (node enhanced-etale-category), which has a right adjoint by the ∞-categorical adjoint functor theorem ([Lur09, Corollary 5.5.2.9], EnhancedDerivedSheaves E3).
2. Right adjoints at different cutoffs agree on the common domain by uniqueness of adjoints.

Used by:

- ECD Lemma 17.5: Rf∗ = R_Yét ∘ Rf_v∗
- ECD Lemma 17.8: RHom on D_ét is R_Yét of the v-internal Hom

API:

| name | role | statement |
|---|---|---|
| `etaleCoreflection` | constructor | The functor R_Yét : D(Y_v, Λ) → D_ét(Y, Λ) with the adjunction incl ⊣ R_Yét. |
| `etaleCoreflection.counit_iso_of_mem` | characterisation | For A ∈ D_ét(Y, Λ) the counit R_Yét(A) → A is an isomorphism. |
| `etaleCoreflection.exact` | other | R_Yét is exact and commutes with all limits. |
| `etaleCoreflection.cutoff` | compatibility | R_Yét computed at κ and at κ′ ≥ κ agree on D(Y_v,κ, Λ). |
| `etaleCoreflection.bounded_formula` | compatibility | For locally spatial Y, R_Yét = R(ν ∘ λ)∗ on D⁺(Y_v, Λ) (node etale-coreflection-bounded-formula). |

Unit tests:

- `etaleCoreflection_on_etale` (degenerate): R_Yét(A) ≅ A for every A ∈ D_ét(Y, Λ).
- `etaleCoreflection_point` (computation): For Y = Spa(C, O_C), R_Yét(A) is the constant complex RΓ(Y_v, A).
- `etaleCoreflection_std` (compatibility): For strictly totally disconnected Y, R_Yét = R(ν ∘ λ)∗ on all of D(Y_v, Λ).
- `etaleCoreflection_not_identity` (non-example): For Y = Spa(C, O_C) and the v-sheaf S ↦ C(S, Z_p), R_Yét of it is Z_p[0] (global sections), which differs from the sheaf itself.

Acceptance:

- For A ∈ D_ét(Y, Λ), R_Yét(A) ≅ A; for locally spatial Y and A ∈ D⁺(Y_v, Λ), R_Yét(A) = R(ν ∘ λ)∗A.

Depends on: `DiamondEtaleCohomology:C2/enhanced-etale-category`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `mathlib:CategoryTheory.Adjunction`.

Sources:

- ECD, Corollary 17.2, p. 97.
- ECD, proof of Corollary 17.2, p. 97.

### `etale-coreflection-bounded-formula` — R_Yét on bounded-below objects of a locally spatial diamond

Declaration `DiamondEtaleCohomology:C2/etale-coreflection-bounded-formula` (theorem).

If Y is a locally spatial diamond, then on D⁺(Y_v, Λ) the coreflection R_Yét is R(ν ∘ λ)∗ followed by the embedding D⁺(Y_ét, Λ) ⊂ D_ét(Y, Λ), where ν ∘ λ : Y_v → Y_ét is the map of sites; if Y is strictly totally disconnected, this formula holds on all of D(Y_v, Λ).

Construction and proof:

1. For A ∈ D⁺(Y_v, Λ) and B ∈ D⁺_ét(Y, Λ) = D⁺(Y_ét, Λ), Hom(B, A) = Hom(B, R(ν∘λ)∗A) by adjunction and full faithfulness of (ν∘λ)^∗ (C0/bounded-below-comparison); R(ν∘λ)∗A ∈ D⁺(Y_ét, Λ).
2. Let A ∈ D^{≥a}(Y_v, Λ). Then R(ν∘λ)∗A ∈ D^{≥a}(Y_ét, Λ) since R(ν∘λ)∗ is left t-exact, so (ν∘λ)^∗R(ν∘λ)∗A ∈ D^{≥a}. τ^{≥a} is left adjoint to the inclusion D^{≥a} ⊂ D, and D_ét(Y, Λ) is closed under τ^{≥a}; so for every B ∈ D_ét(Y, Λ) both Hom(B, A) and Hom(B, (ν∘λ)^∗R(ν∘λ)∗A) depend only on τ^{≥a}B ∈ D⁺_ét(Y, Λ) = D⁺(Y_ét, Λ), where step 1 applies. Composition with the counit of (ν∘λ)^∗ ⊣ R(ν∘λ)∗ (C0/comparison-morphisms) identifies them, so (ν∘λ)^∗R(ν∘λ)∗A is R_Yét(A).
3. For strictly totally disconnected Y use the unbounded comparison (C0/unbounded-comparison-std) and D_ét(Y, Λ) = D(Y_ét, Λ).

Acceptance:

- The source asserts the formula without proof (PAPER-SCHOLZE-17/381); the proof steps here supply it.

Depends on: `DiamondEtaleCohomology:C2/etale-coreflection`, `DiamondEtaleCohomology:C0/bounded-below-comparison`, `DiamondEtaleCohomology:C0/unbounded-comparison-std`, `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `DiamondEtaleCohomology:C0/comparison-morphisms`.

Sources:

- ECD, after Corollary 17.2, p. 97.

## C3. Four operations

Pullback f^∗ for an arbitrary map of small v-stacks is built through a Čech nerve; Rf∗ is its right adjoint and equals R_Yét ∘ Rf_v∗, and for locally spatial diamonds it is the left-completed étale pushforward. Proposition 17.6 gives Rf∗ = Rf_v∗ and base change for qcqs maps with prime-to-p torsion coefficients on D⁺, and on all of D_ét when Rf∗ has finite cohomological dimension. The derived tensor product restricts to D_ét (17.7), internal Hom on D_ét is R_Yét of the v-internal Hom (17.8), and Rf∗RHom(f^∗A, B) ≅ RHom(A, Rf∗B) (17.9). The v-pushforward for arbitrary maps, the v-internal Hom at a cutoff, and the base change transformations for maps of small v-stacks have their own APIs in this stage. Change of coefficients completes the stage.

Other roadmaps: EnhancedDerivedSheaves E1 (derived tensor), E2 (amplitude of R lim), E3 (representability, mates).

Coverage: planned. Remaining: Receive the E3 representability criterion (HTT 5.5.2.2) for internal Hom. Lemma-level refinement: coherence of (f ∘ g)^∗ ≃ g^∗ ∘ f^∗ and of its mate for Rf∗; the projection formula and Hom identities for étale f_! are stated as API of C5/etale-extension-by-zero.

Planets: **Pullback f^∗** (`pullback`); **Pushforward Rf∗** (`pushforward`); **Base change for qcqs pushforward** (`qcqs-base-change-bounded`); **Derived tensor product on D_ét** (`etale-tensor`); **Internal Hom on D_ét** (`internal-hom`).

### `pullback` — Pullback f^∗ on D(Y_v, Λ) and D_ét for arbitrary maps of small v-stacks ★

Declaration `DiamondEtaleCohomology:C3/pullback` (construction).

Let f : Y′ → Y be a map of small v-stacks. Choose a perfectoid space Y′_0 with a surjection Y′_0 → Y′ and let Y′_• be its Čech nerve; all Y′_i are small v-sheaves and Y′_i → Y′, Y′_i → Y are 0-truncated. Pullback along Y′_• → Y gives f_v^∗ : 𝒟(Y_v, Λ) → 𝒟_cart(Y′_•,v, Λ) ≃ 𝒟(Y′_v, Λ), which carries 𝒟_ét(Y, Λ) into 𝒟_ét(Y′, Λ) and restricts to f^∗ : D_ét(Y, Λ) → D_ét(Y′, Λ). The functor is canonically independent of the choice of Y′_0 → Y′ and, for g : Y″ → Y′, there is a natural equivalence (f ∘ g)^∗ ≃ g^∗ ∘ f^∗ with the usual coherences. For 0-truncated f it is the pullback of the morphism of sites f_v.

Construction and proof:

1. For 0-truncated f, f_v is a morphism of sites and f_v^∗ is the pullback of ringed topoi (C2/enhanced-v-derived-category).
2. In general, pull back to the Čech nerve, which consists of 0-truncated maps, and use hyperdescent (C2/v-hyperdescent) to identify cartesian objects on Y′_• with 𝒟(Y′_v, Λ).
3. Independence: the choices of Y′_0 → Y′ form a cofiltered category, and refinements induce equivalences compatible with the identifications. Composition: composites of pullbacks are pullbacks on Čech nerves. The printed law (f ∘ g)^∗ ≃ f^∗ ∘ g^∗ is a misprint for g^∗ ∘ f^∗ (PAPER-SCHOLZE-17/E92), and 𝒟_ét(Y_v, Λ) is a misprint for 𝒟_ét(Y, Λ) (PAPER-SCHOLZE-17/E93).
4. Preservation of D_ét: test on strictly totally disconnected X → Y′; the composite X → Y is a map from a strictly totally disconnected space. The referee's alternative: the cocontinuous functor Y′_v → Y_v, (X′ → Y′) ↦ (X′ → Y′ → Y), gives the same pullback.
5. EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi assumes ringed topoi with enough points; Y_v,κ^∼ is algebraic (C0/algebraic-topoi), hence locally coherent, and has enough points by Deligne's theorem (SGA 4 VI 9.0, part of the DiamondsAndVStacks:D0 request).

Used by:

- ECD Lemma 17.5: Rf∗ is the right adjoint of f^∗
- ECD Proposition 19.1: f_! is the left adjoint of f^∗ for étale f
- DiamondSixOperations:S1–S4: f^∗ is one of the six operations, with pullback/tensor and pullback/Hom identities

API:

| name | role | statement |
|---|---|---|
| `pull` | constructor | For f : Y′ → Y, the exact colimit-preserving functor f^∗ : 𝒟_ét(Y, Λ) → 𝒟_ét(Y′, Λ), and on homotopy categories f^∗ : D_ét(Y, Λ) → D_ét(Y′, Λ). |
| `pull_comp` | functoriality | For g : Y″ → Y′ and f : Y′ → Y, pull (g ≫ f) ≅ pull f ⋙ pull g, coherently associative. |
| `pull_id` | functoriality | pull (𝟙 Y) ≅ 𝟭. |
| `pull_zeroTruncated` | compatibility | If f is 0-truncated, pull f is the restriction of f_v^∗ for the morphism of sites f_v. |
| `pull_locallySpatial` | compatibility | If f is a map of locally spatial diamonds, pull f restricted to D⁺_ét = D⁺(−_ét) is f_ét^∗. |
| `pull_tStructure` | other | pull f is t-exact for the standard t-structures and commutes with H^i. |
| `pull_colimits` | other | pull f preserves all small colimits. |
| `pull_twoCell` | functoriality | A 2-isomorphism α : h ⇒ h′ of maps of small v-stacks induces pull h ≅ pull h′, compatibly with pull_comp and with vertical composition of 2-cells. |
| `vPull` | constructor | f_v^∗ : 𝒟(Y_v,κ, Λ) → 𝒟(Y′_v,κ, Λ) for κ adequate for a perfectoid cover Y′_0 → Y′ (the Čech-nerve construction of the statement), with vPull_comp : vPull (g ≫ f) ≅ vPull f ⋙ vPull g; for 0-truncated f the pullback of the morphism of sites. |
| `vPush` | constructor | The right adjoint Rf_v∗ of f_v^∗, given by Rf_v∗A = lim_{[n]∈Δ} Rg_{n,v∗}(A\|Y′_n) for the Čech nerve g_• : Y′_• → Y of a perfectoid cover of Y′; for 0-truncated f it is the derived pushforward of the morphism of sites; it is compatible with the cutoff transitions and commutes with restriction along 0-truncated maps to Y (v-slices). |

Unit tests:

- `pull_id_test` (degenerate): pull (𝟙 Y) A ≅ A for every A ∈ D_ét(Y, Λ).
- `pull_constant` (computation): pull f carries the constant sheaf Λ_Y to Λ_{Y′}.
- `pull_std_compat` (compatibility): For a map f : X′ → X of strictly totally disconnected spaces, pull f corresponds to the derived pullback of sheaves on |X| along |f| under D_ét = D(|−|, Λ).
- `pull_comp_order` (characterisation): For g : Z → Y and f : Y → X, (f ∘ g)^∗ ≃ g^∗ ∘ f^∗ (and not f^∗ ∘ g^∗, which does not typecheck).
- `pull_classifying_stack` (computation): For a finite group G acting trivially on X = Spa(C, O_C) and q : X → [X/G], hyperdescent along the Čech nerve G^• × X (C2/v-hyperdescent) gives 𝒟_ét([X/G], Λ) ≃ Fun(BG, 𝒟(Λ)) ≃ 𝒟(Λ[G]), and pull q is the forgetful functor to 𝒟(Λ); for G ≠ 1 and Λ ≠ 0 it is not fully faithful (End(Λ[G]) is Λ[G] in 𝒟(Λ[G]) but the |G| × |G| matrix ring over Λ in 𝒟(Λ)).

Acceptance:

- In function notation, for f : Y → X and g : Z → Y, the composition law is (f ∘ g)^∗ ≃ g^∗ ∘ f^∗; in Lean's diagrammatic notation g ≫ f it reads pull (g ≫ f) ≅ pull f ⋙ pull g.

Depends on: `DiamondEtaleCohomology:C2/enhanced-v-derived-category`, `DiamondEtaleCohomology:C2/v-hyperdescent`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `mathlib:CategoryTheory.Functor.IsCocontinuous`, `DiamondEtaleCohomology:C0/algebraic-topoi`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Sources:

- ECD, §17, p. 98.

### `pushforward` — Pushforward Rf∗ on D_ét ★

Declaration `DiamondEtaleCohomology:C3/pushforward` (construction).

For any map of small v-stacks f : Y′ → Y, the functor f^∗ : D_ét(Y, Λ) → D_ét(Y′, Λ) has a right adjoint Rf∗ : D_ét(Y′, Λ) → D_ét(Y, Λ), the homotopy category of a right adjoint of the colimit-preserving functor f^∗ : 𝒟_ét(Y, Λ) → 𝒟_ét(Y′, Λ) of presentable ∞-categories.

Construction and proof:

1. f_v^∗ commutes with all colimits by construction, hence so does f^∗ on 𝒟_ét; both categories are presentable (C2/enhanced-etale-category); apply the adjoint functor theorem (EnhancedDerivedSheaves E3).

Used by:

- ECD Proposition 17.6: comparison with v-pushforward and base change
- ECD Theorem 19.2: proper base change compares j_!Rg∗ with Rf∗j′_!
- DiamondSixOperations:S1: Rf_! = Rf̄∗ j_! for compactifiable f
- AdicCoefficientsAndComparisons:L0: the adic operations

API:

| name | role | statement |
|---|---|---|
| `push` | constructor | Rf∗ : 𝒟_ét(Y′, Λ) → 𝒟_ét(Y, Λ) with the adjunction pull f ⊣ push f. |
| `push_comp` | functoriality | push (g ≫ f) ≅ push g ⋙ push f, i.e. R(f ∘ g)∗ ≃ Rf∗ ∘ Rg∗, the mate of pull_comp, coherently. |
| `push_id` | functoriality | R(𝟙 Y)∗ ≅ 𝟭. |
| `push_limits` | other | Rf∗ is exact and preserves all limits. |
| `push_globalSections` | characterisation | RΓ(Y, −) := RHom_{𝒟_ét(Y,Λ)}(Λ_Y, −) : D_ét(Y, Λ) → D(Λ), so H^i(Y, A) = Hom(Λ_Y, A[i]); for f : Y → ∗ the adjunction gives Hom(Λ_Y, A[i]) = Hom(Λ_∗, (Rf∗A)[i]) and RΓ(Y, A) = RΓ(∗, Rf∗A). D_ét(∗, Λ) is not D(Λ), so H^i(Rf∗A) is a sheaf on ∗_v, not H^i(Y, A). |
| `push_eq_coreflection` | compatibility | Rf∗ = R_Yét ∘ Rf_v∗ (node pushforward-via-coreflection). |
| `push_locallySpatial` | compatibility | For locally spatial Y′, Y, Rf∗ is the left-completed Rf_ét∗ (node pushforward-locally-spatial). |
| `push.baseChange` | constructor | For a 2-cartesian square of small v-stacks (f̃ : Ỹ′ → Ỹ, g′ : Ỹ′ → Y′ over f : Y′ → Y, g : Ỹ → Y), the base change transformation g^∗ ∘ Rf∗ ⟶ Rf̃∗ ∘ g′^∗, the mate of pull_comp and the 2-cell (pull_twoCell); the identity for g = id; compatible with horizontal and vertical pasting; for qcqs f with nΛ = 0, n prime to p, on D⁺_ét it agrees with the v-site base-change map under Rf∗ = Rf_v∗. |

Unit tests:

- `push_id_test` (degenerate): R(𝟙 Y)∗ A ≅ A.
- `push_point` (computation): For f : Spa(C, O_C) × S → Spa(C, O_C) with S profinite and M a Λ-module, Rf∗ M = C(S, M) placed in degree 0 (locally constant functions).
- `push_adjunction` (characterisation): Hom_{D_ét(Y,Λ)}(B, Rf∗A) ≅ Hom_{D_ét(Y′,Λ)}(f^∗B, A) naturally in B and A.
- `push_not_v_pushforward` (non-example): For f : ⊔_{n∈N} Spa(C, O_C) → Spa(C, O_C) (not quasicompact) and Λ ≠ 0 finite, Rf_v∗Λ is the v-sheaf X ↦ C(|X|, Λ^N) with Λ^N in the product topology, which is not in D_ét (its sections over Spa(C, O_C) × (N ∪ {∞}) are not locally constant), while Rf∗Λ = R_Yét Rf_v∗Λ is the constant sheaf Λ^N; for qcqs f with nΛ = 0, n prime to p, the two agree on D⁺_ét (Proposition 17.6).

Acceptance:

- Concrete instance: for f : Spa(C, O_C) × S → Spa(C, O_C), Rf∗Λ = C(S, Λ) in degree 0; for f = id, Rf∗ = id.

Depends on: `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `mathlib:CategoryTheory.Adjunction`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Sources:

- ECD, Lemma 17.5, p. 98.
- ECD, proof of Lemma 17.5, p. 98.

### `pushforward-via-coreflection` — Rf∗ is the coreflection of the v-pushforward

Declaration `DiamondEtaleCohomology:C3/pushforward-via-coreflection` (theorem).

For any map of small v-stacks f : Y′ → Y, Rf∗ = R_Yét ∘ Rf_v∗ on D_ét(Y′, Λ).

Construction and proof:

1. For B ∈ D_ét(Y, Λ) and A ∈ D_ét(Y′, Λ): Hom(B, R_Yét Rf_v∗A) = Hom_{D(Y_v)}(B, Rf_v∗A) = Hom_{D(Y′_v)}(f_v^∗B, A) = Hom(f^∗B, A); by uniqueness of right adjoints this is Rf∗. Here Rf_v∗ is the right adjoint of f_v^∗ for an arbitrary map of small v-stacks (C3/pullback API vPush).

Acceptance:

- For f between strictly totally disconnected spaces, R_Yét Rf_v∗ restricted to D_ét(Y′, Λ) = D(Y′_ét, Λ) is the étale pushforward Rf_ét∗ (Corollary 16.7).

Depends on: `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C2/etale-coreflection`, `DiamondEtaleCohomology:C3/pullback`.

Sources:

- ECD, after Lemma 17.5, p. 98.

### `pushforward-locally-spatial` — Rf∗ for locally spatial diamonds is the left-completed étale pushforward

Declaration `DiamondEtaleCohomology:C3/pushforward-locally-spatial` (theorem).

Let f : Y′ → Y be a map of locally spatial diamonds. Under the identifications of D_ét(Y′, Λ) and D_ét(Y, Λ) with the left completions of D(Y′_ét, Λ) and D(Y_ét, Λ) (C2/left-completion-comparison), Rf∗ is the left-completed étale pushforward: Rf∗(R lim_n A_n) = R lim_n Rf_ét∗A_n for a Postnikov tower (A_n) in D(Y′_ét, Λ), and Rf∗ = Rf_ét∗ on D⁺_ét(Y′, Λ) = D⁺(Y′_ét, Λ).

Construction and proof:

1. On D⁺: for bounded-below B, A in the étale categories, Hom(f_ét^∗B, A) = Hom(B, Rf_ét∗A) and f^∗ restricts to f_ét^∗ (C3/pullback); so the right adjoint agrees with Rf_ét∗ on D⁺, with Rf_ét∗A ∈ D⁺(Y_ét, Λ).
2. Rf∗ is left t-exact (right adjoint of the t-exact f^∗, pull_tStructure), so Rf∗A ∈ D⁺_ét(Y, Λ) for A ∈ D⁺; the cone of Rf_ét∗A → Rf∗A is bounded below and receives no nonzero maps from bounded-below objects, hence vanishes.
3. In general both sides commute with Postnikov limits (right adjoints preserve limits, D_ét is left-complete), so Rf∗ is the left-completed Rf_ét∗.
4. The source asserts this without proof (PAPER-SCHOLZE-17/387); the two steps above supply it.

Acceptance:

- For f a quasicompact open immersion of spatial diamonds and A ∈ D⁺(Y′_ét, Λ), Rf∗A = Rf_ét∗A.

Depends on: `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C3/pullback`.

Sources:

- ECD, after Lemma 17.5, p. 98.

### `qcqs-base-change-bounded` — Pushforward along qcqs maps with prime-to-p torsion coefficients: comparison and base change on D⁺ ★

Declaration `DiamondEtaleCohomology:C3/qcqs-base-change-bounded` (theorem).

Assume nΛ = 0 for some n prime to p, and let f : Y′ → Y be a qcqs map of small v-stacks. For every A ∈ D⁺_ét(Y′, Λ), Rf_v∗A ∈ D⁺_ét(Y, Λ), hence Rf∗A = Rf_v∗A. Moreover the formation of Rf∗ commutes with any base change: for every map g : Ỹ → Y of small v-stacks with f̃ : Ỹ′ = Y′ ×_Y Ỹ → Ỹ and g′ : Ỹ′ → Y′, the natural transformation g^∗Rf∗A → Rf̃∗g′^∗A is an equivalence for all A ∈ D⁺_ét(Y′, Λ).

Construction and proof:

1. Rf_v∗A ∈ D⁺_ét(Y, Λ) is Corollary 16.8(ii) (C2/qcqs-pushforward-preserves-etale); then Rf∗ = R_Yét Rf_v∗ = Rf_v∗ (node pushforward-via-coreflection).
2. Base change: the map is push.baseChange (C3/pushforward); under Rf∗ = Rf_v∗ (C3/pullback API vPush) it is the v-site base-change map, which is an isomorphism because v-pushforward commutes with v-slices, and f̃ is again qcqs.

Acceptance:

- The hypothesis nΛ = 0 with n prime to p is kept; for quasi-pro-étale qcqs f with arbitrary Λ the corresponding comparison is C2/qcqs-pushforward-preserves-etale(i).

Depends on: `DiamondEtaleCohomology:C2/qcqs-pushforward-preserves-etale`, `DiamondEtaleCohomology:C3/pushforward-via-coreflection`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`.

Sources:

- ECD, Proposition 17.6, p. 98.
- ECD, proof of Proposition 17.6, p. 99.

### `qcqs-base-change-finite-cd` — Unbounded comparison and base change under finite cohomological dimension

Declaration `DiamondEtaleCohomology:C3/qcqs-base-change-finite-cd` (theorem).

Assume nΛ = 0 for some n prime to p and let f : Y′ → Y be a qcqs map of small v-stacks such that Rf∗ has finite cohomological dimension: there is N with R^if∗A = 0 for i > N and all A ∈ D_ét(Y′, Λ) concentrated in degree 0. Then for all A ∈ D_ét(Y′, Λ), Rf∗A = Rf_v∗A ∈ D_ét(Y, Λ), and for every map g : Ỹ → Y of small v-stacks g^∗Rf∗A → Rf̃∗g′^∗A is an isomorphism. Only Rf∗, not Rf̃∗, needs finite cohomological dimension.

Construction and proof:

1. By left-completeness Rf_v∗A = R lim_n Rf∗τ^{≥−n}A, and the system is eventually constant in each degree; R lim has cohomological dimension ≤ 1 in a replete topos ([BS15, 3.1.11], EnhancedDerivedSheaves E2), so each cohomology sheaf of Rf_v∗A is that of some Rf∗τ^{≥−n}A, and Rf_v∗A ∈ D_ét(Y, Λ) by the cohomology-sheaf criterion.
2. Base change (the map push.baseChange of C3/pushforward): Rf̃∗g′^∗A = R lim_n g^∗Rf∗τ^{≥−n}A, and the cone of g^∗Rf∗A → g^∗Rf∗τ^{≥−n}A lies in degrees ≤ −n + N, so its R lim vanishes by left-completeness.

Acceptance:

- Concrete instance: for a quasicompact separated quasi-pro-étale f of locally spatial diamonds, R^if∗ = 0 on sheaves for i > 0 (DiamondEtaleCohomology:C8/qpetale-direct-image), so N = 0 and base change holds on unbounded D_ét.

Depends on: `DiamondEtaleCohomology:C3/qcqs-base-change-bounded`, `EnhancedDerivedSheaves:E2/inverse-limit-amplitude`, `DiamondEtaleCohomology:C2/cohomology-sheaf-criterion`, `DiamondEtaleCohomology:C0/left-completeness`, `DiamondEtaleCohomology:C0/v-topos-replete`, `EnhancedDerivedSheaves:E2`.

Sources:

- ECD, Proposition 17.6, p. 99.
- ECD, proof of Proposition 17.6, p. 99.

### `v-derived-tensor` — The derived tensor product on D(Y_v, Λ) and its compatibility with pullback

Declaration `DiamondEtaleCohomology:C3/v-derived-tensor` (construction).

For a small v-stack Y and every cutoff κ adequate for Y, there is a functor − ⊗^L_Λ − : 𝒟(Y_v,κ, Λ) × 𝒟(Y_v,κ, Λ) → 𝒟(Y_v,κ, Λ) of ∞-categories, preserving colimits separately in each variable, which makes 𝒟(Y_v,κ, Λ) presentably symmetric monoidal with unit Λ, with internal Hom RHom_v right adjoint to − ⊗^L_Λ A. The cutoff transitions are symmetric monoidal, so ⊗^L_Λ is defined on the colimit 𝒟(Y_v, Λ), which is symmetric monoidal but not presentable. On homotopy categories it is the derived tensor product of the ringed topos. For every map f : Y′ → Y of small v-stacks there is a natural equivalence f^∗(A ⊗^L_Λ B) ≃ f^∗A ⊗^L_Λ f^∗B.

Construction and proof:

1. For a ringed topos, K-flat replacements give the derived tensor product as a symmetric monoidal functor of ∞-categories (EnhancedDerivedSheaves E1).
2. For 0-truncated f this is the monoidality of pullback of ringed topoi; in general follow the construction of f^∗ through the Čech nerve (C3/pullback).
3. ECD footnote 4 calls the uncut D(Y_v, Λ) presentably symmetric monoidal; presentability holds only at a cutoff (Lemma 17.1, node C2/enhanced-v-derived-category), see DiamondEtaleCohomology/E7.

Used by:

- ECD Lemma 17.7: the tensor product restricts to D_ét
- ECD Corollary 17.9: the pullback/tensor identity enters the adjunction calculus

API:

| name | role | statement |
|---|---|---|
| `vTensor` | constructor | The bifunctor ⊗^L_Λ on 𝒟(Y_v, Λ), colimit-preserving in each variable. |
| `vTensor.symmetricMonoidal` | instance | For each adequate κ, 𝒟(Y_v,κ, Λ) is presentably symmetric monoidal with unit the constant sheaf Λ; the transitions κ ≤ κ′ are symmetric monoidal, and the colimit 𝒟(Y_v, Λ) is symmetric monoidal (not presentable). |
| `vTensor.pull` | compatibility | f^∗(A ⊗^L B) ≃ f^∗A ⊗^L f^∗B, naturally and monoidally coherent. |
| `vTensor.cohomology_flat` | simp | If B is a flat Λ-module sheaf in degree 0, H^i(A ⊗^L B) = H^i(A) ⊗ B. |
| `vTensor.internalHom` | universal-property | The internal Hom RHom_v(A, −) of 𝒟(Y_v,κ, Λ), right adjoint to − ⊗^L_Λ A, compatible with the cutoff transitions; on homotopy categories the derived internal Hom of the ringed topos. |

Unit tests:

- `vTensor_unit` (degenerate): Λ ⊗^L A ≃ A.
- `vTensor_constant` (computation): For Λ-modules M, N, const M ⊗^L const N = const (M ⊗^L_Λ N).
- `vTensor_pull` (compatibility): For f : X′ → X strictly totally disconnected, f^∗(A ⊗^L B) ≃ f^∗A ⊗^L f^∗B agrees with the tensor product of sheaves on |X′|.
- `vTensor_not_exact` (non-example): For Λ = Z, Z/p ⊗^L Z/p has H^{−1} = Z/p ≠ 0, so the derived tensor product is not the underived one.

Acceptance:

- For constant sheaves, const M ⊗^L const N = const(M ⊗^L_Λ N), and f^∗ is symmetric monoidal.

Depends on: `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `DiamondEtaleCohomology:C2/enhanced-v-derived-category`, `DiamondEtaleCohomology:C3/pullback`, `mathlib:CategoryTheory.MonoidalCategory`.

Sources:

- ECD, §17, p. 99.

### `etale-tensor` — The derived tensor product on D_ét ★

Declaration `DiamondEtaleCohomology:C3/etale-tensor` (construction).

For any small v-stack Y, − ⊗^L_Λ − on D(Y_v, Λ) restricts to a functor D_ét(Y, Λ) × D_ét(Y, Λ) → D_ét(Y, Λ); hence 𝒟_ét(Y, Λ) is presentably symmetric monoidal, in a unique way compatible with the symmetric monoidal structure of 𝒟(Y_v, Λ), and f^∗ is symmetric monoidal.

Construction and proof:

1. The membership can be checked v-locally, so assume Y is a disjoint union of strictly totally disconnected spaces; there D_ét(Y, Λ) = D(Y_ét, Λ) and the tensor product of D(Y_ét, Λ) is compatible with pullback along Y_v → Y_ét.
2. A full subcategory closed under tensor products and containing the unit inherits the symmetric monoidal structure; colimits are preserved since 𝒟_ét is closed under colimits (C2/enhanced-etale-category).

Used by:

- ECD Lemma 17.8: internal Hom is the right adjoint of − ⊗^L A on D_ét
- DiamondSixOperations:S1: projection formula for Rf_!
- DiamondEtaleCohomology:C9/perfect-local-system-compact: tensoring with the dual of a perfect local system preserves coproducts

API:

| name | role | statement |
|---|---|---|
| `etTensor` | constructor | The symmetric monoidal structure on 𝒟_ét(Y, Λ) with unit Λ_Y. |
| `etTensor.incl` | compatibility | The inclusion 𝒟_ét(Y, Λ) → 𝒟(Y_v, Λ) is symmetric monoidal. |
| `etTensor.pull` | functoriality | pull f is symmetric monoidal: f^∗(A ⊗^L B) ≃ f^∗A ⊗^L f^∗B. |
| `etTensor.colimits` | other | ⊗^L preserves colimits separately in each variable on 𝒟_ét(Y, Λ). |
| `etTensor.stalk` | compatibility | For a locally spatial diamond Y and a geometric point ȳ, (A ⊗^L B)_ȳ = A_ȳ ⊗^L_Λ B_ȳ. |

Unit tests:

- `etTensor_unit` (degenerate): Λ_Y ⊗^L A ≅ A in D_ét(Y, Λ).
- `etTensor_point` (computation): For Y = Spa(C, O_C), under D_ét(Y, Λ) ≃ D(Λ) the tensor product is ⊗^L_Λ.
- `etTensor_std` (compatibility): For strictly totally disconnected X, the tensor product on D_ét(X, Λ) is the derived tensor product of sheaves of Λ-modules on |X|.
- `etTensor_lower_shriek` (characterisation): For X strictly totally disconnected, U ⊂ |X| quasicompact open and Λ_U^! ∈ D(|X|, Λ) = D_ét(X, Λ) the extension by zero of Λ_U on the space |X|: Λ_U^! ⊗^L B is the extension by zero of B|_U, for every B ∈ D_ét(X, Λ).
- `etTensor_not_closed_v_hom` (non-example): The v-internal Hom of two objects of D_ét(Y, Λ) need not lie in D_ét(Y, Λ); internal Hom on D_ét requires R_Yét (node internal-hom).

Acceptance:

- For strictly totally disconnected X the tensor product on D_ét(X, Λ) = D(|X|, Λ) is the derived tensor product of sheaves on |X|.

Depends on: `DiamondEtaleCohomology:C3/v-derived-tensor`, `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C0/unbounded-comparison-std`.

Sources:

- ECD, Lemma 17.7, p. 100.
- ECD, after Lemma 17.7, p. 100.

### `internal-hom` — Internal Hom on D_ét ★

Declaration `DiamondEtaleCohomology:C3/internal-hom` (construction).

For any small v-stack Y and A ∈ D_ét(Y, Λ), B ↦ B ⊗^L_Λ A on D_ét(Y, Λ) has a right adjoint C ↦ RHom_Λ(A, C), i.e. Hom(B ⊗^L A, C) = Hom(B, RHom_Λ(A, C)); for varying A these assemble into RHom_Λ(−, −) : D_ét(Y, Λ)^op × D_ét(Y, Λ) → D_ét(Y, Λ). In general RHom_Λ(A, C) = R_Yét of the internal Hom of D(Y_v, Λ), and not the latter itself.

Construction and proof:

1. For fixed (A, C), B ↦ Map(B ⊗^L A, C) takes colimits in 𝒟_ét to limits since − ⊗^L A preserves colimits (node etale-tensor); by the representability criterion for presentable ∞-categories ([Lur09, Proposition 5.5.2.2], EnhancedDerivedSheaves E5/E3) it is representable.
2. The comparison with R_Yét of the v-internal Hom (C3/v-derived-tensor API vTensor.internalHom) follows from the adjunctions incl ⊣ R_Yét and ⊗ ⊣ Hom on D(Y_v, Λ).

Used by:

- ECD Corollary 17.9: Rf∗RHom(f^∗A, B) ≅ RHom(A, Rf∗B)
- DiamondSixOperations:S3, S6: Verdier duality and biduality use RHom on D_ét
- DiamondEtaleCohomology:C9/perfect-local-system-compact: Hom(j_!L, −) = RΓ(U, L^∨ ⊗ −)

API:

| name | role | statement |
|---|---|---|
| `etHom` | constructor | The bifunctor RHom_Λ(−, −) on 𝒟_ét(Y, Λ) making it closed symmetric monoidal. |
| `etHom.adj` | universal-property | Hom(B ⊗^L A, C) ≅ Hom(B, RHom_Λ(A, C)) naturally in A, B, C. |
| `etHom.eq_coreflection` | characterisation | RHom_Λ(A, C) ≅ R_Yét(RHom_{D(Y_v,Λ)}(A, C)). |
| `etHom.globalSections` | characterisation | RΓ(Y, RHom_Λ(A, C)) computes RHom_{D_ét(Y,Λ)}(A, C). |
| `etHom.pull_map` | functoriality | A natural map f^∗RHom_Λ(A, C) → RHom_Λ(f^∗A, f^∗C), adjoint to f^∗ monoidality; that it is an isomorphism for étale f is an API item of C5/etale-extension-by-zero (it needs the projection formula for f_!). |
| `etHom.dual` | other | The dual A^∨ = RHom_Λ(A, Λ_Y); for dualizable A, RHom_Λ(A, C) ≅ A^∨ ⊗^L C. |

Unit tests:

- `etHom_unit` (degenerate): RHom_Λ(Λ_Y, C) ≅ C.
- `etHom_point` (computation): For Y = Spa(C, O_C), under D_ét(Y, Λ) ≃ D(Λ), RHom_Λ is the derived Hom of complexes of Λ-modules.
- `etHom_std_compat` (compatibility): For strictly totally disconnected X, U ⊂ |X| quasicompact open with inclusion j and Λ_U^! the extension by zero of Λ_U on the space |X|, RHom_Λ(Λ_U^!, C) ≅ Rj_∗j^∗C, as for sheaves of Λ-modules on |X|.
- `etHom_not_v_hom` (non-example): For Y = Spa(C, O_C), Λ = Z and A = ⊕_{n∈N} Z, the v-internal Hom Hom(A, Z) is the sheaf S ↦ C(S, Z^N) with Z^N carrying the product topology, which is not in D_ét(Y, Z); the étale internal Hom RHom_Λ(A, Z) is the constant sheaf with value Z^N.

Acceptance:

- RHom_Λ(Λ_Y, C) ≅ C, and RΓ(Y, RHom_Λ(A, C)) = RHom_{D_ét(Y,Λ)}(A, C).

Depends on: `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C2/etale-coreflection`, `DiamondEtaleCohomology:C2/enhanced-etale-category`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3`, `mathlib:CategoryTheory.MonoidalClosed`, `DiamondEtaleCohomology:C3/v-derived-tensor`.

Sources:

- ECD, Lemma 17.8, p. 100.
- ECD, after Lemma 17.8, p. 100.

### `pushforward-internal-hom` — Pushforward and internal Hom

Declaration `DiamondEtaleCohomology:C3/pushforward-internal-hom` (theorem).

Let f : Y′ → Y be a map of small v-stacks. There is a natural equivalence Rf∗RHom_Λ(f^∗A, B) ≅ RHom_Λ(A, Rf∗B) of functors D_ét(Y, Λ)^op × D_ét(Y′, Λ) → D_ét(Y, Λ).

Construction and proof:

1. For C ∈ D_ét(Y, Λ): Hom(C, Rf∗RHom(f^∗A, B)) ≅ Hom(f^∗C, RHom(f^∗A, B)) ≅ Hom(f^∗C ⊗ f^∗A, B) ≅ Hom(f^∗(C ⊗ A), B) ≅ Hom(C ⊗ A, Rf∗B) ≅ Hom(C, RHom(A, Rf∗B)); conclude by Yoneda.

Acceptance:

- With A = Λ_Y the equivalence reads Rf∗RHom(Λ_{Y′}, B) ≅ Rf∗B, i.e. it is compatible with the unit.

Depends on: `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`.

Sources:

- ECD, Corollary 17.9, p. 100.
- ECD, proof of Corollary 17.9, p. 101.

### `change-of-coefficients` — Change of coefficient ring on D_ét

Declaration `DiamondEtaleCohomology:C3/change-of-coefficients` (construction).

Let φ : Λ → Λ′ be a map of rings and Y a small v-stack. Restriction of scalars φ_∗ : D(Y_v, Λ′) → D(Y_v, Λ) and extension of scalars φ^∗ = Λ′ ⊗^L_Λ − : D(Y_v, Λ) → D(Y_v, Λ′) preserve the étale subcategories, giving φ^∗ ⊣ φ_∗ on D_ét. Both commute with pullback f^∗; φ_∗ commutes with Rf∗; φ^∗ is symmetric monoidal; and Rf∗φ_∗ ≅ φ_∗Rf∗. For Λ → Λ/I and Λ/Iⁿ → Λ/I^m these give the reduction functors.

Construction and proof:

1. Membership in D_ét is tested after pullback to strictly totally disconnected X (C2/etale-derived-category), where D_ét = D(X_ét, −) and restriction and extension of scalars preserve étale complexes and commute with λ^∗ν^∗.
2. φ^∗ = Λ′ ⊗^L_Λ − commutes with the inclusions D_ét ⊂ D(−_v) and with f^∗ (monoidality of pullback, constant Λ′); passing to right adjoints gives φ_∗ ∘ R_Yét^{Λ′} ≅ R_Yét^{Λ} ∘ φ_∗ and φ_∗ ∘ Rf∗ ≅ Rf∗ ∘ φ_∗. φ_∗ commutes with f_v^∗ because pullback of module sheaves along a morphism of topoi commutes with restriction of scalars for constant rings.
3. ECD fixes Λ throughout §§14–20; this node supplies the coefficient changes that the stage and its consumers require.

Used by:

- AdicCoefficientsAndComparisons:L0: D_ét(Y, Λ) is stable under reductions Λ/Iⁿ → Λ/I^m
- DiamondSixOperations:S3: upper-shriek change of rings
- ECD Proposition 20.15: filtered colimits of coefficient rings

API:

| name | role | statement |
|---|---|---|
| `restrictScalars` | constructor | φ_∗ : D_ét(Y, Λ′) → D_ét(Y, Λ). |
| `extendScalars` | constructor | φ^∗ = Λ′ ⊗^L_Λ − : D_ét(Y, Λ) → D_ét(Y, Λ′), left adjoint to φ_∗. |
| `restrictScalars_pull` | compatibility | φ_∗ ∘ f^∗ ≅ f^∗ ∘ φ_∗. |
| `restrictScalars_push` | compatibility | φ_∗ ∘ Rf∗ ≅ Rf∗ ∘ φ_∗. |
| `extendScalars_pull` | compatibility | φ^∗ ∘ f^∗ ≅ f^∗ ∘ φ^∗, symmetric monoidally. |
| `changeOfCoefficients_comp` | functoriality | (ψ ∘ φ)_∗ ≅ φ_∗ ∘ ψ_∗ and (ψ ∘ φ)^∗ ≅ ψ^∗ ∘ φ^∗. |

Unit tests:

- `restrictScalars_id` (degenerate): For φ = id, φ_∗ ≅ 𝟭 and φ^∗ ≅ 𝟭.
- `extendScalars_reduction` (computation): For Λ = Z/ℓ² → Λ′ = Z/ℓ and the constant sheaf Λ, φ^∗Λ = Λ′ and φ_∗φ^∗Λ is the constant sheaf Z/ℓ viewed as a Z/ℓ²-module.
- `changeOfCoefficients_point` (compatibility): For Y = Spa(C, O_C), under D_ét ≃ D(Λ) these are the restriction and derived extension of scalars of Mathlib's module categories.
- `extendScalars_not_underived` (non-example): For Z → Z/p and the constant sheaf Z/p, φ^∗(Z/p) = Z/p ⊗^L_Z Z/p has H^{−1} ≠ 0, so the underived extension of scalars is not the right functor.

Acceptance:

- For Λ → Λ/ℓ and Y = Spa(C, O_C), extension and restriction of scalars are those of D(Λ) → D(Λ/ℓ) under D_ét ≃ D(Λ).

Depends on: `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C2/etale-coreflection`, `mathlib:ModuleCat`.

Sources:

- ECD, paragraph before Proposition 14.10, p. 86. ECD fixes one coefficient ring; this node supplies the coefficient changes that the stage text and the consumers (AdicCoefficientsAndComparisons L0) require.

## C4. Proper, partially proper, and canonical compactification

ECD §18 for v-stacks: proper maps (quasicompact, separated, universally closed), with closed immersions proper and the comparison with topological properness for locally compact Hausdorff spaces; the valuative criterion of properness and its strong form for perfectoid Tate pairs; partially proper maps, whose valuative reformulation using 0-truncatedness and quasiseparatedness retains uniqueness of lifts; the envelope Ȳ of a separated v-sheaf (Ȳ(R, R⁺) = Y(R, R°)), its affinoid formula Spa(R, (R⁺)′), compatibility with limits and surjections, partial properness, smallness, the diamond property and quasi-pro-étaleness; the canonical compactification Ȳ′^{/Y} of a separated map with its universal property for partially proper targets and Corollary 18.8; filtered colimits of proper maps along closed immersions are partially proper, and conversely every partially proper map to a quasiseparated v-sheaf is such a colimit (18.9, with the quasiseparatedness hypothesis recorded in DiamondEtaleCohomology/E4); and the tautness criterion for locally spatial sources (18.10). The canonical compactification of a spatial map is not asserted to be spatial, and the map into it is not assumed to be an open immersion.

Other roadmaps: DiamondsAndVStacks D0 (spectral topology), D1 (Lemma 7.6, Corollary 7.22), D3 (separatedness; Propositions 10.9 and 10.10 for v-stacks requested), D4 (isomorphism criteria, compact Hausdorff spaces), D5 (spatial diamonds; sub-v-sheaves of pro-constructible generalizing subsets and locally compact Hausdorff spaces requested), PerfectoidSpaces P4, ClassicalAdicEtaleCohomology H3 (taut spaces).

Coverage: planned. Remaining: Receive the DiamondsAndVStacks:D3 contract for ECD 10.9–10.10 on v-stacks and the D5 contracts for sub-v-sheaves attached to pro-constructible generalizing subsets and for locally compact Hausdorff v-sheaves. RS-05's owner entry for 'Diamond canonical compactification geometry' names DiamondsAndVStacks:D5; this packet plans ECD §18 in C4, as RT-AREA-padic-1/11 option one requires, and records the correction in restructure.

Planets: **Proper map of v-stacks** (`proper-map`); **Valuative criterion of properness** (`valuative-criterion-proper`); **Partially proper map** (`partially-proper-map`); **Canonical compactification** (`canonical-compactification`); **Tautness criterion** (`tautness-criterion`).

### `proper-map` — Proper maps of v-stacks ★

Declaration `DiamondEtaleCohomology:C4/proper-map` (definition).

A map f : Y′ → Y of v-stacks is proper if it is quasicompact, separated and universally closed: for every small v-sheaf X with a map X → Y, the map |Y′ ×_Y X| → |X| is closed. Since f is quasicompact, Y′ ×_Y X is a small v-sheaf for small X, and it suffices to test universal closedness on perfectoid X, or even on strictly totally disconnected perfectoid X.

Construction and proof:

1. Quasicompact, separated and the underlying space |−| of a small v-sheaf are DiamondsAndVStacks notions (D3, D4).
2. The reduction of the test to strictly totally disconnected X uses that |X| carries the quotient topology from any v-cover by perfectoid spaces (D4) and that such covers can be refined by strictly totally disconnected ones (D1).

Used by:

- ECD Theorem 19.2: proper base change is stated for proper f
- DiamondSixOperations:S0: compactifiable maps are open immersions followed by proper maps
- VectorBundlesAndIsocrystals:VB3: properness of projectivized Banach–Colmez spaces
- DiamondSixOperations:S1: Rf_! = Rf∗ for proper f

API:

| name | role | statement |
|---|---|---|
| `IsProper` | constructor | The predicate on maps of v-stacks: quasicompact ∧ separated ∧ universally closed. |
| `IsProper.iff_std` | characterisation | f is proper iff it is quasicompact and separated and \|Y′ ×_Y X\| → \|X\| is closed for every strictly totally disconnected perfectoid X → Y. |
| `IsProper.comp` | functoriality | Composites of proper maps are proper. |
| `IsProper.baseChange` | functoriality | Proper maps are stable under arbitrary base change of v-stacks. |
| `IsProper.of_comp` | functoriality | If g ∘ f is proper and g is separated, then f is proper. |
| `IsProper.iff_valuative` | characterisation | f is proper iff 0-truncated, qcqs and the (K, K⁺) valuative criterion holds (node valuative-criterion-proper). |
| `IsProper.partiallyProper` | other | Proper maps are partially proper (node valuative-criterion-proper). |
| `IsProper.isClosedMap` | projection | For proper f between small v-sheaves, \|f\| : \|Y′\| → \|Y\| is closed. |
| `IsUniversallyClosed` | constructor | f : Y′ → Y is universally closed if for every small v-sheaf X → Y, \|Y′ ×_Y X\| → \|X\| is closed; it suffices to test strictly totally disconnected X. |
| `IsProper.iff` | characterisation | IsProper f ↔ f quasicompact ∧ separated ∧ IsUniversallyClosed f. |
| `IsUniversallyClosed.comp` | functoriality | Composites of universally closed maps are universally closed. |
| `IsUniversallyClosed.baseChange` | functoriality | Universally closed maps are stable under base change. |
| `IsProper.surjective_of_surjective_points` | other | A proper (indeed quasicompact) map f of small v-stacks with \|f\| surjective is a surjection of v-stacks (ECD Lemma 12.11, D4); a map Spa(C, C⁺) → Y lifts after replacing C by an extension, not necessarily over the same C. |

Unit tests:

- `isProper_id` (degenerate): The identity of a v-stack is proper.
- `isProper_closedImmersion` (computation): A closed immersion of v-sheaves is proper (node closed-immersion-proper).
- `isProper_topological` (compatibility): For a map of locally compact Hausdorff spaces T′ → T, the induced map of v-sheaves is proper iff T′ → T is a proper map (Mathlib IsProperMap), node locally-compact-hausdorff-proper.
- `isProper_open_not` (non-example): For C⁺ ⊊ O_C, the quasicompact injection Spa(C, O_C) → Spa(C, C⁺) (an open immersion when C⁺ has rank 2) is quasicompact and separated but not proper: its image is not closed.
- `isProper_openDisc_not` (non-example): The perfectoid open unit disc over Spa(C, O_C) is partially proper over Spa(C, O_C) but not quasicompact, hence not proper.
- `isUniversallyClosed_not_separated` (non-example): For a finite group G ≠ 1 acting trivially on X = Spa(C, O_C), [X/G] → X is quasicompact and universally closed (|[X/G] ×_X T| = |T|) but not 0-truncated, hence not separated and not proper; its valuative lifts exist but form the groupoid BG.

Acceptance:

- Universal closedness, separatedness, properness and partial properness are four distinct predicates; none is replaced by another.

Depends on: `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D1/universally-open-std-cover`, `mathlib:IsClosedMap`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`.

Sources:

- ECD, Definition 18.1, p. 101.
- ECD, after Definition 18.1, p. 101.

### `closed-immersion-proper` — Closed immersions are proper

Declaration `DiamondEtaleCohomology:C4/closed-immersion-proper` (lemma).

Every closed immersion of v-sheaves is proper.

Construction and proof:

1. A closed immersion is quasicompact and separated (a monomorphism) by D3, and its base change along X → Y is a closed immersion, whose image in |X| is closed (D3, D4).

Acceptance:

- Concrete instance: for X affinoid perfectoid and a Zariski closed Z ⊂ X, Z → X is proper.

Depends on: `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`, `DiamondEtaleCohomology:C4/proper-map`.

Sources:

- ECD, Remark 18.2, p. 101.

### `locally-compact-hausdorff-proper` — Properness for maps of locally compact Hausdorff spaces

Declaration `DiamondEtaleCohomology:C4/locally-compact-hausdorff-proper` (theorem).

Let T′ → T be a continuous map of locally compact Hausdorff spaces and T̲′ → T̲ the induced map of v-sheaves (X ↦ C(|X|, T)). Then T̲′ → T̲ is proper in the sense of Definition 18.1 if and only if T′ → T is proper in the usual sense (preimages of compact subsets are compact; equivalently universally closed).

Construction and proof:

1. T̲ is the filtered colimit of the compact Hausdorff v-sheaves K̲ over compact K ⊂ T along closed immersions, and |T̲| = T (DiamondsAndVStacks D4, compact Hausdorff spaces as diamonds); a map from a quasicompact |X| to T lands in some K.
2. Separatedness: T′ is Hausdorff, so the diagonal of T̲′ → T̲ is the v-sheaf of a closed subset of T′ ×_T T′, a closed immersion.
3. Quasicompactness: T̲′ ×_T̲ K̲ = (f^{−1}K)̲, which is quasicompact iff f^{−1}K is compact; so f quasicompact ⇔ preimages of compacta are compact.
4. Universal closedness: for perfectoid X → T̲, |T̲′ ×_T̲ X| = T′ ×_T |X| and the projection is closed when T′ → T is proper (proper maps of topological spaces are universally closed). Conversely proper ⇒ quasicompact ⇒ topologically proper.
5. The source leaves this to the reader (PAPER-SCHOLZE-17/411); the steps above supply it.

Acceptance:

- Concrete instance: for a profinite set S, S̲ → ∗ is proper, while Z̲ → ∗ (Z discrete, infinite) is partially proper but not proper.

Depends on: `DiamondEtaleCohomology:C4/proper-map`, `DiamondsAndVStacks:D4/compact-hausdorff-diamonds`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`, `DiamondsAndVStacks:D5`, `mathlib:IsProperMap`.

Sources:

- ECD, Remark 18.2, p. 101.

### `valuative-criterion-proper` — Valuative criterion of properness ★

Declaration `DiamondEtaleCohomology:C4/valuative-criterion-proper` (theorem).

A map f : Y′ → Y of v-stacks is proper if and only if it is 0-truncated, quasicompact and quasiseparated, and for every perfectoid field K with an open and bounded valuation subring K⁺ ⊂ K and every commutative square Spa(K, O_K) → Y′, Spa(K, K⁺) → Y there is a unique lift Spa(K, K⁺) → Y′. Moreover, if f is proper, then for every perfectoid Tate ring R with an open and integrally closed subring R⁺ ⊂ R°, every square Spa(R, R°) → Y′, Spa(R, R⁺) → Y has a unique lift Spa(R, R⁺) → Y′.

Construction and proof:

1. ⇐: separatedness from the valuative criterion of separatedness (ECD Proposition 10.9, D3). For closedness reduce to Y = X affinoid perfectoid and Y′ qcqs with an affinoid perfectoid cover X′ → Y′. The image W ⊂ |X| of a closed Z ⊂ |Y′| is pro-constructible (image under the spectral map |X′| → |X|); it is closed once specializing, and a specialization w ⇝ w′ with w ∈ W is realized by Spa(K, K⁺) → Spa(K, (K⁺)′) → X; the unique lift and density of Spa(K, K⁺) in Spa(K, (K⁺)′) put w′ in W.
2. ⇒ (the (R, R⁺) form, which contains the (K, K⁺) form): uniqueness by ECD Proposition 10.10 (D3). For existence replace Y by Spa(R, R⁺); Spa(R, R°) → Y′ is a quasicompact injection determined by its image (ECD 12.15, D4). Its closure Z in |Y′| pulls back to the closure of a pro-constructible generalizing subset of a totally disconnected cover (ECD Corollary 10.6, D3), so Z is a qcqs sub-v-sheaf; Z → Spa(R, R⁺) is injective (separated, and bijective on rank-one points) and surjective because |f| is universally closed and |Spa(R, R°)| is dense; hence an isomorphism by ECD Lemma 2.5 (D0) and 12.15, giving the lift.

Acceptance:

- Concrete instance: for C⁺ ⊊ O_C the quasicompact injection j : Spa(C, O_C) ⊂ Spa(C, C⁺) (an open immersion when C⁺ has rank 2) fails the criterion for K = C, K⁺ = C⁺: the square formed by the identities of Spa(C, O_C) and of Spa(C, C⁺) has no lift Spa(C, C⁺) → Spa(C, O_C), so j is not proper.

Depends on: `DiamondEtaleCohomology:C4/proper-map`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces`, `DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks`, `DiamondsAndVStacks:D0/generalizing-surjection-is-quotient`, `DiamondsAndVStacks:D0/closure-of-pro-constructible`, `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`, `DiamondsAndVStacks:D3`, `DiamondsAndVStacks:D5`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`.

Sources:

- ECD, Proposition 18.3, p. 101.

### `partially-proper-map` — Partially proper maps of v-stacks ★

Declaration `DiamondEtaleCohomology:C4/partially-proper-map` (definition).

A map f : Y′ → Y of v-stacks is partially proper if f is separated and, for every perfectoid Tate ring R with an open and integrally closed subring R⁺ ⊂ R° and every commutative square Spa(R, R°) → Y′, Spa(R, R⁺) → Y, there is a (necessarily unique) lift Spa(R, R⁺) → Y′. A v-stack Y is partially proper if Y → ∗ is partially proper. By the valuative criterion of separatedness (ECD 10.9), f is partially proper if and only if f is 0-truncated and quasiseparated and every such square has a unique lift. Existence of lifts alone does not suffice (DiamondEtaleCohomology/E5): two copies of Spa(C, C⁺) glued along a quasicompact open neighbourhood of the rank-one point give a 0-truncated, quasiseparated, non-separated map to Spa(C, C⁺) with lifts for all (R, R⁺).

Construction and proof:

1. Uniqueness of lifts is ECD Proposition 10.10 (D3) for separated f; the equivalent form uses ECD Proposition 10.9 (D3).
2. ECD does not define 'Y proper' for Y → ∗ (Remark 18.5): quasicompactness of Y and of Y → ∗ differ; partial properness has no such issue.

Used by:

- ECD Proposition 18.6: the canonical compactification is the universal partially proper envelope
- DiamondSixOperations:S0: compactifiable = open immersion followed by partially proper, with C4's factorization
- DiamondEtaleCohomology:C8/partially-proper-dimension: dimension of partially proper spaces

API:

| name | role | statement |
|---|---|---|
| `IsPartiallyProper` | constructor | The predicate on maps of v-stacks: separated and the (R, R⁺) lifting property, for perfectoid Tate R with open integrally closed R⁺ ⊂ R°. |
| `IsPartiallyProper.iff_qs` | characterisation | f is partially proper iff f is 0-truncated, quasiseparated, and every (R, R⁺)-square has a unique lift. |
| `IsPartiallyProper.comp` | functoriality | Composites of partially proper maps are partially proper. |
| `IsPartiallyProper.baseChange` | functoriality | Partially proper maps are stable under base change. |
| `IsPartiallyProper.of_isProper` | other | Proper maps are partially proper. |
| `isProper_iff_partiallyProper_qc` | characterisation | f is proper iff it is partially proper and quasicompact (node proper-iff-partially-proper-qc). |
| `IsPartiallyProperStack` | constructor | A v-stack Y is partially proper iff Y → ∗ is. |

Unit tests:

- `isPartiallyProper_id` (degenerate): Identities are partially proper.
- `isPartiallyProper_point_residue` (computation): For C algebraically closed, Spa(C, O_C) → ∗ is partially proper iff the residue field of C is algebraic over F_p (by node compactification-affinoid-formula, Spa(C, O_C)‾ = Spa(C, (O_C)′) with (O_C)′ the integral closure of F_p + m_C).
- `isPartiallyProper_openDisc` (computation): The perfectoid open unit disc over Spa(C, O_C) is partially proper over Spa(C, O_C).
- `isPartiallyProper_closedDisc_not` (non-example): The perfectoid closed unit disc Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩) over Spa(C, O_C) is quasicompact and separated but not partially proper: it misses the rank-two points at the boundary that its canonical compactification adds.
- `isPartiallyProper_glued_not` (non-example): For C⁺ ⊊ O_C, a ∈ O_C ∖ C⁺ and U = {|a| ≤ 1} ⊂ X = Spa(C, C⁺), the space Y′ obtained by gluing two copies of X along U maps to X by a 0-truncated quasiseparated map with lifts for all (R, R⁺)-squares, which is not partially proper: the (C, C⁺)-square at the rank-one point has two lifts, so Y′ → X is not separated.

Acceptance:

- Proper ⇔ partially proper and quasicompact (node proper-iff-partially-proper-qc); the canonical compactification of any separated map is partially proper.

Depends on: `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `PerfectoidSpaces:P4/separated-unique-extension-from-rank-one-locus`, `DiamondsAndVStacks:D3`.

Sources:

- ECD, Definition 18.4, p. 103.
- ECD, Remark 18.5, p. 103.

### `proper-iff-partially-proper-qc` — Proper is partially proper plus quasicompact

Declaration `DiamondEtaleCohomology:C4/proper-iff-partially-proper-qc` (lemma).

A map f : Y′ → Y of v-stacks is proper if and only if it is partially proper and quasicompact.

Construction and proof:

1. ⇒: the second part of the valuative criterion (node valuative-criterion-proper).
2. ⇐: partially proper gives 0-truncated and quasiseparated with lifts for all (R, R⁺), in particular for perfectoid fields (K, K⁺); with quasicompactness the first part of the valuative criterion applies.

Acceptance:

- Concrete instance: the perfectoid open unit disc over Spa(C, O_C) is partially proper but not quasicompact, hence not proper.

Depends on: `DiamondEtaleCohomology:C4/valuative-criterion-proper`, `DiamondEtaleCohomology:C4/partially-proper-map`.

Sources:

- ECD, Remark 18.5, p. 103.

### `proper-stability` — Stability of proper and partially proper maps

Declaration `DiamondEtaleCohomology:C4/proper-stability` (lemma).

Proper maps, and partially proper maps, of v-stacks are stable under composition and arbitrary base change; if g ∘ f is proper (resp. partially proper) and g is separated, then f is proper (resp. partially proper). In particular a fibre product of two proper maps to X is proper over X.

Construction and proof:

1. Quasicompactness, separatedness and the lifting properties are stable under composition and base change (D3); universal closedness is stable by definition. Cancellation: f factors as the graph Y′ → Y′ ×_Y″ Y (a closed immersion, g separated) followed by the base change of g ∘ f; use closed-immersion-proper.
2. ECD uses these facts without comment, e.g. in the proof of Theorem 19.2.

Acceptance:

- Concrete instance: for canonical compactifications X̄′^{/X} → X proper and a map X̄′^{/X} → Y′ over X with Y′ proper over X, the fibre product X̄′^{/X} ×_{Y′} X̄′^{/X} is proper over X.

Depends on: `DiamondEtaleCohomology:C4/proper-map`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/closed-immersion-proper`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`.

Sources:

- ECD, proof of Theorem 19.2, p. 109.

### `compactification-of-separated-sheaf` — The partially proper envelope Ȳ of a separated v-sheaf

Declaration `DiamondEtaleCohomology:C4/compactification-of-separated-sheaf` (construction).

For a separated v-sheaf Y, Ȳ is the v-sheaf with Ȳ(R, R⁺) = Y(R, R°) for totally disconnected Spa(R, R⁺); it comes with an injective map Y → Ȳ.

Construction and proof:

1. The sheaf property is checked as for the relative construction (node canonical-compactification): if Spa(S, S⁺) → Spa(R, R⁺) is a v-cover of totally disconnected spaces, so is Spa(S, S°) → Spa(R, R°), since Spa(R, R°) is the minimal pro-constructible generalizing subset containing all rank-one points: by ECD Lemma 7.6 (D1) a pro-constructible generalizing U ⊂ Spa(R, R⁺) is ∩_{f∈F}{|f| ≤ 1}; if U contains all rank-one points each f ∈ F is power-bounded because R is uniform, so U ⊇ Spa(R, R°). Separatedness of Y gives the descent.
2. Injectivity of Y → Ȳ is ECD Proposition 10.10 (D3).

Used by:

- ECD Proposition 18.7: properties of the envelope
- ECD Corollary 18.8: relative compactification by base change from Ȳ′ ×_Ȳ Y
- ECD Theorem 19.2, proof: canonical compactifications of strictly totally disconnected spaces are affinoid perfectoid

API:

| name | role | statement |
|---|---|---|
| `cpt` | constructor | The v-sheaf Ȳ with Ȳ(R, R⁺) = Y(R, R°) on totally disconnected Spa(R, R⁺). |
| `toCpt` | data | The injection Y → Ȳ. |
| `cpt.map` | functoriality | A map Y′ → Y of separated v-sheaves induces Ȳ′ → Ȳ, functorially. |
| `cpt.affinoid` | simp | For Y = Spa(R, R⁺) affinoid perfectoid, Ȳ = Spa(R, (R⁺)′) (node compactification-affinoid-formula). |
| `cpt.lift` | universal-property | Every map from Y to a partially proper v-sheaf extends uniquely along Y → Ȳ (from nodes compactification-partially-proper and canonical-compactification-universal). |

Unit tests:

- `cpt_affinoid` (computation): For Y = Spa(R, R⁺), Ȳ = Spa(R, (R⁺)′) with (R⁺)′ the integral closure of F_p + R°°.
- `cpt_of_partiallyProper` (degenerate): If Y is partially proper (over ∗), Y → Ȳ is an isomorphism.
- `cpt_point` (computation): For C algebraically closed with residue field not algebraic over F_p, Spa(C, O_C)‾ = Spa(C, (O_C)′) ≠ Spa(C, O_C).
- `cpt_spatial_not_claimed` (characterisation): For a separated diamond Y, Ȳ is a diamond (node compactification-small-diamond); for a spatial diamond Y, Ȳ is quasicompact and quasiseparated and Y → Ȳ is a quasicompact injection. Whether Ȳ is spatial is open (ECD p. 130) and is not asserted.
- `cpt_point_not_open` (non-example): For C algebraically closed with residue field k transcendental over F_p, Spa(C, O_C) → Spa(C, (O_C)′) is a quasicompact injection whose image, the rank-one point, is not open (any finitely many elements of k lie in a proper valuation ring of k containing the algebraic closure of F_p in k); so Y → Ȳ is not an open immersion in general.

Acceptance:

- For Y = Spa(R, R⁺) affinoid perfectoid, Ȳ = Spa(R, (R⁺)′) with (R⁺)′ the integral closure of F_p + R°° (node compactification-affinoid-formula).

Depends on: `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `PerfectoidSpaces:P4/separated-unique-extension-from-rank-one-locus`, `DiamondsAndVStacks:D3`.

Sources:

- ECD, after Proposition 18.6, p. 104.

### `compactification-affinoid-formula` — The envelope of an affinoid perfectoid space

Declaration `DiamondEtaleCohomology:C4/compactification-affinoid-formula` (theorem).

If Y = Spa(R, R⁺) is an affinoid perfectoid space, then Ȳ = Spa(R, (R⁺)′), where (R⁺)′ ⊂ R⁺ is the smallest open and integrally closed subring of R, namely the integral closure of F_p + R°°. Relative form: for a map Spa(R, R⁺) → X = Spa(A, A⁺) of affinoid perfectoid spaces (in particular for X strictly totally disconnected), the canonical compactification is Spa(R, R⁺_X), where R⁺_X is the integral closure in R of (the image of A⁺) + R°°; it is affinoid perfectoid. For X = Spa(C, C⁺) and X′ = Spa(C′, C′⁺) with C algebraically closed, R⁺_X = C⁺ + C′°°.

Construction and proof:

1. Hom((R, (R⁺)′), (S, S⁺)) = Hom(R, S) = Hom((R, R⁺), (S, S°)) for every pair (S, S⁺): a continuous map R → S carries R°° into S°° ⊂ S⁺ and F_p + R°° into S⁺, hence its integral closure too.
2. Relative form: Ȳ′^{/Y} = Ȳ′ ×_Ȳ Y (node canonical-compactification); Spa(A, A⁺) ⊂ Spa(A, (A⁺)′) is the pro-constructible generalizing subset {|a| ≤ 1 : a ∈ A⁺}, so its preimage in Spa(R, (R⁺)′) is {|a| ≤ 1 : a ∈ image of A⁺} = Spa(R, R⁺_X) (ECD Lemma 7.6, D1). C⁺ + C′°° is integrally closed when the residue field of C is algebraically closed (hence integrally closed in that of C′).

Acceptance:

- Concrete instance used in ECD 19.2: for Spa(C′, C′⁺) over Spa(C, C⁺), the relative compactification is Spa(C′, C′°° + C⁺) (C algebraically closed).

Depends on: `DiamondEtaleCohomology:C4/compactification-of-separated-sheaf`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`.

Sources:

- ECD, Proposition 18.7(iv), p. 104.
- ECD, proof of Proposition 18.7, p. 105.

### `compactification-limits-surjectivity` — The envelope commutes with limits and preserves surjections

Declaration `DiamondEtaleCohomology:C4/compactification-limits-surjectivity` (theorem).

Let Y be a separated v-sheaf. The functor Y ↦ Ȳ commutes with all limits, and if f : Y′ → Y is a surjective map of separated v-sheaves, then f̄ : Ȳ′ → Ȳ is a surjective map of v-sheaves.

Construction and proof:

1. Limits: clear from the definition Ȳ(R, R⁺) = Y(R, R°).
2. Surjectivity: a map X = Spa(R, R⁺) → Ȳ from a totally disconnected space is a map Spa(R, R°) → Y, which lifts to Y′ after a v-cover of X (using that v-covers of Spa(R, R⁺) restrict to v-covers of Spa(R, R°)); the lift is a map X → Ȳ′.
3. Refinement step: given an affinoid v-cover Spa(T, T⁺) → Spa(R, R°) over which the lift exists, Spa(T, T⁺_X) → Spa(R, R⁺), with T⁺_X the integral closure of (image of R⁺) + T°°, is a v-cover (each point of Spa(R, R⁺) specializes a rank-one point lifting to Spa(T, T°), and valuation rings of residue fields extend), and its restriction to Spa(T, T°) refines the given cover.

Acceptance:

- Concrete instance: for a surjection X′ → X of affinoid perfectoid spaces, Spa(R′, (R′⁺)′) → Spa(R, (R⁺)′) is surjective.

Depends on: `DiamondEtaleCohomology:C4/compactification-of-separated-sheaf`, `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`.

Sources:

- ECD, Proposition 18.7(v),(vi), p. 104.
- ECD, proof of Proposition 18.7, p. 105.

### `compactification-partially-proper` — The envelope is partially proper, and envelopes of quasicompact maps are proper

Declaration `DiamondEtaleCohomology:C4/compactification-partially-proper` (theorem).

Let Y be a separated v-sheaf. Then Ȳ is partially proper, and if f : Y′ → Y is a quasicompact map of separated v-sheaves, then f̄ : Ȳ′ → Ȳ is proper.

Construction and proof:

1. Quasiseparatedness of Ȳ → ∗: with Z = Spa(F_p((t^{1/p^∞}))) (so Z̄ = Z) and affinoid perfectoid X_1, X_2 → Ȳ × Z, write X_1 ×_{Ȳ×Z} X_2 = X_1 ×_{X̄_1} (X̄_1 ×_{Ȳ×Z} X̄_2) ×_{X̄_2} X_2 using limits (node compactification-limits-surjectivity), with X_i → X̄_i quasicompact by the affinoid formula and X̄_1 ×_{Ȳ×Z} X̄_2 quasicompact by surjectivity and quasiseparatedness of Y.
2. The lifting property holds with unique lifts by construction (Ȳ(R, R⁺) = Y(R, R°)) on totally disconnected Spa(R, R⁺), hence in general by v-descent; 0-truncatedness is clear. Uniqueness is what makes the appeal to ECD 10.9 valid (DiamondEtaleCohomology/E5).
3. For quasicompact f, f̄ is partially proper (source partially proper, target separated) and quasicompact by the affinoid formula, limits and surjectivity, so proper (node proper-iff-partially-proper-qc).

Acceptance:

- Concrete instance: for affinoid perfectoid Y = Spa(R, R⁺), Spa(R, (R⁺)′) is partially proper over ∗, and the map to it from a quasicompact Y′ = Spa(R′, R′⁺) over Y gives a proper map of envelopes.

Depends on: `DiamondEtaleCohomology:C4/compactification-affinoid-formula`, `DiamondEtaleCohomology:C4/compactification-limits-surjectivity`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-iff-partially-proper-qc`, `DiamondEtaleCohomology:C4/proper-stability`.

Sources:

- ECD, Proposition 18.7(i), p. 104.
- ECD, Proposition 18.7(vii), p. 105.

### `compactification-small-diamond` — The envelope of a small v-sheaf, of a diamond and of a quasi-pro-étale map

Declaration `DiamondEtaleCohomology:C4/compactification-small-diamond` (theorem).

Let Y be a separated v-sheaf. If Y is a small v-sheaf, so is Ȳ; if Y is a diamond, so is Ȳ; and if f : Y′ → Y is a quasi-pro-étale map of separated v-sheaves, then f̄ : Ȳ′ → Ȳ is quasi-pro-étale. Spatiality is not asserted.

Construction and proof:

1. Small: from the affinoid formula and surjectivity (a surjection from a perfectoid space gives one from its envelope).
2. Quasi-pro-étale: for strictly totally disconnected X = Spa(R, R⁺) → Ȳ with X° = Spa(R, R°), let Z = Y′ ×_Y X° → X° → X; by ECD Corollary 7.22 (D1) Z → X factors canonically through X ×_{π0 X} π0 Z, and Ȳ′ ×_Ȳ X = Z̄^{/X} = X ×_{π0 X} π0 Z is quasi-pro-étale over X.
3. Diamond: from the affinoid formula, surjectivity and quasi-pro-étaleness (a quasi-pro-étale surjection from a perfectoid space characterizes diamonds, D4).

Acceptance:

- The canonical compactification of a spatial morphism is not asserted to be spatial (stage text of C4).

Depends on: `DiamondEtaleCohomology:C4/compactification-affinoid-formula`, `DiamondEtaleCohomology:C4/compactification-limits-surjectivity`, `DiamondsAndVStacks:D1/topological-classification-of-pro-etale-maps`, `DiamondsAndVStacks:D4/atlas-characterisation-of-diamonds`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`.

Sources:

- ECD, Proposition 18.7(ii),(iii), p. 104.
- ECD, proof of Proposition 18.7, p. 105.

### `canonical-compactification` — The canonical compactification of a separated map of v-stacks ★

Declaration `DiamondEtaleCohomology:C4/canonical-compactification` (construction).

Let f : Y′ → Y be a separated map of v-stacks. The functor on totally disconnected perfectoid spaces X = Spa(R, R⁺) over Y, X ↦ Y′(R, R°) ×_{Y(R,R°)} Y(R, R⁺), extends to a v-stack Ȳ′^{/Y} with a map f̄^{/Y} : Ȳ′^{/Y} → Y and a natural map Y′ → Ȳ′^{/Y} over Y. Its formation is functorial in f and commutes with base change in Y; for separated Y, Ȳ′^{/Y} = Ȳ′ ×_Ȳ Y.

Construction and proof:

1. If Spa(S, S⁺) → Spa(R, R⁺) is a v-cover of totally disconnected spaces, so is Spa(S, S°) → Spa(R, R°) (ECD Lemma 7.6, D1).
2. Work locally on Y (Y representable), so Ȳ′^{/Y} is a presheaf of sets; injectivity of restriction along the cover follows from the v-cover of rank-one loci, and descent of a compatible section reduces, by separatedness of Y′ → Y and ECD Proposition 10.10 (D3), to agreement on Spa(T, T°) and Spa(T, (T⁺)′).
3. Functoriality and base change are clear from the formula; the formula Ȳ′ ×_Ȳ Y for separated Y compares values on totally disconnected test objects.

Used by:

- ECD Theorem 19.2, proof: proper hypercovers by canonical compactifications of strictly totally disconnected spaces
- DiamondSixOperations:S0: f is compactifiable iff Y′ → Ȳ′^{/Y} is an open immersion; S0 imports this construction
- DiamondSixOperations:S1: Rf_! = Rf̄∗ j_! and the 3 dim.trg bound for canonical compactifications
- DiamondsAndVStacks:D3: ECD Lemma 9.9 is a special case

API:

| name | role | statement |
|---|---|---|
| `canonicalCompactification` | constructor | The v-stack Ȳ′^{/Y} over Y attached to a separated f : Y′ → Y. |
| `canonicalCompactification.toCpt` | data | The map Y′ → Ȳ′^{/Y} over Y. |
| `canonicalCompactification.fac` | simp | f̄^{/Y} ∘ (Y′ → Ȳ′^{/Y}) = f. |
| `canonicalCompactification.partiallyProper` | other | f̄^{/Y} is partially proper (node canonical-compactification-universal). |
| `canonicalCompactification.lift` | universal-property | For partially proper g : Z → Y, every Y-map Y′ → Z extends uniquely to Ȳ′^{/Y} → Z. |
| `canonicalCompactification.baseChange` | functoriality | For Ỹ → Y, the canonical compactification of Y′ ×_Y Ỹ → Ỹ is Ȳ′^{/Y} ×_Y Ỹ. |
| `canonicalCompactification.map` | functoriality | A map Y′_2 → Y′_1 of separated Y-stacks induces Ȳ′_2^{/Y} → Ȳ′_1^{/Y}, functorially. |
| `canonicalCompactification.of_partiallyProper` | simp | If f is partially proper then Y′ → Ȳ′^{/Y} is an isomorphism. |
| `cpt.relative_eq` | characterisation | Ȳ′^{/Y} = Ȳ′ ×_Ȳ Y for a map Y′ → Y of separated v-sheaves (ECD p. 104). |
| `canonicalCompactification.toCpt_injective` | other | Y′ → Ȳ′^{/Y} is an injection of v-stacks over Y (ECD 10.10); it is not in general an open immersion (test cpt_point_not_open). |

Unit tests:

- `canonicalCompactification_id` (degenerate): For f = id_Y, Ȳ^{/Y} = Y.
- `canonicalCompactification_field` (computation): For X = Spa(C, C⁺) with C algebraically closed and connected strictly totally disconnected X′ = Spa(C′, C′⁺) over X, X̄′^{/X} = Spa(C′, C⁺ + C′°°).
- `canonicalCompactification_affinoid` (computation): For X′ = Spa(R, R⁺) over X = Spa(A, A⁺) affinoid perfectoid, X̄′^{/X} = Spa(R, R⁺_X) with R⁺_X the integral closure of the image of A⁺ plus R°°.
- `canonicalCompactification_closedDisc` (non-example): For the perfectoid closed unit disc D over Spa(C, O_C), D → D̄^{/Spa(C,O_C)} is not an isomorphism (D is not partially proper), though it is an open immersion; the same map need not be an open immersion for general separated f.

Acceptance:

- The natural map Y′ → Ȳ′^{/Y} is not assumed to be an open immersion; 'compactifiable' is a separate predicate of DiamondSixOperations:S0.

Depends on: `DiamondEtaleCohomology:C4/compactification-of-separated-sheaf`, `DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D3`.

Sources:

- ECD, Proposition 18.6, p. 103.
- ECD, after Proposition 18.6, p. 103.

### `canonical-compactification-universal` — Partial properness and universal property of the canonical compactification

Declaration `DiamondEtaleCohomology:C4/canonical-compactification-universal` (theorem).

In the situation of node canonical-compactification, f̄^{/Y} : Ȳ′^{/Y} → Y is partially proper, and for every partially proper map g : Z → Y of v-stacks, composition with Y′ → Ȳ′^{/Y} induces a bijection Hom_Y(Ȳ′^{/Y}, Z) → Hom_Y(Y′, Z).

Construction and proof:

1. Partial properness is v-local on Y, so assume Y affinoid perfectoid, hence separated; then Ȳ′^{/Y} = Ȳ′ ×_Ȳ Y and the claim follows from partial properness of Ȳ′ (node compactification-partially-proper) and of Ȳ′ → Ȳ.
2. The universal property follows from the definition of partially proper maps: on totally disconnected test objects a Y-map Y′ → Z extends uniquely from Spa(R, R°) to Spa(R, R⁺).

Acceptance:

- Concrete instance: for X′ = Spa(C′, C′⁺) over X = Spa(C, C⁺), every map from X′ to a partially proper X-space extends uniquely to Spa(C′, C′°° + C⁺).

Depends on: `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/compactification-partially-proper`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/proper-stability`.

Sources:

- ECD, Proposition 18.6, p. 103.
- ECD, proof of Proposition 18.6, p. 104.

### `relative-compactification-properties` — Properties of the relative canonical compactification

Declaration `DiamondEtaleCohomology:C4/relative-compactification-properties` (theorem).

Let Y′ → Y be a separated map of v-stacks. (i) Ȳ′^{/Y} → Y is partially proper. (ii) If Y and Y′ are small v-stacks, Ȳ′^{/Y} is a small v-stack. (iii) If Y and Y′ are diamonds, Ȳ′^{/Y} is a diamond. (iv) Y′ ↦ Ȳ′^{/Y}, from v-sheaves over Y to v-sheaves over Y, commutes with all limits. (v) If f : Y′_2 → Y′_1 is a surjective map of separated v-stacks over Y, then f̄^{/Y} is surjective. (vi) If f : Y′_2 → Y′_1 is a quasicompact map of separated v-stacks over Y, then f̄^{/Y} : Ȳ′_2^{/Y} → Ȳ′_1^{/Y} is proper. (vii) If f : Y′_2 → Y′_1 is a quasi-pro-étale map of separated v-stacks over Y, then f̄^{/Y} is quasi-pro-étale.

Construction and proof:

1. If Y is separated, Ȳ′^{/Y} = Ȳ′ ×_Ȳ Y and everything follows from the properties of the envelope (nodes compactification-partially-proper, compactification-small-diamond, compactification-limits-surjectivity).
2. In general the formation commutes with base change in Y, so all properties reduce to affinoid perfectoid Y.

Acceptance:

- Part (vi) is what ECD Theorem 19.2's proof uses: X̄′^{/X} → X is proper for strictly totally disconnected X′ → X.

Depends on: `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/compactification-partially-proper`, `DiamondEtaleCohomology:C4/compactification-small-diamond`, `DiamondEtaleCohomology:C4/compactification-limits-surjectivity`, `DiamondEtaleCohomology:C4/proper-stability`.

Sources:

- ECD, Corollary 18.8, p. 105.
- ECD, proof of Corollary 18.8, p. 106.

### `proper-image-closed` — Images of proper maps in separated targets

Declaration `DiamondEtaleCohomology:C4/proper-image-closed` (lemma).

Let f : Y′ → Y be a separated map of v-sheaves. If Z → Y is a proper map of v-sheaves and Z → Y′ is a map over Y, then the sheaf-theoretic image Z′ of Z in Y′ is proper over Y and closed in Y′.

Construction and proof:

1. Z′ is separated as a subsheaf of Y′ and quasicompact as a quotient of Z; the valuative criterion for Z′ follows from that of Z.
2. Closedness: Z′ is the image of the graph of Z → Y′, a closed subset of Z ×_Y Y′, under the projection to Y′, which is closed by properness of Z → Y.

Acceptance:

- Used by VectorBundlesAndIsocrystals:VB3: a proper map f of small v-sheaves with |f| surjective is a surjection of v-sheaves (C4/proper-map API IsProper.surjective_of_surjective_points, ECD 12.11), so every map Spa(C, C⁺) → Y lifts after replacing C by an extension; it need not lift over the same C (X̄′^{/X} → Spa(C, O_C) for C ⊊ C′).

Depends on: `DiamondEtaleCohomology:C4/valuative-criterion-proper`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`.

Sources:

- ECD, proof of Proposition 18.9, p. 106.

### `partially-proper-colimit` — Partially proper maps of v-sheaves are filtered colimits of proper ones

Declaration `DiamondEtaleCohomology:C4/partially-proper-colimit` (theorem).

Let f : Y′ → Y be a map of v-sheaves. If f is a (possibly large) filtered colimit of proper maps f_i : Y′_i → Y along closed immersions Y′_i → Y′_j, then f is partially proper. Conversely, if Y is quasiseparated (for example spatial, or affinoid perfectoid) and f is partially proper, then f is such a colimit, namely of all closed sub-v-sheaves of Y′ proper over Y; if Y′ is small the colimit can be taken small. The quasiseparatedness hypothesis cannot be dropped (DiamondEtaleCohomology/E4): for C the completed algebraic closure of F_p((t)), Spa(C, O_C) → ∗ is partially proper but not quasicompact, and its only closed sub-v-sheaves are ∅ and itself.

Hypotheses:

- Y quasiseparated for the direction ⇒ (ECD states 18.9 for all v-sheaves Y; the printed proof needs Z → Y quasicompact for affinoid Z).

Construction and proof:

1. ⇐: from the valuative criterion (node valuative-criterion-proper): lifts exist on some Y′_i since Spa(R, R⁺) is quasicompact. f is separated: a map from a totally disconnected X to Y′ ×_Y Y′ factors through some Y′_i ×_Y Y′_i, where the diagonal is that of the proper Y′_i → Y.
2. ⇒: consider all closed sub-v-sheaves of Y′ proper over Y. By node proper-image-closed the image of Y′_1 ⊔ Y′_2 is another one, so the category is filtered; for affinoid perfectoid Z → Y′, Z → Y is quasicompact because Y is quasiseparated, so Z̄^{/Y} is proper over Y (node relative-compactification-properties(vi)) and Z → Y′ factors through the image of Z̄^{/Y} → Y′, a closed sub-v-sheaf proper over Y, so Y′ is the colimit.

Acceptance:

- Concrete instance: the perfectoid open unit disc over Spa(C, O_C) is the increasing union of closed discs of radius |ϖ|^{1/n}, each with its canonical compactification proper over Spa(C, O_C).
- Non-example for the hypothesis on Y: Spa(C, O_C) → ∗ (C the completed algebraic closure of F_p((t))) is partially proper (test isPartiallyProper_point_residue) and not quasicompact (Spa(C, O_C) ×_∗ Spa(C, O_C) surjects onto a perfectoid punctured open disc), so it is not a filtered colimit of proper maps along closed immersions.

Depends on: `DiamondEtaleCohomology:C4/valuative-criterion-proper`, `DiamondEtaleCohomology:C4/proper-image-closed`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`.

Sources:

- ECD, Proposition 18.9, p. 106.

### `tautness-criterion` — Partial properness through tautness for locally spatial sources ★

Declaration `DiamondEtaleCohomology:C4/tautness-criterion` (theorem).

Let f : Y′ → Y be a map from a locally spatial v-sheaf Y′ to a spatial v-sheaf Y. Then f is partially proper if and only if |Y′| is taut (quasiseparated, with quasicompact closures of quasicompact opens) and for every perfectoid field K with open bounded valuation subring K⁺ and every square Spa(K, O_K) → Y′, Spa(K, K⁺) → Y there is a unique lift Spa(K, K⁺) → Y′.

Construction and proof:

1. ⇒: for quasicompact open U ⊂ Y′ choose Spa(S, S⁺) → Y surjective and Spa(R, R⁺) → U ×_Y Spa(S, S⁺) surjective, and let (R⁺)′ be the smallest open integrally closed subring containing the image of S⁺; partial properness gives Spa(R, (R⁺)′) → Y′ ×_Y Spa(S, S⁺), whose image in |Y′| is Ū (Ū is the set of specializations of points of U), hence Ū is quasicompact. The printed 'Spa(R⁺, (R⁺)′)' is a misprint for Spa(R, (R⁺)′) (PAPER-SCHOLZE-17/E58).
2. ⇐: write |Y′| as an increasing union of quasicompact opens U_i; the closures Ū_i are quasicompact closed generalizing subsets, corresponding to spatial sub-v-sheaves Y′_i (DiamondsAndVStacks D5) satisfying the (K, K⁺) criterion, so Y′_i → Y is proper (valuative criterion; the printed 'Y′_i → Y′' is a misprint, PAPER-SCHOLZE-17/E59), and Proposition 18.9 applies.

Acceptance:

- Consumer instance (VectorBundlesAndIsocrystals:VB3): taut partial properness of projectivized Banach–Colmez spaces over a spatial base.

Depends on: `DiamondEtaleCohomology:C4/partially-proper-colimit`, `DiamondEtaleCohomology:C4/valuative-criterion-proper`, `ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms`, `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D5/injection-and-finite-etale-permanence`, `DiamondsAndVStacks:D0/closure-of-pro-constructible`, `DiamondsAndVStacks:D5`.

Sources:

- ECD, Proposition 18.10, p. 106.
- ECD, after Proposition 18.10, p. 107.

## C5. Extension by zero and proper base change

For an étale map f, f^∗ on D_ét has an exact left adjoint f_! satisfying base change (19.1), built first on perfectoid sites and then by hyperdescent; for open immersions it is extension by zero and gives the open-support triangle. For f proper and j an open immersion, the exchange map j_!Rg∗ → Rf∗j′_! is an isomorphism on D⁺ when f is quasi-pro-étale or the coefficients are prime-to-p torsion, and on all of D_ét under finite cohomological dimension with the same hypotheses (19.2). The proof reduces to a geometric point, covers a proper space by canonical compactifications of strictly totally disconnected spaces, identifies their étale topoi with Zariski–Riemann spaces, and concludes with the acyclicity Lemma 19.4.

Other roadmaps: ClassicalAdicEtaleCohomology H1:henselian (Huber's Lemmas 2.1 and 2.4), H1:valuation-exports (proper schemes over strictly henselian valuation rings), SchemeAndStackFoundations SF.2 (proper base change, étale topos of a limit; requested), DiamondsAndVStacks D1, PerfectoidSpaces P6, EnhancedDerivedSheaves E2–E3.

Coverage: planned. Remaining: Receive the SchemeAndStackFoundations:SF.2 contracts (étale topos of a limit of schemes; proper base change) behind Lemma 19.4. Lemma-level refinement of the hypercover and Leray steps in the proof of Theorem 19.2.

Planets: **Extension by zero f_!** (`etale-extension-by-zero`); **Zariski–Riemann acyclicity** (`zariski-riemann-acyclicity`); **Proper base change** (`proper-base-change-bounded`).

### `etale-extension-by-zero` — Extension by zero f_! along étale maps ★

Declaration `DiamondEtaleCohomology:C5/etale-extension-by-zero` (construction).

Let f : Y′ → Y be an étale morphism of small v-stacks. Then f^∗ : D_ét(Y, Λ) → D_ét(Y′, Λ) has a left adjoint Rf_! : D_ét(Y′, Λ) → D_ét(Y, Λ). It commutes with canonical truncations, so it is written f_! and is t-exact. If Y is a perfectoid space, f_! is induced by the exact left adjoint of f^∗ on Y_ét (the slice (Y_ét)_{/Y′}), and it commutes with base change along maps of perfectoid spaces.

Construction and proof:

1. Perfectoid case: if Y is perfectoid, so is Y′, and Y′_ét is a slice of Y_ét, so f^∗ on étale sheaves has an exact left adjoint f_! (the sheaf represented by Z → Y′ goes to the sheaf represented by Z → Y′ → Y). It induces a left adjoint on derived categories commuting with truncations, hence on left completions.
2. Perfectoid base change: all functors commute with truncations, so reduce to étale sheaves; all functors are defined on sheaves of sets with the adjunction and commute with colimits, so reduce to representable sheaves of étale Z → Y′, where f_! is represented by Z → Y, visibly compatible with base change; then Λ-linearise (Λ[h_Z]).
3. General Y: choose a simplicial v-hypercover Y_• → Y by strictly totally disconnected spaces and pull back f to f_• : Y′_• → Y_•. Hyperdescent identifies D_ét(Y, Λ) ≃ D_cart(Y_•,ét, Λ) and D_ét(Y′, Λ) ≃ D_cart(Y′_•,ét, Λ) (C2); the degreewise left adjoint Rf_•! preserves cartesian objects by the perfectoid base change of the previous step, giving Rf_!. The identifications use hyperdescent (C2/v-hyperdescent) and testing on one cover (C2/etale-test-on-one-cover), since the Y′_i are étale over strictly totally disconnected Y_i but need not be disjoint unions of strictly totally disconnected spaces; the left adjoint on left completions uses C2/left-completion-comparison.

Used by:

- ECD Theorem 19.2: j_! enters the proper base change map
- DiamondEtaleCohomology:C9/etale-constant-compact: the generators j_!Λ for quasicompact separated étale j
- DiamondEtaleCohomology:C7: the filtration pieces j_!(L|_Z)
- DiamondSixOperations:S1: Rf_! = Rf̄∗ j_! for compactifiable f

API:

| name | role | statement |
|---|---|---|
| `etaleShriek` | constructor | For étale f : Y′ → Y, the exact functor f_! : D_ét(Y′, Λ) → D_ét(Y, Λ) with f_! ⊣ f^∗. |
| `etaleShriek.tExact` | other | f_! commutes with canonical truncations and with H^i. |
| `etaleShriek.comp` | functoriality | For étale g : Y″ → Y′ and f : Y′ → Y, (f ∘ g)_! ≅ f_! ∘ g_!, and (𝟙 Y)_! ≅ 𝟭. |
| `etaleShriek.sheaf` | characterisation | On sheaves over a perfectoid Y, f_! of the sheaf represented by Z → Y′ is the sheaf represented by Z → Y′ → Y. |
| `etaleShriek.projection` | relation | f_!(A ⊗^L f^∗B) ≅ f_!A ⊗^L B (projection formula), checked on a hypercover by strictly totally disconnected spaces where it is the projection formula for slices. |
| `etaleShriek.homAdj` | universal-property | RHom_Λ(f_!A, B) ≅ Rf∗RHom_Λ(A, f^∗B). |
| `etaleShriek.enhanced` | constructor | f_! : 𝒟_ét(Y′, Λ) → 𝒟_ét(Y, Λ), left adjoint of f^∗, obtained from the f_{i!} on a hypercover by Beck–Chevalley (EnhancedDerivedSheaves E3/mates-and-beck-chevalley); its homotopy-category functor is etaleShriek. |
| `etHom.pull_map_isIso` | other | For étale f, the natural map f^∗RHom_Λ(A, C) → RHom_Λ(f^∗A, f^∗C) of C3/internal-hom (etHom.pull_map) is an isomorphism, by the projection formula for f_!. |

Unit tests:

- `etaleShriek_id` (degenerate): For f = 𝟙 Y, f_! ≅ 𝟭.
- `etaleShriek_disjoint` (computation): For f : Y ⊔ Y → Y the fold map, f_!(A, B) = A ⊕ B.
- `etaleShriek_stalk` (compatibility): For an open immersion j : U ⊂ Y of locally spatial diamonds and a geometric point ȳ, (j_!A)_ȳ = A_ȳ if y ∈ |U| and 0 otherwise (classical extension by zero on Y_ét).
- `etaleShriek_finite_etale` (computation): For a finite étale map f of degree d over a geometric point Spa(C, O_C), f_!Λ = Λ^d.
- `etaleShriek_not_pushforward` (non-example): For C⁺ ≠ O_C of rank 2 and the open immersion j : Spa(C, O_C) ⊂ Spa(C, C⁺), j_!Λ has zero stalk at the closed point while Rj∗Λ has stalk Λ, so j_! ≠ Rj∗.

Acceptance:

- Available without the general exceptional pushforward Rf_! of DiamondSixOperations; for étale f the two agree (S1 lower-shriek-etale-agreement).

Depends on: `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C2/v-hyperdescent`, `DiamondEtaleCohomology:C2/etale-category-one-cutoff`, `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Sources:

- ECD, Definition/Proposition 19.1, p. 107.
- ECD, after Definition/Proposition 19.1, p. 107.

### `extension-by-zero-base-change` — Base change for extension by zero

Declaration `DiamondEtaleCohomology:C5/extension-by-zero-base-change` (theorem).

In the situation of node etale-extension-by-zero, for every map g : Ỹ → Y of small v-stacks with pullbacks f̃ : Ỹ′ = Y′ ×_Y Ỹ → Ỹ and g′ : Ỹ′ → Y′, the natural transformation Rf̃_!g′^∗ → g^∗Rf_! of functors D_ét(Y′, Λ) → D_ét(Ỹ, Λ), adjoint to g′^∗ → g′^∗f^∗Rf_! = f̃^∗g^∗Rf_!, is an equivalence. Consequently, passing to right adjoints, for an open immersion j : U ⊂ Y and any f : Y′ → Y with pullback g : U′ → U, j′ : U′ ⊂ Y′, the base change map j^∗Rf∗ → Rg∗j′^∗ is an isomorphism on all of D_ét(Y′, Λ).

Construction and proof:

1. For perfectoid spaces this is part of node etale-extension-by-zero (perfectoid base change).
2. General case: compatible by construction for pullback along the hypercover Y_0 → Y, which implies it for all g by descent.

Acceptance:

- Concrete instance: for an open immersion j : U ⊂ Y and a geometric point g : Spa(C, C⁺) → Y whose closed point maps outside |U|, RΓ(Spa(C, C⁺), g^∗j_!A) = 0; if moreover C⁺ = O_C, then U ×_Y Spa(C, O_C) = ∅ and g^∗j_!A = 0. (g^∗j_!A itself need not vanish: for Y = Spa(C, C⁺) of rank 2, U = {η} and g = id it is j_!A.)

Depends on: `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C3/pullback`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Sources:

- ECD, Definition/Proposition 19.1, p. 107.
- ECD, proof of Definition/Proposition 19.1, p. 108.

### `open-support-triangle` — Extension by zero along open immersions

Declaration `DiamondEtaleCohomology:C5/open-support-triangle` (lemma).

Let j : U ⊂ Y be an open immersion of small v-stacks. Then j^∗j_! ≅ 𝟭 on D_ét(U, Λ), so j_! is fully faithful; j_! is the classical extension by zero (its stalks vanish at points outside |U| for locally spatial Y); and for A ∈ D_ét(Y, Λ) the cone C of the counit j_!j^∗A → A satisfies j^∗C = 0. The complement |Y| ∖ |U| need not underlie a closed sub-v-sheaf.

Construction and proof:

1. j^∗j_! ≅ 𝟭 is base change (node extension-by-zero-base-change) along j itself, since U ×_Y U = U.
2. Stalks: on strictly totally disconnected X, j_! is extension by zero of sheaves on |X| along the open |U ×_Y X|.
3. Apply j^∗ to the triangle j_!j^∗A → A → C and use j^∗j_! ≅ 𝟭.

Acceptance:

- For Y = Spa(C, C⁺) of rank 2 and j the open generic point, j_!Λ → Λ → C has C with stalk Λ at s and 0 at η.

Depends on: `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C0/geometric-stalk`.

Sources:

- ECD, Remark 19.3, p. 108.
- ECD, proof of Theorem 19.5(ii), p. 112.

### `exchange-map` — The proper base change map j_!Rg∗ → Rf∗j′_!

Declaration `DiamondEtaleCohomology:C5/exchange-map` (construction).

Let f : Y′ → Y be a proper morphism of small v-stacks and j : U ⊂ Y an open immersion, with pullbacks g : U′ = U ×_Y Y′ → U and j′ : U′ ⊂ Y′. The natural transformation j_!Rg∗ → Rf∗j′_! : D_ét(U′, Λ) → D_ét(Y, Λ) is adjoint to f^∗j_!Rg∗ ≅ j′_!g^∗Rg∗ → j′_!, using base change for j_! and the counit of g^∗ ⊣ Rg∗. It is compatible with restriction along open immersions, and with base change in Y in the sense of a commuting square with the base-change maps for Rg∗ and Rf∗ (which are not isomorphisms in general).

Construction and proof:

1. Construct as stated (node extension-by-zero-base-change gives f^∗j_! ≅ j′_!g^∗). The printed 'U′ = V ×_Y Y′' is a misprint for U ×_Y Y′ (PAPER-SCHOLZE-17/E53).
2. Compatibility with base change in Y and with restriction follows by pasting of mates (EnhancedDerivedSheaves E3).

Used by:

- ECD Theorem 19.2: the map whose invertibility is proper base change
- DiamondSixOperations:S1: independence of Rf_! of the factorization uses this map

API:

| name | role | statement |
|---|---|---|
| `pbcMap` | constructor | The transformation j_! ∘ Rg∗ ⟶ Rf∗ ∘ j′_! for f proper and j an open immersion. |
| `pbcMap.adjoint` | characterisation | Its adjoint f^∗j_!Rg∗ → j′_! is j′_!(counit) composed with the base change isomorphism. |
| `pbcMap.restrict` | compatibility | Restricted to U (via j^∗) it is the identity of Rg∗ under j^∗j_! ≅ 𝟭 and base change for Rf∗ along j. |
| `pbcMap.baseChange` | functoriality | For h : Ỹ → Y with pulled-back data, the square formed by h^∗(pbcMap), the pbcMap of the pulled-back data, the base-change map h^∗Rg∗ → Rg̃∗h′^∗ (composed with j_! base change) and h^∗Rf∗ → Rf̃∗h″^∗ (composed with j′_! base change) commutes. |

Unit tests:

- `pbcMap_U_eq_Y` (degenerate): If U = Y, the transformation is the identity of Rf∗.
- `pbcMap_f_id` (degenerate): If f = id_Y, the transformation is the identity of j_!.
- `pbcMap_restrict_U` (characterisation): After applying j^∗ the transformation becomes the identity Rg∗ → Rg∗ (base change for Rf∗ along the open immersion j).
- `pbcMap_not_iso_nonproper` (non-example): For the non-proper open immersion f : Spa(C, O_C) ⊂ Spa(C, C⁺) (C⁺ ≠ O_C, rank 2) and j = f, the analogous transformation j_!Rg∗Λ = j_!Λ → Rf∗j′_!Λ = Rf∗Λ is not an isomorphism (stalks at the closed point 0 and Λ).

Acceptance:

- If U = Y or f = id the map is the identity; its restriction to U is the identity of Rg∗.

Depends on: `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C4/proper-map`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Sources:

- ECD, Theorem 19.2, p. 108.
- ECD, proof of Theorem 19.2, p. 109.

### `compactification-hypercover` — Hypercovers of proper maps by compactified strictly totally disconnected spaces

Declaration `DiamondEtaleCohomology:C5/compactification-hypercover` (lemma).

Let X = Spa(C, C⁺) be a geometric point (or any strictly totally disconnected space) and Y′ → X proper. There is a v-hypercover Y′_• → Y′ in which each Y′_i is the canonical compactification X̄′_i^{/X} of a strictly totally disconnected X′_i → X; each Y′_i is an affinoid perfectoid space proper over X, and RΓ(Y′, B) = R lim_{[i]∈Δ} RΓ(Y′_i, B) for B ∈ D_ét(Y′, Λ).

Construction and proof:

1. For a strictly totally disconnected X′ → Y′ surjective, X̄′^{/X} is proper over X (C4/relative-compactification-properties(vi)) and equals X̄′ ×_X̄ X, affinoid perfectoid by the affinoid formula; the map extends uniquely to X̄′^{/X} → Y′ (universal property, Y′ partially proper over X).
2. Fibre products X̄′^{/X} ×_{Y′} X̄′^{/X} are again proper over X; iterate to build the hypercover.
3. Unbounded cohomological descent in the replete topos (C2/v-hyperdescent) gives the limit formula.

Acceptance:

- Each term Y′_i of the hypercover is affinoid perfectoid and proper over X, and its connected components are of the form Spa(C′, C′°° + C⁺).

Depends on: `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondEtaleCohomology:C4/compactification-affinoid-formula`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/proper-stability`, `DiamondEtaleCohomology:C2/v-hyperdescent`, `EnhancedDerivedSheaves:E2`.

Sources:

- ECD, proof of Theorem 19.2, p. 109.

### `compactified-field-point-topos` — The étale topos of a compactified geometric point is a Zariski–Riemann topos

Declaration `DiamondEtaleCohomology:C5/compactified-field-point-topos` (lemma).

Let X = Spa(C, C⁺) and X′ = Spa(C′, C′⁺) be connected strictly totally disconnected (C, C′ algebraically closed) with X′ → X, and Y′ = X̄′^{/X} = Spa(C′, C′°° + C⁺). Then Y′ has a single rank-one point, every map in Y′_ét is a local isomorphism, so Y′_ét^∼ ≃ |Y′|^∼; and with K′, K the residue fields of C′, C and V = C⁺/C°° ⊂ K, |Y′| ≅ |Spa(K′, V)|, the space of valuation rings of K′ containing V. This is compatible with |X| ≅ |Spa(K, V)| under V′ ↦ V′ ∩ K, so the points of Y′ over the closed point of X form f^{−1}(s).

Construction and proof:

1. The relative compactification is Spa(C′, C′°° + C⁺) by the affinoid formula (C4).
2. Its only rank-one point is Spa(C′, O_C′) with C′ algebraically closed, so étale maps are local isomorphisms (as for Spa(C, C⁺)_ét in C0/etale-site). Étale maps of perfectoid spaces are locally composites of rational open immersions and finite étale maps, and finite étale algebras over (C′, B⁺) split for C′ algebraically closed and any plus ring B⁺ (PerfectoidSpaces P3).
3. Open bounded valuation subrings of C′ containing C′°° + C⁺ correspond to valuation rings of K′ containing V.

Acceptance:

- For C′ = C (X′ = X) the compactification is X itself and |Y′| = |Spa(K, V)| is the chain of valuation rings between V and K.

Depends on: `DiamondEtaleCohomology:C4/compactification-affinoid-formula`, `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `PerfectoidSpaces:P3/etale-morphism-of-perfectoid-spaces`, `PerfectoidSpaces:P3/finite-etale-morphism-of-perfectoid-spaces`.

Sources:

- ECD, proof of Theorem 19.2, p. 110.

### `zariski-riemann-acyclicity` — Acyclicity of relative Zariski–Riemann spaces away from the special fibre ★

Declaration `DiamondEtaleCohomology:C5/zariski-riemann-acyclicity` (theorem).

Let K ⊂ K′ be algebraically closed fields and V ⊂ K a valuation ring. Let T′ = Spa(K′, V) be the spectral space of valuation rings V′ ⊂ K′ containing V, T = Spa(K, V), f : T′ → T, V′ ↦ V′ ∩ K, and s ∈ T the closed point. If F is a sheaf of torsion abelian groups on T′ with F_{x′} = 0 for all x′ ∈ f^{−1}(s), then RΓ(T′, F) = 0.

Construction and proof:

1. Let C be the cofiltered category of proper V-schemes X with a point x ∈ X(K′) (products and equalizers stay in C); then T′ = lim_C |X|, and integral projective X with x dominant suffice ([Hub93b, Lemma 2.1], ClassicalAdicEtaleCohomology H1:henselian).
2. For X ∈ C with x dominant, the normalisation X̃ of X in K′ is the limit, along finite transition maps, of objects of C over X; X̃_ét ≃ X̃_Zar by [Hub93b, Lemma 2.4] (H1:henselian), and X̃_ét^∼ = lim X′_ét^∼ (SGA 4 VII 5.7, requested from SchemeAndStackFoundations SF.2), so every étale U → X becomes a local isomorphism over some X′ → X in C (EGA IV 8.10.5, 17.7.8). Hence the topoi lim |X|^∼ and lim X_ét^∼ agree. C is taken to be Huber's system of integral projective models with x dominant.
3. Reduce to F constructible, pulled back from F_X on X_ét with zero restriction to the special fibre; RΓ(T′, F) = colim_{X′ ∈ C/X} RΓ(X′_ét, F_{X′}), and each term vanishes by the proper base change theorem for étale cohomology of schemes over the strictly henselian valuation ring V: V is strictly henselian since K is algebraically closed, and RΓ(X, F_X) = RΓ(X_s, F_X|X_s) = 0 (ClassicalAdicEtaleCohomology H1:valuation-exports, proper schemes over strictly henselian valuation rings, which rests on proper base change from SchemeAndStackFoundations:SF.2). The passage lim |X|^∼ ≃ lim X_ét^∼ also needs that the étale topos of a cofiltered limit of schemes with affine transition maps is the limit topos (SGA 4 VII 5.7), requested from SF.2, and limits of coherent topoi (DiamondsAndVStacks D0).

Acceptance:

- Concrete instance: for V = K (s the unique point) the hypothesis forces F = 0; for V of rank one, f^{−1}(η) ⊂ T′ is open and F = j′_!G for any torsion sheaf G on it satisfies the hypothesis, so RΓ(T′, j′_!G) = 0.

Depends on: `ClassicalAdicEtaleCohomology:H1:henselian/zariski-riemann-space-as-limit`, `ClassicalAdicEtaleCohomology:H1:henselian/etale-over-normal-separably-closed-local-isomorphism`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/proper-nearby-cycle-cohomology`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/algebraically-closed-fraction-field-strictly-henselian`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `SchemeAndStackFoundations:SF.2`, `DiamondsAndVStacks:D0`.

Sources:

- ECD, Lemma 19.4, p. 110.
- ECD, proof of Lemma 19.4, p. 110.

### `proper-base-change-bounded` — Proper base change for diamonds on D⁺ ★

Declaration `DiamondEtaleCohomology:C5/proper-base-change-bounded` (theorem).

Let f : Y′ → Y be a proper morphism of small v-stacks and j : U ⊂ Y an open immersion, with g : U′ = U ×_Y Y′ → U and j′ : U′ ⊂ Y′. If f is quasi-pro-étale or nΛ = 0 for some n prime to p, then j_!Rg∗A → Rf∗j′_!A is an isomorphism for every A ∈ D⁺_ét(U′, Λ).

Construction and proof:

1. Reduce to Y = X strictly totally disconnected: for nΛ = 0 by Proposition 17.6 (C3) and base change for j_!; for quasi-pro-étale f with arbitrary Λ by Corollary 16.8(i) (C2), since v-pushforward commutes with v-slices (PAPER-SCHOLZE-17/E95: Proposition 17.6 assumes nΛ = 0).
2. Check on stalks: X = Spa(C, C⁺) and global sections (C0/geometric-stalk). If U = X it is clear; otherwise RΓ(X, j_!Rg∗A) = 0 and one needs RΓ(Y′, j′_!A) = 0.
3. Quasi-pro-étale f: Y′ is strictly totally disconnected and affinoid pro-étale over X (D1), |Y′| ↪ |X| × π0 Y′ is a pro-constructible generalizing embedding (D1, ECD 7.22) whose image is closed by universal closedness, hence everything, so Y′ = Spa(C, C⁺) × S with S = π0 Y′ profinite (PerfectoidSpaces P6, product with a profinite set); then Y′ is strictly totally disconnected, so RΓ(Y′, −) is exact on sheaves (C0/std-etale-acyclic); every point of |Y′| = |X| × S specialises to a point of {s} × S, where the cohomology sheaves of j′_!A vanish, so every section has empty support and RΓ(Y′, j′_!A) = 0.
4. nΛ = 0: by node compactification-hypercover reduce to Y′ = X̄′^{/X} for strictly totally disconnected X′; a Leray spectral sequence along Y′ → π0 Y′ reduces to connected Y′ = Spa(C′, C′°° + C⁺), whose étale topos is that of the Zariski–Riemann space |Spa(K′, V)| (node compactified-field-point-topos), and j′_!A has zero stalks over the closed point of X; apply node zariski-riemann-acyclicity.

Acceptance:

- Concrete instance (ECD 19.5(ii)): for the closed point s of Y = Spa(C′, C′⁺) and U = Y ∖ {s}, RΓ of a proper Y′ over Y with coefficients j′_!A vanishes.

Depends on: `DiamondEtaleCohomology:C5/exchange-map`, `DiamondEtaleCohomology:C3/qcqs-base-change-bounded`, `DiamondEtaleCohomology:C2/qcqs-pushforward-preserves-etale`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C0/etale-site-enough-points`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`, `DiamondsAndVStacks:D1/topological-classification-of-pro-etale-maps`, `PerfectoidSpaces:P6/product-with-profinite-set`, `DiamondEtaleCohomology:C4/proper-map`, `DiamondEtaleCohomology:C5/compactification-hypercover`, `DiamondEtaleCohomology:C5/compactified-field-point-topos`, `DiamondEtaleCohomology:C5/zariski-riemann-acyclicity`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `DiamondEtaleCohomology:C0/etale-cohomology-continuity`, `DiamondEtaleCohomology:C3/pushforward-via-coreflection`, `DiamondEtaleCohomology:C2/v-hyperdescent`.

Sources:

- ECD, Theorem 19.2, p. 108.
- ECD, proof of Theorem 19.2, p. 109.

### `proper-base-change-unbounded` — Proper base change under finite cohomological dimension

Declaration `DiamondEtaleCohomology:C5/proper-base-change-unbounded` (theorem).

In the situation of node proper-base-change-bounded, assume moreover that f is quasi-pro-étale or nΛ = 0 for some n prime to p, and that Rf∗ has finite cohomological dimension: there is N with R^if∗A = 0 for i > N for all A ∈ D_ét(Y′, Λ) concentrated in degree 0. Then j_!Rg∗A → Rf∗j′_!A is an isomorphism for all A ∈ D_ét(U′, Λ).

Construction and proof:

1. Rg∗ = j^∗Rf∗j′_! also has finite cohomological dimension, so each cohomology sheaf of both sides agrees with that for τ^{≥−n}A for n large; apply the D⁺ case.
2. Rf∗ commutes with Postnikov limits; with R lim of cohomological dimension ≤ 1 in the replete topos (EnhancedDerivedSheaves E2) and the bound N on sheaves, Rf∗(D^{≤m}_ét) ⊂ D^{≤m+N+1}_ét, and the towers stabilise degreewise. Rg∗ = j^∗Rf∗j′_! is base change of Rf∗ along the open j (C5/extension-by-zero-base-change).
3. The printed statement of the unbounded case omits the hypothesis on f or Λ, which the proof needs because it reduces to the D⁺ case (PAPER-SCHOLZE-17/E94); the node keeps it.

Acceptance:

- The unbounded statement keeps the hypothesis 'f quasi-pro-étale or nΛ = 0 with n prime to p' (PAPER-SCHOLZE-17/E94).

Depends on: `DiamondEtaleCohomology:C5/proper-base-change-bounded`, `DiamondEtaleCohomology:C2/cohomology-sheaf-criterion`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `EnhancedDerivedSheaves:E2/inverse-limit-amplitude`, `DiamondEtaleCohomology:C0/v-topos-replete`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`.

Sources:

- ECD, Theorem 19.2, p. 108.
- ECD, proof of Theorem 19.2, p. 109.

## C6. Algebraically closed base-field invariance

Theorem 19.5: for prime-to-p torsion coefficients, pullback on D_ét is fully faithful (iii) along a surjective extension Spa(C′, C′⁺) → Spa(C, C⁺) of algebraically closed nonarchimedean fields, (ii) from a discrete algebraically closed field k to Spa(C, C⁺) over k, and (i) along an extension of discrete algebraically closed fields; hence étale cohomology and connected components are invariant. Part (iii) follows from Proposition 17.6 and Theorem 16.1; part (ii) reduces to perfectoid annuli over k((t)) and their canonical compactifications. The compactifications are proper over the base and interleave the annuli, so proper base change applies to them. For constant F_ℓ coefficients their cohomology agrees with that of the annuli; this supplies the vanishing argument of PAPER-SCHOLZE-17/E60 without retaining it as a gap.

Other roadmaps: ClassicalAdicEtaleCohomology H2 (geometric field pairs), H4 (prime-to-p cohomology of annuli with arbitrary plus ring and tame towers).

Coverage: planned. Remaining: Lemma-level refinement of the compactified-annulus argument (the interleaving Y′_n ⊂ Ȳ′_n^{/Y} ⊂ Y′_{n+1} and the computation Rk_∗F_ℓ = F_ℓ) and of the tame-tower colimit of 19.5(ii).

Planets: **Invariance under change of algebraically closed base field** (`invariance-complete-extension`); **Invariance from a discrete to a complete base field** (`invariance-discrete-to-complete`).

### `invariance-complete-extension` — Invariance under extension of algebraically closed nonarchimedean base fields ★

Declaration `DiamondEtaleCohomology:C6/invariance-complete-extension` (theorem).

Let Y be a small v-stack over Spa(C, C⁺), with C an algebraically closed complete nonarchimedean field and C⁺ ⊂ C an open and bounded valuation subring; let C′/C be an extension of algebraically closed complete nonarchimedean fields and C′⁺ ⊂ C′ an open and bounded valuation subring containing C⁺ such that Spa(C′, C′⁺) → Spa(C, C⁺) is surjective, and Y′ = Y ×_{Spa(C,C⁺)} Spa(C′, C′⁺). If nΛ = 0 for some n prime to p, then pullback D_ét(Y, Λ) → D_ét(Y′, Λ) is fully faithful.

Construction and proof:

1. Let f : Y′ → Y (qcqs); show A → Rf∗f^∗A is an isomorphism for A ∈ D_ét(Y, Λ) (the printed 'A ∈ D_ét(X, Λ)' is a misprint for D_ét(Y, Λ), PAPER-SCHOLZE-17/E54).
2. Postnikov completeness of all categories involved and t-exactness of f^∗ reduce to A ∈ D⁺_ét(Y, Λ).
3. There Rf∗ = Rf_v∗ commutes with any base change (C3/qcqs-base-change-bounded), so assume Y = X strictly totally disconnected over Spa(C, C⁺). X ×_{Spa(C,C⁺)} Spa(C′, C′⁺) is affinoid perfectoid but not strictly totally disconnected, so apply the final statement of Theorem 16.1 (C1/v-pushforward-prime-to-p) with base Spa(C, C⁺) and X̃ = Spa(C′, C′⁺), for which λ∘(X̃) = Spa(C, C⁺) since X̃ → Spa(C, C⁺) is surjective (C0/separated-pro-etale-hull, PAPER-SCHOLZE-17/E91), to the cohomology sheaves of A on quasicompact opens of X; étale, quasi-pro-étale and v-cohomology agree on D⁺ (C0/bounded-below-comparison); pass to D⁺ by the hypercohomology spectral sequence.

Acceptance:

- Concrete instance used by AdicCoefficientsAndComparisons L3 and DiamondSixOperations S4: for X over Spa(C, O_C) and C′ ⊃ C complete algebraically closed with C′⁺ = O_C′, étale cohomology of X with prime-to-p torsion coefficients is unchanged by base change to C′.

Depends on: `DiamondEtaleCohomology:C3/qcqs-base-change-bounded`, `DiamondEtaleCohomology:C1/v-pushforward-prime-to-p`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C3/pullback`, `DiamondEtaleCohomology:C3/pushforward`, `ClassicalAdicEtaleCohomology:H2/geometric-field-pair-extension`, `DiamondEtaleCohomology:C0/separated-pro-etale-hull`, `DiamondEtaleCohomology:C0/bounded-below-comparison`.

Sources:

- ECD, Theorem 19.5(iii), p. 111.
- ECD, proof of Theorem 19.5, p. 111.

### `annulus-exhaustion` — Reduction of Theorem 19.5(ii) to annuli and stalks

Declaration `DiamondEtaleCohomology:C6/annulus-exhaustion` (lemma).

Let k be a discrete algebraically closed field of characteristic p, C the completed algebraic closure of k((t)), Y = Spa(A, A⁺) strictly totally disconnected over k with pseudouniformizer ϖ, and Y′ = Y ×_k Spa(C, C⁺) (here C⁺ = O_C, as O_C = k + C°°). Assume nΛ = 0 for some n prime to p. Then Y′ is the increasing union of the affinoid perfectoid annuli Y′_n = {|t|^n ≤ |ϖ| ≤ |t|^{1/n}} ⊂ Y′, interleaved with their canonical compactifications Y′_n ⊂ Ȳ′_n^{/Y} ⊂ Y′_{n+1} (node annulus-extension-by-zero-vanishing), and D_ét(Y, Λ) → D_ét(Y′, Λ) is fully faithful as soon as, for every n ≥ 1 and every geometric point Spa(C′, C′⁺) → Y, RΓ(Spa(C′, C′⁺), A) → RΓ(Ȳ′_n^{/Y} ×_Y Spa(C′, C′⁺), f̄_n^∗A) is an isomorphism for A ∈ D⁺_ét.

Construction and proof:

1. By hyperdescent along a hypercover by disjoint unions of strictly totally disconnected spaces Y_i (Y′_i = Y′ ×_Y Y_i perfectoid), full faithfulness reduces to strictly totally disconnected Y (C2/etale-category-one-cutoff).
2. RHom's in D_ét(Y′, Λ) are derived limits of those in D_ét(Y′_n, Λ), hence (the towers being interleaved) of those in D_ét(Ȳ′_n^{/Y}, Λ); so it suffices that A → Rf̄_{n∗}f̄_n^∗A is an isomorphism for the proper f̄_n. Reduce to D⁺ by Postnikov completeness; there Rf̄_{n∗} commutes with base change (Proposition 17.6, C3/qcqs-base-change-bounded, using nΛ = 0), and the compactification commutes with base change to Spa(C′, C′⁺) (C4/canonical-compactification), so check on stalks (C0/etale-site-enough-points). The charts of the product Y ×_k Spa(C, O_C) (PerfectoidSpaces P2, products in Perf, relative to k) give the annuli.

Acceptance:

- The annuli Y′_n are affinoid perfectoid, increasing, and cover Y′; RHom in D_ét(Y′, Λ) is R lim_n of RHom in D_ét(Y′_n, Λ).

Depends on: `DiamondEtaleCohomology:C2/etale-category-one-cutoff`, `DiamondEtaleCohomology:C2/v-hyperdescent`, `DiamondEtaleCohomology:C2/etale-derived-left-complete`, `DiamondEtaleCohomology:C0/etale-site-enough-points`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondEtaleCohomology:C3/qcqs-base-change-bounded`, `PerfectoidSpaces:P2/products-in-perf`, `DiamondEtaleCohomology:C4/canonical-compactification`.

Sources:

- ECD, proof of Theorem 19.5, p. 111.
- ECD, proof of Theorem 19.5, p. 112.

### `annulus-extension-by-zero-vanishing` — Compactified annuli and the vanishing for extensions by zero

Declaration `DiamondEtaleCohomology:C6/annulus-extension-by-zero-vanishing` (lemma).

In the situation of node annulus-exhaustion (so C is the completed algebraic closure of k((t)) and C⁺ = O_C), f : Y′ = Y ×_k Spa(C, O_C) → Y is partially proper, and the canonical compactifications Ȳ′_n^{/Y} of the annuli f_n : Y′_n → Y embed in Y′ with Y′_n ⊂ Ȳ′_n^{/Y} ⊂ Y′_{n+1}; each f̄_n : Ȳ′_n^{/Y} → Y is proper. Over a geometric point Y = Spa(C′, C′⁺) with closed point s, U = Y ∖ {s} and j : U ⊂ Y, and with nΛ = 0 for some n prime to p: RΓ(Ȳ′_n^{/Y}, f̄_n^∗j_!A_0) = 0 = RΓ(Y, j_!A_0) for every A_0 ∈ D⁺_ét(U, Λ), and RΓ(Ȳ′_n^{/Y}, F_ℓ) = RΓ(Y′_n, F_ℓ) for ℓ ≠ p.

Hypotheses:

- nΛ = 0 for some n prime to p (needed for Theorem 19.2 and Proposition 17.6 on the proper f̄_n).

Construction and proof:

1. (a) The residue field of C is k, so O_C = k + C°° and the only open bounded valuation subring of C containing k is O_C. Hence Spa(C, O_C) → Spd k is partially proper (Definition 18.4): for a perfectoid Tate pair (R, R⁺) with k → R⁺ and a continuous C → R carrying O_C into R°, C°° goes into R°° ⊂ R⁺ and k into R⁺, so O_C goes into R⁺; separatedness is that of the affinoid Spa(C, O_C). By base change f : Y′ → Y is partially proper.
2. (b) By the universal property (C4/canonical-compactification-universal) Y′_n ⊂ Y′ extends to Ȳ′_n^{/Y} → Y′. It is injective: Ȳ′_n^{/Y}(R, R⁺) = Y′_n(R, R°) ×_{Y(R,R°)} Y(R, R⁺) ⊂ Y′(R, R°) ×_{Y(R,R°)} Y(R, R⁺) = Y′(R, R⁺). It lands in Y′_{n+1}: on Spa(R, R°) the elements tⁿ/ϖ and ϖⁿ/t are power-bounded, so t^{n+1}/ϖ and ϖ^{n+1}/t are topologically nilpotent, hence in R⁺. f̄_n is proper (C4/relative-compactification-properties (vi), Y′_n → Y being quasicompact).
3. (c) For A_0 ∈ D⁺_ét(U, Λ): Theorem 19.2 for the proper f̄_n (C5/proper-base-change-bounded) gives Rf̄_{n∗}f̄_n^∗j_!A_0 = j_!Rḡ_{n∗}(…), whose global sections over the local Y vanish since Γ(Y, −) is the stalk at s; and RΓ(Y, j_!A_0) = 0 for the same reason.
4. (d) For F_ℓ: the rank-one points of Ȳ′_n^{/Y} and Y′_n coincide (Ȳ′_n^{/Y}(K, O_K) = Y′_n(K, O_K)), so for a geometric point z̄ = Spa(C(z), C(z)⁺) of Ȳ′_n^{/Y} the preimage of the quasicompact open k : Y′_n ⊂ Ȳ′_n^{/Y} is a nonempty quasicompact open of the chain |z̄|, i.e. Spa(C(z), V) for a valuation ring V, with RΓ(Spa(C(z), V), F_ℓ) = F_ℓ. With base change for Rk_∗ along quasi-pro-étale geometric points (C1/etale-base-change-complexes (ii)) this gives Rk_∗F_ℓ = F_ℓ, so RΓ(Ȳ′_n^{/Y}, F_ℓ) = RΓ(Y′_n, F_ℓ).
5. This replaces ECD's application of Theorem 19.2 to the non-proper annulus f_n (PAPER-SCHOLZE-17/E60) by an application to its canonical compactification; the earlier plan (compare RΓ(Ȳ′_n^{/Y}, B) and RΓ(Y′_n, B) for all B pulled back from Y) reduced the vanishing to itself and is not used.

Acceptance:

- Over Y = Spa(C′, O_C′) (rank one) U is empty and both statements are trivial; for Y of rank 2 the first statement is the vanishing that ECD's proof of 19.5(ii) needs, now proved on Ȳ′_n^{/Y} where Theorem 19.2 applies.

Depends on: `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/canonical-compactification`, `DiamondEtaleCohomology:C4/canonical-compactification-universal`, `DiamondEtaleCohomology:C4/relative-compactification-properties`, `DiamondEtaleCohomology:C5/proper-base-change-bounded`, `DiamondEtaleCohomology:C3/qcqs-base-change-bounded`, `DiamondEtaleCohomology:C0/geometric-stalk`, `DiamondEtaleCohomology:C6/perfectoid-annulus-cohomology`, `DiamondEtaleCohomology:C6/annulus-exhaustion`, `DiamondEtaleCohomology:C1/etale-base-change-complexes`, `DiamondEtaleCohomology:C5/open-support-triangle`.

Sources:

- ECD, proof of Theorem 19.5, p. 112.

### `perfectoid-annulus-cohomology` — Cohomology of the perfectoid annulus over a geometric point

Declaration `DiamondEtaleCohomology:C6/perfectoid-annulus-cohomology` (lemma).

In the situation of node annulus-exhaustion over a geometric point Spa(C′, C′⁺), with ℓ ≠ p: RΓ(Y′_n, F_ℓ) = F_ℓ (concentrated in degree 0).

Construction and proof:

1. Y′_n is the inverse limit, over finite extensions L ⊂ C of k((t^{1/p^∞})), of the affinoid perfectoid spaces Y′_{n,L} = {|t|^n ≤ |ϖ| ≤ |t|^{1/n}} ⊂ Spa(L, O_L) ×_k Spa(C′, C′⁺), so H^i(Y′_n, F_ℓ) = colim_L H^i(Y′_{n,L}, F_ℓ) by continuity (C0/etale-cohomology-continuity).
2. Each L is k((t_L^{1/p^∞})) for a uniformizer t_L of the corresponding finite separable extension of k((t)), so Y′_{n,L} is the perfection of a closed annulus over Spa(C′, C′⁺) in the coordinate t_L (the printed 'over Spa(C, C⁺)' is a misprint, PAPER-SCHOLZE-17/E55), with H^0 = H^1 = F_ℓ and H^i = 0 otherwise (ClassicalAdicEtaleCohomology H4, annuli with arbitrary plus ring).
3. The colimit over L kills the degree-one Kummer class by extracting ℓ-power roots of the uniformizer (H4 tame towers).

Acceptance:

- H^1 of each finite-level annulus Y′_{n,L} with F_ℓ coefficients is generated by the Kummer class of t_L, which maps to zero at the next stage L′ with ℓ | e(L′/L).

Depends on: `DiamondEtaleCohomology:C0/etale-cohomology-continuity`, `ClassicalAdicEtaleCohomology:H4/annulus-cohomology`, `ClassicalAdicEtaleCohomology:H4/annulus-geometric-plus-ring`, `ClassicalAdicEtaleCohomology:H4/tame-tower-annulus-acyclicity`.

Sources:

- ECD, proof of Theorem 19.5, p. 112.

### `invariance-discrete-to-complete` — Invariance from a discrete to a complete algebraically closed base field ★

Declaration `DiamondEtaleCohomology:C6/invariance-discrete-to-complete` (theorem).

Let Y be a small v-stack over k, a discrete algebraically closed field of characteristic p, let C/k be an algebraically closed complete nonarchimedean field and Y′ = Y ×_k Spa(C, C⁺) for an open and bounded valuation subring C⁺ ⊂ C containing k. If nΛ = 0 for some n prime to p, pullback D_ét(Y, Λ) → D_ét(Y′, Λ) is fully faithful.

Construction and proof:

1. By part (iii) (node invariance-complete-extension) it suffices to treat C the completed algebraic closure of k((t)).
2. Reduce to compactified annuli and stalks (node annulus-exhaustion): for Y = Spa(C′, C′⁺), show RΓ(Y, A) = RΓ(Ȳ′_n^{/Y}, f̄_n^∗A) for A ∈ D⁺_ét(Y, Λ).
3. Both sides vanish for A = j_!A_0 (node annulus-extension-by-zero-vanishing), so assume A is concentrated at s, then constant; by triangles Λ = F_ℓ and A = F_ℓ (bounded below sums of shifts, Ȳ′_n^{/Y} being qcqs); RΓ(Ȳ′_n^{/Y}, F_ℓ) = RΓ(Y′_n, F_ℓ) = F_ℓ (nodes annulus-extension-by-zero-vanishing and perfectoid-annulus-cohomology).

Acceptance:

- Concrete instance used by AdicCoefficientsAndComparisons L3 (ECD 27.2, 27.4): k = F̄_p and C the completed algebraic closure of F_p((t)).

Depends on: `DiamondEtaleCohomology:C6/invariance-complete-extension`, `DiamondEtaleCohomology:C6/annulus-exhaustion`, `DiamondEtaleCohomology:C6/annulus-extension-by-zero-vanishing`, `DiamondEtaleCohomology:C6/perfectoid-annulus-cohomology`, `DiamondEtaleCohomology:C5/open-support-triangle`.

Sources:

- ECD, Theorem 19.5(ii), p. 111.
- ECD, proof of Theorem 19.5, p. 111.

### `invariance-discrete-extension` — Invariance under extension of discrete algebraically closed base fields

Declaration `DiamondEtaleCohomology:C6/invariance-discrete-extension` (theorem).

Let Y be a small v-stack over k, a discrete algebraically closed field of characteristic p, k′/k an extension of discrete algebraically closed fields and Y′ = Y ×_k k′. If nΛ = 0 for some n prime to p, pullback D_ét(Y, Λ) → D_ét(Y′, Λ) is fully faithful.

Construction and proof:

1. Choose an algebraically closed complete nonarchimedean C′ over k′; then D_ét(Y) → D_ét(Y ×_k Spa(C′, O_C′)) is fully faithful by part (ii) for k and factors through D_ét(Y′); and D_ét(Y′) → D_ét(Y′ ×_{k′} Spa(C′, O_C′)) is fully faithful by part (ii) for k′, with Y′ ×_{k′} Spa(C′, O_C′) = Y ×_k Spa(C′, O_C′). Full faithfulness of the composite and of the second functor gives it for the first; ECD records this as '(i) follows from (ii) and (iii)'.

Acceptance:

- Concrete instance: for a small v-stack Y over k and an algebraically closed extension k′ of k, RΓ(Y, F_ℓ) → RΓ(Y ×_k k′, F_ℓ) is an isomorphism (ℓ ≠ p).

Depends on: `DiamondEtaleCohomology:C6/invariance-discrete-to-complete`, `DiamondEtaleCohomology:C6/invariance-complete-extension`, `DiamondEtaleCohomology:C3/pullback`.

Sources:

- ECD, Theorem 19.5(i), p. 111.
- ECD, proof of Theorem 19.5, p. 111.

### `cohomology-invariance` — Invariance of étale cohomology and of connected components

Declaration `DiamondEtaleCohomology:C6/cohomology-invariance` (theorem).

In the situation of Theorem 19.5 (i), (ii) or (iii), with nΛ = 0 for some n prime to p and f : Y′ → Y the projection: for every A ∈ D_ét(Y, Λ), RΓ(Y, A) → RΓ(Y′, f^∗A) is an isomorphism; and pullback induces a bijection between open and closed subsets of |Y| and of |Y′|, so Y is connected if and only if Y′ is.

Construction and proof:

1. RΓ(Y, A) = RHom(Λ, A) → RHom(f^∗Λ, f^∗A) = RΓ(Y′, f^∗A) is an isomorphism by full faithfulness.
2. For ℓ ≠ p, H^0(Y, F_ℓ) = Hom(Y, F_ℓ) = locally constant functions |Y| → F_ℓ, whose idempotents are the clopen subsets; the H^0 isomorphism for Λ = F_ℓ is a bijection of idempotents.

Acceptance:

- This is the consequence DiamondSixOperations:S4 uses in ECD 23.12: geometric connectedness and étale cohomology are invariant under C ⊂ C′.

Depends on: `DiamondEtaleCohomology:C6/invariance-complete-extension`, `DiamondEtaleCohomology:C6/invariance-discrete-to-complete`, `DiamondEtaleCohomology:C6/invariance-discrete-extension`, `DiamondEtaleCohomology:C3/pushforward`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`.

Sources:

- ECD, Theorem 19.5, p. 111.

## C7. Constructible and perfect-constructible coefficients

Constructible sheaves (noetherian Λ) are defined on spectral spaces, on strictly totally disconnected spaces and on small v-stacks by spectral constructible stratifications; they form an abelian category, coincide with compact sheaves on spectral spaces and on spatial diamonds, satisfy v-descent and finite-stage descent along cofiltered limits, and admit dévissages by j_!(L|_Z) with L a local system (20.1–20.8). Perfect-constructible complexes (any commutative Λ) are defined by constant perfect values on strata; they form a thick subcategory, are characterized for noetherian Λ by constructible cohomology together with local boundedness and either perfect geometric stalks of every rank or locally bounded Tor amplitude. They satisfy restricted compactness. The v-descent theorem has a complete noetherian-coefficient argument; its general commutative-coefficient case retains the gap of DiamondEtaleCohomology/E11, also inherited by the general-coefficient filtration and limit theorems (20.13, 20.15–20.16). The filtrations on spatial diamonds use j_!(L|_Z), with L étale-locally constant with perfect values. The proof order of 20.15–20.16 is: full faithfulness, spreading of perfect local systems, the filtration theorem, then essential surjectivity.

Earlier stages: C5 supplies étale extension by zero, the open-support triangle and base change throughout this stage.

Other roadmaps: DiamondsAndVStacks D5 (local structure of étale maps, finite-stage comparisons; localization and field-point presentation requested), DeformationAndDerivedPatchingAlgebra P7 (perfect complexes), SchemeKTheoryOperations S.1 (perfect complexes over filtered colimits of rings), and the C8 part's point-quotient, specialization-stabilizer and point-sheaf nodes at declaration level.

Coverage: planned. Remaining: Receive the DiamondsAndVStacks:D5 localization and field-point contract used by Propositions 20.8 and 20.16. Lemma-level refinement: the extension step of Remark 20.3, the hypercohomology step of 20.14 and the ring case of 20.15, which ECD only states as 'proved similarly'. Close the gap on v-descent of perfect-constructibility for non-noetherian Λ (ECD 20.13, DiamondEtaleCohomology/E11). Receive the D0 contract on sheaves on limits of spectral spaces and constructible sheaves from a finite stage (also used in C5).

Planets: **Constructible étale sheaf** (`constructible-sheaf`); **Constructible sheaves on spatial diamonds** (`constructible-spatial-characterisation`); **Finite-stage descent of constructible sheaves** (`constructible-limit-descent`); **Dévissage of constructible sheaves** (`constructible-filtration`); **Perfect-constructible complex** (`perfect-constructible`); **Dévissage of perfect-constructible complexes** (`perfect-constructible-filtration`).

### `constructible-sheaf-spectral` — Constructible sheaves of modules on a spectral space

Declaration `DiamondEtaleCohomology:C7/constructible-sheaf-spectral` (definition).

Let Λ be a noetherian ring and X a spectral space. A sheaf F of Λ-modules on X is constructible if there is a finite stratification X = ⊔ S_i into constructible locally closed subsets S_i such that each F|_{S_i} is the constant sheaf on S_i associated with a finitely generated Λ-module. Constructible refers to the constructible subsets of the spectral space (finite Boolean combinations of quasicompact opens).

Construction and proof:

1. Use Mathlib's constructible subsets of a topological space and sheaves on TopCat; restriction to a locally closed subset is the pullback along the inclusion.
2. Refining two finite constructible stratifications gives a common refinement, which is used in every closure argument.

Used by:

- ECD Lemma 20.4: constructible = compact on a spectral space
- ECD Definition 20.1(i): constructible étale sheaves on strictly totally disconnected spaces are constructible sheaves on |X|

API:

| name | role | statement |
|---|---|---|
| `IsConstructibleSheaf` | constructor | The predicate on sheaves of Λ-modules on a spectral space X: a finite stratification by constructible locally closed subsets on which F is constant with finitely generated value. |
| `IsConstructibleSheaf.constant` | constructor | The constant sheaf of a finitely generated Λ-module is constructible. |
| `IsConstructibleSheaf.extendByZero_open` | functoriality | For a quasicompact open j : U ⊂ X, j_! preserves constructibility; for a constructible closed i : Z ⊂ X, i_∗ preserves it. |
| `IsConstructibleSheaf.pullback` | functoriality | Pullback along a spectral map of spectral spaces preserves constructibility. |
| `IsConstructibleSheaf.kernel_cokernel_extension` | other | Constructible sheaves on a spectral space are closed under kernels, cokernels, images, direct summands and extensions (node constructible-compact-spectral). |
| `IsConstructibleSheaf.iff_compact` | characterisation | F is constructible iff Hom(F, −) commutes with filtered colimits (node constructible-compact-spectral). |
| `IsConstructibleSheaf.stalk_fg` | projection | Every stalk of a constructible sheaf is a finitely generated Λ-module. |

Unit tests:

- `isConstructibleSheaf_zero` (degenerate): The zero sheaf is constructible.
- `isConstructibleSheaf_constant` (computation): The constant sheaf Λ^n on a spectral space is constructible.
- `isConstructibleSheaf_finite_T0` (compatibility): On a finite T0 space (spectral, all subsets constructible) a sheaf is constructible iff all its stalks are finitely generated.
- `isConstructibleSheaf_not_fg` (non-example): On a nonempty spectral space, the constant sheaf with value ⊕_{n∈N} Λ (Λ ≠ 0) is not constructible.
- `isConstructibleSheaf_not_qc_open` (non-example): On the Cantor set X, a point x and U = X ∖ {x}, the sheaf j_!Λ_U (Λ ≠ 0) is not constructible: U is open but not quasicompact, hence not constructible.

Acceptance:

- The stratification of a closed unit disc into a point and its complement is not a constructible stratification (the open complement is not quasicompact), cf. ECD §1.

Depends on: `mathlib:Topology.IsConstructible`, `mathlib:SpectralSpace`, `mathlib:TopCat.Sheaf`, `mathlib:Module.Finite`, `mathlib:IsNoetherianRing`.

Sources:

- ECD, Lemma 20.4, p. 113.
- ECD, Remark 20.3, p. 113.

### `constructible-sheaf-std` — Constructible étale sheaves on a strictly totally disconnected space

Declaration `DiamondEtaleCohomology:C7/constructible-sheaf-std` (definition).

Let Λ be noetherian and X a strictly totally disconnected perfectoid space; identify étale sheaves on X with sheaves on |X|. A sheaf of Λ-modules on X_ét is constructible if there is a stratification of X into constructible locally closed subsets S_i ⊂ |X| such that F|_{S_i} is the constant sheaf on S_i associated with a finitely generated Λ-module; i.e. if the corresponding sheaf on the spectral space |X| is constructible.

Construction and proof:

1. Use C0/std-etale-acyclic (X_ét^∼ ≃ Sh(|X|)) and the spectral-space notion (node constructible-sheaf-spectral). ECD switches from X as a perfectoid space to |X| as a topological space so that restriction to S_i makes sense (Remark 20.2).

Used by:

- ECD Definition 20.1(ii): constructibility on small v-stacks is tested by pullback to strictly totally disconnected spaces

API:

| name | role | statement |
|---|---|---|
| `IsConstructibleStd` | constructor | Constructibility of a sheaf of Λ-modules on X_ét for strictly totally disconnected X. |
| `IsConstructibleStd.iff_space` | equivalence | F is constructible iff its image in Sh(\|X\|, Λ) is constructible in the sense of the spectral space \|X\|. |
| `IsConstructibleStd.pullback` | functoriality | Pullback along a map of strictly totally disconnected spaces preserves constructibility. |

Unit tests:

- `isConstructibleStd_point` (computation): For X = Spa(C, O_C), F is constructible iff F(X) is a finitely generated Λ-module.
- `isConstructibleStd_chain` (computation): For X = Spa(C, C⁺) of rank 2 with open generic point j, j_!Λ is constructible (stratification {η} ⊔ {s}).
- `isConstructibleStd_profinite` (compatibility): For X = Spa(C, O_C) × S with S profinite, constructible sheaves are the sheaves on S that are locally constant with finitely generated values on a finite clopen partition.
- `isConstructibleStd_not` (non-example): For X = Spa(C, O_C) × S with S infinite profinite and s ∈ S a non-isolated point, the skyscraper sheaf i_{s∗}Λ (Λ ≠ 0) at {s} × Spa(C, O_C) is not constructible: {s} is closed but not constructible (the constructible subsets of |X| = S are the clopen ones), although all stalks are finitely generated.

Acceptance:

- For X = Spa(C, O_C) × S with S profinite, constructible sheaves are locally constant with finitely generated values on a finite clopen partition of S.

Depends on: `DiamondEtaleCohomology:C7/constructible-sheaf-spectral`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `DiamondsAndVStacks:D1/strictly-totally-disconnected`.

Sources:

- ECD, Definition 20.1(i), p. 113.
- ECD, Remark 20.2, p. 113.

### `constructible-sheaf` — Constructible sheaves on a small v-stack ★

Declaration `DiamondEtaleCohomology:C7/constructible-sheaf` (definition).

Let Λ be noetherian, Y a small v-stack and F a small sheaf of Λ-modules on Y_v. F is constructible if F[0] ∈ D_ét(Y, Λ) and, for every strictly totally disconnected perfectoid space f : X → Y, the pullback f^∗F is constructible on X (node constructible-sheaf-std). Cons(Y, Λ) denotes the category of constructible sheaves.

Construction and proof:

1. The definition only uses pullbacks to strictly totally disconnected spaces, where étale sheaves are sheaves on |X|.
2. By v-descent (node constructible-v-descent) it suffices to test one v-cover by a strictly totally disconnected space.

Used by:

- ECD Proposition 20.9: compactness of constructible F_ℓ-sheaves (DiamondEtaleCohomology:C9/bounded-filtered-compactness)
- ECD Theorem 1.11 and §23: D_cons(Y, F_ℓ) of bounded complexes with constructible cohomology (DiamondSixOperations:S4)
- DiamondEtaleCohomology:C8/constructible-support-reduction: dévissage of torsion sheaves to constructible ones

API:

| name | role | statement |
|---|---|---|
| `IsConstructible` | constructor | Constructibility of a small sheaf of Λ-modules on Y_v, for a small v-stack Y and noetherian Λ. |
| `IsConstructible.iff_cover` | characterisation | For a surjection X → Y from a strictly totally disconnected space, F is constructible iff F ∈ D_ét(Y, Λ) and its pullback to X is constructible (node constructible-v-descent). |
| `IsConstructible.pullback` | functoriality | For any map g : Y′ → Y of small v-stacks, g^∗ preserves constructibility. |
| `Cons` | constructor | The full abelian subcategory Cons(Y, Λ) of constructible sheaves (node constructible-abelian). |
| `IsConstructible.iff_compact_spatial` | characterisation | For a spatial diamond Y, F is constructible iff F is compact among étale sheaves of Λ-modules (node constructible-spatial-characterisation). |
| `IsConstructible.etaleShriek` | functoriality | For a quasicompact separated étale j : U → Y and a constructible sheaf G on U, j_!G is constructible (C5 extension by zero, node constructible-filtration). |
| `IsConstructible.stalk_fg` | projection | For a locally spatial diamond Y, every geometric stalk of a constructible sheaf is a finitely generated Λ-module. |

Unit tests:

- `isConstructible_constant` (computation): The constant sheaf Λ_Y on any small v-stack is constructible.
- `isConstructible_zero` (degenerate): The zero sheaf is constructible.
- `isConstructible_std_compat` (compatibility): For strictly totally disconnected X the notion agrees with node constructible-sheaf-std.
- `isConstructible_open_disc` (non-example): For the closed perfectoid unit disc D over Spa(C, O_C), a classical point x (T = 0), Λ ≠ 0 and U = D ∖ {x}, which is open but not quasicompact (the increasing union of the rational opens {|T| ≥ |p|^n}), j_!Λ_U is not constructible: its support U would be a finite union of constructible strata of the spatial diamond D, hence a constructible open, hence quasicompact.
- `isConstructible_v_sheaf_not` (non-example): For Y = Spa(C, O_C) and Λ ≠ 0, the étale sheaf ⊕_{n∈N} Λ_Y lies in D_ét(Y, Λ) but is not constructible (its value is not a finitely generated Λ-module).

Acceptance:

- For a spatial diamond Y the notion is intrinsic: constructible iff compact in étale sheaves iff constant with finitely generated values on the pullbacks of a constructible stratification of |Y| (node constructible-spatial-characterisation).

Depends on: `DiamondEtaleCohomology:C7/constructible-sheaf-std`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C3/pullback`.

Sources:

- ECD, Definition 20.1(ii), p. 113.

### `constructible-abelian` — Constructible sheaves form an abelian category

Declaration `DiamondEtaleCohomology:C7/constructible-abelian` (theorem).

For noetherian Λ and a small v-stack Y, the class of constructible sheaves on Y is stable under kernels, cokernels, images and extensions in the category of small sheaves of Λ-modules on Y_v; in particular Cons(Y, Λ) is an abelian category.

Construction and proof:

1. Reduce to strictly totally disconnected X (pullback is exact, D_ét is stable under these operations by the cohomology-sheaf criterion), and apply the spectral-space closure properties of node constructible-compact-spectral to |X|.

Acceptance:

- Extensions are covered through compactness (node constructible-compact-spectral); no special property of the strata is needed.

Depends on: `DiamondEtaleCohomology:C7/constructible-sheaf`, `DiamondEtaleCohomology:C7/constructible-sheaf-spectral`, `DiamondEtaleCohomology:C2/cohomology-sheaf-criterion`, `mathlib:IsNoetherianRing`, `DiamondEtaleCohomology:C7/constructible-compact-spectral`, `DiamondEtaleCohomology:C7/constructible-sheaf-std`.

Sources:

- ECD, Remark 20.3, p. 113.

### `constructible-compact-spectral` — Constructible equals compact on a spectral space

Declaration `DiamondEtaleCohomology:C7/constructible-compact-spectral` (theorem).

Let Λ be noetherian, X a spectral space and F a sheaf of Λ-modules on X. Then F is constructible if and only if F is compact in the category of sheaves of Λ-modules on X (Hom(F, −) commutes with filtered colimits). Every sheaf of Λ-modules on X is a filtered colimit of constructible sheaves.

Construction and proof:

1. On a spectral space X (Λ noetherian), constructible sheaves are closed under kernels, cokernels, images and direct summands: a map M_S → N_S of constant sheaves with finitely generated values on a constructible locally closed S is given by finitely many locally constant functions on the quasicompact S, so it is constant on a finite clopen refinement of S, and clopen subsets of S are constructible in X.
2. Constructible ⇒ compact: j_! for constructible open j and i_∗ for constructible closed i preserve compact objects (their right adjoints j^∗, i^! preserve filtered colimits); a filtration reduces to constant sheaves of finitely generated modules, done by a finite free 2-term resolution.
3. Every sheaf has a 2-term resolution H → G → F → 0 by sums of j_!Λ, j quasicompact open; H → G is a filtered colimit of maps of finite sums, whose cokernels are constructible.
4. Compact ⇒ constructible: F = colim F_i, the identity factors through some F_i, so F is a direct summand of a constructible sheaf.
5. Hence constructible sheaves on X are closed under extensions: compact objects of a Grothendieck abelian category are (colim Ext^1(A, F_j) → Ext^1(A, colim F_j) is injective for compact A). Λ_U is compact because Γ(U, −) commutes with filtered colimits for U quasicompact open (D0), and i^! commutes with them because j_∗ does for quasicompact j.

Acceptance:

- Compactness is Mathlib's IsFinitelyPresentable in the category of sheaves of Λ-modules on X.

Depends on: `DiamondEtaleCohomology:C7/constructible-sheaf-spectral`, `mathlib:CategoryTheory.IsFinitelyPresentable`, `mathlib:TopCat.Sheaf`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`.

Sources:

- ECD, Lemma 20.4, p. 113.
- ECD, proof of Lemma 20.4, p. 114.

### `constructible-v-descent` — v-descent of constructibility

Declaration `DiamondEtaleCohomology:C7/constructible-v-descent` (theorem).

Let Λ be noetherian, f : Ỹ → Y a surjective map of small v-stacks and F a small sheaf of Λ-modules on Y_v. If f^∗F is constructible, then F is constructible.

Construction and proof:

1. F[0] ∈ D_ét(Y, Λ) by v-locality (C2/etale-test-on-one-cover). Reduce to Y = X and Ỹ = X̃ strictly totally disconnected.
2. Hom_X(F, −) is the equalizer of Hom_X̃(f^∗F, f^∗−) ⇒ Hom_{X̃′}(g^∗F, g^∗−) for a strictly totally disconnected cover X̃′ of X̃ ×_X X̃; both commute with filtered colimits by Lemma 20.4, so F is compact, hence constructible.

Acceptance:

- Concrete instance: a sheaf on a spatial diamond Y whose pullback to a strictly totally disconnected cover is constant with finitely generated value is constructible.

Depends on: `DiamondEtaleCohomology:C7/constructible-compact-spectral`, `DiamondEtaleCohomology:C7/constructible-sheaf`, `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `DiamondEtaleCohomology:C0/bounded-below-comparison`.

Sources:

- ECD, Proposition 20.5, p. 114.
- ECD, proof of Proposition 20.5, p. 114.

### `constructible-spatial-characterisation` — Characterizations of constructible sheaves on spatial diamonds ★

Declaration `DiamondEtaleCohomology:C7/constructible-spatial-characterisation` (theorem).

Let Λ be noetherian, Y a spatial diamond and F an étale sheaf of Λ-modules on Y. The following are equivalent: (i) F is constructible; (ii) F is compact in the category of étale sheaves of Λ-modules on Y; (iii) there is a stratification of |Y| into constructible locally closed subsets S_i such that for every strictly totally disconnected f : X → Y, f^∗F|_{f^{−1}(S_i)} is constant with finitely generated value. Moreover every étale sheaf of Λ-modules on Y is a filtered colimit of constructible sheaves.

Construction and proof:

1. (iii) ⇒ (i) by definition; (i) ⇒ (ii) since compactness descends along a strictly totally disconnected cover (as in 20.5).
2. (ii) ⇒ (iii): call sheaves as in (iii) strongly constructible; they are closed under kernels, cokernels, images and extensions. By ECD Lemma 11.31 (D5) every étale sheaf is a quotient of sums of j_!Λ with j : U ↪ V → W ↪ Y (quasicompact open, finite étale, quasicompact open), so it suffices that such j_!Λ is strongly constructible; then compact sheaves are summands of strongly constructible ones.
3. For strictly totally disconnected X: U embeds in X × {1, …, m} as a quasicompact open (the printed '× {1, …, n}' is a misprint, PAPER-SCHOLZE-17/E56); the number a(x) of geometric points of U over x has quasicompact open superlevel sets, and j_!Λ restricted to a^{−1}(i) is Λ^i. In general define a on |Y| and check level sets on a strictly totally disconnected cover. The level sets of a are constructible in |Y| when their preimages in |X| are, because |X| → |Y| is a quotient map for a v-cover of a spatial diamond (D5), and f^∗(j_!Λ) = j_{X!}Λ (C5).

Acceptance:

- For Y = Spa(C, C⁺) of finite rank, constructible sheaves are those constant with finitely generated values on each of the finitely many points of a finite stratification of the chain |Y|.

Depends on: `DiamondEtaleCohomology:C7/constructible-sheaf`, `DiamondEtaleCohomology:C7/constructible-compact-spectral`, `DiamondEtaleCohomology:C7/constructible-v-descent`, `DiamondsAndVStacks:D5/local-structure-of-etale-maps`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C0/bounded-below-comparison`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondsAndVStacks:D5/universally-open-presentation`.

Sources:

- ECD, Proposition 20.6, p. 114.
- ECD, proof of Proposition 20.6, p. 114.

### `constructible-limit-descent` — Constructible sheaves in cofiltered limits of spatial diamonds ★

Declaration `DiamondEtaleCohomology:C7/constructible-limit-descent` (theorem).

Let Y_i, i ∈ I, be a cofiltered inverse system of spatial diamonds with inverse limit Y = lim Y_i, again a spatial diamond, and Λ noetherian. Then 2-colim_i Cons(Y_i, Λ) → Cons(Y, Λ) is an equivalence of categories.

Construction and proof:

1. Full faithfulness: Hom_Y(F, G) = Hom_{Y_{i_0}}(F_{i_0}, f_{i_0∗}G) = colim_i Hom_{Y_i}(F_i, G_i), using the relative version of continuity (C0/etale-cohomology-continuity) for f_{i_0∗}G = colim f_{i,i_0∗}G_i and compactness of F_{i_0}.
2. Essential surjectivity: a constructible F is the cokernel of a map of finite sums of j_!Λ with j quasicompact separated étale (proof of 20.6); such data descend to some Y_i by ECD Proposition 11.23 (D5) and full faithfulness.

Acceptance:

- Concrete instance: for the strictly totally disconnected presentation X = lim Y_i → Y of ECD 11.24 (Y_i quasicompact separated étale over a spatial diamond Y), every constructible sheaf on X is pulled back from some Y_i.

Depends on: `DiamondEtaleCohomology:C7/constructible-spatial-characterisation`, `DiamondEtaleCohomology:C0/etale-cohomology-continuity`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`.

Sources:

- ECD, Proposition 20.7, p. 115.
- ECD, proof of Proposition 20.7, p. 115.

### `local-system` — Local systems of finitely generated Λ-modules on the étale site

Declaration `DiamondEtaleCohomology:C7/local-system` (definition).

Let Λ be noetherian and U a locally spatial diamond. A sheaf L of Λ-modules on U_ét is a local system (of finitely generated Λ-modules) if there is an étale cover {U_k → U} such that each L|_{U_k} is isomorphic to the constant sheaf of a finitely generated Λ-module.

Construction and proof:

1. Étale-local constancy; for quasicompact U finitely many U_k suffice. Over a local spatial diamond Spa(C, C⁺)/G (C8 point-quotient), local systems on an open neighbourhood are continuous representations of an open subgroup on finitely generated modules (proof of ECD 20.8).

Used by:

- ECD Proposition 20.8: graded pieces j_!(L|_Z) of the filtration of a constructible sheaf
- DiamondEtaleCohomology:C9/finite-field-compact-objects: j_!L for F_ℓ-local systems L are compact

API:

| name | role | statement |
|---|---|---|
| `IsLocalSystem` | constructor | Étale-local constancy with finitely generated values for a sheaf of Λ-modules on U_ét. |
| `IsLocalSystem.isConstructible` | other | On a spatial diamond, a local system is constructible. |
| `IsLocalSystem.pullback` | functoriality | Pullback along any map of locally spatial diamonds preserves local systems. |
| `IsLocalSystem.tensor_hom` | other | Local systems are closed under ⊗ and internal Hom of sheaves, and under kernels and cokernels of maps between them. |
| `IsLocalSystem.ofRep` | constructor | For a quasi-pro-étale presentation Spa(C, O_C) → Spa(C, O_C)/G, continuous G-representations on finitely generated Λ-modules give local systems. |

Unit tests:

- `isLocalSystem_constant` (degenerate): The constant sheaf Λ^n is a local system.
- `isLocalSystem_finite_etale` (computation): For a finite étale Galois G-cover V → U and a finitely generated Λ[G]-module M, the sheaf of G-equivariant maps V → M is a local system, trivialized on V.
- `isLocalSystem_point` (compatibility): On Spa(C, O_C) local systems are finitely generated Λ-modules, i.e. constant sheaves.
- `isLocalSystem_not` (non-example): For a rank-2 point Y = Spa(C, C⁺) with open generic point j and Λ ≠ 0, j_!Λ is constructible but not a local system (stalks Λ and 0).

Acceptance:

- On Spa(C, O_C)/G (C8 point-quotient) local systems correspond to continuous G-representations on finitely generated Λ-modules with open stabilizers.

Depends on: `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C7/constructible-sheaf`, `mathlib:Module.Finite`.

Sources:

- ECD, Proposition 20.8, p. 116.

### `support-restriction` — Restriction to a constructible closed subset L|_Z

Declaration `DiamondEtaleCohomology:C7/support-restriction` (construction).

Let U be a locally spatial diamond, Z ⊂ |U| a constructible closed subset with open complement j′ : U ∖ Z → U (a quasicompact open immersion), and L a sheaf of Λ-modules on U_ét. Then L|_Z is the cokernel of the injective map j′_!(L|_{U∖Z}) → L. For complexes A ∈ D_ét(U, Λ), A|_Z is the cone of the counit j′_!j′^∗A → A.

Construction and proof:

1. j′_! is exact and j′^∗j′_! ≅ 𝟭 (C5/open-support-triangle), so the counit is injective on sheaves and its cokernel has zero stalks off Z; the derived version is the cone, which is t-exactly compatible with the sheaf version.

Used by:

- ECD Propositions 20.8 and 20.16: graded pieces j_!(L|_Z)
- DiamondEtaleCohomology:C8/constructible-support-reduction: constructible sheaves supported on one stratum

API:

| name | role | statement |
|---|---|---|
| `supportRestrict` | constructor | For constructible closed Z ⊂ \|U\|, the exact functor L ↦ L\|_Z = coker(j′_!j′^∗L → L) on sheaves of Λ-modules on U_ét. |
| `supportRestrictDerived` | constructor | The triangulated version A ↦ A\|_Z = cone(j′_!j′^∗A → A) on D_ét(U, Λ). |
| `supportRestrict.stalk` | simp | (L\|_Z)_ū = L_ū for u ∈ Z and 0 for u ∉ Z. |
| `supportRestrict.triangle` | relation | j′_!j′^∗A → A → A\|_Z is a distinguished triangle. |
| `supportRestrict.idempotent` | simp | (A\|_Z)\|_Z ≅ A\|_Z, and (A\|_Z)\|_{Z′} ≅ A\|_{Z∩Z′}. |
| `supportRestrict.pullback` | functoriality | For g : U″ → U of locally spatial diamonds, g^∗(A\|_Z) ≅ (g^∗A)\|_{g^{−1}(Z)} (C5/extension-by-zero-base-change). |
| `supportRestrict.etaleShriek` | relation | For étale j : U → Y and a constructible closed W ⊂ \|Y\|, (j_!(A\|_Z))\|_W ≅ j_!(A\|_{Z ∩ j^{−1}(W)}). |
| `supportRestrict.isConstructible` | other | For U spatial and L constructible (noetherian Λ), L\|_Z is constructible (a cokernel of constructible sheaves). |

Unit tests:

- `supportRestrict_all` (degenerate): For Z = |U|, L|_Z = L; for Z = ∅, L|_Z = 0.
- `supportRestrict_point` (computation): For U = Spa(C, C⁺) of rank 2 and Z = {s}, Λ|_Z has stalk Λ at s and 0 at η.
- `supportRestrict_triangle` (characterisation): For A ∈ D_ét(U, Λ), j′^∗(A|_Z) = 0.
- `supportRestrict_not_subsheaf` (non-example): For U = Spa(C, C⁺) of rank 2 and Z = {s}, there is no sub-v-sheaf Z′ ⊂ U with |Z′| = Z, because images of maps from perfectoid spaces are generalizing and {s} is not; so L|_Z cannot be written as i_∗ of a sheaf on a sub-v-sheaf with underlying set Z.

Acceptance:

- L|_Z is a sheaf on U, not on a sub-v-sheaf Z: a constructible closed subset of |U| need not underlie a closed sub-v-sheaf (ECD Remark 19.3).

Depends on: `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `mathlib:Topology.IsConstructible`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`.

Sources:

- ECD, Proposition 20.8, p. 116.

### `constructible-filtration` — Dévissage of constructible sheaves on spatial diamonds ★

Declaration `DiamondEtaleCohomology:C7/constructible-filtration` (theorem).

Let Λ be noetherian and Y a spatial diamond. An étale sheaf F of Λ-modules on Y is constructible if and only if F has a finite filtration whose graded pieces are of the form j_!(L|_Z), where j : U → Y is a quasicompact separated étale map, Z ⊂ |U| a constructible closed subset, and L a local system of finitely generated Λ-modules on U.

Construction and proof:

1. Such filtrations give constructible sheaves (nodes local-system, support-restriction, constructible-abelian).
2. Conversely take a stratification as in 20.6(iii) whose initial unions are quasicompact open and filter F by extensions by zero; reduce to F supported on one constructible locally closed S with f^∗F|_{f^{−1}S} constant. The claim is local (Mayer–Vietoris for two opens), and by Proposition 20.7 can be checked on the localizations Y_y at points y ∈ |Y| (DiamondsAndVStacks D5).
3. For local Y with a quasi-pro-étale surjection Spa(C, C⁺) → Y, F is given by a continuous action of the profinite group G_S (fibre of the relation over the generic point of S) on a finitely generated M; G_S ↪ G_η is a closed subgroup (C8 specialization-stabilizers, from the point quotient C8 point-quotient). Extend the action to an open H ⊂ G_η containing G_S; U = Spa(C, C⁺)/H is separated étale over Y and M defines the required L.

Acceptance:

- Imports the C8 point-quotient and specialization-stabilizer nodes at declaration level (their prerequisites do not involve C7), avoiding a stage-level cycle with C8.

Depends on: `DiamondEtaleCohomology:C7/constructible-spatial-characterisation`, `DiamondEtaleCohomology:C7/constructible-limit-descent`, `DiamondEtaleCohomology:C7/local-system`, `DiamondEtaleCohomology:C7/support-restriction`, `DiamondEtaleCohomology:C8/point-quotient`, `DiamondEtaleCohomology:C8/specialization-stabilizers`, `DiamondEtaleCohomology:C8/point-sheaf-equivalence`, `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondsAndVStacks:D5`.

Sources:

- ECD, Proposition 20.8, p. 115.
- ECD, proof of Proposition 20.8, p. 116.

### `perfect-local-system` — Locally constant complexes with perfect values

Declaration `DiamondEtaleCohomology:C7/perfect-local-system` (definition).

Let Λ be a commutative ring and U a locally spatial diamond. A ∈ D_ét(U, Λ) is locally constant with perfect values if there is a cover {U_k → U} in U_ét such that each A|_{U_k} is isomorphic to the constant complex attached to a perfect complex of Λ-modules. If U is spatial, the cover can be taken to be one quasicompact separated étale surjection U′ → U.

Construction and proof:

1. Perfect complexes of Λ-modules are supplied by their owner (requested); constant complexes come from D(Λ) → D_ét(U, Λ).
2. Such A is dualizable in D_ét(U, Λ): A^∨ = RHom_Λ(A, Λ) is again locally constant with perfect values and A^∨ ⊗^L − ≅ RHom_Λ(A, −), checked locally where A is constant perfect (C3/internal-hom).
3. For spatial U, a cover in U_ét of the quasicompact U has a finite subcover by quasicompact separated étale maps (node C0/etale-site), whose disjoint union is the required U′ → U.

Used by:

- ECD Proposition 20.16(iii): graded pieces j_!(L|_Z) of perfect-constructible complexes
- DiamondEtaleCohomology:C9/perfect-local-system-compact: dualizability gives Hom(j_!L, −) = RΓ(U, L^∨ ⊗ −)

API:

| name | role | statement |
|---|---|---|
| `IsPerfectLocalSystem` | constructor | Local constancy with perfect values for objects of D_ét(U, Λ). |
| `IsPerfectLocalSystem.dualizable` | other | A is dualizable with dual A^∨ = RHom_Λ(A, Λ_U), and A^∨ ⊗^L B ≅ RHom_Λ(A, B). |
| `IsPerfectLocalSystem.pullback` | functoriality | Pullback preserves the property. |
| `IsPerfectLocalSystem.triangle` | other | The property is closed under shifts, cones, extensions, retracts, finite sums, ⊗^L and duals: étale-locally a map between constant perfect complexes P_V → Q_V is the constant map attached to a map of perfect complexes (H^0(V, P^∨ ⊗ Q) has colimit Hom_{D(Λ)}(P, Q) over étale neighbourhoods of a geometric point), and perfect complexes form a thick subcategory. |
| `IsPerfectLocalSystem.isPerfectConstructible` | other | Locally constant complexes with perfect values on a spatial diamond are perfect-constructible. |
| `IsPerfectLocalSystem.exists_qcsep_trivialization` | characterisation | If U is spatial, there is a quasicompact separated étale surjection U′ = ⊔_{k=1}^m U_k → U with A\|_{U_k} constant with perfect value. |

Unit tests:

- `isPerfectLocalSystem_unit` (degenerate): Λ_U is locally constant with perfect values.
- `isPerfectLocalSystem_point` (computation): On Spa(C, O_C), these are exactly the perfect complexes of Λ-modules under D_ét ≃ D(Λ).
- `isPerfectLocalSystem_field` (compatibility): For Λ a field and U a locally spatial diamond, A is locally constant with perfect values iff A is locally bounded (bounded if U is quasicompact) with cohomology sheaves that are local systems of finite-dimensional vector spaces.
- `isPerfectLocalSystem_not_fg` (non-example): The constant complex attached to Λ = Z, module Q (not perfect over Z) is locally constant but not with perfect values.

Acceptance:

- A locally constant complex with perfect values is dualizable, with dual RHom_Λ(A, Λ_U) again locally constant with perfect values.

Depends on: `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C3/internal-hom`, `DiamondEtaleCohomology:C3/etale-tensor`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual-perfect`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-tensor-perfect`, `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C0/geometric-stalk`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-triangle`.

Sources:

- ECD, Proposition 20.16(iii), p. 120.

### `perfect-constructible-std` — Perfect-constructible complexes on a strictly totally disconnected space

Declaration `DiamondEtaleCohomology:C7/perfect-constructible-std` (definition).

Let Λ be any commutative ring and X a strictly totally disconnected perfectoid space. A ∈ D_ét(X, Λ) ≅ D(|X|, Λ) is perfect-constructible if there is a stratification of X into constructible locally closed subsets S_i ⊂ |X| such that A|_{S_i} is the constant complex on S_i attached to a perfect complex of Λ-modules.

Construction and proof:

1. D_ét(X, Λ) = D(X_ét, Λ) = D(|X|, Λ) (C2/etale-test-on-one-cover, C0/std-etale-acyclic); restriction to S_i is derived pullback along S_i ⊂ |X|.

Used by:

- ECD Definition 20.11(ii): perfect-constructibility on small v-stacks is tested on strictly totally disconnected spaces

API:

| name | role | statement |
|---|---|---|
| `IsPerfectConstructibleStd` | constructor | Perfect-constructibility for A ∈ D(\|X\|, Λ), X strictly totally disconnected. |
| `IsPerfectConstructibleStd.pullback` | functoriality | Pullback along maps of strictly totally disconnected spaces preserves the property. |
| `IsPerfectConstructibleStd.refine` | other | The witnessing stratification may be refined, and two witnessing stratifications have a common refinement. |

Unit tests:

- `isPerfectConstructibleStd_point` (computation): For X = Spa(C, O_C), A is perfect-constructible iff RΓ(X, A) is a perfect complex of Λ-modules.
- `isPerfectConstructibleStd_zero` (degenerate): The zero complex is perfect-constructible.
- `isPerfectConstructibleStd_field` (compatibility): For Λ a field, A is perfect-constructible iff A is bounded with constructible cohomology sheaves in the sense of node constructible-sheaf-std.
- `isPerfectConstructibleStd_not` (non-example): For Λ = Z[ε]/(ε²) and X = Spa(C, O_C), the constant sheaf Z = Λ/ε is constructible (finitely generated) but not perfect-constructible, since Λ/ε has infinite projective dimension.

Acceptance:

- For Λ a field, perfect-constructible = bounded with constructible cohomology sheaves on the strictly totally disconnected X.

Depends on: `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `mathlib:Topology.IsConstructible`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`.

Sources:

- ECD, Definition 20.11(i), p. 117.

### `perfect-constructible` — Perfect-constructible complexes on a small v-stack ★

Declaration `DiamondEtaleCohomology:C7/perfect-constructible` (definition).

Let Λ be any commutative ring, Y a small v-stack and A ∈ D_ét(Y, Λ). A is perfect-constructible if for every strictly totally disconnected perfectoid f : X → Y the pullback f^∗A is perfect-constructible (node perfect-constructible-std). D_ét,pc(Y, Λ) is the full subcategory of perfect-constructible complexes. Over a general Λ this is distinct from bounded complexes with constructible cohomology sheaves.

Construction and proof:

1. Tested on one v-cover by a strictly totally disconnected space (node perfect-constructible-v-descent).

Used by:

- ECD Proposition 20.17: compact objects of D_ét(Y, Λ) are the perfect-constructible complexes (DiamondEtaleCohomology:C9/compact-iff-perfect-constructible)
- DiamondSixOperations:S4, S6: smooth perfect-constructibility and biduality over general coefficients
- VStackSheavesAndLisseCategories: lisse and constructible coefficient categories are compared with D_ét,pc

API:

| name | role | statement |
|---|---|---|
| `IsPerfectConstructible` | constructor | Perfect-constructibility of A ∈ D_ét(Y, Λ). |
| `Dpc` | constructor | The full subcategory D_ét,pc(Y, Λ), a thick triangulated subcategory (node perfect-constructible-thick). |
| `IsPerfectConstructible.pullback` | functoriality | Pullback along any map of small v-stacks preserves perfect-constructibility. |
| `IsPerfectConstructible.iff_cover` | characterisation | For a surjection X → Y from a strictly totally disconnected space, A is perfect-constructible iff its pullback is (node perfect-constructible-v-descent). |
| `IsPerfectConstructible.iff_noetherian` | characterisation | For noetherian Λ: locally bounded, constructible cohomology sheaves and perfect geometric stalks at all geometric points Spa(C, C⁺) → Y (node perfect-constructible-stalk-criterion (ii)). |
| `IsPerfectConstructible.etaleShriek` | functoriality | For quasicompact separated étale j and perfect-constructible B on U, j_!B is perfect-constructible. |
| `IsPerfectConstructible.tensor` | other | D_ét,pc(Y, Λ) is closed under ⊗^L and contains Λ_Y. |
| `IsPerfectConstructible.changeOfRings` | functoriality | Extension of scalars Λ′ ⊗^L_Λ − preserves perfect-constructibility (C3/change-of-coefficients). |
| `HasLocallyBoundedTorAmplitude` | other | A ∈ D(Y_v, Λ) has locally bounded Tor amplitude if for every strictly totally disconnected f : X → Y there are a ≤ b with H^i(f^∗A ⊗^L_Λ M) = 0 for all Λ-modules M and i ∉ [a, b]. |
| `IsPerfectConstructible.iff_torAmplitude` | characterisation | For noetherian Λ: A is perfect-constructible iff A ∈ D_ét(Y, Λ) is locally bounded with constructible cohomology sheaves and locally bounded Tor amplitude (node perfect-constructible-stalk-criterion (iii)). |

Unit tests:

- `isPerfectConstructible_unit` (computation): Λ_Y is perfect-constructible.
- `isPerfectConstructible_zero` (degenerate): 0 is perfect-constructible.
- `isPerfectConstructible_field` (compatibility): For Λ = F_ℓ, D_ét,pc(Y, F_ℓ) consists of the locally bounded complexes with constructible cohomology sheaves (node perfect-constructible-over-field).
- `isPerfectConstructible_not_bounded_cons` (non-example): For Λ = Z[ε]/(ε²), the constructible sheaf Λ/ε on Spa(C, O_C) is bounded with constructible cohomology but not perfect-constructible.
- `isPerfectConstructible_not_sum` (non-example): ⊕_{n∈N} Λ_Y (Λ ≠ 0) is not perfect-constructible.

Acceptance:

- Over Λ = F_ℓ and quasicompact Y, D_ét,pc(Y, F_ℓ) is the category of bounded complexes with constructible cohomology sheaves (node perfect-constructible-over-field).

Depends on: `DiamondEtaleCohomology:C7/perfect-constructible-std`, `DiamondEtaleCohomology:C2/etale-derived-category`, `DiamondEtaleCohomology:C3/pullback`.

Sources:

- ECD, Definition 20.11(ii), p. 117.
- ECD, before Definition 20.11, p. 117.

### `perfect-constructible-thick` — Perfect-constructible complexes form a thick subcategory

Declaration `DiamondEtaleCohomology:C7/perfect-constructible-thick` (theorem).

For any commutative ring Λ and small v-stack Y, D_ét,pc(Y, Λ) ⊂ D_ét(Y, Λ) is a thick triangulated subcategory: it contains 0, is closed under shifts, cones and direct summands.

Construction and proof:

1. Reduce to strictly totally disconnected X. Shifts are clear; for a cone of a map A → B choose a common refinement of the stratifications on which both are constant perfect; on a stratum S the map is locally constant (for a constructible locally closed S = U ∩ Z ⊂ |X| with U a quasicompact open, H^i(S, −) = H^i(U, ι_∗ −) = 0 for i > 0 (C0/std-etale-acyclic), so RHom_{D(S)}(P_S, Q_S) = Cont(S, RHom_Λ(P, Q)) for P perfect, and a map of constant perfect complexes is constant on a finite clopen refinement of S), so after a finite clopen refinement the cone is constant perfect. Summands: a summand of a constant perfect complex on S is locally constant with perfect value (a retract of a perfect complex is perfect), and constant after refinement.
2. The source says 'It is clear'; the steps above are the verification.

Acceptance:

- Mathlib has ObjectProperty.IsTriangulated and IsStableUnderRetracts but no thick-subcategory class; the node uses their conjunction.

Depends on: `DiamondEtaleCohomology:C7/perfect-constructible`, `DiamondEtaleCohomology:C7/perfect-constructible-std`, `mathlib:CategoryTheory.ObjectProperty.IsTriangulated`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-triangle`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-retract`, `DiamondEtaleCohomology:C0/std-etale-acyclic`.

Sources:

- ECD, after Definition 20.11, p. 118.

### `perfect-constructible-stalk-criterion` — Perfect-constructibility through cohomology sheaves, stalks and Tor amplitude

Declaration `DiamondEtaleCohomology:C7/perfect-constructible-stalk-criterion` (theorem).

Let Λ be noetherian, Y a small v-stack and A ∈ D_ét(Y, Λ). The following are equivalent. (i) A is perfect-constructible. (ii) A is locally bounded, each cohomology sheaf H^i(A) is constructible, and all geometric stalks of A are perfect complexes of Λ-modules. (iii) A is locally bounded, each cohomology sheaf H^i(A) is constructible, and A has locally bounded Tor amplitude: for every strictly totally disconnected f : X → Y there are a ≤ b such that H^i(f^∗A ⊗^L_Λ M) = 0 for every Λ-module M (as a constant sheaf) and every i ∉ [a, b]. Here locally bounded means that f^∗A is bounded for every strictly totally disconnected f : X → Y, and a geometric stalk is the stalk at the closed point of Spa(C, C⁺) → Y for every algebraically closed C and every open bounded valuation subring C⁺, not only C⁺ = O_C.

Hypotheses:

- Λ noetherian: constructible sheaves (Definition 20.1) are only defined over noetherian Λ, and the pointwise equivalence of (ii) and (iii) uses that over a noetherian ring a bounded complex with finitely generated cohomology is pseudo-coherent.

Construction and proof:

1. ⇒ is clear on a strictly totally disconnected cover. ⇐: reduce to X strictly totally disconnected and then, by stratifying, to a totally disconnected spectral space S (each connected component has a unique closed point) and bounded B with constant finitely generated cohomology sheaves; show B is locally constant by induction on the length, using τ^{<b}B → B → H^b(B)[−b].
2. Key identity: RHom_{D(S,Λ)}(M, C) = Cont(S, RHom_Λ(M, C)) for finitely generated M and bounded C, by a resolution of M by finite free modules (possibly of infinite length; as C is bounded each Ext degree involves only finitely many terms) and H^i(S, C) = Cont(S, H^i(C)) (acyclicity of constructible locally closed subsets, C0/std-etale-acyclic); so the extension class is locally constant, and perfect stalks give perfect values.
3. (ii) ⇔ (iii): stalks commute with f^∗ and with ⊗^L_Λ M, so A has Tor amplitude in [a, b] on X iff every stalk of f^∗A has Tor amplitude in [a, b] (Stacks 0652). Under (ii) or (iii) every stalk is bounded with finitely generated cohomology (constructible cohomology sheaves, local boundedness), hence pseudo-coherent over noetherian Λ (Stacks 066E), and a pseudo-coherent complex is perfect iff it has finite Tor dimension (Stacks 0658). This gives (iii) ⇒ (ii) pointwise. For (i) ⇒ (iii) with a uniform bound: on the quasicompact X the pullback f^∗A is constant with perfect value P_i on each of finitely many strata, and [a, b] containing the Tor amplitudes of the P_i works.

Acceptance:

- Concrete instance: for Λ = Z/ℓ² and Y = Spa(C, O_C), the constant complex Z/ℓ is bounded with constructible cohomology and perfect stalk only if Z/ℓ is a perfect Z/ℓ²-complex, which it is not; so it is not perfect-constructible.
- Higher-rank stalks matter: for Λ = Z/4 and Y = Spa(C, C⁺) of rank 2 with closed point s, A = i_{s∗}(Z/2) is bounded with constructible cohomology and has perfect stalk 0 at the rank-one point, but its stalk Z/2 at s has infinite Tor amplitude over Z/4; A is not perfect-constructible.

Depends on: `DiamondEtaleCohomology:C7/perfect-constructible`, `DiamondEtaleCohomology:C7/constructible-sheaf`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `DiamondsAndVStacks:D1/components-of-totally-disconnected`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`.

Sources:

- ECD, Proposition 20.12, p. 118.
- ECD, proof of Proposition 20.12, p. 118.
- Stacks, Tag 0652 (Definition 15.68.1). Definition of Tor amplitude used in part (iii), applied stalkwise.
- Stacks, Tag 0658 (Lemma 15.76.2). The two conditions the lemma proves equivalent; gives (ii) ⇔ (iii) on stalks.
- Stacks, Tag 066E (Lemma 15.66.17). Over noetherian Λ the stalks of A are pseudo-coherent.

### `perfect-constructible-over-field` — Perfect-constructible complexes with field coefficients

Declaration `DiamondEtaleCohomology:C7/perfect-constructible-over-field` (theorem).

Let Λ be a field (for example F_ℓ) and Y a small v-stack. A ∈ D_ét(Y, Λ) is perfect-constructible if and only if it is locally bounded and all its cohomology sheaves are constructible. In particular, for quasicompact Y, D_ét,pc(Y, F_ℓ) is the category of bounded complexes with constructible cohomology sheaves.

Construction and proof:

1. Over a field every bounded complex with finite-dimensional cohomology is perfect, and the stalks of constructible sheaves are finite dimensional; apply node perfect-constructible-stalk-criterion. Local boundedness is boundedness for quasicompact Y.

Acceptance:

- This is the bounded-constructible equivalence over F_ℓ requested by the C8/C9 part; over a general ring the two notions differ (node perfect-constructible-std, non-example).

Depends on: `DiamondEtaleCohomology:C7/perfect-constructible-stalk-criterion`, `DiamondEtaleCohomology:C7/constructible-sheaf`.

Sources:

- ECD, §1, p. 7. ECD's description of D_cons(Y, F_ℓ) in the introduction; the node derives it from Proposition 20.12.

### `perfect-constructible-v-descent` — v-descent of perfect-constructibility

Declaration `DiamondEtaleCohomology:C7/perfect-constructible-v-descent` (theorem).

Let Λ be a commutative ring, f : Ỹ → Y a surjective map of small v-stacks and A ∈ D_ét(Y, Λ). If f^∗A is perfect-constructible, then A is perfect-constructible.

Construction and proof:

1. Noetherian Λ: A is perfect-constructible by node perfect-constructible-stalk-criterion. f^∗H^i(A) = H^i(f^∗A) is constructible, so H^i(A) is constructible (node constructible-v-descent); A is locally bounded, because for strictly totally disconnected X → Y finitely many strictly totally disconnected pieces of X ×_Y Ỹ cover X and f^∗A is bounded on each; every geometric stalk of A is a geometric stalk of f^∗A, hence perfect.
2. General commutative Λ: reduce to X̃ → X strictly totally disconnected. ECD replaces X̃ by Y ×_{|Y|} |Ỹ| 'to make Ỹ → Y affinoid pro-étale', but that is false in general (DiamondEtaleCohomology/E11): Corollary 7.22 needs |X̃| → |X| ×_{π0 X} π0 X̃ to be an embedding, which fails for X = Spa(C, O_C), X̃ = Spa(C′, C′⁺) of rank 2. The intended route passes first to λ°_X(X̃) (C0/separated-pro-etale-hull), which is affinoid pro-étale over X, and then needs descent of perfect-constructibility along the surjection X̃ → λ°_X(X̃) (a homeomorphism on π0, surjective and monotone on each component chain); that step is recorded as a gap of this packet. Granting it, ECD's argument runs with a presentation of λ°_X(X̃) as a limit of affinoid étale X_j → X, on which the stratification and the comparison maps are defined, X_j → X splitting.

Acceptance:

- Concrete instance: a complex on a spatial diamond whose pullback to a strictly totally disconnected cover is constant with perfect value is perfect-constructible.
- For noetherian Λ the statement is complete; for general commutative Λ it rests on the recorded gap on ECD 20.13.

Depends on: `DiamondEtaleCohomology:C7/perfect-constructible`, `DiamondEtaleCohomology:C7/perfect-constructible-std`, `PerfectoidSpaces:P6/affinoid-pro-etale-map`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondEtaleCohomology:C2/etale-test-on-one-cover`, `DiamondEtaleCohomology:C7/perfect-constructible-stalk-criterion`, `DiamondEtaleCohomology:C7/constructible-v-descent`, `DiamondEtaleCohomology:C0/separated-pro-etale-hull`, `DiamondsAndVStacks:D1/topological-classification-of-pro-etale-maps`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`.

Sources:

- ECD, Proposition 20.13, p. 118.
- ECD, proof of Proposition 20.13, p. 118.

### `perfect-constructible-restricted-compactness` — Restricted compactness of perfect-constructible complexes

Declaration `DiamondEtaleCohomology:C7/perfect-constructible-restricted-compactness` (theorem).

Let Y be a spatial diamond, Λ a commutative ring and A ∈ D_ét(Y, Λ) perfect-constructible. For every filtered direct system C_j ∈ D^{≥−n}_ét(Y, Λ), j ∈ J, uniformly bounded to the left, colim_j Hom_{D_ét(Y,Λ)}(A, C_j) → Hom_{D_ét(Y,Λ)}(A, colim_j C_j) is an isomorphism.

Construction and proof:

1. By descent and boundedness reduce to Y = X strictly totally disconnected; decomposing A into finitely many triangles reduce to A = j_!Λ for a quasicompact open j : U ⊂ X, where the claim is colim RΓ(U_ét, C_j) ≅ RΓ(U_ét, colim C_j), true since U_ét is coherent and the C_j are uniformly bounded below: filtered colimits of sheaves commute with cohomology on the coherent site (D0), and the hypercohomology spectral sequence, with the uniform lower bound, passes this to complexes.
2. The printed statement and proof write F_ℓ for Λ in the categories of the C_j and the Hom groups; the node uses Λ throughout (PAPER-SCHOLZE-17/E57).

Acceptance:

- Routed to C7 by the maintainer (PAPER-SCHOLZE-17/464): the full-faithfulness half of Proposition 20.15 and the last step of 20.16 use it.

Depends on: `DiamondEtaleCohomology:C7/perfect-constructible`, `DiamondEtaleCohomology:C7/perfect-constructible-thick`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C2/v-hyperdescent`.

Sources:

- ECD, Proposition 20.14, p. 119.
- ECD, proof of Proposition 20.14, p. 119.

### `perfect-constructible-limit-fully-faithful` — Full faithfulness of perfect-constructible complexes in cofiltered limits

Declaration `DiamondEtaleCohomology:C7/perfect-constructible-limit-fully-faithful` (theorem).

Let Y_i, i ∈ I, be a cofiltered inverse system of spatial diamonds with inverse limit Y = lim Y_i a spatial diamond, and Λ a commutative ring. Then 2-colim_i D_ét,pc(Y_i, Λ) → D_ét,pc(Y, Λ) is fully faithful. Likewise, for a spatial diamond Y and a filtered colimit of commutative rings Λ = colim Λ_i, 2-colim_i D_ét,pc(Y, Λ_i) → D_ét,pc(Y, Λ) is fully faithful.

Construction and proof:

1. Hom_Y(A, B) = Hom_{Y_{i_0}}(A_{i_0}, f_{i_0∗}B) = Hom(A_{i_0}, colim_i f_{i,i_0∗}B_i) = colim_i Hom(A_i, B_i), using the relative continuity of C0 (Proposition 14.9) and the restricted compactness 20.14 (B is locally bounded).
2. The ring case is proved similarly (as the source says), with Λ_i → Λ base change.

Acceptance:

- Proof order (C7 stage text): this full-faithfulness half is proved first, then Proposition 20.16, then essential surjectivity; no cycle.

Depends on: `DiamondEtaleCohomology:C7/perfect-constructible-restricted-compactness`, `DiamondEtaleCohomology:C0/etale-cohomology-continuity`, `DiamondEtaleCohomology:C3/change-of-coefficients`, `DiamondEtaleCohomology:C7/perfect-constructible`, `DiamondEtaleCohomology:C3/pushforward`.

Sources:

- ECD, Proposition 20.15, p. 119.
- ECD, proof of Proposition 20.15, p. 119.

### `perfect-local-system-limit` — Perfect local systems spread out along cofiltered limits

Declaration `DiamondEtaleCohomology:C7/perfect-local-system-limit` (theorem).

Let Y_i, i ∈ I, be a cofiltered inverse system of spatial diamonds with limit Y = lim Y_i a spatial diamond, and Λ a commutative ring. Every L ∈ D_ét(Y, Λ) that is locally constant with perfect values is isomorphic to the pullback of some L_i ∈ D_ét(Y_i, Λ) that is locally constant with perfect values. The same holds for a spatial diamond Y and a filtered colimit of commutative rings Λ = colim Λ_i.

Construction and proof:

1. Choose a quasicompact separated étale surjection Y′ = ⊔_{k=1}^m Y′_k → Y with L|_{Y′_k} constant with perfect value P_k (node perfect-local-system, IsPerfectLocalSystem.exists_qcsep_trivialization); descend Y′ → Y to some Y′_i → Y_i (ECD Proposition 11.23, D5).
2. L has bounded amplitude, so its descent datum along the Čech nerve of Y′ → Y involves only a finite truncation of the nerve (C2/v-hyperdescent). The constant pieces P_k spread to Y′_i, and the finitely many maps and homotopies of the truncated descent datum spread to some Y_i by full faithfulness (node perfect-constructible-limit-fully-faithful).
3. This is the case 'A = L' of ECD's proof of the essential surjectivity in Proposition 20.15, which uses only the full-faithfulness half; isolating it lets the proof of 20.16 use it without the general essential surjectivity (stage C7's proof-order requirement).

Acceptance:

- Proof order: full faithfulness of 20.15 → this node → 20.16 → essential surjectivity of 20.15; no cycle.

Depends on: `DiamondEtaleCohomology:C7/perfect-constructible-limit-fully-faithful`, `DiamondEtaleCohomology:C7/perfect-local-system`, `DiamondEtaleCohomology:C2/v-hyperdescent`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`.

Sources:

- ECD, proof of Proposition 20.15, pp. 119–120. The spreading-out of a locally constant complex with perfect values, the case A = L of the essential surjectivity of 20.15, isolated as its own node.

### `perfect-constructible-filtration` — Characterizations of perfect-constructible complexes on spatial diamonds ★

Declaration `DiamondEtaleCohomology:C7/perfect-constructible-filtration` (theorem).

Let Λ be a commutative ring, Y a spatial diamond and A ∈ D_ét(Y, Λ). Equivalent: (i) A is perfect-constructible; (ii) there is a stratification of |Y| into constructible locally closed S_i such that for every strictly totally disconnected f : X → Y, f^∗A|_{f^{−1}(S_i)} is constant with perfect value; (iii) A has a finite filtration with graded pieces j_!(L|_Z), j : U → Y quasicompact separated étale, Z ⊂ |U| constructible closed, L ∈ D_ét(U, Λ) locally constant with perfect values.

Construction and proof:

1. (ii) ⇒ (i) and (iii) ⇒ (i) by definition and thickness.
2. (i) ⇒ (ii): take f : X = lim Y_i → Y as in ECD 11.24 (D5); the witnessing stratification of X comes from some |Y_i| with quasicompact opens U_{j,i}; let U_j be their images. The printed inference ('as the image of U_{j,i} ∖ U_{j−1,i} contains U_j ∖ U_{j−1}') does not suffice (PAPER-SCHOLZE-17/E61): lift generalizations along the étale Y_i → Y and the quasi-pro-étale X → Y_i to see that all cospecialization maps of A between points of S_j = U_j ∖ U_{j−1} are isomorphisms; then f^∗A on f^{−1}(S_j), constant with one value B_j on finitely many constructible pieces, is constant after a clopen refinement, and v-descent (node perfect-constructible-v-descent) gives it for every strictly totally disconnected X′ → Y.
3. (ii) ⇒ (iii): as in 20.8, localize (Mayer–Vietoris for two quasicompact opens, then localizations Y_y, using the full-faithfulness half of 20.15 for maps and node perfect-local-system-limit, ECD 11.23 and limits of spectral spaces to spread U, Z and L); for local Y with Spa(C, C⁺) → Y and constant perfect value B on a closed constructible S, pass to the limit over open H ⊂ G_η containing G_S (C8 specialization-stabilizers; full faithfulness of 20.15) to assume G_S = G_η; take the fibre of A over η_S, a complex of discrete G_S = G_η-modules (C8 point-sheaf-equivalence, applied to the open point Y° = Spa(C, O_C)/G_η, in place of ECD's site BG of finite G-sets), and push it forward along {η} ⊂ Y to get Ã locally constant with perfect values restricting to A on S; the map from B is defined on an étale neighbourhood by 20.14 and is an isomorphism there.

Acceptance:

- Uses the repaired (i) ⇒ (ii) argument of PAPER-SCHOLZE-17/E61, the full-faithfulness half of Proposition 20.15 and the spreading-out of perfect local systems (node perfect-local-system-limit), but not the essential surjectivity of 20.15 for general perfect-constructible complexes.

Depends on: `DiamondEtaleCohomology:C7/perfect-constructible-limit-fully-faithful`, `DiamondEtaleCohomology:C7/perfect-constructible-restricted-compactness`, `DiamondEtaleCohomology:C7/perfect-constructible-v-descent`, `DiamondEtaleCohomology:C7/perfect-local-system`, `DiamondEtaleCohomology:C7/support-restriction`, `DiamondEtaleCohomology:C7/perfect-constructible-thick`, `DiamondEtaleCohomology:C8/point-quotient`, `DiamondEtaleCohomology:C8/specialization-stabilizers`, `DiamondEtaleCohomology:C8/point-sheaf-equivalence`, `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondsAndVStacks:D5`, `DiamondEtaleCohomology:C7/perfect-local-system-limit`.

Sources:

- ECD, Proposition 20.16, p. 120.
- ECD, proof of Proposition 20.16, p. 120.

### `perfect-constructible-limit-equivalence` — Perfect-constructible complexes in cofiltered limits of spatial diamonds

Declaration `DiamondEtaleCohomology:C7/perfect-constructible-limit-equivalence` (theorem).

Let Y_i, i ∈ I, be a cofiltered inverse system of spatial diamonds with inverse limit Y = lim Y_i a spatial diamond, and Λ a commutative ring. Then 2-colim_i D_ét,pc(Y_i, Λ) → D_ét,pc(Y, Λ) is an equivalence of categories.

Construction and proof:

1. Full faithfulness is node perfect-constructible-limit-fully-faithful.
2. Essential surjectivity: by 20.16 (node perfect-constructible-filtration) reduce to A = j_!(L|_Z), where U, Z spread by ECD 11.23 and the limit of spectral spaces, j_! and support restriction commute with pullback (C5/extension-by-zero-base-change, C7/support-restriction), and L spreads by node perfect-local-system-limit.

Acceptance:

- Proof order: uses node perfect-constructible-filtration, which itself uses only the full-faithfulness half (node perfect-constructible-limit-fully-faithful).

Depends on: `DiamondEtaleCohomology:C7/perfect-constructible-limit-fully-faithful`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`, `DiamondEtaleCohomology:C2/v-hyperdescent`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondEtaleCohomology:C7/perfect-local-system-limit`, `DiamondEtaleCohomology:C5/extension-by-zero-base-change`, `DiamondEtaleCohomology:C7/support-restriction`.

Sources:

- ECD, proof of Proposition 20.15, p. 119.
- ECD, proof of Proposition 20.15, p. 120.

### `perfect-constructible-ring-colimit` — Perfect-constructible complexes under filtered colimits of coefficient rings

Declaration `DiamondEtaleCohomology:C7/perfect-constructible-ring-colimit` (theorem).

Let Y be a spatial diamond and Λ = colim_i Λ_i a filtered colimit of commutative rings. Then 2-colim_i D_ét,pc(Y, Λ_i) → D_ét,pc(Y, Λ) is an equivalence of categories.

Construction and proof:

1. Full faithfulness: node perfect-constructible-limit-fully-faithful (ring case).
2. Essential surjectivity 'proved similarly': by 20.16 reduce to locally constant L with perfect values on a quasicompact separated étale trivializing cover; perfect complexes over Λ and maps between them descend to some Λ_i (perfect complexes of a filtered colimit of rings), and the finite descent datum descends by full faithfulness. SchemeKTheoryOperations:S.1/perfect-complexes-on-limits applies with S_i = Spec Λ_i through D_QCoh(Spec Λ) ≃ D(Λ).

Acceptance:

- The source does not write this proof out ('the case of rings is proved similarly'); the steps are the analogue of the space case.

Depends on: `DiamondEtaleCohomology:C7/perfect-constructible-limit-fully-faithful`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`, `DiamondEtaleCohomology:C3/change-of-coefficients`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`, `SchemeKTheoryOperations:S.1/perfect-complexes-on-limits`, `DiamondEtaleCohomology:C7/perfect-local-system-limit`.

Sources:

- ECD, Proposition 20.15, p. 119.

## C8. Dimension and cohomological bounds

Objects: topological fibre dimension, the generating and independent topological transcendence degrees, the modified generating degree, dimension of analytic and diamond morphisms, local finiteness of dim.trg, one-point profinite quotient presentations, point cohomological dimension, and the simplicial space of specialization chains with its quasi-augmentation.

Theorems: ECD 21.3 and its modified form, 21.6–21.17, including the finite case of Question 21.4, field-point tests for topological dimension, the spatial bound with arbitrary open vanishing locus, and the prime-to-p geometric bound at maximal points. The analytic branch contains Caraiani–Scholze 4.2.19 and 4.2.21. General monotonicity in ECD Question 21.4 and Fargues–Scholze Problem I.11.1 remain questions.

The early point-quotient, specialization-stabilizer and sheaf-comparison declarations are available before C7's filtrations. They depend only on the geometric suppliers and C0, while the later support-sensitive bound uses C7. Acyclicity is proved once in C0/std-etale-acyclic; the older C8 identifier remains an export for existing references.

Other roadmaps: DiamondsAndVStacks supplies the actual spaces, presentations, point-localization geometry and ordinary topos interfaces; EnhancedDerivedSheaves supplies generic derived-category and cosimplicial interfaces. ProfiniteCohomology and ProfiniteProPGroups supply all-degree continuous cohomology, cohomological dimension and Sylow theory. Accepted RS-05 assigns all-degree Hochschild–Serre to ArithmeticGaloisDuality R02.1 and the coefficient/convergence compatibility to R02.2. AdicEtaleGeometry A2's general-analytic extension remains requested for the partially proper branch.

Coverage: planned. The characteristic-independent approximation, size and valued-amalgamation comparisons, Huber valuation estimates, Temkin primitive perturbation, wild/residue/tame proof interiors, valuation rank comparisons, Scheiderer quasi-augmented descent, and general-analytic valuation-space comparison remain exactly the accepted source boundaries. The assembled reader does not close them.

Planets: **Topological transcendence degree** (`topological-trdeg`); **Modified topological transcendence degree** (`modified-topological-trdeg`); **dim.trg of a morphism** (`diamond-dim-trg`); **Cohomological dimension of points** (`point-cd-geometric-bound`); **Spectral-space cohomological dimension** (`spectral-cohomological-bound`); **Cohomological dimension of a spatial diamond** (`spatial-cohomological-bound`).

### `specialization-dimension` — Dimension through the specialization order

Declaration `DiamondEtaleCohomology:C8/specialization-dimension` (lemma).

For a quasi-sober T0 space X, topologicalKrullDim X equals Order.krullDim of X with its specialization order. Thus on locally spectral spaces it is ECD21.1(i), with empty space valued at minus infinity and unbounded finite chain lengths at plus infinity.

Construction and proof:

1. Apply irreducibleSetEquivPoints and Order.krullDim_eq_of_orderIso. Reversing a finite chain, when comparing the source’s indexing convention, preserves its length.

Acceptance:

- The empty space gives bottom, not zero. A one-point sober space gives zero.

Depends on: `mathlib:topologicalKrullDim`, `mathlib:irreducibleSetEquivPoints`, `mathlib:Order.krullDim_eq_of_orderIso`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition21.1(i), p.122.

### `fibre-dimension` — Topological fibre dimension

Declaration `DiamondEtaleCohomology:C8/fibre-dimension` (definition).

For a map f:X′→X of topological spaces, fibreDimension(f) is the supremum, over x∈X, of topologicalKrullDim of the subspace {x′ | f(x′)=x}, in WithBot ENat. For the spectral maps of locally spectral spaces in ECD21.1(ii), this is its dimension.

Construction and proof:

1. Form the fibre subspaces with their induced topology and take the indexed supremum in the existing complete lattice. Use specialization-dimension to compare the source convention.
2. For ECD21.1(ii), each fibre of a spectral map of locally spectral spaces is the preimage of a pro-constructible point inside spectral opens, hence a pro-constructible subset and itself locally spectral: quasi-sober and T0. Only under that hypothesis does specialization-dimension identify its topologicalKrullDim with the chain length of 21.1(i). For a T0 space that is not quasi-sober the two can differ (an infinite set with the cofinite topology has topological Krull dimension one and no proper specializations), so the comparison is stated for these fibres only.

Used by:

- ECD21.6: Compare topological fibre dimension with modified residue-field dimension.
- DiamondSixOperations:S1: Topological dimension is a separate term in the proper-support estimate.

API:

| name | role | statement |
|---|---|---|
| `fibreDimension_eq_iSup` | characterisation | The invariant is the supremum of the dimensions of the fibre subspaces. |
| `fibreDimension_le_iff` | characterisation | fibreDimension(f)≤d iff every fibre has dimension≤d. |
| `fibreDimension_homeomorph` | compatibility | A commuting square with homeomorphisms on source and target preserves fibreDimension. |
| `fibreDimension_id` | simp | For nonempty X the identity has fibreDimension zero. |

Unit tests:

- `fibreDimension_empty` (degenerate): A map with empty domain has fibreDimension bottom.
- `fibreDimension_identity` (computation): The identity on any nonempty topological space has fibreDimension zero.
- `fibreDimension_toPoint` (compatibility): For f:X→PUnit, fibreDimension(f)=topologicalKrullDim X.
- `fibreDimension_emptyTarget` (degenerate): The unique function from the empty space to itself has fibreDimension bottom, despite being an identity.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `mathlib:topologicalKrullDim`, `DiamondEtaleCohomology:C8/specialization-dimension`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition21.1(ii), p.122.

### `topological-trdeg` — Topological transcendence degree ★

Declaration `DiamondEtaleCohomology:C8/topological-trdeg` (definition).

For an extension K→L of fields with a topology on L, topologicalTrdeg(K,L)∈ENat is the infimum of finite n admitting an intermediate field A⊆L whose underlying subset is dense and whose Algebra.trdeg over K is at most n. If no such finite n exists the value is infinity. ECD21.2 uses this for extensions of complete algebraically closed nonarchimedean fields with their given continuous embeddings.

Construction and proof:

1. Use the existing IntermediateField carrier and Algebra.trdeg; density refers to the subspace inclusion in L. Take the infimum of the corresponding subset of natural numbers embedded in ENat. The least finite bound equals the source’s least attained finite transcendence degree.

Used by:

- ECD21.3: Finite dense generators control towers and base change.
- ECD21.5–21.7: The modified invariant measures completed residue-field extensions.

API:

| name | role | statement |
|---|---|---|
| `topologicalTrdeg_le_iff` | characterisation | For n natural, topologicalTrdeg(K,L)≤n iff some dense intermediate field has Algebra.trdeg≤n. |
| `topologicalTrdeg_le_of_dense` | constructor | A dense intermediate field of algebraic transcendence degree≤n gives the corresponding upper bound. |
| `topologicalTrdeg_eq_top_iff` | characterisation | The value is infinity iff no dense intermediate field has finite algebraic transcendence degree. |
| `topologicalTrdeg_self` | simp | topologicalTrdeg(K,K)=0. |
| `topologicalTrdeg_equiv` | functoriality | A K-algebra equivalence that is a homeomorphism preserves the invariant. |

Unit tests:

- `topologicalTrdeg_self_test` (computation): For any field K with any topology, the identity extension has value zero.
- `topologicalTrdeg_dense_algebraic` (degenerate): If the image of an algebraic intermediate extension A/K is dense in L, the value is zero, even when L/K is not algebraic.
- `topologicalTrdeg_discrete_one` (compatibility): If L has the discrete topology and Algebra.trdeg K L=1, then topologicalTrdeg(K,L)=1.
- `topologicalTrdeg_discrete_infinite` (non-example): For discrete L with infinite algebraic transcendence degree, the value is infinity, not zero.
- `topologicalTrdeg_padicComplex` (computation): topologicalTrdeg(ℚ_p, ℂ_p) = 0: the image of the algebraic closure PadicAlgCl p is a dense intermediate field algebraic over ℚ_p, although Algebra.trdeg ℚ_p ℂ_p is infinite. A definition using the algebraic transcendence degree of the ambient field fails this test.
- `topologicalTrdeg_eq_zero_iff_surjective` (characterisation): For complete algebraically closed nonarchimedean K with an isometric embedding into L, topologicalTrdeg(K,L)=0 iff the embedding is surjective: a dense intermediate field algebraic over the algebraically closed K is K, whose image is closed.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `mathlib:Algebra.trdeg`, `mathlib:IntermediateField`, `mathlib:Dense`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition21.2, p.122.

### `finite-topological-generators` — Finite topological generators

Declaration `DiamondEtaleCohomology:C8/finite-topological-generators` (lemma).

For complete algebraically closed nonarchimedean fields K⊆L and n natural, topologicalTrdeg(K,L)≤n iff there exist n elements of L such that L is the smallest complete algebraically closed subfield of L containing K and those elements.

Construction and proof:

1. For a dense intermediate A/K of transcendence degree at most n, choose a finite transcendence basis and pad its tuple. Any closed algebraically closed intermediate field containing the tuple contains every element algebraic over it, hence A, hence L.
2. Conversely let the tuple have the stated minimality property. The relative algebraic closure of K(tuple) in L is algebraically closed. Its closure is a complete algebraically closed subfield by the characteristic-independent coefficient/root approximation in Conrad §2. Minimality makes that closure L, so the relative algebraic closure is a dense intermediate field of degree at most n.
3. For the approximation step, approximate a monic polynomial by same-degree monic polynomials over the dense algebraically closed subfield. Their roots are uniformly bounded. Give the finite splitting extension of the complete field Mathlib's spectral norm (spectralNorm.normedField); by spectralNorm_extends it restricts to the original norm. A subsequence of the approximate roots tends to one of the finitely many roots there, so it is Cauchy in the complete base field and its limit is that root. Conrad's argument uses no separability, unlike the CharZero-only IsAlgClosed.of_denseRange.

Acceptance:

- The case n=0 is compatible with a complete algebraically closed base. Complete and algebraically closed are both retained.

Depends on: `DiamondEtaleCohomology:C8/topological-trdeg`, `mathlib:spectralNorm.normedField`, `mathlib:spectralNorm_extends`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), After Definition21.2 and proof of Lemma21.3, p.122; [CONRAD](https://math.stanford.edu/~conrad/248APage/handouts/algclosurecomp.pdf), Theorem 1.1 and §2, pp.1–3.

### `topological-trdeg-tower` — Topological transcendence degree in a tower

Declaration `DiamondEtaleCohomology:C8/topological-trdeg-tower` (lemma).

For complete algebraically closed nonarchimedean fields K⊆L⊆M, topologicalTrdeg(K,M)≤topologicalTrdeg(L,M)+topologicalTrdeg(K,L) in ENat.

Construction and proof:

1. An infinite term makes the inequality automatic. For finite terms combine two finite lists from finite-topological-generators.
2. Any complete algebraically closed subfield containing the combined list contains L and then M. Apply finite-topological-generators again.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/finite-topological-generators`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Lemma21.3(i) and proof, p.122.

### `topological-trdeg-base-change` — Topological transcendence degree after dense compositum

Declaration `DiamondEtaleCohomology:C8/topological-trdeg-base-change` (lemma).

For a commutative square of continuous embeddings K⊆K′ and L⊆L′ of complete algebraically closed nonarchimedean fields, with K′ embedded in L′ and the relative algebraic closure of LK′ dense in L′, topologicalTrdeg(L,L′)≤topologicalTrdeg(K,K′).

Construction and proof:

1. Choose finite topological generators of K′ over K when the bound is finite.
2. The smallest complete algebraically closed subfield of L′ containing L and the generators contains K′; the density assumption then makes it L′.

Acceptance:

- An arbitrary unrelated square without dense algebraic compositum is not admitted.

Depends on: `DiamondEtaleCohomology:C8/finite-topological-generators`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Lemma21.3(ii) and proof, p.122.

### `topological-independence-degree` — Topological algebraic independence and its degree

Declaration `DiamondEtaleCohomology:C8/topological-independence-degree` (definition).

For a field extension K→L with a topology on L, a set S⊆L is topologically algebraically independent over K (Temkin's topgebraically independent) if no x∈S lies in the closure in L of the set of elements of L algebraic over the intermediate field K(S∖{x}). topologicalIndependenceDegree(K,L)∈ENat is the supremum of the cardinalities of finite topologically algebraically independent sets. For complete algebraically closed nonarchimedean L that closure is the completed algebraic closure of K(S∖{x}) inside L, so this is Temkin's top.tr.deg(L/K) whenever the latter is finite.

Construction and proof:

1. Use IntermediateField.adjoin K (S∖{x}), the set of elements of L algebraic over it, and its topological closure in L; take the supremum in ENat over finite independent sets.
2. In a complete algebraically closed L the elements algebraic over a subfield F form an algebraic closure of F, whose closure is the completed algebraic closure; membership in it is Temkin's topgebraicity (§2.1.4).

Used by:

- ECD, paragraph after Question 21.4: Temkin's monotonic invariant through which the finite case of the question is answered.
- Temkin, Theorems 3.2.1 and 3.2.3: Compared with the generating degree, which is ECD's tr.c.

API:

| name | role | statement |
|---|---|---|
| `topologicalIndependenceDegree_le_iff` | characterisation | For n natural, topologicalIndependenceDegree(K,L)≤n iff every finite topologically algebraically independent set has at most n elements. |
| `IsTopAlgIndependent.algebraicIndependent` | relation | A topologically algebraically independent set is algebraically independent over K, since an element algebraic over K(S∖{x}) lies in the closure of the algebraic elements. |
| `IsTopAlgIndependent.mono` | structure | A subset of a topologically algebraically independent set is topologically algebraically independent. |
| `topologicalIndependenceDegree_self` | simp | topologicalIndependenceDegree(K,K)=0: every element of K is algebraic over K. |

Unit tests:

- `topologicalIndependenceDegree_padicComplex` (computation): topologicalIndependenceDegree(ℚ_p, ℂ_p)=0 because the algebraic closure of ℚ_p is dense in ℂ_p, although ℂ_p has infinite algebraic transcendence degree over ℚ_p.
- `isTopAlgIndependent_discrete` (compatibility): If L has the discrete topology, a set is topologically algebraically independent over K iff it is algebraically independent over K.
- `isTopAlgIndependent_singleton` (characterisation): {x} is topologically algebraically independent over K iff x is not in the closure of the elements of L algebraic over K.

Acceptance:

- Temkin's degree is a cardinal; only its finite values are used, through independent-le-generating-degree.

Depends on: `mathlib:IntermediateField`, `mathlib:IsAlgebraic`.

Source: [TEMKIN](https://arxiv.org/pdf/1610.09162v2), §2.1.6, p.5.

### `independent-le-generating-degree` — Temkin's comparison of independent and generating degrees

Declaration `DiamondEtaleCohomology:C8/independent-le-generating-degree` (theorem).

Let K⊆L⊆M be complete algebraically closed nonarchimedean fields with isometric embeddings. (a) topologicalIndependenceDegree(K,M)≤topologicalTrdeg(K,M). (b) If topologicalTrdeg(K,M) is finite, the two are equal. (c) topologicalIndependenceDegree(K,L)≤topologicalIndependenceDegree(K,M).

Additional hypotheses:

- All field inclusions preserve the given nonarchimedean absolute values.

Construction and proof:

1. (a) Temkin 3.2.1. By finite-topological-generators, a finite bound n on topologicalTrdeg(K,M) gives a tuple T of length n such that the algebraic closure of K(T) is dense in M. For a finite independent S, density gives an α-perturbation S′ of S inside that algebraic closure; by Temkin 3.1.9, through Lemma 3.1.6 (Temkin 2010, Lemma 6.3.2), S′ is again topologically algebraically independent, hence algebraically independent, so |S|=|S′|≤n.
2. (b) Temkin 3.2.3 and Remark 2.1.10(i). Removing elements from a finite generating tuple until it is minimal makes it topologically algebraically independent, giving the reverse inequality.
3. (c) Temkin Lemma 2.2.2. A set in L independent over K stays independent in M: L is algebraically closed and complete, so the elements of M algebraic over K(S∖{x}) lie in L and their closure in M equals the closure in L.

Acceptance:

- For L=K both degrees are 0. Equality is not asserted without finiteness: Temkin, Theorem 5.3.5 and Remark 2.1.10(iii), constructs an extension with independent degree 1 and infinite generating degree.

Depends on: `DiamondEtaleCohomology:C8/topological-independence-degree`, `DiamondEtaleCohomology:C8/finite-topological-generators`.

Source: [TEMKIN](https://arxiv.org/pdf/1610.09162v2), Theorem 3.2.1, p.8; [TEMKIN](https://arxiv.org/pdf/1610.09162v2), Remark 2.1.10(i) and Theorem 3.2.3, pp.5 and 8; [TEMKIN](https://arxiv.org/pdf/1610.09162v2), Lemma 2.2.2, p.6.

### `topological-trdeg-finite-monotonicity` — Finite topological transcendence degree is monotone

Declaration `DiamondEtaleCohomology:C8/topological-trdeg-finite-monotonicity` (theorem).

For complete algebraically closed nonarchimedean fields K⊆L⊆M, if topologicalTrdeg(K,L) is finite then topologicalTrdeg(K,L)≤topologicalTrdeg(K,M).

Additional hypotheses:

- All field inclusions preserve the given nonarchimedean valuations.

Construction and proof:

1. If topologicalTrdeg(K,M) is infinite there is nothing to prove.
2. Otherwise topologicalTrdeg(K,L)=topologicalIndependenceDegree(K,L) by part (b) of independent-le-generating-degree, using the finiteness hypothesis on L; this is at most topologicalIndependenceDegree(K,M) by part (c), and at most topologicalTrdeg(K,M) by part (a).

Acceptance:

- Retain the stated finite bound and check the degenerate identity case.

Depends on: `DiamondEtaleCohomology:C8/finite-topological-generators`, `DiamondEtaleCohomology:C8/independent-le-generating-degree`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Paragraph immediately after Question 21.4, p.123; [TEMKIN](https://arxiv.org/pdf/1610.09162v2), Lemma 2.2.2; Theorems 3.2.1 and 3.2.3, pp.6–8.

### `modified-topological-trdeg` — Modified topological transcendence degree ★

Declaration `DiamondEtaleCohomology:C8/modified-topological-trdeg` (definition).

For complete algebraically closed nonarchimedean fields K⊆L, modifiedTopologicalTrdeg(K,L) is the minimum in ENat of topologicalTrdeg(K,E) over further complete algebraically closed valued extensions E of L, with compatible continuous embeddings. Equivalently it is the infimum of finite n admitting such E and a dense intermediate field of E over K of algebraic transcendence degree≤n. The implementation must use a proved universe bound for finite witnesses; it may not simply quantify over a proper class.

Construction and proof:

1. Use the finite-witness predicate on natural numbers and take its infimum. The value is infinity if there is no finite witness.
2. Finite-witness size reduction is required before choosing a universe of extension fields; this is recorded as a gap.

Used by:

- ECD21.5–21.7: Makes residue-field dimension insensitive to enlargement of representatives.
- ECD21.16: The valuation lower bound survives further extensions and therefore descends to this minimum.

API:

| name | role | statement |
|---|---|---|
| `modifiedTopologicalTrdeg_le_iff` | characterisation | A finite bound n is equivalent to a further extension with topologicalTrdeg at most n. |
| `modifiedTopologicalTrdeg_le` | relation | modifiedTopologicalTrdeg(K,L)≤topologicalTrdeg(K,L), using E=L. |
| `modifiedTopologicalTrdeg_mono` | functoriality | For K⊆L⊆M, modifiedTopologicalTrdeg(K,L)≤modifiedTopologicalTrdeg(K,M). |
| `modifiedTopologicalTrdeg_equiv` | compatibility | Compatible topological valued-field equivalences preserve the invariant. |

Unit tests:

- `modifiedTopologicalTrdeg_identity` (computation): The identity extension has value zero.
- `modifiedTopologicalTrdeg_zeroWitness` (degenerate): Any further extension E with topologicalTrdeg(K,E)=0 forces modifiedTopologicalTrdeg(K,L)=0.
- `modifiedTopologicalTrdeg_noFiniteWitness` (non-example): If every further extension has infinite topologicalTrdeg over K, the modified invariant is infinity.
- `modifiedTopologicalTrdeg_vsOriginal` (compatibility): When every further extension E satisfies topologicalTrdeg(K,L)≤topologicalTrdeg(K,E), the modified and original invariants agree; this monotonicity is an explicit hypothesis, not an unconditional theorem.
- `modifiedTopologicalTrdeg_eq_zero_iff_surjective` (characterisation): For an isometric extension K⊆L of complete algebraically closed nonarchimedean fields, modifiedTopologicalTrdeg(K,L)=0 iff L=K: a further extension E with topologicalTrdeg(K,E)=0 is K and contains L.
- `modifiedTopologicalTrdeg_eq_one` (computation): If topologicalTrdeg(K,L)=1 then modifiedTopologicalTrdeg(K,L)=1, without Temkin's theorem: the value is at most 1 by modifiedTopologicalTrdeg_le and is not 0 because L≠K. A definition that is always zero, or that takes a supremum over further extensions, fails this test.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/topological-trdeg`, `DiamondsAndVStacks:D0/completion-cardinality-bound`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Paragraph before Definition21.5, p.123.

### `modified-trdeg-finite-equality` — The modified and original finite degrees agree

Declaration `DiamondEtaleCohomology:C8/modified-trdeg-finite-equality` (theorem).

For a complete algebraically closed nonarchimedean extension K⊆L with finite topologicalTrdeg(K,L), modifiedTopologicalTrdeg(K,L)=topologicalTrdeg(K,L).

Additional hypotheses:

- All field inclusions preserve the given nonarchimedean valuations.

Construction and proof:

1. The identity further extension gives the upper bound. Every further extension E has degree at least the finite degree of L by topological-trdeg-finite-monotonicity.
2. Take the infimum over those extensions for the lower bound. This does not assert equality when the original degree is infinite.

Acceptance:

- Retain the stated finite bound and check the degenerate identity case.

Depends on: `DiamondEtaleCohomology:C8/modified-topological-trdeg`, `DiamondEtaleCohomology:C8/topological-trdeg-finite-monotonicity`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Finite-degree paragraph and modified invariant before Definition 21.5, p.123.

### `modified-trdeg-tower` — Modified transcendence degree in a tower

Declaration `DiamondEtaleCohomology:C8/modified-trdeg-tower` (lemma).

For complete algebraically closed nonarchimedean fields K⊆L⊆M, modifiedTopologicalTrdeg(K,M)≤modifiedTopologicalTrdeg(L,M)+modifiedTopologicalTrdeg(K,L).

Construction and proof:

1. For finite bounds choose witnesses for both minima.
2. Place the witnesses into compatible complete algebraically closed valued extensions using a valued amalgamation argument, then apply topological-trdeg-tower and the defining infimum. The compatible amalgamation and density details are a recorded gap.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/modified-topological-trdeg`, `DiamondEtaleCohomology:C8/topological-trdeg-tower`, `DiamondEtaleCohomology:C8/topological-trdeg-base-change`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Paragraph before Definition21.5, p.123.

### `modified-trdeg-base-change` — Modified transcendence degree after base change

Declaration `DiamondEtaleCohomology:C8/modified-trdeg-base-change` (lemma).

In the commutative square and dense-algebraic-compositum situation of21.3(ii), modifiedTopologicalTrdeg(L,L′)≤modifiedTopologicalTrdeg(K,K′).

Construction and proof:

1. Extend a finite witness above K′ and amalgamate over K′ with L′.
2. Apply topological-trdeg-base-change in the enlarged field and the definition of the modified infimum. The valued amalgamation step shares the explicit gap in modified-trdeg-tower.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/modified-topological-trdeg`, `DiamondEtaleCohomology:C8/topological-trdeg-base-change`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Paragraph before Definition21.5 and Remark21.8, p.123.

### `analytic-dim-trg` — Geometric transcendence dimension of an analytic map

Declaration `DiamondEtaleCohomology:C8/analytic-dim-trg` (definition).

For a map f:X′→X of analytic adic spaces, analyticDimTrg(f)∈WithBot ENat is the supremum over x′∈X′ of modifiedTopologicalTrdeg(C(f(x′)),C(x′)), where C(x) is a completed algebraic closure of the completed residue field. The comparison embeddings must lie over the residue-field map.

Construction and proof:

1. Use the stalkwise valued residue fields of upstream AdicSpaces Layer3, then completion and algebraic closure.
2. Take the pointwise supremum; compare choices through common complete algebraically closed extensions using modified-trdeg-base-change. Choice independence still needs the precise valued embedding argument recorded in the gap list.

Used by:

- ECD21.6: Bounds topological fibre dimension.
- PAPER-CARAIANI-SCHOLZE-17/69: Keep geometric transcendence dimension distinct from the topological Krull dimension of a partially proper analytic space.

API:

| name | role | statement |
|---|---|---|
| `analyticDimTrg_le_iff` | characterisation | analyticDimTrg(f)≤d iff every displayed completed residue-field contribution is≤d. |
| `analyticDimTrg_equiv` | compatibility | Isomorphic analytic morphisms have the same invariant. |
| `analyticDimTrg_empty` | simp | A map with empty source has dimension bottom. |
| `analyticDimTrg_field` | simp | For a map of rank-one algebraically closed field spectra, the invariant equals modifiedTopologicalTrdeg of the field extension. |

Unit tests:

- `analyticDimTrg_empty_test` (degenerate): Empty analytic source gives bottom.
- `analyticDimTrg_identity_point` (computation): The identity of a nonempty algebraically closed field spectrum has dimension zero.
- `analyticDimTrg_field_test` (compatibility): A compatible extension C⊆D of complete algebraically closed fields gives the field invariant on Spa(D,O_D)→Spa(C,O_C).

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/modified-topological-trdeg`, `DiamondEtaleCohomology:C8/modified-trdeg-base-change`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition21.5, p.123.

### `analytic-dimension-bound` — Topological dimension bounded by geometric transcendence dimension

Declaration `DiamondEtaleCohomology:C8/analytic-dimension-bound` (theorem).

For a morphism f of analytic adic spaces, fibreDimension(f)≤analyticDimTrg(f).

Construction and proof:

1. Use the valuative chain/rationalized-value-group estimate from Huber1.8.5(i).
2. Rationalized value groups do not change on passing to completed algebraic closure and embed under extension; combine with the minimum defining modifiedTopologicalTrdeg. The full Huber proof and the completion comparison remain explicit proof inputs to establish.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/fibre-dimension`, `DiamondEtaleCohomology:C8/analytic-dim-trg`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Lemma21.6 and proof, p.123.

### `diamond-dim-trg` — Geometric transcendence dimension of a diamond map ★

Declaration `DiamondEtaleCohomology:C8/diamond-dim-trg` (definition).

For f:Y′→Y of diamonds, choose at each y′ over y a quasi-pro-étale field point Spa(C(y),C(y)+)→Y and a quasi-pro-étale point Spa(C(y′),C(y′)+) of its pullback through y′. diamondDimTrg(f) is the supremum of modifiedTopologicalTrdeg(C(y),C(y′)) over y′ in WithBot ENat. Independence of choices is required. For f representable in diamonds between v-stacks, take the supremum over all diamond base changes X→Y.

Construction and proof:

1. Use D4–D5 field-point and quasi-pro-étale presentations.
2. Compare two representatives in a common pullback using modified-trdeg-base-change; the precise comparison and cutoff independence are recorded proof gaps. Take the point supremum, then the test-object supremum for v-stacks.

Used by:

- DiamondSixOperations:S0: Eligibility requires local finite bounds.
- DiamondSixOperations:S1: A uniform bound controls proper-support pushforward.
- ECD21.16: Bounds maximal-point cohomological dimension.

API:

| name | role | statement |
|---|---|---|
| `diamondDimTrg_le_iff` | characterisation | For diamond maps, the bound d holds iff every point-field contribution is≤d. |
| `diamondDimTrg_vstack` | characterisation | For representable v-stack maps the bound is tested on all diamond base changes. |
| `diamondDimTrg_empty` | simp | Empty source gives bottom. |
| `diamondDimTrg_point` | compatibility | On compatible algebraically closed field points this is the modified field invariant. |
| `diamondDimTrg_representative` | compatibility | Changing the quasi-pro-étale point representatives preserves the value. |

Unit tests:

- `diamondDimTrg_empty_test` (degenerate): Empty source gives bottom.
- `diamondDimTrg_identity_point` (computation): The identity of Spa(C,O_C) has value zero.
- `diamondDimTrg_field_test` (compatibility): Spa(D,O_D)→Spa(C,O_C) gives modifiedTopologicalTrdeg(C,D).
- `diamondDimTrg_bottom` (non-example): Nonempty source has value at least zero, never bottom.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/modified-topological-trdeg`, `DiamondEtaleCohomology:C8/modified-trdeg-base-change`, `DiamondsAndVStacks:D5/relative-representability`, `DiamondsAndVStacks:D5`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition21.7 and Remark21.8, p.123.

### `diamond-dim-base-change` — Geometric transcendence dimension under pullback

Declaration `DiamondEtaleCohomology:C8/diamond-dim-base-change` (lemma).

For f representable in diamonds and any base change g, diamondDimTrg(g* f)≤diamondDimTrg(f).

Construction and proof:

1. For diamond maps apply modified-trdeg-base-change to compatible point fields and take their supremum.
2. For v-stacks every test of the pullback is a test of the original morphism.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/modified-trdeg-base-change`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Remark21.8, p.123.

### `diamond-dim-composition` — Geometric transcendence dimension of a composite

Declaration `DiamondEtaleCohomology:C8/diamond-dim-composition` (lemma).

For composable maps g:Z→Y and f:Y→X representable in diamonds with nonempty Z, diamondDimTrg(f∘g)≤diamondDimTrg(g)+diamondDimTrg(f). For empty Z the composite has bottom dimension; this separates the empty case from arithmetic involving infinity.

Construction and proof:

1. Choose compatible point presentations, apply modified-trdeg-tower, bound both terms by their suprema, then take the supremum over source points and diamond tests.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/modified-trdeg-tower`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Lemma21.3, modified paragraph and Definitions21.5–21.7, pp.122–123.

### `locally-finite-dim-trg` — Local finiteness of geometric transcendence dimension

Declaration `DiamondEtaleCohomology:C8/locally-finite-dim-trg` (definition).

For f representable in locally spatial diamonds, LocallyFiniteDimTrg(f) means that after every locally spatial diamond test X→Y, each point of Y′×_Y X has an open neighborhood W and a natural number d with diamondDimTrg(W→X)≤d. Bounds depend on the neighborhood. For maps of locally spatial diamonds, base-change stability makes this equivalent to the source-neighborhood condition before testing.

Construction and proof:

1. Use source neighborhoods in each locally spatial pullback and require a finite natural bound.
2. Use diamond-dim-base-change and the identity test to compare the two formulations.

Used by:

- DiamondSixOperations:S0: One of the eligibility conditions.
- DiamondSixOperations:S4: Target v-descent retains this as a hypothesis on f itself.

API:

| name | role | statement |
|---|---|---|
| `locallyFiniteDimTrg_of_bound` | constructor | A finite global bound implies the local condition. |
| `locallyFiniteDimTrg_openCover` | characterisation | On locally spatial diamond maps, an open source cover with finite bounds is equivalent to the predicate. |
| `locallyFiniteDimTrg_baseChange` | functoriality | Base change preserves the predicate. |
| `locallyFiniteDimTrg_identity` | simp | Identity morphisms satisfy the predicate. |

Unit tests:

- `locallyFiniteDimTrg_empty` (degenerate): Empty source satisfies the predicate.
- `locallyFiniteDimTrg_identity_test` (computation): The identity has bound zero.
- `locallyFiniteDimTrg_localNotUniform` (non-example): A disjoint union of maps of finite but unbounded component dimensions is locally finite without a uniform global finite bound.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/diamond-dim-base-change`, `DiamondsAndVStacks:D5/relative-representability`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Convention22.1, p.127; Definitions21.7–21.8, p.123.

### `topological-dimension-field-tests` — Topological fibre dimension can be tested on field points

Declaration `DiamondEtaleCohomology:C8/topological-dimension-field-tests` (theorem).

For f:Y′→Y representable in locally spatial diamonds, define its topological fibre dimension as the supremum of fibreDimension(f×Y X) over locally spatial diamond tests X→Y. The same supremum is obtained by restricting to X=Spa(C,C+) for complete algebraically closed perfectoid fields C and open bounded valuation subrings C+.

Construction and proof:

1. Use the geometric field-point/localization presentations of D5 to represent each fibre of a locally spatial diamond test.
2. The fibre topology and its specialization chains are preserved by this point presentation; take the two suprema. The presentation and universe comparisons are imported through an exact D5 request.

Acceptance:

- For a diamond target the identity test recovers its ordinary fibre dimension. Empty source has bottom; every plus ring allowed by the statement is retained.

Depends on: `DiamondEtaleCohomology:C8/fibre-dimension`, `DiamondsAndVStacks:D5`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Remark 21.8, second paragraph, p.123.

### `strictly-disconnected-acyclic` — Étale acyclicity of strictly totally disconnected spaces

Declaration `DiamondEtaleCohomology:C8/strictly-disconnected-acyclic` (lemma).

For strictly totally disconnected perfectoid X, every abelian étale sheaf F has H^i(X_et,F)=0 for i>0.

Construction and proof:

1. Apply DiamondEtaleCohomology:C0/std-etale-acyclic to the quasicompact open U=X. Its exactness of global sections gives the asserted vanishing for every abelian étale sheaf. This C8 identifier is an export of the C0 theorem, retained for existing references; it plans no second proof of étale acyclicity.

Acceptance:

- All abelian étale sheaves are allowed; arbitrary v-sheaves are not asserted acyclic.

Depends on: `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Remark21.14, p.125.

### `qpetale-direct-image` — Degree-zero direct image for quasi-pro-étale maps

Declaration `DiamondEtaleCohomology:C8/qpetale-direct-image` (theorem).

For a quasicompact separated quasi-pro-étale map j:U→Y of locally spatial diamonds, R^i j_et,* F=0 for every abelian étale sheaf F and i>0.

Construction and proof:

1. Use C1 Corollary16.10 and enough points to reduce to a strictly totally disconnected base.
2. D1 Lemma7.19 and D5 quasi-pro-étale representability make the pulled-back source strictly totally disconnected. Apply strictly-disconnected-acyclic.

Acceptance:

- Keep both quasicompact and separated; this proof does not invoke C9.

Depends on: `DiamondEtaleCohomology:C1/etale-base-change-sheaves`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`, `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `DiamondEtaleCohomology:C0/etale-site-enough-points`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Remark21.14, p.125.

### `injection-direct-image` — Degree-zero direct image for a quasicompact injection

Declaration `DiamondEtaleCohomology:C8/injection-direct-image` (lemma).

For a quasicompact injection j:U→Y of locally spatial diamonds, R^i j_et,* F=0 for every abelian étale F and i>0.

Construction and proof:

1. D5 identifies the injection with the subdiamond on a pro-constructible generalizing subset. After pullback to a strictly totally disconnected X that subset of |X| is an intersection of quasicompact open subsets (D0 closure-of-pro-constructible), so the pullback is a cofiltered limit of quasicompact open immersions: affinoid pro-étale and separated over X.
2. Apply qpetale-direct-image.

Acceptance:

- Includes quasicompact open immersions; no blanket assertion about all open immersions.

Depends on: `DiamondEtaleCohomology:C8/qpetale-direct-image`, `DiamondsAndVStacks:D5/injection-and-finite-etale-permanence`, `DiamondsAndVStacks:D0/closure-of-pro-constructible`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Lemma21.13 and proof, p.125.

### `point-quotient` — A one-point diamond as a profinite quotient

Declaration `DiamondEtaleCohomology:C8/point-quotient` (theorem).

A quasiseparated diamond Y with exactly one underlying point is Spa(C,O_C)/G for a complete algebraically closed nonarchimedean field C of characteristic p and a profinite group G acting continuously and faithfully on C.

Construction and proof:

1. Choose a quasi-pro-étale field-point surjection. Its relation is quasicompact by quasiseparatedness and is affinoid pro-étale by D1 Lemma7.19, hence Spa(C,O_C)×S for profinite S.
2. The relation composition, identity and inversion give S a continuous group structure; the second projection gives the faithful field action. Descend the equivalence-relation quotient.

Acceptance:

- Use the sheaf quotient of an equivalence relation; an arbitrary stack quotient is not a substitute.

Depends on: `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D5`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.9 and proof, pp.123–124.

### `point-quotient-unique` — Uniqueness of the profinite point presentation

Declaration `DiamondEtaleCohomology:C8/point-quotient-unique` (lemma).

Two faithful presentations of the same one-point quasiseparated diamond yield isomorphic valued-field/profinite-group pairs. The isomorphism need not be unique.

Construction and proof:

1. Their fibre product is affinoid pro-étale over both field points. Choosing a point gives an isomorphism of fields over Y.
2. Recover each group as the automorphism group of its covering map.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/point-quotient`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.9, uniqueness paragraph, p.124.

### `point-sheaf-equivalence` — Sheaves at a diamond point as discrete modules

Declaration `DiamondEtaleCohomology:C8/point-sheaf-equivalence` (comparison).

For Y=Spa(C,O_C)/G as in21.9, abelian étale sheaves on Y are equivalent to discrete abelian groups with continuous G-action. Global sections correspond to G-invariants.

Construction and proof:

1. Étale abelian sheaves on the algebraically closed field point are abelian groups.
2. Descent over Spa(C,O_C)×G is a continuous action on that discrete group; the cocycle condition is the action law. Identify invariant sections.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/point-quotient`, `DiamondEtaleCohomology:C0/etale-site`, `DiamondEtaleCohomology:C0/std-etale-acyclic`, `DiamondEtaleCohomology:C0/quasi-pro-etale-pullback-fully-faithful`, `DiamondEtaleCohomology:C0/etale-to-quasi-pro-etale-basis`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Paragraph after Proposition21.9, p.124.

### `point-cohomology` — Point cohomology is canonical continuous cohomology

Declaration `DiamondEtaleCohomology:C8/point-cohomology` (comparison).

Under point-sheaf-equivalence, H^i(Y_et,F) is naturally isomorphic to the underlying abelian group of the pinned continuousCohomology i on the corresponding discrete module through the upstream TopRep dictionary. This holds for all i and commutes with coefficient maps and changes of point presentation.

Construction and proof:

1. The acyclic field cover and Cartan–Leray yield continuous cochains.
2. Use the upstream all-degree comparison to the canonical homogeneous-cochain carrier. Check degree zero against invariants and naturality against coefficient maps.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/point-sheaf-equivalence`, `DiamondEtaleCohomology:C8/strictly-disconnected-acyclic`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `mathlib:continuousCohomology`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), After Proposition21.9, p.124; proof of21.15, p.126.

### `point-cd` — Cohomological dimension at a maximal point

Declaration `DiamondEtaleCohomology:C8/point-cd` (definition).

For a prime ℓ and a maximal point y of a quasiseparated diamond Y, pointCd(ℓ,y)∈ENat is cd_ℓ(G_y) for any faithful presentation Y_y=Spa(C_y,O_Cy)/G_y of the one-point subdiamond Y_y with |Y_y|={y}. The same definition applies at a maximal point of a locally spatial diamond, because Y_y lies in a spatial open neighbourhood and is quasiseparated; 21.16 uses it in that form, and the value does not depend on the neighbourhood. The invariant quantifies over all discrete ℓ-primary torsion modules; no fixed common exponent is imposed.

Construction and proof:

1. Use the maximal-point subdiamond and point-quotient.
2. Apply point-quotient-unique and the supplier’s invariance of cohomological dimension under continuous group isomorphism.

Used by:

- ECD21.11: The supremum over maximal points controls global cohomology.
- ECD21.15: The generic-point value bounds closed-point-supported sheaves.

API:

| name | role | statement |
|---|---|---|
| `pointCd_presentation` | characterisation | For every faithful presentation, pointCd(ℓ,y)=cd_ℓ(G_y). |
| `pointCd_le_iff` | characterisation | The finite bound n is equivalent to vanishing in degrees>n for all ℓ-primary torsion étale sheaves on Y_y. |
| `pointCd_equiv` | compatibility | Isomorphisms of pointed diamonds preserve the invariant. |
| `pointCd_open` | compatibility | For an open subdiamond V⊆Y containing the maximal point y, pointCd computed in V equals pointCd computed in Y. |

Unit tests:

- `pointCd_closedField` (computation): The algebraically closed field point Spa(C,O_C) has value zero.
- `pointCd_presentation_test` (compatibility): For every faithful quotient presentation the value is the upstream cd_ℓ of its profinite group.
- `pointCd_unbounded` (non-example): Nonzero ℓ-primary torsion cohomology in arbitrarily high degrees forces infinite pointCd.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/point-quotient`, `DiamondEtaleCohomology:C8/point-quotient-unique`, `DiamondEtaleCohomology:C8/point-cohomology`, `DiamondsAndVStacks:D5/injection-and-finite-etale-permanence`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition21.10, p.124.

### `specialization-stabilizers` — Closed inclusion of specialization stabilizers

Declaration `DiamondEtaleCohomology:C8/specialization-stabilizers` (lemma).

For a spatial diamond Y whose underlying space is local with closed point s and generic point η, the presentation Spa(C,C+)→Y in21.15 gives profinite groups G_y at the points. If y′ generalizes y, then G_y embeds as a closed subgroup of G_y′; in particular G_s≤G_η.

Construction and proof:

1. The relation is affinoid pro-étale. Its fibre at the unique lift of y is the space of sections over Spa(C,C_y+).
2. Unique generalization induces injective continuous maps of these profinite groups; compact-to-Hausdorff makes the image closed.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/point-quotient`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`, `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondsAndVStacks:D5`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.15, proof first two paragraphs, p.126.

### `closed-point-cohomology` — Cohomology with support at the closed point

Declaration `DiamondEtaleCohomology:C8/closed-point-cohomology` (comparison).

In21.15, an abelian étale sheaf F with zero restriction to Y minus {s} corresponds to a discrete continuous G_s-module, and its cohomology is canonically the continuous cohomology of that module.

Construction and proof:

1. After pullback to Spa(C,C+) the sheaf is supported at the closed point, hence is an abelian group.
2. Descent is precisely the G_s action. Apply Cartan–Leray to identify cohomology, with the same canonical carrier comparison used in point-cohomology.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/specialization-stabilizers`, `DiamondEtaleCohomology:C8/point-cohomology`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.15, last proof paragraph, p.126.

### `closed-point-bound` — Closed-point support and generic-point cohomological dimension

Declaration `DiamondEtaleCohomology:C8/closed-point-bound` (theorem).

For spatial Y with local underlying space, closed point s and generic point η, an ℓ-torsion étale sheaf F vanishing off s satisfies H^i(Y,F)=0 for i>pointCd(ℓ,η).

Construction and proof:

1. Identify cohomology through closed-point-cohomology.
2. Use specialization-stabilizers and the upstream closed-subgroup inequality cd_ℓ(G_s)≤cd_ℓ(G_η).

Acceptance:

- The statement assumes spatiality and the local underlying space; no arbitrary point-support assertion is substituted.

Depends on: `DiamondEtaleCohomology:C8/closed-point-cohomology`, `DiamondEtaleCohomology:C8/specialization-stabilizers`, `DiamondEtaleCohomology:C8/point-cd`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.15, p.126.

### `extension-cd-bound` — Cohomological dimension of a profinite extension

Declaration `DiamondEtaleCohomology:C8/extension-cd-bound` (lemma).

For an exact sequence of profinite groups 1→N→G→Q→1 with N closed and normal and the quotient topology on Q, cd_ℓ(G)≤cd_ℓ(N)+cd_ℓ(Q). The coefficient category is all discrete ℓ-primary torsion modules.

Construction and proof:

1. Instantiate the shared all-degree continuous Hochschild–Serre sequence E2^(a,b)=H^a(Q,H^b(N,M))⇒H^(a+b)(G,M).
2. For finite bounds the E2 terms vanish outside the rectangle a≤cd_ℓ(Q), b≤cd_ℓ(N); use convergence to deduce vanishing above the sum. Infinite bounds are automatic.

Acceptance:

- Identify the edge maps with canonical restriction/inflation, rather than invoking only a five-term sequence.

Depends on: `ArithmeticGaloisDuality:R02.1`, `ArithmeticGaloisDuality:R02.2`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.16, final inequality, p.127.

### `wild-automorphism` — Wild continuous automorphisms in characteristic p

Declaration `DiamondEtaleCohomology:C8/wild-automorphism` (lemma).

Let C be complete algebraically closed nonarchimedean of characteristic p. If a continuous automorphism γ satisfies γ^(n!)→1 pointwise and acts trivially on C×/(1+C°°), then γ^(p^n)→1 pointwise.

Construction and proof:

1. The source passes to the procyclic profinite closure of γ. Establishing the required topology and compactness is an explicit proof obligation in the gap list.
2. Using profinite Sylow, reduce a non-pro-p factor to a pro-ℓ cyclic group for ℓ≠p.
3. If γ(x)≠x, choose y with the size of γ(x)/x−1. The residue of (g(x)/x−1)/y is a nonzero continuous homomorphism to the additive residue field. Triviality on leading terms proves its additivity. A pro-ℓ group has no nontrivial continuous map to this discrete p-torsion group, a contradiction.

Acceptance:

- Both pointwise factorial-power convergence and the leading-term action hypothesis are retained.

Depends on: `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-2-profinite-sylow-theory`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Lemma21.17 and proof, p.127.

### `wild-kernel-pro-p` — The wild kernel is pro-p

Declaration `DiamondEtaleCohomology:C8/wild-kernel-pro-p` (lemma).

For a continuous faithful action of a profinite group G on an algebraically closed complete nonarchimedean field C′ of characteristic p, the closed normal kernel P of its action on C′×/(1+C′°°) is pro-p.

Construction and proof:

1. Each element of P satisfies the factorial-power convergence hypothesis by continuity of the action from a profinite group.
2. The action gives a continuous injection of the compact group G into the Hausdorff group of continuous automorphisms of C′ with the topology of pointwise convergence, hence a homeomorphism onto its image. Pointwise convergence of g^(p^n) to the identity is therefore convergence in G, so every open normal subgroup of P contains g^(p^n) for large n.
3. Apply wild-automorphism to its procyclic closure. Every finite quotient of P has only p-power-order elements, hence is a p-group; use the upstream finite-quotient criterion.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/wild-automorphism`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`, `tauceti:TauCeti.IsProP`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.16, first proof paragraph, p.126.

### `prime-to-p-wild-removal` — Removing a pro-p kernel from cohomological dimension

Declaration `DiamondEtaleCohomology:C8/prime-to-p-wild-removal` (lemma).

For a closed normal pro-p subgroup P of a profinite G and ℓ≠p, cd_ℓ(G)=cd_ℓ(G/P).

Construction and proof:

1. Finite-quotient averaging and the all-degree coefficient-colimit comparison give H^b(P,M)=0 for b>0 and discrete ℓ-primary torsion M.
2. Hochschild–Serre collapses to H^a(G,M)=H^a(G/P,M^P). This yields one inequality; inflate each G/P module to get the reverse.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/extension-cd-bound`, `ArithmeticGaloisDuality:R02.1`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.16, first proof paragraph, p.126.

### `residue-galois-identification` — The residue action as an absolute Galois group

Declaration `DiamondEtaleCohomology:C8/residue-galois-identification` (lemma).

In21.16, for complete algebraically closed C⊆C′ fixed by a continuous faithful profinite G-action, let k⊆k′ be residue fields and I the kernel of the residue action. Then k0′=(k′)^(G/I) is perfect, k′ is its algebraic closure, and G/I identifies topologically with Gal(k′/k0′).

Construction and proof:

1. Continuity of the action on the discrete residue field makes each orbit finite, so every residue element is algebraic over the invariants.
2. The invariant field is perfect since the unique pth root in k′ of an invariant element is invariant.
3. Apply the profinite infinite-Galois correspondence to the faithful action. The precise infinite-Galois proof and its supplier comparison are recorded as unfinished proof work.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/wild-kernel-pro-p`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.16, residue-action paragraph, p.126.

### `residue-cd-bound` — Residue-field transcendence bound

Declaration `DiamondEtaleCohomology:C8/residue-cd-bound` (theorem).

If k is algebraically closed of characteristic p, F/k is a perfect field extension and ℓ≠p, then cd_ℓ(G_F)≤trdeg(F/k), interpreted in ENat, with infinity for infinite transcendence degree.

Construction and proof:

1. Infinite transcendence degree is trivial. Otherwise choose a transcendence basis t_1,…,t_n of F/k. F is algebraic over k(t_1,…,t_n), and passing to its separable part does not change the absolute Galois group, so G_F is a closed subgroup of G_{k(t_1,…,t_n)}; ProfiniteCohomology Layer 11's closed-subgroup monotonicity reduces to the purely transcendental field.
2. Induct on n. For K=k(t_1,…,t_{n−1}) and L=K(t_n), the closed normal subgroup G_{K^s(t_n)} of G_L has quotient G_K, so extension-cd-bound gives cd_ℓ(G_L)≤cd_ℓ(G_{K^s(t_n)})+cd_ℓ(G_K). The base case is cd_ℓ(G_k)=0 for algebraically closed k.
3. G_{K^s(t_n)} is the absolute Galois group of the purely inseparable extension K^alg(t_n). Every finite extension of K^alg(t_n) is the function field of a curve over the algebraically closed field K^alg, so its Brauer group vanishes by Tsen's theorem (Stacks 03RD, 03RF).
4. Vanishing of the ℓ-part of the Brauer group of every finite separable extension gives cd_ℓ≤1 for ℓ≠p (Serre, Galois Cohomology, II.3.1 Proposition 5: Kummer theory plus reduction to a pro-ℓ Sylow subgroup, ProfiniteProPGroups Layer 6). That criterion has not been read here and is the remaining explicit gap of this node; no local-field cd=2 theorem or fixed finite coefficient case is substituted.

Acceptance:

- Algebraic extensions of the algebraically closed base give zero; retain ℓ≠p and the all-discrete-torsion scope.

Depends on: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`, `DiamondEtaleCohomology:C8/extension-cd-bound`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-6-cohomological-dimension-of-pro-p-groups`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.16, residue-field bound, p.126; [STACKS](https://stacks.math.columbia.edu/), Tag 03RF (Lemma 59.67.11), with Tag 03RD (Theorem 59.67.10, Tsen).

### `tame-character-embedding` — The tame-inertia character embedding

Declaration `DiamondEtaleCohomology:C8/tame-character-embedding` (theorem).

In21.16, with rational value groups Γ⊆Γ′ and residue fields k⊆k′, the tame quotient I/P embeds continuously into Hom(Γ′/Γ,μ∞(k)). If r=dim_Q(Γ′/Γ) is finite, this character group is the prime-to-p finite-adele group of rank r. The embedding is a closed embedding because I/P is compact.

Construction and proof:

1. The leading-term exact sequence has kernel k′× and quotient Γ′. An inertia element gives the character [v(x)]↦res(g(x)/x), trivial on Γ and independent of x.
2. The kernel is P. Continuity and profiniteness force the character values to be roots of unity, and these lie in k because k is algebraically closed.
3. Identify characters of the Q-vector group Γ′/Γ with the finite-adele module after a basis choice. The topology and this nontrivial character-group computation require the explicit remaining proof decomposition.

Acceptance:

- Retain arbitrary rational value-group rank until the finite-dimension hypothesis is used; do not replace Γ′/Γ by a cyclic discrete value group.

Depends on: `DiamondEtaleCohomology:C8/wild-kernel-pro-p`, `DiamondEtaleCohomology:C8/residue-galois-identification`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.16, tame-inertia paragraph, p.127.

### `tame-cd-bound` — Cohomological dimension of tame inertia

Declaration `DiamondEtaleCohomology:C8/tame-cd-bound` (lemma).

For ℓ≠p and finite r=dim_Q(Γ′/Γ) in21.16, cd_ℓ(I/P)≤r.

Construction and proof:

1. Use the tame-character-embedding as a closed embedding into (A_f^p)^r.
2. The ℓ-Sylow subgroup of a compact subgroup of (A_f^p)^r is a compact subgroup of Q_ℓ^r, hence a finitely generated torsion-free Z_ℓ-module Z_ℓ^s with s≤r. Its cd_ℓ is that of the whole group by the Sylow equality cd_p_eq_of_isProPSylow of ProfiniteProPGroups Layer 6, and cd_ℓ(Z_ℓ^s)≤s by extension-cd-bound and cd_ℓ(Z_ℓ)=1 (Layer 11: cd_p Ẑ=1, with the Sylow equality). The lattice computation is an explicit unfinished proof input.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/tame-character-embedding`, `DiamondEtaleCohomology:C8/extension-cd-bound`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-6-cohomological-dimension-of-pro-p-groups`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.16, p.127.

### `valuation-transcendence-bound` — Residue and value-group transcendence inequality

Declaration `DiamondEtaleCohomology:C8/valuation-transcendence-bound` (theorem).

For complete algebraically closed nonarchimedean C⊆C′, with residue fields k⊆k′ and value groups Γ⊆Γ′, trdeg(k′/k)+dim_Q(Γ′/Γ)≤modifiedTopologicalTrdeg(C,C′), with finite-cardinal ranks interpreted in ENat and infinite ranks as infinity.

Construction and proof:

1. For a finite set of algebraically independent residue classes and rationally independent value classes modulo the base value group, choose lifts a_i and b_j. A nonzero polynomial in their combined lifts groups by b-monomials. Each nonzero coefficient polynomial in the a_i has value in the base group: scale its coefficients to maximal norm one and use residue independence to prevent cancellation. Distinct b-monomials have distinct values modulo the base group, so the resulting sum cannot cancel. The lifts are algebraically independent.
2. Take suprema of finite residue and rational-rank witnesses to obtain the valuation transcendence inequality for each dense intermediate field. Density preserves residue field and value group, since approximating x with error smaller than |x| preserves its value and its leading residue.
3. Algebraic extensions change residue fields algebraically and value groups only by torsion; completion is immediate in rank one. Thus pass through completed algebraic closures and then further valued extensions, where the two ranks only increase. Apply the finite bound to every witness and take the modified infimum. The detailed rank and topology comparisons are recorded for refinement; the cited Bourbaki proof was not accessible.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/modified-topological-trdeg`, `mathlib:Algebra.trdeg`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.16, final proof paragraph, p.127.

### `point-cd-geometric-bound` — Maximal-point cohomological dimension bound ★

Declaration `DiamondEtaleCohomology:C8/point-cd-geometric-bound` (theorem).

Let f:Y→Spa(C,C+) be a map of locally spatial diamonds, C complete algebraically closed of characteristic p and C+ an open bounded valuation subring. For a maximal point y and prime ℓ≠p, pointCd(ℓ,y)≤diamondDimTrg(f).

Construction and proof:

1. Reduce to Y_y=Spa(C′,O_C′)/G fixing C, using point-quotient and diamond-dim-base-change.
2. Remove the wild pro-p kernel. Apply extension-cd-bound to the residue quotient and tame inertia.
3. Use residue-cd-bound and tame-cd-bound, then valuation-transcendence-bound and the defining point supremum.

Acceptance:

- This is a prime-to-p theorem. Infinite geometric dimension yields no finite bound.
- Concrete instance: for the identity of Spa(C,O_C) both sides are 0.

Depends on: `DiamondEtaleCohomology:C8/point-quotient`, `DiamondEtaleCohomology:C8/point-cd`, `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/diamond-dim-base-change`, `DiamondEtaleCohomology:C8/wild-kernel-pro-p`, `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`, `DiamondEtaleCohomology:C8/residue-galois-identification`, `DiamondEtaleCohomology:C8/residue-cd-bound`, `DiamondEtaleCohomology:C8/tame-cd-bound`, `DiamondEtaleCohomology:C8/valuation-transcendence-bound`, `DiamondEtaleCohomology:C8/extension-cd-bound`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.16, pp.126–127.

### `specialization-chain-space` — The simplicial space of specialization chains

Declaration `DiamondEtaleCohomology:C8/specialization-chain-space` (construction).

For spectral X, form sp_n(X) from tuples (x0,…,xn) for which xi generalizes xj when i≤j, allowing repetitions, with the subspace topology from the product constructible topology. Deleting and repeating coordinates gives a simplicial topological space. The projection γ_n to x0 takes values in the original topology; γ_0 is the quasi-augmentation and the projections are not an ordinary simplicial augmentation. This chain orientation matches KST; reversing chains preserves the dimension convention of ECD21.1.

Construction and proof:

1. Use Mathlib’s constructible-topology synonym and simplicial-object carrier. Form the specialization-chain subtype of the finite product. Specialization is measured in the original topology, not the Hausdorff patch topology.
2. Coordinate restriction along a monotone ordinal map preserves chains and is continuous; coordinate identities prove the functor laws. For spectral X, the specialization relation is patch-closed, so each chain space is profinite using the D0 patch-space theorem.
3. The first-vertex projection is continuous to the original topology. It changes under the face deleting x0, which is why a quasi-augmentation rather than a Cartesian hypercover is required.

Used by:

- Scheiderer Corollary4.6, as invoked in ECD21.11: Computes cohomology using finite specialization chains.
- KST Lemma6.6: Normalization removes chains with repeated vertices.

API:

| name | role | statement |
|---|---|---|
| `specializationChainSpace_zero` | compatibility | The degree-zero space is X with its constructible topology. |
| `specializationChainSpace_face` | projection | The ith face deletes the ith entry. |
| `specializationChainSpace_degeneracy` | constructor | The ith degeneracy repeats the ith entry. |
| `specializationChainSpace_nondegenerate` | characterisation | For a T0 space and a positive-degree chain, absence of an elementary degeneracy preimage is equivalent to pairwise distinct vertices; degree-zero chains are all nondegenerate. |

Unit tests:

- `specializationChainSpace_empty` (degenerate): All degrees are empty for empty X.
- `specializationChainSpace_point` (computation): For a one-point space there is exactly one simplex in every degree and no nondegenerate positive-dimensional simplex.
- `specializationChainSpace_discrete` (non-example): For a two-point discrete space every chain is constant; there is no nondegenerate edge.
- `specializationChainSpace_twoPointChain` (computation): For a two-point spectral chain there is exactly one nondegenerate edge, whereas no nondegenerate simplex exists in degree2.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `mathlib:WithConstructibleTopology`, `mathlib:CategoryTheory.SimplicialObject`, `DiamondsAndVStacks:D0/constructible-topology-profinite`.

Source: [KST](https://arxiv.org/pdf/2407.04378v3), Lemma 6.6 and proof, p.24, citing Scheiderer §2, Remark 2.5, Theorem 4.1 and Proposition 4.7.

### `chain-cohomology-comparison` — Cohomology from the quasi-augmented chain space

Declaration `DiamondEtaleCohomology:C8/chain-cohomology-comparison` (comparison).

For spectral X and abelian sheaf F on X, H*(X,F) is computed by the cosimplicial section complex Γ(sp_n(X),γ_n*F), whose coefficient transition maps use specialization. Its normalized subcomplex has degree-n sections supported on nondegenerate chains.

Construction and proof:

1. Construct the inverse/direct-image adjunction for the quasi-augmentation, including the coefficient transition maps at the face deleting the first vertex.
2. Prove Scheiderer cohomological descent (Remark2.5 and Theorem4.1), then identify the normalization as in Proposition4.7.
3. These are precise unclosed proof tasks: only the application in KST Lemma6.6 has been read, not Scheiderer’s proofs.

Acceptance:

- Do not replace the quasi-augmentation by an ordinary augmentation; the first-vertex coefficient map must be constructed.

Depends on: `DiamondEtaleCohomology:C8/specialization-chain-space`, `EnhancedDerivedSheaves:E2`.

Source: [KST](https://arxiv.org/pdf/2407.04378v3), Lemma 6.6 and proof, p.24, citing Scheiderer §2, Remark 2.5, Theorem 4.1 and Proposition 4.7.

### `spectral-cohomological-bound` — Spectral-space cohomological dimension ★

Declaration `DiamondEtaleCohomology:C8/spectral-cohomological-bound` (theorem).

For spectral X with topologicalKrullDim X≤d, d natural, and any abelian sheaf F on X, H^i(X,F)=0 for i>d.

Construction and proof:

1. Use specialization-dimension to bound lengths of nondegenerate specialization chains by d.
2. Apply chain-cohomology-comparison; the normalized complex is zero in degrees>d because there are no such nondegenerate chains.

Acceptance:

- A nonempty zero-dimensional spectral space has no positive cohomology. The Stacks0A3G proof is corroboration, not a replacement for the required quasi-augmented proof.

Depends on: `DiamondEtaleCohomology:C8/specialization-dimension`, `DiamondEtaleCohomology:C8/chain-cohomology-comparison`.

Source: [KST](https://arxiv.org/pdf/2407.04378v3), Lemma 6.6 and proof, p.24, citing Scheiderer §2, Remark 2.5, Theorem 4.1 and Proposition 4.7.

### `boundary-dimension-drop` — Dimension drop at the boundary of an open stratum

Declaration `DiamondEtaleCohomology:C8/boundary-dimension-drop` (lemma).

In the constructible-stratum reduction of21.11, the boundary B=closure(V minus U) minus V satisfies dim B<dim(Y minus U) whenever the latter dimension is finite and the boundary is nonempty. Here V is quasicompact open and U is the open on which F vanishes.

Construction and proof:

1. The set V minus U is pro-constructible; use D0 closure-of-pro-constructible to lift a point of its boundary to a proper generalization in V minus U.
2. Every finite chain in B can be prolonged by that proper generalization. Compare chain lengths with specialization-dimension. Empty boundary gives bottom separately.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/specialization-dimension`, `DiamondsAndVStacks:D0/closure-of-pro-constructible`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.11, first proof paragraph on p.125.

### `constructible-support-reduction` — Constructible reduction with controlled support

Declaration `DiamondEtaleCohomology:C8/constructible-support-reduction` (lemma).

To prove the21.11 bound for an ℓ-primary torsion sheaf F vanishing on open U, it suffices to treat F=F0/j_U!F0|U with F0 constructible and supported on one locally closed constructible stratum S=V∩Z0, where its pullback to any strictly totally disconnected cover is constant finite ℓ-torsion on the stratum.

Construction and proof:

1. Use filtered-colimit compatibility to reduce to bounded-exponent and constructible coefficients, and dévissage to ℓ-torsion.
2. Use the C7 constructible filtration and the exact extension-by-zero quotient to preserve vanishing on U. Reduce through finite extensions to a single stratum.

Acceptance:

- The stratification is spectral-constructible. An arbitrary point/complement decomposition of a closed disc does not qualify.

Depends on: `DiamondEtaleCohomology:C7/constructible-spatial-characterisation`, `DiamondEtaleCohomology:C7/constructible-filtration`, `DiamondEtaleCohomology:C7/constructible-sheaf-spectral`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C5/open-support-triangle`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.11, proof p.124.

### `local-stalk-bound` — The local stalk bound for topological direct image

Declaration `DiamondEtaleCohomology:C8/local-stalk-bound` (lemma).

In21.11 after constructible-support-reduction and replacement by a closed support Z, for g:Y_et→|Y| the sheaves R^i g_*F vanish for i>sup_y pointCd(ℓ,y), with y ranging over maximal points.

Construction and proof:

1. Check stalks by localization at a point. The local valuative space is a chain of specializations.
2. A closed finite-dimensional part Z of that chain is a finite chain. Take the open of generalizations of its generic point; the support-constant hypothesis makes F→j_*j*F an isomorphism.
3. Use injection-direct-image to replace Y by that open, then apply closed-point-bound. The precise localization/continuity interface is requested from C0 and D5.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/constructible-support-reduction`, `DiamondEtaleCohomology:C8/injection-direct-image`, `DiamondEtaleCohomology:C8/closed-point-bound`, `DiamondEtaleCohomology:C0/etale-cohomology-continuity`, `DiamondEtaleCohomology:C0/geometric-stalk`, `DiamondEtaleCohomology:C0/etale-site-enough-points`, `DiamondsAndVStacks:D5`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.11, final proof paragraph, p.125.

### `spatial-cohomological-bound` — Cohomological dimension of a spatial diamond ★

Declaration `DiamondEtaleCohomology:C8/spatial-cohomological-bound` (theorem).

For a spatial diamond Y, prime ℓ, open U and an ℓ-primary torsion étale sheaf F with F|U=0, H^i(Y,F)=0 for i>dim(|Y| minus |U|)+sup_y pointCd(ℓ,y), where y ranges over maximal points. For empty support the sheaf is zero; if either finite bound fails the assertion supplies no finite vanishing range.

Construction and proof:

1. Use constructible-support-reduction. Write a stratum-supported F as j!F_V and compare it with j_*F_V.
2. The cokernel is supported on the boundary, whose dimension drops by boundary-dimension-drop. The long exact sequence and induction reduce to closed support.
3. Apply the Leray sequence for Y_et→|Y|. Use local-stalk-bound vertically and spectral-cohomological-bound on the closed support horizontally.

Acceptance:

- The induction includes general U, even when the desired application has U empty. This does not assert the3d compactification theorem owned by S1.
- Concrete instance: for Y=Spa(C,O_C), with one point, dimension 0 and trivial point group, the bound gives H^i=0 for i>0.

Depends on: `DiamondEtaleCohomology:C8/constructible-support-reduction`, `DiamondEtaleCohomology:C8/boundary-dimension-drop`, `DiamondEtaleCohomology:C8/injection-direct-image`, `DiamondEtaleCohomology:C8/local-stalk-bound`, `DiamondEtaleCohomology:C8/spectral-cohomological-bound`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition21.11 and Remark21.12, pp.124–125.

### `partially-proper-closure-dimension` — Dimension of a rank-one closure in a partially proper adic space

Declaration `DiamondEtaleCohomology:C8/partially-proper-closure-dimension` (theorem).

Let X be an adic space partially proper over Spa(K,O_K), K complete nonarchimedean with residue field k. For rank-one x∈X, the topological dimension of closure{x} equals trdeg(k(x)/k), where k(x) is the residue field of O_K(x) for the completed residue field K(x).

Construction and proof:

1. The valuative partial-properness criterion identifies closure{x} with the Zariski–Riemann space of k(x)/k.
2. Its dimension is the algebraic transcendence degree. Both the precise valuation-space comparison and its dimension proof are explicit missing proof decompositions; CS17 gives this route in one paragraph.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/specialization-dimension`, `AdicEtaleGeometry:A2`, `mathlib:Algebra.trdeg`.

Source: [CS17](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Proposition4.2.19 and proof, pp.711–712.

### `partially-proper-dimension` — Dimension of a partially proper adic space

Declaration `DiamondEtaleCohomology:C8/partially-proper-dimension` (theorem).

For X partially proper over Spa(K,O_K), dim X is the supremum of trdeg(k(x)/k) over its points. The supremum convention includes empty X and infinite dimension; any asserted finite maximum must be justified by attainment.

Construction and proof:

1. Every point of an analytic adic space generalizes to a rank-one point; each finite specialization chain therefore lies below one.
2. Apply partially-proper-closure-dimension and take the supremum. The source writes maximal transcendence degree; this plan uses the uniform supremum convention of21.1.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/partially-proper-closure-dimension`, `AdicEtaleGeometry:A2`.

Source: [CS17](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Proposition4.2.19 and proof, pp.711–712.

### `partially-proper-fibre-dimension` — Closure dimension along a partially proper analytic map

Declaration `DiamondEtaleCohomology:C8/partially-proper-fibre-dimension` (theorem).

For a map f:X→Y of partially proper adic spaces over Spa(K,O_K), rank-one x∈X and y=f(x), dim closure_X{x}=dim closure_Y{y}+dim closure_(X_y){x}. Closures here are topological closures; X_y is the fibre over the rank-one point.

Construction and proof:

1. Apply partially-proper-closure-dimension to source, target and fibre.
2. Apply the read baseline trdeg_add_eq to k⊆k(y)⊆k(x). Its conversion from cardinal ranks to ENat, including infinite rank, remains a comparison obligation.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C8/partially-proper-closure-dimension`, `mathlib:Algebra.trdeg`, `AdicEtaleGeometry:A2`, `mathlib:trdeg_add_eq`.

Source: [CS17](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Proposition4.2.21 and proof, p.712.

## C9. Compact objects

Objects and theorems: bounded filtered compactness (ECD 20.9), a single cohomological bound valid for all quasicompact separated étale test objects, left completeness of the ordinary étale derived category, its canonical comparison with D_ét, preservation of coproducts by derived global sections, compact generators j_!Λ, and the characterization of compact objects as perfect-constructible (20.17). For F_ℓ coefficients this is the bounded-constructible criterion of 20.10. The last application derives the common bound d+e from C8's two separate dimension bounds.

For the general coefficient theorem Λ is commutative, matching C7's coefficient convention. The bound is uniform over every coefficient sheaf and all quasicompact separated étale tests. A collection of bounds depending on the object, a nonspatial diamond, or local finite dim.trg without a global cohomological bound does not meet these hypotheses. Prime-to-p is imposed when obtaining the geometric bound from C8, while the conditional compactness theorem itself retains its stated coefficient generality.

Bounded filtered compactness is retained as the finite-field export of C7/perfect-constructible-restricted-compactness, with the perfect-constructible field comparison. C5 supplies exact étale extension by zero; C3 supplies tensor and internal Hom. The finite closure of the compact generators is imported from Tau Ceti DGAInfinity Layer 6, with Layer 5's DG interpretation, and is expressed using Mathlib's ObjectProperty.triangEnvelope. The E2 Postnikov and finite-window nodes are separate from the remaining category-level completeness request, and E3 supplies coproduct/compactness and cutoff compatibility.

Coverage: planned. The same finite cohomological bound is preserved at each step. The accepted E46 source gap inherited through the ordinary/enhanced comparison, the non-noetherian E11 gap inherited through the general-Λ filtration, the external E2/E3/DGAInfinity interfaces, and the omitted suggested signatures remain explicit. Dualizability of perfect local systems is already in C7's API and still needs promotion to a prerequisite lemma under PROTOCOL §4.

Planets: **Compact generators** (`compact-generators`); **Compact étale complexes** (`compact-iff-perfect-constructible`).

### `bounded-filtered-compactness` — Constructible sheaves and bounded filtered colimits

Declaration `DiamondEtaleCohomology:C9/bounded-filtered-compactness` (theorem).

Let Y be spatial and F a constructible étale sheaf of F_ℓ-vector spaces. For a filtered system C_j in D_et(Y,F_ℓ), uniformly in D^{≥−n} for one n, the canonical map colim_j Hom(F[0],C_j)→Hom(F[0],colim_j C_j) is an isomorphism.

Construction and proof:

1. For the field Λ=F_ℓ, the constructible sheaf F concentrated in degree zero is perfect-constructible by DiamondEtaleCohomology:C7/perfect-constructible-over-field.
2. Apply DiamondEtaleCohomology:C7/perfect-constructible-restricted-compactness with A=F[0] and the given single common lower bound. This C9 identifier retains the finite-field statement of Proposition 20.9 as an export of the more general C7 result.

Acceptance:

- A family with no common lower bound is outside this theorem. ℓ need only be prime; no prime-to-p assertion is smuggled into this conditional theorem.

Depends on: `DiamondEtaleCohomology:C7/perfect-constructible-over-field`, `DiamondEtaleCohomology:C7/perfect-constructible-restricted-compactness`, `EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition20.9 and proof, pp.116–117.

### `uniform-test-bound` — The same cohomological bound on étale test objects

Declaration `DiamondEtaleCohomology:C9/uniform-test-bound` (lemma).

Let Λ be a commutative ring and Y spatial. Suppose one natural N satisfies H^i(Y,F)=0 for i>N and every étale Λ-module sheaf F. Then the same N works for every quasicompact separated étale j:U→Y and every étale Λ-module sheaf on U.

Construction and proof:

1. Apply qpetale-direct-image to the underlying abelian sheaf; it is compatible with Λ-module structure.
2. Leray gives H^i(U,F)=H^i(Y,j_*F). Apply the bound on Y, without replacing N by a bound depending on U.

Acceptance:

- The same N must work simultaneously for every test object and every coefficient sheaf.

Depends on: `DiamondEtaleCohomology:C8/qpetale-direct-image`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), First proof paragraphs of20.10 and20.17, pp.117,121.

### `left-completeness` — Left completeness under the uniform bound

Declaration `DiamondEtaleCohomology:C9/left-completeness` (theorem).

For Y and Λ satisfying uniform-test-bound, the unbounded ordinary derived category D(Y_et,Λ) is left-complete.

Construction and proof:

1. Quasicompact separated étale objects form a basis of the site. The same finite cohomological bound holds on this basis.
2. For every complex E the hypothesis of E2 postnikov-finite-cohomological-dimension (the site-level Stacks 0D6P) holds with d=N on the basis of quasicompact separated étale objects, so E→Rlim τ≥−n E is an isomorphism. Category-level left completeness, that every compatible Postnikov tower is the tower of its derived limit, uses the same uniform bound through E2's truncation window and is requested from E2. Stacks 0719 is the ringed-space form and is not cited.

Acceptance:

- This is Postnikov left completion, not the right adjoint to the étale inclusion.

Depends on: `DiamondEtaleCohomology:C9/uniform-test-bound`, `DiamondEtaleCohomology:C0/etale-to-quasi-pro-etale-basis`, `DiamondEtaleCohomology:C0/algebraic-topoi`, `EnhancedDerivedSheaves:E2`, `EnhancedDerivedSheaves:E2/postnikov-finite-cohomological-dimension`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Propositions20.10 and20.17, pp.117,121.

### `ordinary-derived-comparison` — The ordinary and enhanced étale categories agree

Declaration `DiamondEtaleCohomology:C9/ordinary-derived-comparison` (comparison).

Under the same hypotheses, the canonical comparison D(Y_et,Λ)→D_et(Y,Λ) is an equivalence, compatibly with the enhanced ordinary-derived comparison and adequate cutoff changes.

Construction and proof:

1. C2 identifies D_et with the left completion of D(Y_et,Λ), using14.15.
2. Compose with left-completeness; retain the actual comparison natural transformation rather than an unrelated equivalence.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C9/left-completeness`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Propositions20.10 and20.17, pp.117,121.

### `global-sections-coproducts` — Global sections preserves coproducts under a uniform bound

Declaration `DiamondEtaleCohomology:C9/global-sections-coproducts` (lemma).

Under the same hypotheses, for every quasicompact separated étale U→Y, RΓ(U,−) on D(U_et,Λ) commutes with arbitrary coproducts.

Construction and proof:

1. For uniformly bounded-below complexes use coherent-site filtered-colimit compatibility and exactness of coproducts; finite sums are automatic.
2. The same cohomological bound N gives, through E2 postnikov-uniform-window (the site-level Stacks 0D6M), a finite truncation window contributing to each output degree, independent of the family member.
3. Use left completeness and that window estimate to remove the lower bound. The precise general-Λ truncation lemma is requested from E2;20.9 is the F_ℓ precursor, not a proof by itself for arbitrary Λ.

Acceptance:

- Do not exchange an arbitrary product or limit with a coproduct. The finite cohomological window is essential.

Depends on: `DiamondEtaleCohomology:C9/uniform-test-bound`, `DiamondEtaleCohomology:C9/left-completeness`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `EnhancedDerivedSheaves:E2`, `EnhancedDerivedSheaves:E2/postnikov-uniform-window`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Propositions20.10 and20.17, pp.117,121.

### `etale-constant-compact` — Compactness of étale extension-by-zero generators

Declaration `DiamondEtaleCohomology:C9/etale-constant-compact` (lemma).

Under the same hypotheses, j!Λ is compact for every quasicompact separated étale j:U→Y.

Construction and proof:

1. C5 étale adjunction identifies derived Hom(j!Λ,−) with RΓ(U,−).
2. Apply global-sections-coproducts. Exactness identifies the triangulated coproduct criterion with the enhanced compactness criterion supplied by E3.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C9/global-sections-coproducts`, `EnhancedDerivedSheaves:E3`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition20.17, p.121.

### `etale-generators-detect-zero` — Étale test objects detect zero complexes

Declaration `DiamondEtaleCohomology:C9/etale-generators-detect-zero` (lemma).

Under the same hypotheses, if RΓ(U,A)=0 for every quasicompact separated étale U→Y then A=0 in D_et(Y,Λ).

Construction and proof:

1. Use ordinary-derived-comparison.
2. Cohomology sheaves are detected on the coherent étale basis via stalks. Use the uniform truncation estimates to relate the derived-section tests to those stalks, then conservativity of cohomology.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C9/ordinary-derived-comparison`, `DiamondEtaleCohomology:C9/uniform-test-bound`, `DiamondEtaleCohomology:C0/etale-site-enough-points`, `DiamondEtaleCohomology:C0/geometric-stalk`, `DiamondEtaleCohomology:C0/etale-to-quasi-pro-etale-basis`, `EnhancedDerivedSheaves:E2`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition20.17, second proof paragraph, p.121.

### `compact-generators` — Compact generation under bounded cohomological dimension ★

Declaration `DiamondEtaleCohomology:C9/compact-generators` (theorem).

For spatial Y of bounded Λ-cohomological dimension, Λ commutative, D_et(Y,Λ) is compactly generated by a set of objects j!Λ with j ranging over quasicompact separated étale maps to Y in an adequate cutoff skeleton.

Construction and proof:

1. Use etale-constant-compact and etale-generators-detect-zero.
2. Compact generation is meant as in Stacks Definition 13.37.5: a set of compact objects whose shifted Homs detect zero. C0 supplies a set-sized skeleton of the quasicompact separated étale test objects at an adequate cutoff; E3 supplies the compatibility of the compactness criterion when the cutoff is enlarged.

Acceptance:

- Spatiality and a uniform cohomological bound are hypotheses. No Bun_G or solid-sheaf compact-generation theorem follows merely from this declaration.

Depends on: `DiamondEtaleCohomology:C9/etale-constant-compact`, `DiamondEtaleCohomology:C9/etale-generators-detect-zero`, `DiamondEtaleCohomology:C0/etale-to-quasi-pro-etale-basis`, `EnhancedDerivedSheaves:E3`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition20.17, p.121; [STACKS](https://stacks.math.columbia.edu/), Tag 09SQ, Definition 13.37.5.

### `compact-implies-perfect-constructible` — Compact objects are perfect-constructible

Declaration `DiamondEtaleCohomology:C9/compact-implies-perfect-constructible` (lemma).

Under compact-generators, every compact A∈D_et(Y,Λ) is perfect-constructible in the C7 sense.

Construction and proof:

1. The generators j!Λ are perfect-constructible by C7.
2. D(Y_ét,Λ) is the homotopy category of E1's DG model and is generated, through vanishing of all shifted Homs, by the set of compact objects j!Λ. In such a category every compact object lies in the triangulated envelope of the generators, Mathlib's ObjectProperty.triangEnvelope (shifts, finite sums, extensions, retracts): Stacks 13.37.3–13.37.4 in triangulated form, imported in DG form from Tau Ceti DGAInfinity Layers 5–6. This is not within EnhancedDerivedSheaves E3's stated scope.
3. Use C7 stability of perfect-constructibility under shifts, finite sums, cones and retracts, and triangEnvelope_le_iff.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C9/compact-generators`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-6-quasi-equivalence-derived-morita-theory-and-compact-generators`, `mathlib:CategoryTheory.ObjectProperty.triangEnvelope`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`, `DiamondEtaleCohomology:C7/perfect-constructible-thick`, `DiamondEtaleCohomology:C7/perfect-local-system`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition20.17, p.121; [STACKS](https://stacks.math.columbia.edu/), Tag 09SM, Lemmas 13.37.3–13.37.4 and proof of Proposition 13.37.6.

### `perfect-local-system-compact` — Compactness of extensions of perfect local systems

Declaration `DiamondEtaleCohomology:C9/perfect-local-system-compact` (lemma).

Under the same bounded-cohomological-dimension hypotheses, j!L is compact when j:U→Y is quasicompact separated étale and L∈D_et(U,Λ) is locally constant with perfect values.

Construction and proof:

1. C5 adjunction and C3 tensor/Hom identify derived Hom(j!L,−) with RΓ(U,L^∨⊗^L_Λ j*−).
2. Perfect local systems are dualizable and tensoring with L^∨ preserves coproducts by E1/C7.
3. Apply global-sections-coproducts.

Acceptance:

- Retain every stated hypothesis; verify each proof step against its named input.

Depends on: `DiamondEtaleCohomology:C9/global-sections-coproducts`, `DiamondEtaleCohomology:C7/perfect-local-system`, `DiamondEtaleCohomology:C7`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`, `DiamondEtaleCohomology:C3/etale-tensor`, `DiamondEtaleCohomology:C3/internal-hom`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition20.17, end of proof, pp.121–122.

### `perfect-constructible-implies-compact` — Perfect-constructible objects are compact

Declaration `DiamondEtaleCohomology:C9/perfect-constructible-implies-compact` (lemma).

Under the same hypotheses every perfect-constructible A∈D_et(Y,Λ) is compact.

Construction and proof:

1. Import the C7 finite filtration20.16, with pieces j!(L|Z), Z constructible closed in U.
2. Resolve L|Z by the two-term extension-by-zero triangle for U minus Z. Its open immersion is quasicompact because Z is constructible closed.
3. Reduce to perfect-local-system-compact and use stability under finite triangles.

Acceptance:

- An arbitrary closed Z without constructibility does not justify the quasicompact complement step.

Depends on: `DiamondEtaleCohomology:C9/perfect-local-system-compact`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`, `DiamondEtaleCohomology:C7/support-restriction`, `DiamondEtaleCohomology:C5/open-support-triangle`, `DiamondEtaleCohomology:C5/etale-extension-by-zero`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition20.17, last proof paragraph, pp.121–122.

### `compact-iff-perfect-constructible` — Characterization of compact étale complexes ★

Declaration `DiamondEtaleCohomology:C9/compact-iff-perfect-constructible` (theorem).

For a spatial diamond Y of bounded Λ-cohomological dimension, Λ commutative, A∈D_et(Y,Λ) is compact iff A is perfect-constructible.

Construction and proof:

1. Combine compact-implies-perfect-constructible and perfect-constructible-implies-compact.

Acceptance:

- Over a general coefficient ring, bounded constructible is not substituted for perfect-constructible.
- Concrete instance: for Y=Spa(C,O_C) the compact objects of D(Λ) are the perfect complexes of Λ-modules.

Depends on: `DiamondEtaleCohomology:C9/compact-implies-perfect-constructible`, `DiamondEtaleCohomology:C9/perfect-constructible-implies-compact`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition20.17, p.121.

### `finite-field-compact-objects` — Compact complexes with finite-field coefficients

Declaration `DiamondEtaleCohomology:C9/finite-field-compact-objects` (theorem).

For spatial Y with one bound N on H^i(Y,F) for all ℓ-torsion étale sheaves F, A∈D_et(Y,F_ℓ) is compact iff it is bounded with constructible cohomology sheaves.

Construction and proof:

1. Apply compact-iff-perfect-constructible with Λ=F_ℓ.
2. Use C7’s equivalence between perfect-constructible and bounded constructible over a field; finite-dimensional vector spaces have finite projective resolutions.

Acceptance:

- The field-coefficient equivalence must not be exported unchanged to an arbitrary Λ.

Depends on: `DiamondEtaleCohomology:C9/compact-iff-perfect-constructible`, `DiamondEtaleCohomology:C7/perfect-constructible-over-field`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition20.10, p.117.

### `compact-generation-from-dimension-bounds` — Compact generation from finite dimension bounds

Declaration `DiamondEtaleCohomology:C9/compact-generation-from-dimension-bounds` (application).

Let Y be a spatial diamond over Spa(C,C+), C complete algebraically closed perfectoid of characteristic p. Let ℓ≠p be prime and d,e natural with dim |Y|≤d and diamondDimTrg(Y→Spa(C,C+))≤e. Then one bound d+e works for all ℓ-torsion étale sheaves on Y and every qc separated étale test U→Y. Consequently D_et(Y,F_ℓ) is left-complete and compactly generated, with compact objects precisely the bounded constructible complexes.

Construction and proof:

1. Apply point-cd-geometric-bound at every maximal point, then spatial-cohomological-bound with empty U to get d+e.
2. Apply uniform-test-bound to retain that same N on every qc separated étale object, then the C9 comparison, generation and compact-object characterization.

Acceptance:

- Spa(C,O_C) has d=e=0 and recovers perfect complexes over F_ℓ. A union of components with unbounded dimensions fails the uniform-bound hypotheses.

Depends on: `DiamondEtaleCohomology:C8/point-cd-geometric-bound`, `DiamondEtaleCohomology:C8/spatial-cohomological-bound`, `DiamondEtaleCohomology:C9/uniform-test-bound`, `DiamondEtaleCohomology:C9/compact-generators`, `DiamondEtaleCohomology:C9/finite-field-compact-objects`.

Source: [ECD](https://arxiv.org/pdf/1709.07343v4), Propositions 21.11 and 21.16 combined with 20.10, pp.117,124,126.

## Supplier contracts

A node identifier supplies the statement specified at that node, together with its recorded prerequisite boundary. A stage request remains only where the required interface has not yet been assigned a sufficient node. The following contracts are those that remain after the C0–C9 references have been reconciled.

### Contracts retained by C0

**C0.1 — `DiamondsAndVStacks:D0`.** Limits of fibred coherent topoi and their cohomology (SGA 4 VI 8.2–8.3 and 8.7.7): for a cofiltered system of coherent topoi with coherent transition morphisms and an abelian sheaf (resp. a sheaf of groups, of sets) pulled back from one stage, H^j of the limit topos is the colimit of the H^j of the stages (all j, resp. j ≤ 1, resp. j = 0); together with the coherent-topos notion (algebraic topos with qcqs final object) and SGA 4 VI 1.3, 1.17, 2.2, 2.6, 2.8 for categories of small sheaves. The same contract is already requested by ClassicalAdicEtaleCohomology--H0 and PerfectoidSpaces--P0. Also Deligne's theorem (SGA 4 VI 9.0): a locally coherent topos has enough points, used to apply EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi to Y_v,κ. Also: for a cofiltered system of spectral spaces T_i with limit T, Sh(T) = lim Sh(T_i), and every constructible sheaf on T is pulled back from some T_i (SGA 4 VI 8, IX 2.7), used for Lemma 19.4.

Consumers: `DiamondEtaleCohomology:C0/etale-cohomology-continuity`, `DiamondEtaleCohomology:C0/algebraic-topoi`, `DiamondEtaleCohomology:C0/perfectoid-bases-and-coherent-subsites`, `DiamondEtaleCohomology:C5/zariski-riemann-acyclicity`, `DiamondEtaleCohomology:C3/pullback`.

**C0.2 — `DiamondsAndVStacks:D3`.** ECD Lemma 9.5 as a node of its own: for C algebraically closed nonarchimedean with open bounded valuation subring C⁺, a rational open V of a finite-dimensional perfectoid ball over Spa(C, C⁺) with V → Spa(C, C⁺) surjective has a section Spa(C, C⁺) → V; and its consequence over a strictly totally disconnected base X: a rational open of a perfectoid ball over X that is a v-cover of X splits. At present the statement is a side clause of descended-subsets-are-cut-out-by-functions and its formal-scheme proof is a recorded D3 gap.

Consumers: `DiamondEtaleCohomology:C0/v-pullback-higher-vanishing`.

**C0.3 — `DiamondsAndVStacks:D3`.** ECD Propositions 10.9 and 10.10 for maps of v-stacks: f is separated iff it is 0-truncated, quasiseparated and (K, K⁺)-lifts along Spa(K, O_K) ⊂ Spa(K, K⁺) are unique for perfectoid fields K; and for separated f and a perfectoid Tate pair (R, R⁺), a map Spa(R, R⁺) → Y′ over Y is determined by its restriction to Spa(R, R°). Only the perfectoid-space cases exist (PerfectoidSpaces:P4/valuative-criterion-separatedness, P4/separated-unique-extension-from-rank-one-locus).

Consumers: `DiamondEtaleCohomology:C4/valuative-criterion-proper`, `DiamondEtaleCohomology:C4/partially-proper-map`, `DiamondEtaleCohomology:C4/compactification-of-separated-sheaf`, `DiamondEtaleCohomology:C4/canonical-compactification`.

**C0.4 — `DiamondsAndVStacks:D5`.** Converse of ECD 11.20, without spectrality: for a small v-sheaf Y, a surjection X → Y from a totally disconnected perfectoid space, and a subset T ⊂ |Y| whose preimage T_X ⊂ |X| is pro-constructible and generalizing (for example T closed with generalizing preimage), Y_T := Y ×_{|Y|} T is a sub-v-sheaf with Y_T ×_Y X = X_{T_X} (ECD 7.6, 10.5), Y_T → Y is a quasicompact injection and |Y_T| = T. If Y is spatial (resp. a locally spatial diamond and T quasicompact), Y_T is spatial (resp. a spatial diamond). A qcqs v-sheaf need not have spectral |Y| (|T̲| = T for compact Hausdorff T), so the statement may not presume it.

Consumers: `DiamondEtaleCohomology:C4/valuative-criterion-proper`, `DiamondEtaleCohomology:C4/tautness-criterion`.

**C0.5 — `DiamondsAndVStacks:D5`.** Localization Y_y of a spatial diamond at a point y (the limit of its quasicompact open neighbourhoods; |Y_y| is the chain of generalizations of y) and a quasi-pro-étale surjection Spa(C, C⁺) → Y_y with C algebraically closed. This joins the two D5 requests of DiamondEtaleCohomology--C8 for the field-point presentation.

Consumers: `DiamondEtaleCohomology:C7/constructible-filtration`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`.

**C0.6 — `DiamondsAndVStacks:D5`.** For a locally compact Hausdorff space T, the v-sheaf T̲ : X ↦ C(|X|, T) is a small v-sheaf with |T̲| = T, T ↦ T̲ is fully faithful, T̲ is the filtered colimit of K̲ over compact K ⊂ T along closed immersions, and for maps T′ → T and X → T̲ with X perfectoid, |T̲′ ×_T̲ X| = T′ ×_T |X|. DiamondsAndVStacks:D4/compact-hausdorff-diamonds covers compact Hausdorff spaces relative to Spa(K, O_K) only.

Consumers: `DiamondEtaleCohomology:C4/locally-compact-hausdorff-proper`.

**C0.7 — `EnhancedDerivedSheaves:E2`.** Module-coefficient versions of E2/left-completion, E2/replete-postnikov-unit and -counit, E2/inverse-limit-amplitude and E2/unbounded-hypercover-descent: for sheaves of O-modules on a replete ringed topos (in particular the constant ring Λ), D(X, O) is left-complete, R lim of a sequence of module sheaves has amplitude [0, 1], and pullback along a hypercover identifies D(X, O) with the cartesian objects. The current nodes are stated for abelian sheaves.

Consumers: `DiamondEtaleCohomology:C0/left-completeness`, `DiamondEtaleCohomology:C2/v-hyperdescent`, `DiamondEtaleCohomology:C3/qcqs-base-change-finite-cd`, `DiamondEtaleCohomology:C5/compactification-hypercover`.

**C0.8 — `EnhancedDerivedSheaves:E3`.** HTT 5.5.3.12–5.5.3.13: a small limit of presentable ∞-categories along colimit-preserving functors, computed in Cat_∞, is presentable and the projections preserve colimits; and HTT 5.5.2.2: a functor C^op → S on a presentable ∞-category is representable iff it preserves small limits. EnhancedDerivedSheaves:E5:presentability/presentable-categories gives only the definition.

Consumers: `DiamondEtaleCohomology:C2/enhanced-etale-category`, `DiamondEtaleCohomology:C3/internal-hom`.

**C0.9 — `SchemeAndStackFoundations:SF.2`.** The étale topos of a cofiltered limit of qcqs schemes with affine transition maps is the limit of the étale topoi, with étale cohomology the colimit (SGA 4 VII 5.7–5.8), and the proper base change theorem for torsion coefficients on which ClassicalAdicEtaleCohomology:H1:valuation-exports/proper-nearby-cycle-cohomology rests (also listed as UPSTREAM:ECD:SCH_BC in the stage's requires).

Consumers: `DiamondEtaleCohomology:C5/zariski-riemann-acyclicity`.

### Contracts retained by C8

**C8.1 — `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`.** Discrete continuous module dictionary, including invariants, morphisms and exactness, on the canonical TopRep carrier. The equivalence of diamond sheaves with this category is proved in C8.

Consumers: `DiamondEtaleCohomology:C8/point-sheaf-equivalence`.

**C8.2 — `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.** All-degree cohomology of discrete profinite modules on continuousCohomology, its comparison with the continuous Čech/cochain model, finite-quotient and coefficient filtered-colimits, coefficient naturality and dimension shifting.

Consumers: `DiamondEtaleCohomology:C8/point-cohomology`, `DiamondEtaleCohomology:C8/closed-point-cohomology`, `DiamondEtaleCohomology:C8/extension-cd-bound`, `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`, `DiamondEtaleCohomology:C8/residue-cd-bound`.

**C8.3 — `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`.** ENat-valued cd_ℓ on all discrete ℓ-primary torsion modules, its vanishing characterization, invariance under continuous group isomorphism, and monotonicity for closed subgroups.

Consumers: `DiamondEtaleCohomology:C8/point-cd`, `DiamondEtaleCohomology:C8/closed-point-bound`, `DiamondEtaleCohomology:C8/extension-cd-bound`, `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`, `DiamondEtaleCohomology:C8/residue-cd-bound`, `DiamondEtaleCohomology:C8/tame-cd-bound`.

**C8.4 — `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-2-profinite-sylow-theory`.** Existence of pro-ℓ Sylow subgroups and their use inside a procyclic profinite group; retain the continuous subgroup topology.

Consumers: `DiamondEtaleCohomology:C8/wild-automorphism`.

**C8.5 — `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`.** The finite-quotient characterization of pro-p and its closed-subgroup/quotient stability; exclude continuous homomorphisms from a pro-ℓ group to discrete p-torsion groups for distinct primes.

Consumers: `DiamondEtaleCohomology:C8/wild-automorphism`, `DiamondEtaleCohomology:C8/wild-kernel-pro-p`, `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`.

**C8.6 — `ArithmeticGaloisDuality:R02.1`.** As assigned by accepted RS-05, supply the all-degree continuous Hochschild–Serre sequence for a closed normal profinite subgroup and discrete torsion coefficients, converging to the canonical upstream carrier, with edge maps.

Consumers: `DiamondEtaleCohomology:C8/extension-cd-bound`, `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`.

**C8.7 — `ArithmeticGaloisDuality:R02.2`.** As assigned by accepted RS-05, supply the discrete/compact coefficient comparison and the convergence/edge-map compatibility needed when specializing Hochschild–Serre to discrete ℓ-primary torsion modules. No compact-coefficient limit interchange without its convergence hypotheses.

Consumers: `DiamondEtaleCohomology:C8/extension-cd-bound`.

**C8.8 — `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`.** The actual adic carrier, local stalks, residue-field valuations and valuation-compatible maps. Completing and algebraically closing those fields, with compatible embeddings, remains a separate C8 proof obligation.

Consumers: `DiamondEtaleCohomology:C8/analytic-dim-trg`.

**C8.9 — `AdicEtaleGeometry:A2`.** Comparison with the valuative partial-properness criterion of CS17 Remark4.2.20 and rank-one generalizations. CS17 allows general analytic partially proper adic spaces, beyond the supplier’s explicit noetherian scope; the extension of the geometric supplier is recorded in restructure and remains unresolved.

Consumers: `DiamondEtaleCohomology:C8/partially-proper-closure-dimension`, `DiamondEtaleCohomology:C8/partially-proper-dimension`, `DiamondEtaleCohomology:C8/partially-proper-fibre-dimension`.

**C8.10 — `DiamondsAndVStacks:D5`.** Localization of a spatial diamond at a point, its chain of generalizations, and the quasi-pro-étale field-point presentation, with compatibility with the inverse system of quasicompact open neighbourhoods. C0/etale-cohomology-continuity supplies the cohomology-continuity statement once this geometric localization is supplied. Existing D5 presentation/permanence nodes do not supply the complete geometric localization contract.

Consumers: `DiamondEtaleCohomology:C8/local-stalk-bound`.

**C8.11 — `EnhancedDerivedSheaves:E2`.** Object-wise Postnikov convergence under one finite bound on a covering basis is planned as E2/postnikov-finite-cohomological-dimension (site-level Stacks 0D6P) and the uniform truncation window as E2/postnikov-uniform-window; C9 cites both at node level. Still requested from the stage: category-level left completeness of D(Y_ét,Λ) under the same uniform bound (every compatible Postnikov tower is the tower of its derived limit), and generic cosimplicial section complexes, normalization and comparison with sheaf cohomology once C8 proves its quasi-augmented descent theorem. An ordinary Cartesian hypercover theorem does not establish that theorem.

Consumers: `DiamondEtaleCohomology:C9/left-completeness`, `DiamondEtaleCohomology:C9/global-sections-coproducts`, `DiamondEtaleCohomology:C9/etale-generators-detect-zero`, `DiamondEtaleCohomology:C8/chain-cohomology-comparison`.

**C8.12 — `EnhancedDerivedSheaves:E3`.** Identify preservation of coproducts by exact derived Hom with the enhanced compactness criterion (an exact functor between the relevant stable cocomplete categories that preserves coproducts preserves all small colimits), and supply the cutoff comparisons for the set of test objects when the cutoff is enlarged. The thick-closure description of compact objects is outside E3's stated scope and is imported from Tau Ceti DGAInfinity Layer 6.

Consumers: `DiamondEtaleCohomology:C9/etale-constant-compact`, `DiamondEtaleCohomology:C9/compact-generators`.

**C8.13 — `DiamondsAndVStacks:D5`.** Quasi-pro-étale algebraically closed field-point presentations through a given diamond point; localization and preservation of fibre specialization chains. Supply the field-point evaluation in Remark 21.8 and the one-point/local presentation used in 21.9/21.15. The general universally-open presentation node does not alone specify this exact contract.

Consumers: `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/point-quotient`, `DiamondEtaleCohomology:C8/specialization-stabilizers`, `DiamondEtaleCohomology:C8/topological-dimension-field-tests`.

**C8.14 — `tauceti:TauCetiRoadmap/DGAInfinity#layer-6-quasi-equivalence-derived-morita-theory-and-compact-generators`.** For a pretriangulated DG category whose derived category is generated, through vanishing of all shifted Homs, by a set S of compact objects, every compact object lies in the triangulated envelope of S (Mathlib ObjectProperty.triangEnvelope: shifts, finite sums, extensions, retracts), with Layer 5's identification of compact objects and the thick closure. Applied to the DG model of D(Y_ét,Λ) from EnhancedDerivedSheaves E1, with S the objects j!Λ. Triangulated form: Stacks 13.37.3–13.37.4.

Consumers: `DiamondEtaleCohomology:C9/compact-implies-perfect-constructible`.

**C8.15 — `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-6-cohomological-dimension-of-pro-p-groups`.** cd_ℓ G = cd_ℓ G_ℓ for an ℓ-Sylow subgroup G_ℓ of a profinite group (cd_p_eq_of_isProPSylow), used to reduce the cohomological dimension of compact subgroups of (A_f^p)^r and of absolute Galois groups to their pro-ℓ Sylow subgroups.

Consumers: `DiamondEtaleCohomology:C8/tame-cd-bound`, `DiamondEtaleCohomology:C8/residue-cd-bound`.

**C8.16 — `DiamondEtaleCohomology:C7`.** Promote the already planned IsPerfectLocalSystem.dualizable API item of C7/perfect-local-system to a named prerequisite lemma, as PROTOCOL §4 requires: for a commutative coefficient ring Λ and a locally spatial diamond U, every étale locally constant complex L with perfect values is dualizable, with dual RHom_Λ(L,Λ_U), and RHom_Λ(L,A) ≃ L^∨ ⊗^L_Λ A naturally in A. The carrier and proof outline already appear in C7/perfect-local-system; this is an API-granularity task, not a new assertion or an unresolved mathematical theorem.

Consumers: `DiamondEtaleCohomology:C9/perfect-local-system-compact`.


## Source and interface obligations

Every layer is planned at target level. The following exact obligations prevent the corresponding prerequisite chains from being closed. A reference to a supplier node preserves that node's unresolved cases; it does not discharge them. In particular, the higher-degree v-comparison boundary propagates through its C2 comparison, and the general-coefficient perfect-constructibility boundary propagates through the relevant C7 filtration. A noetherian or finite-field specialization may use its separately stated proof route.

### C0.1. Vanishing of R^iλ_Y∗λ_Y^∗F for i ≥ 2 (ECD Proposition 14.7, PAPER-SCHOLZE-17/E46)

ECD represents a minimal nonzero class α ∈ H^i(X_v, λ^∗F) by a Čech cocycle on fibre powers of an affinoid perfectoid v-cover X′ → X. For i ≥ 2 this needs the vanishing of the intermediate v-cohomology of the fibre powers of X′, which the source does not establish (minimality gives vanishing only on strictly totally disconnected spaces, and Proposition 14.8 only identifies those groups with étale cohomology). The case i = 1, hence the statement for sheaves of groups and the quasi-pro-étale comparison, is complete. Repair routes: (a) choose X′ so that the relevant étale groups of its fibre powers vanish; (b) a hypercover version of the approximation-and-splitting step, which needs an input not in ECD: compatibility of λ∘_X with the finite limits forming the matching objects of a strictly totally disconnected v-hypercover, or a hypercover for which λ∘_X(X_•) is a quasi-pro-étale hypercover of X. Lemma 14.5(ii) alone does not suffice, since (cosk_1 X_•)_2 is a limit over X_0 ×_X X_0, which is not strictly totally disconnected (over X = Spa(C, O_C), X_0 = Spa(C_0, O_{C_0}), λ∘(X_2) → (cosk_1 λ∘X_•)_2 can fail to be surjective). The v-part of the bounded-below comparison (14.10) in degrees ≥ 2 depends on this gap.

Consumers: `DiamondEtaleCohomology:C0/v-pullback-higher-vanishing`, `DiamondEtaleCohomology:C0/bounded-below-comparison`, `DiamondEtaleCohomology:C0/unbounded-comparison-std`, `DiamondEtaleCohomology:C2/v-local-etaleness`, `DiamondEtaleCohomology:C2/left-completion-comparison`, `DiamondEtaleCohomology:C2/etale-coreflection-bounded-formula`.

### C0.2. v-descent of perfect-constructibility for non-noetherian Λ (ECD Proposition 20.13, DiamondEtaleCohomology/E11)

ECD reduces 20.13 to an affinoid pro-étale cover by replacing Ỹ with Y ×_{|Y|} |Ỹ|, which is not affinoid pro-étale in general (Corollary 7.22 needs |Ỹ| → |Y| ×_{π0} π0 Ỹ to be an embedding; it fails for Y = Spa(C, O_C), Ỹ = Spa(C′, C′⁺) of rank 2), and the final 'is already an isomorphism there' needs the comparison cone to vanish on all of |Ỹ_j|. For noetherian Λ the packet proves 20.13 from 20.5 and 20.12. For general commutative Λ the missing input is descent of perfect-constructibility along X̃ → λ°_X(X̃) for strictly totally disconnected X̃ → X (a homeomorphism on π0, surjective and monotone on each component chain); after it ECD's argument applies to the affinoid pro-étale λ°_X(X̃). The E61 repair of 20.16 (i) ⇒ (ii) ends with this v-descent, so the general-Λ case of 20.15–20.16 depends on it.

Consumers: `DiamondEtaleCohomology:C7/perfect-constructible-v-descent`, `DiamondEtaleCohomology:C7/perfect-constructible-filtration`, `DiamondEtaleCohomology:C7/perfect-constructible-limit-equivalence`, `DiamondEtaleCohomology:C7/perfect-constructible-ring-colimit`.

### C8.1. Characteristic-independent completion argument

Conrad's coefficient/root-approximation proof has been read and works in every characteristic for the closure of a dense algebraically closed subfield. The norm on the finite splitting extension is Mathlib's spectralNorm.normedField, restricting to the original norm by spectralNorm_extends (both read at the pinned commit), so no separate valued-extension construction is needed. What remains is the adapted root-approximation lemma itself. The pinned IsAlgClosed.of_denseRange requires CharZero and cannot be cited in characteristic p.

Consumers: `DiamondEtaleCohomology:C8/finite-topological-generators`.

### C8.2. Universe bounds, valued amalgamation and point choices

Prove finite extension-witness size reduction using the read D0 completion-cardinality bound; construct compatible complete algebraically closed valued amalgams for the two modified21.3 inequalities; prove independence of completed residue-field closures and of quasi-pro-étale point representatives; prove cutoff independence for representable v-stack tests. Split these into individual lemmas before closure. No universal monotonicity answer to Question21.4 is assumed.

Consumers: `DiamondEtaleCohomology:C8/modified-topological-trdeg`, `DiamondEtaleCohomology:C8/modified-trdeg-tower`, `DiamondEtaleCohomology:C8/modified-trdeg-base-change`, `DiamondEtaleCohomology:C8/analytic-dim-trg`, `DiamondEtaleCohomology:C8/diamond-dim-trg`.

### C8.3. Huber valuative dimension and completion lemmas

Read Huber1.8.5(i), prove the chain/rational-value-group estimate, and separately prove the completion/algebraic-closure comparisons and their compatibility with maps on the existing adic carrier. General analytic completed residue fields must be constructed from the upstream stalkwise fields; A0 tensor products do not supply them.

Consumers: `DiamondEtaleCohomology:C8/analytic-dimension-bound`, `DiamondEtaleCohomology:C8/analytic-dim-trg`.

### C8.4. Temkin primitive perturbation source boundary

Temkin §§2–3 and ECD's finite-degree paragraph were read. Temkin's independent degree and his comparison theorem are explicit nodes (topological-independence-degree, independent-le-generating-degree), through which finite intermediate-degree monotonicity and finite modified/original equality are proved. Temkin Theorem 3.1.9 uses Lemma 3.1.6, imported from Temkin 2010 Lemma 6.3.2, whose primitive-field perturbation proof has not been read. Refine that input before claiming source closure; retain the distinction between independent and generating degree for infinite extensions.

Consumers: `DiamondEtaleCohomology:C8/independent-le-generating-degree`, `DiamondEtaleCohomology:C8/topological-trdeg-finite-monotonicity`, `DiamondEtaleCohomology:C8/modified-trdeg-finite-equality`.

### C8.5. Wild, residue and tame proof interiors

In 21.17 justify the topology and compactness of the procyclic closure and split the leading-term residue homomorphism computation. For 21.16 prove the infinite-Galois identification; for the residue bound, the criterion that Brauer vanishing for all finite separable extensions gives cd_ℓ≤1 (Serre, Galois Cohomology, II.3.1), which has not been read, while Tsen's theorem is read in Stacks 03RD/03RF; the tame character topology and finite-adele identification; and the cohomological bound on its compact lattices. These are owned field/Kummer arguments, not supplied by a bare five-term sequence or discrete local-field inertia.

Consumers: `DiamondEtaleCohomology:C8/wild-automorphism`, `DiamondEtaleCohomology:C8/residue-galois-identification`, `DiamondEtaleCohomology:C8/residue-cd-bound`, `DiamondEtaleCohomology:C8/tame-character-embedding`, `DiamondEtaleCohomology:C8/tame-cd-bound`.

### C8.6. Valuation rank and completion comparisons

The polynomial leading-term proof is now explicit in valuation-transcendence-bound. Refine residue independence, rational value-group independence, cardinal-to-ENat conversion, algebraic-extension torsion and completion immediacy. Bourbaki VI.10.3 Corollary 1 has not been read; no claim of an independently closed library proof is made.

Consumers: `DiamondEtaleCohomology:C8/valuation-transcendence-bound`.

### C8.7. Scheiderer quasi-augmented descent proof

The1992 article, DOI10.1016/0022-4049(92)90062-K, was located on its open-archive publisher page, but the PDF endpoint returned403. The author bibliography has no PDF link. Read §§2–4, especially Remark2.5, Theorem4.1 and Corollary4.6. Construct the quasi-augmentation adjunction and prove descent with the precise hypotheses; then separate normalization into a named lemma. KST Lemma6.6 supplies the specialization-chain and normalized-support argument only. Stacks0A3G proves the desired bound by another method and does not close this required source route.

Consumers: `DiamondEtaleCohomology:C8/specialization-chain-space`, `DiamondEtaleCohomology:C8/chain-cohomology-comparison`, `DiamondEtaleCohomology:C8/spectral-cohomological-bound`.

### C8.8. CS17 valuation-space comparison in general analytic scope

Read and prove the Zariski–Riemann description of a rank-one closure and its transcendence-degree dimension formula, and establish the supplier’s partial-properness criterion beyond noetherian analytic spaces. The generic algebraic tower equality is already in the pinned library; only its ENat/infinite-rank conversion and geometric application are new.

Consumers: `DiamondEtaleCohomology:C8/partially-proper-closure-dimension`, `DiamondEtaleCohomology:C8/partially-proper-dimension`, `DiamondEtaleCohomology:C8/partially-proper-fibre-dimension`.

### C8.9. Finite-window and generation interfaces

Object-wise Postnikov convergence and the uniform window are cited from the E2 nodes; the category-level left completion and the coproduct argument remain open requests to E2, the cutoff comparison to E3, and the thick-closure description of compact objects to Tau Ceti DGAInfinity Layer 6. For detect-zero spell out the stalk/derived-section argument using the uniform bound; do not use a cohomology presheaf as though it were already a sheaf. The C7 perfect-local-system carrier and its dualizability API are available, but the API item must be promoted to a named prerequisite lemma before C9/perfect-local-system-compact can cite it; the residual C7 request records this exact granularity obligation.

Consumers: `DiamondEtaleCohomology:C9/left-completeness`, `DiamondEtaleCohomology:C9/global-sections-coproducts`, `DiamondEtaleCohomology:C9/etale-generators-detect-zero`, `DiamondEtaleCohomology:C9/compact-generators`, `DiamondEtaleCohomology:C9/compact-implies-perfect-constructible`, `DiamondEtaleCohomology:C9/perfect-local-system-compact`.

### C8.10. Suggested signatures remain incomplete

The suggested file states all signatures/API/tests representable with the pinned topology and normed-field carriers, including the modified invariant with genuine extension data. Analytic, diamond, site and enhanced-category declarations need the absent owning supplier types; these conditions are omitted under PROTOCOL §13, with a per-node inventory. Group cohomological dimension and the tame character/value-group topology likewise need their imported interfaces. No arbitrary proposition field or assumed theorem package fills these omissions.

Consumers: `DiamondEtaleCohomology:C8/analytic-dim-trg`, `DiamondEtaleCohomology:C8/analytic-dimension-bound`, `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/diamond-dim-base-change`, `DiamondEtaleCohomology:C8/diamond-dim-composition`, `DiamondEtaleCohomology:C8/locally-finite-dim-trg`, `DiamondEtaleCohomology:C8/strictly-disconnected-acyclic`, `DiamondEtaleCohomology:C8/qpetale-direct-image`, `DiamondEtaleCohomology:C8/injection-direct-image`, `DiamondEtaleCohomology:C8/point-quotient`, `DiamondEtaleCohomology:C8/point-quotient-unique`, `DiamondEtaleCohomology:C8/point-sheaf-equivalence`, `DiamondEtaleCohomology:C8/point-cohomology`, `DiamondEtaleCohomology:C8/point-cd`, `DiamondEtaleCohomology:C8/specialization-stabilizers`, `DiamondEtaleCohomology:C8/closed-point-cohomology`, `DiamondEtaleCohomology:C8/closed-point-bound`, `DiamondEtaleCohomology:C8/extension-cd-bound`, `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`, `DiamondEtaleCohomology:C8/residue-galois-identification`, `DiamondEtaleCohomology:C8/residue-cd-bound`, `DiamondEtaleCohomology:C8/tame-character-embedding`, `DiamondEtaleCohomology:C8/tame-cd-bound`, `DiamondEtaleCohomology:C8/valuation-transcendence-bound`, `DiamondEtaleCohomology:C8/point-cd-geometric-bound`, `DiamondEtaleCohomology:C8/chain-cohomology-comparison`, `DiamondEtaleCohomology:C8/spectral-cohomological-bound`, `DiamondEtaleCohomology:C8/boundary-dimension-drop`, `DiamondEtaleCohomology:C8/constructible-support-reduction`, `DiamondEtaleCohomology:C8/local-stalk-bound`, `DiamondEtaleCohomology:C8/spatial-cohomological-bound`, `DiamondEtaleCohomology:C8/partially-proper-closure-dimension`, `DiamondEtaleCohomology:C8/partially-proper-dimension`, `DiamondEtaleCohomology:C8/partially-proper-fibre-dimension`, `DiamondEtaleCohomology:C9/bounded-filtered-compactness`, `DiamondEtaleCohomology:C9/uniform-test-bound`, `DiamondEtaleCohomology:C9/left-completeness`, `DiamondEtaleCohomology:C9/ordinary-derived-comparison`, `DiamondEtaleCohomology:C9/global-sections-coproducts`, `DiamondEtaleCohomology:C9/etale-constant-compact`, `DiamondEtaleCohomology:C9/etale-generators-detect-zero`, `DiamondEtaleCohomology:C9/compact-generators`, `DiamondEtaleCohomology:C9/compact-implies-perfect-constructible`, `DiamondEtaleCohomology:C9/perfect-local-system-compact`, `DiamondEtaleCohomology:C9/perfect-constructible-implies-compact`, `DiamondEtaleCohomology:C9/compact-iff-perfect-constructible`, `DiamondEtaleCohomology:C9/finite-field-compact-objects`, `DiamondEtaleCohomology:C8/topological-dimension-field-tests`, `DiamondEtaleCohomology:C9/compact-generation-from-dimension-bounds`.


## Pinned library register

These are the exact declarations cited by the packets at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The generic library declaration supplies only the stated interface; domain-specific instantiations remain with their named nodes and suppliers.

- [`mathlib:Algebra.trdeg`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AlgebraicIndependent/Basic.lean): Cardinal-valued algebraic transcendence degree; it is not the topological invariant.

- [`mathlib:CategoryTheory.Adjunction`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Adjunction/Basic.lean): Adjunctions between functors, with unit, counit and the hom-set equivalence.

- [`mathlib:CategoryTheory.Functor.IsCocontinuous`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/CoverLifting.lean): Cocontinuous (cover-lifting) functors between sites, inducing sheafPushforwardCocontinuous via right Kan extension.

- [`mathlib:CategoryTheory.Functor.IsContinuous`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Continuous.lean): Continuity of a functor between sites: precomposition preserves sheaves; it gives sheafPushforwardContinuous and, with a left adjoint, the pullback of sheaves.

- [`mathlib:CategoryTheory.GrothendieckTopology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Grothendieck.lean): Grothendieck topologies on a category (sieves with the maximal, pullback and transitivity axioms); the carrier of the étale, quasi-pro-étale and v-sites.

- [`mathlib:CategoryTheory.GrothendieckTopology.Point`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Point/Basic.lean): A point of a site: a fibre functor with cofiltered category of elements that sends covering sieves to jointly surjective families; its sheafFiber is the stalk functor.

- [`mathlib:CategoryTheory.IsFinitelyPresentable`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Presentable/Finite.lean): Finitely presentable (compact) objects: Hom(X, −) commutes with filtered colimits (ℵ₀-presentable).

- [`mathlib:CategoryTheory.MonoidalCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Category.lean): Monoidal categories (tensor product, unit, coherent associator and unitors).

- [`mathlib:CategoryTheory.MonoidalClosed`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Closed/Basic.lean): Closed monoidal categories: every functor X ⊗ − has a right adjoint (internal Hom).

- [`mathlib:CategoryTheory.ObjectProperty.IsTriangulated`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/Subcategory.lean): Triangulated subcategories (object properties containing zero, stable under shifts and extensions); with IsStableUnderRetracts they are thick.

- [`mathlib:CategoryTheory.ObjectProperty.triangEnvelope`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/Generators.lean): In a pretriangulated category, the objects reachable from an object property by shifts, binary products, retracts and extensions; by triangEnvelope_le_iff the smallest triangulated, retract-closed property containing it. Mathlib's name for the retract-closed finite closure of a set of compact generators. Mathlib does not prove that compact objects lie in it.

- [`mathlib:CategoryTheory.Sheaf`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Sheaf.lean): Sheaves on a site with values in a category, as the full subcategory of presheaves satisfying the sheaf condition.

- [`mathlib:CategoryTheory.Sheaf.H`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean): Sheaf cohomology H^n(F) of an abelian sheaf on a site, defined as Ext from the constant sheaf.

- [`mathlib:CategoryTheory.SimplicialObject`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SimplicialObject/Basic.lean): The existing functor carrier for simplicial objects, with face and degeneracy API.

- [`mathlib:Dense`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Defs/Basic.lean): Every point belongs to the closure of the subset; used with the actual intermediate-field carrier.

- [`mathlib:DerivedCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean): The derived category of an abelian category (localization of cochain complexes at quasi-isomorphisms), with its triangulated structure; 1-categorical.

- [`mathlib:IntermediateField`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Basic.lean): Intermediate fields extending a Subalgebra and closed under inverse; existing carrier for dense intermediate fields.

- [`mathlib:IsAlgebraic`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Algebraic/Defs.lean): x is algebraic over R when it is a root of a nonzero polynomial over R; used for the elements algebraic over an intermediate field in topological independence.

- [`mathlib:IsClosedMap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Defs/Basic.lean): A map of topological spaces sending closed sets to closed sets.

- [`mathlib:IsHomeomorph.topologicalKrullDim_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/KrullDimension.lean): Invariance of topological Krull dimension under a homeomorphism.

- [`mathlib:IsNoetherianRing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Noetherian/Defs.lean): Noetherian rings (IsNoetherian R R).

- [`mathlib:IsProperMap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Proper/Basic.lean): Proper maps of topological spaces (continuous, cluster points of images lift); equivalent to universally closed, and for locally compact Hausdorff targets to compact preimages of compacta.

- [`mathlib:Module.Finite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Finiteness/Defs.lean): Finitely generated modules.

- [`mathlib:ModuleCat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Basic.lean): The category of modules over a ring.

- [`mathlib:Order.krullDim_eq_of_orderIso`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Order/KrullDimension.lean): Krull dimension is preserved by an order isomorphism.

- [`mathlib:SpectralSpace`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Spectral/Basic.lean): Spectral spaces: T0, quasi-compact, quasi-sober, quasi-separated and prespectral.

- [`mathlib:TopCat.Sheaf`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Sheaves/Sheaf.lean): Sheaves on a topological space with values in a category, as sheaves for the open-cover topology on Opens X.

- [`mathlib:TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Category/TopCat/Limits/Konig.lean): A cofiltered limit of nonempty compact Hausdorff spaces is nonempty (topological König lemma).

- [`mathlib:Topology.IsConstructible`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructible.lean): Constructible subsets of a topological space: the Boolean subalgebra generated by retrocompact open sets.

- [`mathlib:WithConstructibleTopology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Spectral/ConstructibleTopology.lean): The existing type synonym carrying the constructible topology.

- [`mathlib:continuousCohomology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean): Canonical all-degree carrier on TopRep, valued in TopModuleCat. Does not supply dimension, comparison or Hochschild–Serre by itself.

- [`mathlib:irreducibleSetEquivPoints`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Sober.lean): Order isomorphism from irreducible closed subsets to points with the specialization order, for quasi-sober T0 spaces.

- [`mathlib:spectralNorm.normedField`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean): For K complete, nontrivially normed and ultrametric and L/K algebraic, the normed-field structure on L given by the spectral norm. It is the norm on the finite splitting extension in the Conrad root-approximation argument, in every characteristic.

- [`mathlib:spectralNorm_extends`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean): spectralNorm K L (algebraMap K L k) = ‖k‖: the spectral norm restricts to the given norm of K.

- [`mathlib:topologicalKrullDim`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/KrullDimension.lean): WithBot ENat dimension of the ordered set of irreducible closed subsets, including the empty-space value.

- [`mathlib:topologicalKrullDim_subspace_le`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/KrullDimension.lean): The dimension of any subspace is bounded by the ambient dimension.

- [`mathlib:topologicalKrullDim_zero_of_discreteTopology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/KrullDimension.lean): A discrete space has dimension at most zero; equality requires nonemptiness.

- [`mathlib:trdeg_add_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AlgebraicIndependent/TranscendenceBasis.lean): Cardinal transcendence-degree additivity in a scalar tower with the stated commutative-domain and faithful scalar-action hypotheses; applies to fields.

- [`tauceti:TauCeti.IsProP`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean): The actual pro-p predicate: every quotient by an open normal subgroup is a p-group. On a profinite group this equals the finite continuous quotient criterion used in the suggested signature.


## Reference versions and passages

Source identifiers used in the catalogue resolve as follows. `Stacks` and `STACKS` retain the identifiers of their respective sections and refer to the same project. Detailed verification excerpts remain in the packets; this reader gives the locators and mathematical specifications.

### ECD

Peter Scholze. [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4). arXiv:1709.07343v4, 14 April 2026.

- §14 complete (Definition 14.1 – Proposition 14.16, printed pp. 81–88)

- §16 complete (Theorem 16.1 – Corollary 16.10, pp. 92–96)

- §17 complete (Lemma 17.1 – Corollary 17.9, pp. 96–101)

- §18 complete (Definition 18.1 – Proposition 18.10, pp. 101–107)

- §19 complete (Definition/Proposition 19.1 – Theorem 19.5, pp. 107–112)

- §20 complete (Definition 20.1 – Proposition 20.17, pp. 113–122); 20.9, 20.10, 20.17 belong to C9 (C8 part)

- §1 Theorems 1.11–1.13 (pp. 7–8) and §15 (pp. 89–91) as context for the D6 imports

- §21, printed pp.122–127, complete; §20 Propositions 20.9, 20.10 and 20.17 statements and proofs; 20.16 proof ending; Convention 22.1 and 22.2–22.3 as consumer context.

Version checksum (SHA-256): `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc`.

### Stacks

The Stacks project authors. [The Stacks project](https://stacks.math.columbia.edu). online, accessed 7 October 2026.

- Tag 0652 (Definition 15.68.1, tor-amplitude)

- Tag 0658 (Lemma 15.76.2, perfect = pseudo-coherent of finite tor dimension)

- Tag 066E (Lemma 15.66.17, pseudo-coherent complexes over a noetherian ring)

### CS17

Ana Caraiani and Peter Scholze. [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Annals of Mathematics186 (2017),649–766.

- §4.2, Propositions4.2.19 and4.2.21, Remark4.2.20, printed pp.711–712.

Version checksum (SHA-256): `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`.

### KST

Shane Kelly, Shuji Saito and Georg Tamme. [On pro-cdh descent on derived schemes](https://arxiv.org/pdf/2407.04378v3). arXiv:2407.04378v3, 22 May 2025. The author-hosted copy read in the planning pass (https://www.lcv.ne.jp/~smaki/articles/Derived-pro-cdh.pdf, sha256 3557f642cdee65e4942230dd5781dc7e8c45aeaca804d1843af3594647ed9273) has the identical Lemma 6.6 and proof, also on p.24..

- Lemma6.6 and proof, p.24. This describes the specialization-chain argument but imports Scheiderer Remark2.5 and Theorem4.1; those imported proofs have not been read.

Version checksum (SHA-256): `c59e68e75491735ed87ec32264e1a6985f22f8dd6d47a8201efd39d9a64ccba4`.

### STACKS

The Stacks Project Authors. [The Stacks Project](https://stacks.math.columbia.edu/). Online version accessed 6 October 2026.

- Tags0A3G and0719, full statements and proofs. Tag0A3G uses a different argument from the required quasi-augmented route; Tag0719 is stated for ringed spaces, so a site-level supplier is still required.

- Tag 09SM (Section 13.37, Definition 13.37.5, Lemmas 13.37.3–13.37.4, Proposition 13.37.6: compact objects of a compactly generated triangulated category); Tag 0D6P (Lemma 21.23.10, site-level Postnikov convergence under a finite cohomological bound on a covering basis); Tags 03RD and 03RF (Tsen's theorem; vanishing of the Brauer group of the function field of a curve over an algebraically closed field). Tag 0719 is Section 20.38 on ringed spaces.

### TEMKIN

Michael Temkin. [Topological transcendence degree](https://arxiv.org/pdf/1610.09162v2). arXiv:1610.09162v2; published J. Algebra 568 (2021), 35–60.

- §2.1–2.2: independent versus generating degrees; §3.1–3.2: perturbations, Theorems 3.2.1 and 3.2.3 and their proofs. Lemma 3.1.6 imports Temkin 2010 Lemma 6.3.2; that earlier proof is an explicit source boundary.

Version checksum (SHA-256): `df32be2841a71677ded61b9957fe50e650b2e41ba9874daf96b15330bc4c75af`.

### CONRAD

Brian Conrad. [Completion of algebraic closure](https://math.stanford.edu/~conrad/248APage/handouts/algclosurecomp.pdf). Stanford Math 248A handout, author-hosted text.

- Entire handout: Theorem 1.1 and §2 coefficient/root approximation proof; the argument works in arbitrary characteristic.

Version checksum (SHA-256): `07052ff7a8c1a25ce876ca984f28d62e513998259906bd994d3dc1622cda3f5b`.

### FS

Laurent Fargues and Peter Scholze. [Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4). arXiv:2102.13459v4.

- §I.11, introductory dimension discussion and Problem I.11.1, printed pp.41–42. This is a problem, not an equality theorem.

Version checksum (SHA-256): `1f8040751d3424f59ae56651d990d7b2d5030e6b7cae58bc2fc683358dfc2027`.


## Source corrections used by the specifications

The node statements incorporate the following version-specific corrections and retain the unresolved proof boundaries. Their identifiers locate the complete evidence and verdict records in the packets.

### DiamondEtaleCohomology/E8: misprint

Location: proof of Lemma 14.5 (ii), p. 83 (arXiv:1709.07343v4).

Correction: “… under the inclusion of the pro-constructible generalizing subspace Spa(C, (C⁺)′) ⊂ Spa(C, C⁺)” (an affinoid pro-étale injection; an open immersion when C⁺ has finite rank). The correction text of PAPER-SCHOLZE-17/E91 ('the open subset of generalizations') should be qualified the same way.

Reason: The set of generalizations of a point of Spa(C, C⁺) is open only if the valuation ring has an immediate coarsening there; for C⁺ of value group R × ⊕_{n≥0} Q (lexicographic) the rank-one point is the intersection of the quasicompact opens {|a| ≤ 1} containing it and is not open. Pulling back along the pro-constructible generalizing injection works the same way, so the argument is unaffected.

Effect: nothing.

### DiamondEtaleCohomology/E4: error

Location: Proposition 18.9 and its proof, p. 106 (arXiv:1709.07343v4).

Correction: Add the hypothesis that Y is quasiseparated for the direction ⇒; the direction ⇐ holds as printed.

Reason: Corollary 18.8 (vi) needs Z → Y quasicompact, which holds for affinoid Z when Y is quasiseparated but fails for Y = ∗. For C the completed algebraic closure of F_p((t)), Spa(C, O_C) → ∗ is partially proper (its compactification Spa(C, (O_C)′) equals Spa(C, O_C) since O_C = F̄_p + m_C) but not quasicompact (Spa(C, O_C) ×_∗ Spa(C, O_C) surjects onto a perfectoid punctured open unit disc), and its only closed sub-v-sheaves are ∅ and itself, so it is not a filtered colimit of proper maps along closed immersions.

Effect: a stated result.

### DiamondEtaleCohomology/E5: misprint

Location: paragraph after Definition 18.4, p. 103 (arXiv:1709.07343v4).

Correction: … by “f is 0-truncated and quasiseparated, and the dotted arrow is unique”.

Reason: Proposition 10.9 needs at most one lift, which existence does not give: for C⁺ ⊊ O_C and a ∈ O_C ∖ C⁺, two copies of X = Spa(C, C⁺) glued along U = {|a| ≤ 1} map to X by a 0-truncated quasiseparated map that has lifts for all (R, R⁺)-squares (every Spa(R, R°) → X lands in U) but is not separated (two lifts at the rank-one point). The intended reading keeps the uniqueness of Definition 18.4's '(necessarily unique)'; the one use, the proof of 18.7 (i), has unique lifts by construction.

Effect: nothing.

### DiamondEtaleCohomology/E6: misprint

Location: Proposition 18.3 (second part), p. 101, and Definition 18.4, p. 103 (arXiv:1709.07343v4).

Correction: “… subring R⁺ ⊂ R◦”, as in Proposition 10.10.

Reason: Spa(R, R⁺) is defined only for a ring of integral elements R⁺ ⊂ R◦; R itself is open and integrally closed. Proposition 10.10, on which the uniqueness of lifts rests, says R⁺ ⊂ R◦.

Effect: nothing.

### DiamondEtaleCohomology/E7: misprint

Location: §17, footnote 4, p. 99 (arXiv:1709.07343v4).

Correction: “… D(Y_v,κ, Λ) is presentably symmetric monoidal for each κ”; the colimit over all κ is symmetric monoidal but not presentable.

Reason: Lemma 17.1 obtains presentability only at a cutoff κ, and D(Y_v, Λ) is defined (before Proposition 14.10) as a filtered colimit over all κ, which is not generated under colimits by a set.

Effect: nothing.

### DiamondEtaleCohomology/E9: misprint

Location: proof of Theorem 19.2, p. 110 (arXiv:1709.07343v4).

Correction: “… of the cosimplicial object …”.

Reason: RΓ is contravariant, so the hypercover Y′_• gives a cosimplicial object of D(Λ), whose limit is taken; the same slip in Corollary 16.8 is PAPER-SCHOLZE-17/E48.

Effect: nothing.

### DiamondEtaleCohomology/E10: misprint

Location: proof of Theorem 19.2, p. 110 (arXiv:1709.07343v4).

Correction: “… and j′_!A ∈ D⁺_ét(Y′, Λ) = D⁺(Y′_ét, Λ)”: A lives on U′.

Reason: In the statement of 19.2, A ∈ D⁺_ét(U′, Λ); the object on Y′ whose cohomology is computed is j′_!A.

Effect: nothing.

### DiamondEtaleCohomology/E11: gap

Location: proof of Proposition 20.13, p. 118 (arXiv:1709.07343v4).

Correction: The replacement is not affinoid pro-étale in general: Definition 7.20 and Corollary 7.22 need |Ỹ| → |Y| ×_{π0 Y} π0 Ỹ to be an embedding. For noetherian Λ, deduce 20.13 from 20.5 and 20.12; in general pass first to λ°_Y(Ỹ) (Lemma 14.5) and supply descent along Ỹ → λ°_Y(Ỹ). The later 'is already an isomorphism there' also needs the comparison cone to vanish on all of |Ỹ_j|, not only on the image of |Ỹ|.

Reason: For Y = Spa(C, O_C) and Ỹ = Spa(C′, C′⁺) with C′ ⊃ C algebraically closed and C′⁺ of rank 2 (both strictly totally disconnected, Ỹ → Y a v-cover), |Ỹ| has two points over the one point of |Y| ×_{π0 Y} π0 Ỹ, so Corollary 7.22 does not apply; the v-sheaf Y ×_{|Y|} |Ỹ| has 2 points over Spa(K, O_K) and 3 over a rank-2 Spa(K, K⁺), unlike any Y × S with S profinite. In this example 20.13 itself holds, so this is a gap in the proof.

Effect: the proof.

### DiamondEtaleCohomology/E1: misprint

Location: arXiv1709.07343v4, proof of Proposition21.16, p.126, leading-term exact sequence and preceding sentence; rendered PDF inspected..

Correction: Use C′×/(1+C′°°), as in the leading-term quotient defined earlier in the same proof.

Reason: C′′ is not introduced, and 1+C′′× is not the principal-unit subgroup. The residue/value-group exact sequence has principal units of C′ as denominator.

Effect: nothing.

### DiamondEtaleCohomology/E2: misprint

Location: arXiv1709.07343v4, Proposition20.17 and proof, p.121.

Correction: The target is Y, the spatial diamond in the proposition.

Reason: X has no definition in the proposition; all the categories, coefficient bounds and the preceding transfer argument are over Y.

Effect: nothing.

### DiamondEtaleCohomology/E3: gap

Location: arXiv1709.07343v4, proof of Lemma 21.17, p.127, first sentence; identical in v1 and v3.

Correction: Let G be the closure of the subgroup generated by γ in the continuous automorphisms of C with the topology of pointwise convergence. Because γ^(n!)→1 pointwise and γ is an isometry (it acts trivially on C×/(1+C°°)), the powers γ^a extend to a ∈ Ẑ, and G is a procyclic profinite group, a quotient of Ẑ.

Reason: When γ has infinite order the subgroup it generates is countably infinite, and an infinite profinite group is uncountable, so the printed G is not profinite. The argument needs the closure, and its compactness is asserted without proof; the isometry and factorial-convergence hypotheses supply it.

Effect: nothing.

### Inherited source boundaries

- issue: PAPER-SCHOLZE-17/E44; nodes: `DiamondEtaleCohomology:C0/separated-pro-etale-hull-fibre-products`.
- issue: PAPER-SCHOLZE-17/E45; nodes: `DiamondEtaleCohomology:C0/v-pullback-formula`.
- issue: PAPER-SCHOLZE-17/E46; nodes: `DiamondEtaleCohomology:C0/v-pullback-higher-vanishing`; note: recorded as a gap of this packet.
- issue: PAPER-SCHOLZE-17/E89; nodes: `DiamondEtaleCohomology:C0/v-pullback-fully-faithful`.
- issue: PAPER-SCHOLZE-17/E91; nodes: `DiamondEtaleCohomology:C1/v-pushforward-degree-zero`, `DiamondEtaleCohomology:C1/v-pushforward-prime-to-p`, `DiamondEtaleCohomology:C0/separated-pro-etale-hull`.
- issue: PAPER-SCHOLZE-17/E47; nodes: `DiamondEtaleCohomology:C1/derived-v-pushforward-comparison`.
- issue: PAPER-SCHOLZE-17/E52; nodes: `DiamondEtaleCohomology:C1/v-pushforward-prime-to-p`; note: in the proof of Lemma 16.3, owned by ClassicalAdicEtaleCohomology:H2 (recorded there as ClassicalAdicEtaleCohomology/E7).
- issue: PAPER-SCHOLZE-17/E48; nodes: `DiamondEtaleCohomology:C2/qcqs-pushforward-preserves-etale`.
- issue: PAPER-SCHOLZE-17/E92; nodes: `DiamondEtaleCohomology:C3/pullback`.
- issue: PAPER-SCHOLZE-17/E93; nodes: `DiamondEtaleCohomology:C3/pullback`.
- issue: PAPER-SCHOLZE-17/E58; nodes: `DiamondEtaleCohomology:C4/tautness-criterion`.
- issue: PAPER-SCHOLZE-17/E59; nodes: `DiamondEtaleCohomology:C4/tautness-criterion`.
- issue: PAPER-SCHOLZE-17/E53; nodes: `DiamondEtaleCohomology:C5/exchange-map`.
- issue: PAPER-SCHOLZE-17/E94; nodes: `DiamondEtaleCohomology:C5/proper-base-change-unbounded`.
- issue: PAPER-SCHOLZE-17/E95; nodes: `DiamondEtaleCohomology:C5/proper-base-change-bounded`.
- issue: PAPER-SCHOLZE-17/E54; nodes: `DiamondEtaleCohomology:C6/invariance-complete-extension`.
- issue: PAPER-SCHOLZE-17/E55; nodes: `DiamondEtaleCohomology:C6/perfectoid-annulus-cohomology`.
- issue: PAPER-SCHOLZE-17/E60; nodes: `DiamondEtaleCohomology:C6/annulus-extension-by-zero-vanishing`; note: repaired by applying Theorem 19.2 to the canonical compactifications Ȳ′_n^{/Y} of the annuli, which lie between Y′_n and Y′_{n+1} in the partially proper Y′ (node C6/annulus-extension-by-zero-vanishing).
- issue: PAPER-SCHOLZE-17/E56; nodes: `DiamondEtaleCohomology:C7/constructible-spatial-characterisation`.
- issue: PAPER-SCHOLZE-17/E57; nodes: `DiamondEtaleCohomology:C7/perfect-constructible-restricted-compactness`.
- issue: PAPER-SCHOLZE-17/E61; nodes: `DiamondEtaleCohomology:C7/perfect-constructible-filtration`; note: the repair argument is written into the proof steps.
- issue: PAPER-SCHOLZE-17/E51; nodes: `DiamondEtaleCohomology:C1/v-pushforward-prime-to-p`; note: in the proof of Lemma 16.3, owned by ClassicalAdicEtaleCohomology:H2 (recorded there as ClassicalAdicEtaleCohomology/E6).

