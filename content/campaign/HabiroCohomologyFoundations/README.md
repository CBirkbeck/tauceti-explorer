# q-Hodge filtrations and Habiro cohomology

This is the cohomology owner in the standalone [Habiro rings and cohomology family](../HabiroRings/README.md). Build the reusable algebraic foundations extending relative cyclotomic rings to cohomology. The target is the q-Hodge/Habiro descent theory with the source's hypotheses, including its number-field comparison and trace-theoretic instances. A canonical q-Hodge filtration for every ring, or an unconditional identification with Scholze's analytic Habiro stack, is not asserted.

The early ring/derived-coefficient inputs are [HabiroRings](../HabiroRings/README.md) HR.1–5, with classical completion in [HabiroCyclotomicCompletions](../HabiroCyclotomicCompletions/README.md). Higher categories and animated cotangent/completion machinery belong to [EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md). Generic ordinary cohomology belongs to [DerivedDeRhamCohomology](../DerivedDeRhamCohomology/README.md), [CrystallineCohomology](../CrystallineCohomology/README.md), [AInfCohomology](../AInfCohomology/README.md), [PrismaticCohomology](../PrismaticCohomology/README.md) and [CohomologyComparisons](../CohomologyComparisons/README.md). Trace instances are proved in [RefinedTraceMethods](../RefinedTraceMethods/README.md), arithmetic coefficient modules in [HabiroNumberFields](../HabiroNumberFields/README.md). These are stage-specific imports; HR.6's later cohomology interface is not a prerequisite for constructing HQ.

Primary sources are Wagner's [q-Hodge complexes over the Habiro ring, v2](https://arxiv.org/abs/2510.04782v2), [q-Witt vectors](https://arxiv.org/abs/2410.23078v5), [ku and q-de Rham](https://arxiv.org/abs/2510.06057v1), and [2026 thesis](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf). The local Ong course notes are useful supporting exposition, explicitly unofficial. Scholze's [course description](https://people.mpim-bonn.mpg.de/scholze/ss2025_habiro.pdf) motivates the analytic direction; it is not a complete proof source for a six-functor comparison theorem.

## HQ.1. q-differentials and coordinate comparisons

Import the local q-crystalline site, framed q-difference complex and its p-complete q-prismatic comparison from PrismaticCohomology PR.6. Those local computations include D_q(x^n)=[n]_q x^(n−1), [n]_q=∑_{i=0}^{n−1}q^i, the twisted Leibniz rule and differential-square-zero theorem. Expose their specialization at q=1 to ordinary de Rham theory; do not implement the same local site and chart construction again. The prototype q-integer lemmas are interface checks on this imported calculation.

Own the global arithmetic gluing over a perfectly covered Λ-ring A and its admitted algebras, following Wagner Appendix A. Combine the separate p-complete local constructions with rational de Rham data, prove framing independence by coherent comparison maps, and prove descent including the cocycle identities. Coordinatewise formulas are local computation tools, not a globally canonical definition. For each p compare with the q-prism (ℤ_p[[q−1]],[p]_q) and the source's base changes; the prism ideal is [p]_q, not q−1. Work with completed coefficient rings and prove convergence rather than simply inverting q−1.

## HQ.2. Animated inputs and derived q-de Rham

Use animated polynomial resolutions to define derived q-de Rham on the admitted algebras. Prove resolution independence, the sifted-colimit construction before completion, and derived base change with its actual completion hypotheses. Import ordinary derived de Rham and the Hodge filtration from DerivedDeRhamCohomology; specialize that general API instead of re-deriving it. Separate ordinary tensor product from derived tensor product. Build complete filtered modules over the (q−1)-filtered coefficient ring, their associated graded, completion and filtered tensor products from EnhancedDerivedSheaves.

Distinguish the smooth underived q-de Rham complex qΩ from derived qdR. Wagner Proposition 3.47 compares qΩ to the **q-Hodge completion** of qdR and to Lη_(q−1) of qHdg. It does not assert uncompleted qΩ≃qdR for every smooth algebra, even in characteristic zero. Similarly ordinary smooth de Rham is compared with the Hodge-completed derived theory. Import the generic Lη construction and its torsion corrections from AInfCohomology; own these q-specific applications.

Construct the derived de Rham specialization with its filtration and the rational comparison. Prove the separate p-completed rational comparison needed by the q-Hodge definition. This condition does not follow merely from the rational comparison before p-completion. Supply the exact diagram of completions/localizations and its maps.

## HQ.3. q-Hodge filtrations and modification

Implement Wagner v2 Definition 1.6 / Definition 3.2 in its full source form: a (q−1)-complete descending filtered object with degree-zero q-de Rham identification, filtered specialization to the Hodge filtration, and the prescribed rational and p-completed rational comparisons. Include the specified higher coherences. Express these as equivalences and commutative diagrams in the enhanced filtered category; do not use an unconstrained proposition named `qHodgeCompatible`.

Construct qHdg as the (q−1)-completed colimit of fil⁰→(q−1)fil¹→(q−1)²fil²→⋯, with the source's convention. Prove Theorem 3.11: the functor on the category of **chosen q-Hodge-filtered inputs** factors through HR.2's Habiro-complete category and is symmetric monoidal there. Construct its finite products and base-change maps in the proven range. A chosen multiplicative filtered input can therefore induce the corresponding algebra structure; this does not prove that the canonical smooth section below is fully multiplicative.

For each positive m construct the exhaustive ascending filtration on qHdg/(q^m−1) whose graded pieces are Σ^(−i)qW_m dR^i, using the **derived** m-truncated q-de Rham–Witt objects of Wagner v2 Theorem 3.11(b). The smooth comparison with underived q-Witt differential forms is a separate theorem (Corollary 3.31), with its degree/shift convention recorded in HQ.4. Prove the maps, filtration and convergence; the statement is not an unfiltered equality with an arbitrary q-Witt complex. The construction depends on the chosen filtration until existence/uniqueness has been proved. Lemma 3.3 explicitly rules out a section over all animated algebras, and in the relevant setting even over all smooth algebras without localization.

## HQ.4. q-Witt and cyclotomic descent

Import degree-zero q-Witt rings and their operations from HR.4. Own the **positive-degree q-de Rham–Witt complex**, its differential, truncation sets, Frobenius/Verschiebung extensions and their precise relations. There are no compatible ordinary-style restriction maps on these q-objects (q-Witt v5 §3.11); the V/FV systems in Definitions 3.1, 3.6 and 3.9 are deliberately defined without them. Import ordinary de Rham–Witt, including its genuine restriction maps, from CrystallineCohomology CR.4 and prove the specified specializations without confusing the two operator systems. Prove the smooth derived-to-underived q-Witt-form comparison of q-Hodge v2 Corollary 3.31, with all shifts. Establish ghost-map injectivity only with the actual torsion hypotheses; a ghost-coordinate formula is not an unconditional definition by inversion.

Build the compatible complexes over each cyclotomic completion. Prove transition comparisons and apply HR.2–3's arithmetic fracture/descent to the Habiro coefficient ring with the source's completeness and connectivity hypotheses. Preserve the distinction between a descended complex and a collection of homotopy groups. Carry derived commutative algebra descent only when the input supplies the required multiplicative coherences; do not silently upgrade all smooth instances to E∞ algebras.

## HQ.5. Existence classes and number fields

Prove Theorem 4.11 for smooth algebras over a perfectly covered Λ-ring A after inverting every prime p≤relative dimension. Carry both the base and dimension bound in the theorem. Prove Corollary 4.16's **partial-operad** multiplicativity: the admitted smooth category is not closed under tensor products. If a d-dimensional input needs multiplication, the corresponding product requires primes through 2d inverted; coherence through r factors requires the source's r·d bound. Inverting primes through d alone does not provide an unrestricted E∞ algebra structure. Extend to smooth schemes by descent; for smooth proper schemes retain the perfectness result over the **Habiro completion of the localized ring**, not a raw localization of H.

Treat quasi-regular inputs separately. Require the source's condition (R): for every p, p-torsion-freeness, static p-completed derived de Rham, and Hodge filtration given by the stated ideals. A useful class is a quotient of an étale algebra over a perfect Λ-ring by a Koszul-regular ideal. Theorem 4.22 further requires either a regular sequence of powers x_i^(a_i) with a_i≥2, or a spherical E₁-lift; the latter gives existence without a canonical choice of that lift. Theorem 4.29's canonical section is on the specifically defined subcategory where each constructed local filtration actually q-deforms Hodge. Do not generalize to every regular quotient. Record the additional finite-order comparisons or ℤ_p×-action used in the source's uniqueness statements.

<a id="stage-HQ.5-trace"></a>

**Trace-theoretic existence (HQ.5-trace).** For trace-theoretic instances import RT.4:q-Hodge: R is quasi-syntomic, **2 is invertible**, and R has a **connective spherical E₂-lift** S_R with S_R⊗Hℤ≃HR (Wagner ku Theorem 1.2 / 4.27). A lift merely over ku is not enough. Any separate p=2/E₁ refinement must carry its additional even-resolution assumptions; it is not this theorem with hypotheses removed.

For finite étale arithmetic inputs export the completed cohomology object to HR.6, which owns its degree-zero comparison with HR.5 and HB.6's explicit GSWZ ring. Prove the q−1 completion comparison and carry its actual Frobenius-glued Taylor maps. HR.6/HB.7 owns the line-module comparison and possible loss of K₃-indexed information on completion. A zero-dimensional ring comparison does not identify every K₃ module with a cohomology class on a higher-dimensional scheme.

## HQ.6. Algebraic and analytic boundaries

Define the actual ring/complex/line-bundle comparison problem between the algebraic q-Hodge construction and Scholze's analytic Habiro framework using supplied geometric objects. Prove all algebraic specializations and number-field comparisons above. The general analytic comparison remains a named mathematical statement with explicit domain, coefficient change and expected natural transformation; it is not used as a theorem in K-theory, diamonds or geometric local Langlands. The source expects comparison only after an analytic completed localization that can lose information; its root-of-unity infinitesimal theory is not automatically the algebraic q-de Rham–Witt specialization.

The campaign's condensed/analytic stack and six-operation owners supply a language for a future analytic comparison. They do not imply that analytic and algebraic Habiro theories coincide. Source-status and full-proof questions are recorded in the audit rather than silently turning a course announcement into an unconditional result.

## HQ.7. Acceptance tests and Lean boundary

Test a polynomial ring in one variable, the q-integer differential at q=1, a finite étale number-field ring, a smooth scheme with the required small primes inverted, and a 2-inverted trace-theoretic input with an explicit spherical lift. Each example must commute with de Rham specialization and the appropriate p-adic comparison. Check the difference between a filtered object and its colimit modification, retain derived-limit/Tor corrections, and test that increasing tensor powers can leave the smooth existence category. Exhibit the Hodge-completed versus uncompleted distinction rather than simplifying it away.

Suggested.lean gives executable q-difference signatures on the existing polynomial API. The advanced signatures require the higher categorical objects built in the dependencies; their precise mathematical contracts are the milestones above. No `Prop` placeholder or axiom replaces the q-Hodge conditions.

## HQ.8. Crystalline, A_inf and prismatic comparison atlas

Construct a map-level atlas connecting this theory to the five generic comparison owners. Ordinary derived de Rham and its Hodge completion come from DD; local q-crystalline/prismatic comparison comes from PR.6; ordinary de Rham–Witt and crystalline specialization from CR.4 and its crystalline comparison; Lη and the A_inf/Breuil–Kisin–Fargues objects from AI; global compatibility of classical comparisons from CP. This owner proves that its global arithmetic q-gluing and q-Hodge modification commute with those already-constructed local maps in the **intersection of their hypothesis sets**.

For each square record the base prism or perfectoid base, smooth/proper or quasi-syntomic assumptions, derived completion ideal, whether p or the prism ideal is inverted, Frobenius linearization, filtration and Tate/Breuil–Kisin twist. Prove the q=1, cyclotomic, crystalline and A_inf specializations by those maps; no unconditional equivalence of integral Habiro, crystalline, A_inf and étale cohomology is intended. A comparison that loses information is recorded as a base change or localization, not an inverse equivalence on the original categories.

Use RT.6's quasisyntomic THH/Nygaard/syntomic comparison only after PR has independently constructed its prismatic objects. Conversely the trace proof imports the earlier local prismatic stages, not this completed atlas. This staging prevents an argument that defines a filtration by the comparison theorem it is supposed to prove. The addition audit records these ownership and source-hypothesis corrections.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `HQ.2` | Construct both rational and p-completed rational comparison squares before forming q-Hodge data; prove completion order and the filtered comparison, rather than commuting inversion with a limit formally. |
| `HQ.5` | Record dimension and primes inverted for every product in the partial-operad construction; the r-fold coherence problem has its own r·d bound. |
| `HQ.8` | For each atlas square record source/target rings, derived completion ideals, Frobenius linearization, twists and the intersection of both theorem hypothesis sets; label localizations as localizations. |

**Producer–consumer handoff.** HabiroRings HR.6 receives the late degree-zero theorem; neither diamonds nor motivic arithmetic may assume the analytic Habiro comparison from HQ.6.

**Acceptance.** Compare q=1 and root-of-unity specializations, and a smooth input with a tensor power outside the allowed dimension/prime range.

**Source-readiness boundary.** The general analytic comparison stays a research statement; filtered shifts and existence/uniqueness domains need full statement transcription.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
