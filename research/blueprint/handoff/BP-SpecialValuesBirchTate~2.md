# BP-SpecialValuesBirchTate~2 — completed target-level revision

**Issue:** [#7012](https://github.com/CBirkbeck/tauceti-explorer/issues/7012).  
**Worker:** ChatGPT GPT-6 Astra Pro — `chatgpt-5c67bc37a117`.  
**Date:** 2026-10-07.  
**Claim:** [6044748755](https://github.com/CBirkbeck/tauceti-explorer/issues/7012#issuecomment-6044748755), confirmed by [6044751128](https://github.com/CBirkbeck/tauceti-explorer/issues/7012#issuecomment-6044751128).

## Result and scope

The revision is complete at the issue’s target granularity. All B.1–B.8 stages are **planned**, none is closed, and every implementation status remains **unchecked**. The 51 node IDs, six definitions, 25 API names, 23 test names and 15 planets are retained. The kinds are six definitions, fourteen lemmas, twenty-five theorems, two applications and four comparisons. All 78 baseline citations and all seven confirmed source findings are retained. Two satisfied stage requests become exact imports, leaving seventeen requests and the four explicit proof gaps.

The main deliverable is the synchronized definitive reader: its original sections omitted several corrections already present in the independently reviewed packet. This revision carries those corrections into every affected statement, proof, dependency, API, acceptance condition, source entry and gap. It also fixes additional local/global order and character-normalization errors found during source checks. The suggested Lean changes are comments only. No theorem is claimed formalized.

The prior `review` object and every `sourceIssues[*].review` object are unchanged as JSON values. The original independent report remains untouched. Its `needs_changes` verdict describes the input reviewed on 2026-10-06; this authoring revision does not issue its own acceptance verdict.

Only the issue’s packet, reader, suggested file and this handoff belong in the PR. The current root input blobs were checked again before submission: packet `ab3396435d0d7028a881351a35f35ed2db523db3`, reader `5c5b1a3c99a889f870f26d8afe83444eda05d900`, suggested file `2bf78fd85fb1e5d7e2f13ee86c2409f24022d558`, and independent report `f48dd2d30ff4ef3ad111f8490e5dd945fdd6f0ef`. The new handoff path did not already exist.

## Corrections checked against the independent review

| Area | Result of this revision |
| --- | --- |
| B.1 ownership | Imports N.4’s actual W₂ object and finiteness and N.3:ranks’ positive even-K finiteness. The local definition is only the Birch–Tate predicate. |
| B.2 analytic hypotheses | Retains the added discriminant declarations and makes their use explicit: nonzero integral discriminant gives positive absolute value, so the complex power is entire in the variable and its real specialization has the required positive sign. |
| B.3 ideal counts | The reader now uses the number-field prime/factor bijection together with the actual inertia-degree and ramification-multiplicity statements. It uses ω=(1+√5)/2, its minimal polynomial X²−X−1, exponent one, prime norms and multiplicativity. The generic Kummer–Dedekind support bijection is not credited with degree or multiplicity. |
| B.3 W₂ computation | Synchronizes the exact cyclotomic groups and restriction maps at levels 5/25, 3/9 and 8/16. The real-subfield intersections distinguish √5 from √2. The result is 120, not the unit torsion order. |
| B.3 independent examples | Retains the independent K₂(ℤ) and quadratic upper-bound gates. Reading order four from the abelian theorem cannot certify the independent quadratic example. |
| B.4 actual comparison | The reader and commented signature require an actual additive equivalence, obtained from the natural Tate map and the relative S-integer injection with prime-to-ℓ residue cokernel. Valuation equality alone does not construct this map. The exact M.3 supplier now gives the Tate map directly. |
| B.5 classical comparison | Carries the pole-cleared numerator, covariant dual action, inverse second-kind multiplier, exact norm-kernel/quotient map request, Kronecker–Weber import, and exceptional χ=ω export into the reader. The comparison remains an explicit proof target. |
| B.6 series and module | Retains the exact series identity with its unit factor and the untwisted I.9 characteristic-ideal output. Ideal equality is described as a consequence of the exact identity. |
| B.6 finite descent | Retains all nine comparison-table entries, with the missing actual maps and finite specialization in I.10. The order-two cokernel, real-place term, finite kernels/cokernels and Tor contributions remain visible. |
| B.8 integral statement | Corrects the reader’s Burns–Flach section locator and preserves equality of corrected TΩ classes under lattice change, together with predicate equivalence. Coherence, fixed rational data, graded determinant and local reduced-norm correction remain required. |
| Source findings | The reader now includes E7 and the confirmed review objects for E1–E7. E5/E6 affect a stated result in the cited author copy; their scope is not silently widened to the published volume. |

The exact B.5 auxiliary generator is now fixed as γ₁=(γ′)^{2^b}, with γ₀=(φ(γ₁),γ₁). This makes the subsequent identities u=(u′)^{2^b} and ρ(γ₁)=ρ(γ′)^{2^b} legitimate rather than relying on an arbitrary generator of the open subgroup.

## Additional mathematical corrections

### Trivial analytic characters retain the pole factor

Kolster’s 2009 Proposition 3.2, p.14, explicitly restricts the direct characteristic-series/L-value comparison to ψ≠1. B.4 and its higher-weight B.8 specialization now distinguish the two branches:

- For ψ≠1, f(κ(γ)^n−1) is associated to Lℓ(1−n,ψ).
- For ψ=1, it is associated to (κ(γ)^n−1)Lℓ(1−n,1). The extra factor has the valuation of the H⁰ denominator.

The existing final finite-order equations were correct; the intermediate proof sentences had suppressed the trivial-character condition. This correction changes no public theorem signature or node ID. The exact coefficient-prime order is also made explicit in the M.7 request.

### Local 2-primary orders are separate from full orders

[Rognes–Weibel, Theorems 0.1 and 0.6, pp.1–4](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf) use the 2-primary K groups. The B.8 real-place node’s proof and acceptance conditions had used the full w₄(ℚ)=240 as an order of 2-primary H¹. The corrected checks are:

| Field and weight | Local #H² | Local #H¹ | Local ratio | Full global check |
| --- | ---: | ---: | --- | --- |
| ℚ, n=2 | 2 | 8 | 1/4 = 2·2/16 | 1/12 = 2·2/48 |
| ℚ, n=4 | 2 | 16 | 1/8 = 2·1/16 | 1/120 = 2·1/240 |

Every local group identification in the two congruence classes now uses K_j{2} and w_n^(2). The commented Lean valuation theorem was already correct. Its surrounding comments now identify the active rational arithmetic examples as global full-order checks.

### The equivariant leading order has components

For ℚ(i)/ℚ at weight two, the scalar Dedekind order is one, while the trivial and quadratic Artin components have orders (0,1). The extended boundary receives the pair of nonzero componentwise leading coefficients. The raw center-valued L-value has a zero quadratic component and is not a central unit. The general node already required center-valued data; its test and acceptance wording now say exactly which order is scalar. This follows the componentwise order assertion in [Burns–Flach Conjecture 4(ii), p.535](https://ems.press/content/serial-article-files/25892?nt=1).

### Precise source locators

Kurihara’s Theorem 4.1 is in §4.1, p.24; the proof begins in §4.2. Both B.6 citations now say this. Burns–Flach Lemmas 5–6 and their consequence are in §3.4, pp.526–529; Lemma 9 is separately in §4.2, pp.534–535. Cohen’s negative-value computation names Theorem 10.3.1 and Corollary 10.3.3 precisely; the book’s printed page is its PDF page minus 23.

## Exact imports, map conventions and ownership

### Two requests are satisfied by current fine statements

| Former requested stage | Exact imports | What the actual statement supplies |
| --- | --- | --- |
| MotivicEtaleKTheory:M.3 | M.3/tate-s-integer, plus M.3/symbol-residue-compatibility for B.7 | The natural adic K₂/Galois-symbol isomorphism, every coefficient level, compatibility and S-inclusion/residue maps. The degree-two statement includes ℓ=2 and real places. |
| KTheoryFiniteLocalFields:L.1 | L.1/quillen-k-groups | K_{2i}(𝔽_q)=0 and K_{2i−1}(𝔽_q)≅ℤ/(q^i−1), for every finite field and i≥1. This gives the finite localization defect and the isomorphism of torsion-free integral lattices used by B.7. |

The M.3 packet’s planning review is accepted. The finite/local K-theory packet’s overall review still needs changes, while this exact Quillen node is explicitly verified. Neither fact means the imported declaration has been implemented. The revision imports these precise statements without rebuilding their theories or promoting their owners’ statuses.

M.3 uses S_total=S_∞∪S_f, whereas this packet’s Euler products and S-integer notation use the finite-prime set S_f. Adding the archimedean places for the supplier changes neither the ring nor the finite Euler factors. The degree-two theorem at two does not justify a general higher comparison at two.

The imported Galois/Tate symbol h satisfies the signed identity ∂∘h=−κ∘tame at finite coefficient level. A commuting residue square uses −κ. This sign can be detected with coefficient 3 and residue field 𝔽₇, where the Kummer class of a generator of 𝔽₇× has order three. The revised B.7 acceptance condition records this diagnostic; a test at coefficient two alone would not distinguish the signs.

The symbol h is not silently renamed c₂,₂. The current M.8/finite-etale-chern statement and Weibel V.11.13 give the diagonal normalization c₂,₂=−h on symbols. Under RS-08, M.8 owns transport of this normalization through the actual arithmetic comparison maps and the coherent boundary. The current M.5d packet remains needs_changes; its diagonal formula does not supply the complete coherent arithmetic agreement required here. B.7 is now an explicit consumer of that existing M.8 request. M.7 still supplies higher corrected real-place comparisons, and I.10 supplies compact-support/descent compatibility. The existing public name `chern_localisation_square` is retained; its commented Chern-map prototype states this ownership boundary.

### B.5 and B.6 remain different exact comparison obligations

For B.5, write 𝒢₂ for Greither’s meromorphic function and P₂=(T−q₀)^δ𝒢₂ for its numerator, with δ=1 exactly for the trivial first-kind character. Characteristic ideals and μ use P₂/2; in the exceptional χ=ω branch it is a unit. The supplier still needs to expose that separate branch consistently with Greither pp.452 and 470. Its request now explicitly lists both B.5’s abelian comparison and B.8’s higher real-abelian theorem as consumers: the latter’s dyadic base case also uses χ=ω.

With N=2^b and a=χ(φ(γ₁)), the graph condition is ρ(γ′)^N=a and the algebraic eigenvalue is a(1+y)^N. The inverse substitution ζρ=ρ(γ′)⁻¹ produces this eigenvalue in Greither’s u^s variable. The uninverted substitution produces a⁻¹(1+y)^N. Rognes–Weibel Appendix A uses u^(1−s); its formula must be translated before being used here. The current Dirichlet L2 planning packet does not supply this exact normalized second-kind theorem. I.2 must also supply actual norm-kernel/quotient maps and the finite-error argument under μ=0. Root matching alone does not prove the integral ideal equality.

For B.6, the exact dictionary is G_F(T)=−(1+T)ι_u((γ−1)g), and the I.9 output before applying the involution is char(X)=((γ−1)g). H³=ℤ₂ accounts for the augmentation factor. Kurihara Lemma 4.2 retains an order-two cokernel, and Proposition 4.4 assumes an odd prime. An identity of characteristic ideals can discard finite modules that survive arithmetic specialization: Λ/(2,T) has unit characteristic ideal but coinvariants of order two. I.10’s actual finite descent is therefore still required.

### Confirmed ownership findings

RT-AREA-ktheory-1/10 remains resolved by the direct N.3:ranks/N.4 prerequisites of B.1. There is no local W₂ or finiteness construction. RT-AREA-ktheory-1/11 remains resolved by the direct N.8 certificate import into B.3. The independent quadratic generation upper bound is still that owner’s obligation. RS-16 remains respected: I.9 owns the modern determinant theorem, I.10 the comparison and finite specialization, and B.6 the special-value application.

At main commit `4689b245047bbf5817d9304ec7fff6b98f19ab31`, the untruncated recursive tree and **all 36 JSON files in `research/blueprint/links/`** were checked; every fetched blob matched that tree. The only link targeting B.1–B.8 is `links[24]` in `research/blueprint/links/tauceti_TauCetiRoadmap_ArithmeticDirichletSeries.json`, blob `3d7e10da4688ecb4142e7ec47fb4e8bf2e9c8e8f`, retained by its accepted review. It supplies finite Euler deletion for Re(s)>1. B.7 already imports the exact `restrictAway`, `restrictAway_apply` and `dedekindZeta_eulerProduct_hasProd` declarations; R.5’s continued function supplies the separate continuation to −1. No new Euler-product construction or request is introduced.

The ownership records checked at that commit are `research/blueprint/redteam/RT-AREA-ktheory-1.review.json` (`cdc12992bce191cf8cfc6feceaced7530a234b72`), `research/blueprint/atlas/roadmaps/ArithmeticKTheory.json` (`b094b9ca288fe9eeb3e06474997cfac9404576d8`), the accepted `research/blueprint/restructure/RS-16.result.json` (`a6664e5956c689367ba2158ff33d2c1218aa89e9`, owners[22], links[21], I.9/I.10), and `research/blueprint/atlas/roadmaps/IntegralIwasawaTheory.json` (`7c1b7017b1dc3ca7f2c0832e6987d6687cc7cabc`).

The SpecialValuesBirchTate atlas extract, blob `573f0549c093b7c8cbd651dc5a2b7aedfaca661d`, has 46 edges, 24 touching B.1–B.8. It still omits the three confirmed coarse edges N.4→B.1, N.3:ranks→B.1 and N.8→B.3. The packet’s fine imports implement these dependencies. The atlas extract is outside this revision’s authorized deliverables, so this revision does not claim to have repaired its coarse graph.

## Sources, versions and findings

All eight primary PDFs were freshly downloaded, their SHA-256 hashes recomputed, and the stated passages read. Source records retain historical dates and wrapper versions; the new reads are dated 2026-10-07. The next table records the actual reading scope rather than a claim to have reread each entire book.

| Source and public copy | Passages freshly read | SHA-256 |
| --- | --- | --- |
| [Charles A. Weibel, The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) | VI.8.6–8.8, pp.515–516; V.11.11 proof, V.11.12(4), V.11.13, pp.457–459; VI.9.4–9.5, pp.519–520; IV.1.13, p.269. Author draft 29 August 2013; printed page = PDF page − 8. | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` |
| [Henri Cohen, Number Theory, Volume II: Analytic and Modern Tools](https://maths.dur.ac.uk/users/herbert.gangl/ch.pdf) | Theorem 10.5.3, p.218; Proposition 10.5.5 and Euler-factor proof, p.219; Theorem 10.3.1 and Corollary 10.3.3 with proof, pp.186–189. Printed page = PDF page − 23. | `e25889069c18eee932088e1b9264c614ce883bb394a03cb3a109f5859ab57ca0` |
| [Manfred Kolster, A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf) | Entire note, pp.248–251; printed page = PDF page + 247. Fresh wrapper hash matches the 2026-10-06 copy; the older wrapper record remains provenance. | `ce649cf4085c501f755517afb0dd7bc9a9798ad1ee9a37116d7b5aae98073f2f` |
| [Manfred Kolster, Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf) | Author copy, pp.7–16, including descent/codescent, Proposition 3.2 and the trivial-character correction; printed page = PDF page. | `5772ace94ba4b247ae745cf32c6b3b079fe25e0de46af057cb4e971a1c3ead28` |
| [Cornelius Greither, Class groups of abelian fields, and the main conjecture](https://www.numdam.org/item/AIF_1992__42_3_449_0.pdf) | Printed pp.451–454 and 469–470 in full; 52 PDF pages, printed page = PDF page + 447. | `8e4db974556923a9532151657039d50b34028254f13fc2f1541f449bb50623da` |
| [John Rognes and Charles A. Weibel; appendix by Manfred Kolster, Two-primary algebraic K-theory of rings of integers in number fields](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf) | Introduction pp.1–4 and Appendix A pp.45–49; printed page = PDF page. | `9d770c079313ccc26f29da641d301269edf12985f122fd107ab201f086e8f446` |
| [Masato Kurihara, On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf) | §4, pp.22–28, including Theorem 4.1, Lemma 4.2, Corollary 4.3 and Proposition 4.4; printed page = PDF page. | `22ebb98ed24bcebe814ea2f6ba6b4681d7dbafd309b55f06b02f5807fec8ff33` |
| [David Burns and Matthias Flach, Tamagawa numbers for motives with (non-commutative) coefficients](https://ems.press/content/serial-article-files/25892?nt=1) | §3.4, pp.526–529; §§4.2–4.3, pp.534–537. Publisher copy. | `d9caa72585d3ae77f34fd1798289345ca2d7a0f4284933c1c0945cb0f0994e5b` |

Greither pp.452,469–470, Kolster 1989 p.250, Kolster 2009 pp.8–9,11,14–16 and Rognes–Weibel Appendix pp.48–49 were additionally inspected as page images. All downloads finished. Washington’s book, Federer’s original paper and the Kolster notes’ published volume were not freshly accessed. Their original results remain named supplier inputs. No fresh publisher-volume verification or erratum search is claimed for E3–E6.

| Finding | Retained correction and scope |
| --- | --- |
| E1 | Kolster 1989 p.250: the proof evaluates L₂ at −1. |
| E2 | Kolster 1989 p.250: the no-finite-submodule assertion is about the compact dual. |
| E3 | Kolster 2009 p.16: reference Corollary 3.4. |
| E4 | Kolster 2009 p.9: correct the field symbol in H⁰. |
| E5 | Kolster 2009 p.9: the direct H¹-torsion/H⁰ isomorphism needs nonzero twist; in general quotient by the divisible subgroup. |
| E6 | Kolster 2009 p.11: H¹ rank is r₁+r₂ in odd weight and r₂ in even weight. |
| E7 | Greither 1992 p.469: include the exceptional χ=ω branch; the same article’s pp.452 and 470 give its intended statement and proof. |

Every finding retains its confirmed independent verdict. E5/E6 retain `affects: a stated result`; the others retain their recorded effect. The additional errors corrected in this revision were errors in the planning text, so no spurious published-source finding was added.

## Validation and limits

### Exact baseline, audit and supplier provenance

The current reviewed `data/library-coverage.json` is blob `5e708cfc74a51b10e62149113872fe4e00eb5846`; all eight scoped rows were read. Its accepted AUDIT-27 independent review is blob `18b5dc3e19244b0ffd0a3123adeeeec96751b8cd`. The baseline check read all 78 cited declarations in 50 source modules, including their namespace and section hypotheses, at the exact library pins. Every module matched its returned Git blob. In particular, it distinguished native ideal-count LSeries from analytic continuation, the full number-field Kummer–Dedekind hypotheses from the generic prime-factor support bijection, and the inverted-prime convention for S-integers.

| Supplier input at main `4689b245047bbf5817d9304ec7fff6b98f19ab31` | Exact blob and relevant status |
| --- | --- |
| `research/blueprint/packets/MotivicEtaleKTheory--M.1.json` | `a3b5dc382bbe0b530c07c52787ad5cbc183bfa67`; accepted, with review `83960b32aacf90497b7f69161a6c949bb867c0bc`. |
| `research/blueprint/packets/KTheoryFiniteLocalFields.json` | `ab13bd6bad5142976cf0fe10bac07052a0f5aa73`; overall needs_changes, review `8d635dc7f12d15ac0cbbf40b2e41d3cf8e6ae5e7`; exact Quillen node verified. |
| `research/blueprint/packets/MotivicEtaleKTheory--M.5d.json` | `1131639cd6f58fd2775a4268343099846815b9f8`; needs_changes; stronger coherent arithmetic M.8 comparison remains requested. |
| `research/blueprint/packets/DirichletPadicLFunctions--L2.json` | `766f180cd76203217907541cd74dbdb278b3554f`; accepted plan does not export the B.5 normalized second-kind theorem. |
| `research/blueprint/packets/EulerSystemsCyclotomicMainConjecture.json` | `72f7e986b5fb2bfb47dd7edce91f50da1ec7f195`; exact Greither exceptional-character export remains requested. |

All 32 distinct direct foreign fine prerequisites resolve. Each of the seventeen retained requests still names a stronger or unavailable exact statement: the normalized analytic inputs; N.6’s full coefficient sequence; actual Iwasawa minus maps and twist/evaluation; I.5/I.9 main-conjecture outputs; I.10’s finite-sensitive comparison; M.7’s higher and real-place comparisons; M.8’s coherent normalized Chern comparison; PS.3–PS.5 integral lattice, determinant and correction data; the perfect-complex/trivialization contract in K.5; the upstream ClassFieldTheory Layer 13 theorem; and Greither’s exceptional branch. Resolution of a fine planning statement does not promote its owner’s review or implementation status.

### Bounded recursive dependency check

Starting from all 51 root nodes, a depth-first traversal of fine prerequisites found **633 reachable fine nodes**, **3,065 distinct prerequisite edges**, **645 baseline-reference leaves** and **97 catalogued terminal stage contracts**. It found zero missing fine IDs, zero unregistered terminal stages, zero conflicting packet node IDs and zero cycles in the traversed fine graph. Every reached fine node has a nonempty statement. The root packet Git blob checked was `93f910bb5b723c53db5d8b81f1764dd4db957543` (SHA-256 `937be69a3e40d162f313afaefbbb70f50133f70d0f7e7d6e0f838661176cc86c`).

The 24 reachable foreign owner files were independently matched to the untruncated main tree at `4689b245047bbf5817d9304ec7fff6b98f19ab31`: four matched byte-for-byte and twenty matched after removing precisely one extra terminal newline introduced when saving read-only context. Their JSON values are therefore exactly the frozen main inputs. Statements, hypotheses and direct prerequisites of the 73 additional nodes exposed by the final recursion were read. This extends the existing authoring context; it is not an independent mathematical review of every foreign packet.

For reproduction, index fine nodes in the current packets, use an integrated decomposition only for an ID absent from those packets, start from the 51 root IDs, and follow `prerequisites`. In the legacy GeneralAlgebraicKTheory decomposition, add incoming `links` as prerequisite edges. Stop at registered atlas stages and baseline references. Test the traversed fine graph for cycles without expanding those stage endpoints.

Four reached legacy IDs resolve through `data/decompositions/GeneralAlgebraicKTheory.json`, blob `3f23ad3fe00048dc671d51cac1f7f63c85ed6c08`: K.7/biexact-pairings-and-products, K.4/relative-S-construction-fibration-and-delooping, K.4/waldhausen-additivity-theorem, and K.4:construction/waldhausen-categories-and-S-construction. This accepted decomposition retains its product-coherence, degreewise-realization and Waldhausen/fibration-source gaps. The old product ID is not silently redirected to a differently named K.6 node.

The 97 stage endpoints remain supplier contracts. This check does not establish aggregate-stage acyclicity or certify that every transitive foreign request has exhausted its own finer suppliers. The 645 baseline strings are graph leaves, not an additional 645-declaration source audit. These limits do not alter the root’s complete target-level planning status or close any owner-side proof gap.

The issue’s official packet checker reports **zero packet errors and zero packet warnings**, status complete, eight planned stages and zero closed stages. The separate diagnostic says no local baseline declaration index is available, so that checker’s baseline handling is form-only. It is not evidence of successful index validation. The source audit separately reads all 78 declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

A separate consistency pass checked every node’s statement, hypotheses, proof steps, direct prerequisites, API/test text, uses, source locators/matches and acceptance conditions against its reader section. It also checked all requests and their consumers, all gaps, the baseline register, source hashes, and preserved review/planet/name inventories. This is an artifact consistency check, not a mathematical proof.

A nested-comment scan confirms that the executable Lean text is identical to the reviewed input: 16 imports, two named declarations, seven examples and three admitted proofs. Its normalized active-text SHA-256 is `e07c8e773be22ed3494ea2c6128f6c28103d81da60d9ff0166b4730c5735ae6a`. Every node/API declaration name and all 23 test names remain represented in the suggested file. The interfaces on K-theory, cohomology, Iwasawa and motivic supplier objects remain comments.

**No compilation was performed in this revision.** There is no existing pinned Lean/Lake build in this workspace; `free -g` reports about 9 GB of memory available, below WORKERS.md’s 20 GB threshold. No build, package update, cache download or language server was started. The successful pinned-Mathlib run with exactly three admitted-proof warnings belongs to the prior independent reviewer (`codex-CTuEhy`, 2026-10-06). It covered only the active native portion and did not build the three cited Tau Ceti modules or elaborate the commented supplier interfaces.

The binding protocols and upstream guide were used throughout. The authoring session had read AdicSpaces and ProfiniteCohomology’s upstream documents in full; the original Birch–Tate plan/review’s ArithmeticDirichletSeries and GlobalNumberFields style provenance is separately retained. The reader keeps its substantive B.6 comparison table and B.8 normalization discussion, rather than reducing these to a declaration index.

## What remains and where to resume

| Stage | Status | Exact outstanding work |
| --- | --- | --- |
| B.1 | planned | The imported continuation/completion adapter and existing K₂/W₂ inputs must be implemented by their owners. |
| B.2 | planned | Supply the exact independent untruncated Deligne–Ribet integrality specialization and the normalized analytic inputs. |
| B.3 | planned | Close T.5’s K₂(ℤ) upper bound and N.8’s independent quadratic generation/certificate upper bound. |
| B.4 | planned | Implement the exact Tate import and the remaining coefficient/descent/main-conjecture inputs, retaining the trivial-character H⁰ denominator. |
| B.5 | planned | Prove the normalized second-kind involution, actual minus-module comparison and exceptional-character export; complete the integral arbitrary-ramification comparison. |
| B.6 | planned | Supply I.10 table entries (a),(b),(f),(i), with actual maps and all finite/Tor terms, then combine them with I.9 and the exact series dictionary. |
| B.7 | planned | Supply M.8’s normalized Chern/Galois agreement and M.7/I.10’s higher and compact-support compatibilities; retain the signed residue convention. |
| B.8 | planned | Supply the remaining higher real-place comparisons, integral motivic lattice/regulator and ETNC statement infrastructure. Keep the general motivic/ETNC assertions as precisely defined conjecture predicates. |

The four recorded gaps are the two independent tame-kernel upper bounds, the B.5 arbitrary-ramification comparison and the B.6 modern finite descent. They have exact owners and consumers. The complete target-level pass stops here under the issue’s explicit stopping rule; no target has been removed or hidden behind an unspecified follow-up.

The next independent reviewer should start with the changed proof sentences and the exact supplier substitutions above, then read the synchronized B.5 and B.6 contracts in full. Check that the two newly used fine interfaces suffice at the specified coefficients and places, that the M.8 comparison remains requested, and that local orders are not replaced by full orders in B.8. Replace the old review object only through that independent review. No author-side acceptance, merge, label or issue-state change is requested.

This handoff is self-contained; reproducing the work needs the public source URLs, exact pins and named repository inputs, not deleted job scratch files.
