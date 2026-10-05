# Review continuation: codex-Z21ta0

Codex — codex-Z21ta0, 2026-10-05. Refs #346. Input commit: `e553dc9b084c4494bb4773794cd7d64f7dcd8594`. Bot reply 5993594502 confirms this session's claim comment 5993584008. The issue was read before claiming and again after confirmation. This session did none of the input planning. The preceding checkpoint below is preserved as **historical evidence from codex-izOPZo**, not fresh verification by this session.

**This remains an unfinished review checkpoint with no overall verdict.** There is no top-level packet `review` object. No node is given a final checked disposition and no stage or key definition is promoted. The planning pass's `status: complete` remains unchanged. Its partial/not_read coverage is permitted; it is not by itself grounds for rejecting the plan.

## Changes in this continuation

1. Add the existing `IsGerbe.isIso_hom` projection to the root planning API. The carrier already has this field; it is necessary because the pinned `IsStack` is Cat-valued and alone does not require groupoid fibres.
2. Replace the weak disconnectedness-only `GerbeTests.twoComponents` example with the exact constant `Discrete Bool` pseudofunctor on the one-point site. Its statement includes both `IsStack` and failure of `IsGerbe`. Put it after the existing `BandFixtures.constantDiagram` alias rather than introducing another carrier.
3. Propagate the chosen terminal object and the actual native-cohomology assumptions into `torsor-representative-of-class`, `class-of-gerbe`, `class-choice-independent`, `h2-classification`, `class-coefficient-map` and `class-site-pullback`. The class construction restricts a neutralizing object z over terminal S to every U; this is exactly where terminality is used. Its chosen route also requires enough injectives, the derived H1–torsor comparison, slice injective restriction and covering Čech acyclicity. The existing supplier requests remain obligations. These are requirements of the proposed proof route, not a claim that Giraud's classification fails on other presentations of a topos.
4. Give `root-gerbe-class` its missing scheme, line bundle, positive/invertible n and small étale site hypotheses, including the Kummer/Picard and classification interfaces it consumes. Synchronize all seven affected omission-ledger entries with these hypotheses. They remain omitted mathematical interfaces, rather than pretend Lean signatures.
5. Add `band-morphism-equivalence` as a direct prerequisite of the classification proof's band-preserving-map-to-equivalence step. Its coherent inverse remains an independent prerequisite obligation.
6. Refine the quotient-torsor/inverse-identities gap after reading Breen's Proposition 2.14. That proposition supplies an equivalence of 2-stacks between abelian gerbes and torsors under the torsor gr-stack. The comparison with the packet's specific injective dimension shift, native δ and contraction sign is still required. Add a precise gap for the reserved key's sample API and omitted fixtures.
7. Record E10, a dimension-of-arrow misprint in BV12 arXiv v5 Definition 3.5. The limit-family node already uses the intended one-arrow compatibility square; its source match now names the slip. No mathematical conclusion changes.

Exactly nine existing node objects change (root, and indices 22, 24, 25, 26, 28, 30, 31, 33 in the incoming zero-based array). All 660 ids, 248 baseline objects, 72 source objects, eight coverage rows, 22 requests and the partial key-definition row are preserved. No node, test name or planet is added. There is one added API item, one refined gap, one added gap and one added source finding/version record. Counts: 597 raw API entries and 589 raw tests; checker-normalized 589 APIs and 556 tests; 11 gaps and 10 source findings. All implementation statuses remain unchanged.

## Fresh reading and its limits

Read the binding worker, blueprint, expansion, upstream and browser protocols, the complete upstream JacobianChallenge and AdicSpaces readers, this roadmap's complete campaign reader, the preceding report/handoff, the reviewed R09.4 library-audit row with its review metadata, and the reserved gerbe survey and exact owner assignment. This is not a complete audit of the other seven stages, or a reading of every referenced roadmap. In particular, no complete AlgebraicCurves reading is claimed.

Examined the full JSON objects for the root and indices 19–55: 38 objects in this session. The new strand is listed below. The scope is statement, hypotheses, proof sketch, API/test text and principal-source comparison; it does **not** certify recursive closure, every secondary locator, every definition API or every suggested signature. The prior 20-node record and this record together cover 57 distinct node ids at this bounded reading level. The other 603 nodes, the recursive chains of these 57, and the full eight-stage target/ownership contract remain to review.

Read the supplier objects D0 `stackification`, `groupoid-quotients-and-two-fibre-products` and `cech-to-derived-comparison`. The latter's cover/basis comparison does not by itself establish the more specific injective Čech acyclicity requested here. Read the local packet requests to SF.1/SF.2: H1 torsors, slice injectives, Kummer/Picard, affine Hopf limits and descent. These are precise supplier boundaries, not checked source theorems from those roadmaps. The full SF.1 proof chains and coherent-duality ownership import remain unchecked.

| Node suffix (prefix `AlgebraicModuliForArithmeticGeometry:`) | Principal statement examined and remaining boundary |
| --- | --- |
| `R09.4/change-band` | Contracted Isom torsors and groupoid universal property; composition and the signed contraction dictionary remain open. |
| `R09.4/lifting-gerbe` | B-torsors lifting a D-torsor for a short exact sequence; epimorphism is sheaf-local, not globally section-surjective. |
| `R09.4/injective-boundary-bijection` | Native derived dimension shift, using vanishing in degrees one/two and exactness. |
| `R09.4/torsor-representative-of-class` | Inverse dimension shift followed by the requested H1 torsor comparison; hypotheses made explicit. |
| `R09.4/injective-gerbe-neutral` | Terminal-site object from injective band; cover/slice interfaces still needed. |
| `R09.4/class-of-gerbe` | Pair quotient with z over terminal S; sheaf/torsor construction and sign still open. |
| `R09.4/class-choice-independent` | Neutralization comparison and common injective embedding; native naturality is available, torsor comparison still open. |
| `R09.4/h2-classification` | Fixed-band equivalence classes and zero iff neutral; both inverse identities and coherent equivalence still open. |
| `R09.4/root-gerbe` | Roots of a line bundle without a section; distinct from the divisor-root-stack owner. AJT's source setting is complex/smooth, so general invertible-n Kummer input is a supplier obligation. |
| `R09.4/root-gerbe-class` | Kummer boundary on Xét with explicit geometric hypotheses; sign comparison remains open. |
| `R09.4/root-o1-nonneutral` | Integer equation n·degree(M)=1 is impossible for n>1. The exact P1 degree dictionary is requested from upstream Layer A, not newly planned here. |
| `R09.4/class-coefficient-map` | Same-site `Sheaf.H.map`, keeping fixed bands and class-construction inputs. |
| `R09.4/class-site-pullback` | Geometric inverse image with a separate derived comparison; coefficient maps do not supply it. |
| `R09.4/finite-etale-gerbe` | Finite étale groupoid presentation and gerbe condition; Bμp is excluded in characteristic p. |
| `R09.4/compatible-limit-family` | Objects with transition isomorphisms, component arrows and coherence; E10 preserves the separate index two-arrow condition. |
| `R09.4/limit-stack-descent` | Descent of objects, transitions and arrows component by component. |
| `R09.4/nonempty-affine-limit-gerbe` | Nonempty-limit hypothesis retained; affine Isom limits use faithfully flat transition maps. |
| `R09.4/profinite-etale-gerbe` | Gerbe condition plus a finite-étale two-limit presentation, without an algebraic finite-presentation assertion. |
| `R09.4/locally-full` | Faithfully flat stabilizer maps, not surjectivity of field points. |
| `R09.4/locally-full-isom-epi` | Affine fpqc Isom epimorphism criterion; reduction to common field requires supplier descent. |
| `R09.4/locally-full-relative` | Faithfulness plus local fullness gives equivalence; coherence supplier still relevant. |
| `R09.4/locally-full-limit` | Injective Hopf maps into a filtered colimit; projection conditions must remain compatible. |
| `R09.4/z-hat-gerbe` | Neutral two-limit of factorial cyclic classifying gerbes; identification with actual profinite torsors remains a gap. |
| `R09.4/z-hat-not-finite-type` | Every finite generator list lies at one finite stage, whereas the dimensions of later coordinate stages are unbounded. |
| `R09.4/z-hat-not-algebraic-fp` | Published BV19 Proposition 3.1 supplies the affine-gerbe stabilizer criterion. Not an assertion about every algebraic stack's stabilizers without hypotheses. |
| `R09.4/self-equivalence-isom-transport` | Conjugation-independent Isom transport from the band equation. |
| `R09.4/self-equivalence-torsor` | Local Isom torsors glued without assuming a neutralization; native assembly chains still unchecked. |
| `R09.4/all-self-equivalences` | Groupoid equivalence including modifications; locality and supplier descent still required. |
| `R09.4/quotient-gerbe-transgression` | Finite constant group centralizers with actual equivariant gerbe structure; descent/coherence gap remains. |
| `R09.4/inertia-stack` | Pairs (object, automorphism) and conjugating arrows; fibre automorphism sheaf retained. |
| `R09.4/quotient-inertia-components` | Fixed loci modulo centralizers for a finite constant group; no blanket tameness hypothesis added. |
| `R09.4/canonical-affine-factorization` | Locally-full then faithful factorization, retaining invertible modifications. |
| `R09.5/affine-kernel-rigidification` | Quotient by stabilizer kernels with affine local groupoid descent; no unsupported generic fpqc stackification claim. |
| `R09.4/canonical-factorization-unique` | The quotient Isom sheaf supplies the middle gerbe and uniqueness. |
| `R09.4/finite-etale-image` | Image gerbe into a finite étale gerbe from pro-étale source; not every target object is assumed in the image. |
| `R09.4/locally-full-finite-presentation` | Refinement/cofinality of finite images is the recorded gap, not a proved approximation result. |
| `R09.4/relative-profinite-gerbe-finite-stages` | Finite-stage synchronization from Bresciani Lemma 2; arithmetic/anabelian inputs remain upstream. |

The table uses exact node suffixes; array indices are 19–55 at the recorded input commit. The rigidification node belongs to R09.5; its reading does not certify that stage’s audit or target coverage. No table row should be imported as a final `checked` disposition.

## Reserved gerbe contract

The survey's `algebraicgeometry/gerbes` is assigned once to `AlgebraicModuliForArithmeticGeometry:key/gerbes`. Its partial status is retained. The native root class agrees with Stacks 06NY Definition 8.11.1: a stack in groupoids, locally nonempty and locally connected. The additional projection exposes its groupoid requirement.

| Survey sample clause | Planned consumer and present limitation |
| --- | --- |
| BA is neutral with zero class | Classifying-gerbe, neutralization and `GerbeClassTests.BA`; the root classifying suggested fixture remains omitted. |
| Root of O(1) has Kummer class | Root-gerbe and root-gerbe-class; native Kummer/Picard and δ sign dictionary still required. |
| Root of O(1) is nonneutral for n>1 | Root-o1-nonneutral and `GerbeTests.rootNotNeutral`; the root suggested fixture remains omitted. |
| Fixed-band equivalence classes ↔ derived H2, zero iff neutral | Classification route with explicit native prerequisites and two inverse identities still open. |
| Pullback preserves band/class | Relative pullback and class-site-pullback; needs the geometric change-of-site comparison. |
| Neutral self-equivalences ↔ torsor groupoid | Neutral-self-equivalences, including isomorphisms/modifications; not merely torsor classes. |
| Two-limit objects include coherent transitions | Compatible-limit-family and its non-example; several native API/test signatures remain in the omission ledger. |
| B(Z_hat) is not algebraic finite presentation | Factorial finite-stage tower and non-finite-type stabilizer; torsor-limit identification and native algebraicity interface remain open. |

This mapping is evidence of where to finish alignment, not a declaration that the root's four incoming API entries and three tests fulfilled all eight clauses. The new gap makes that unfinished contract explicit. No general stack machinery or coherent duality is reassigned here.

## Source versions read in this continuation

Fresh downloads on 2026-10-05 match the packet's recorded SHA256 values. Read only the mathematical portions identified here; whole-paper reading is not claimed.

| Source | Fresh reading scope | SHA256 |
| --- | --- | --- |
| [Stacks 06NY](https://stacks.math.columbia.edu/tag/06NY) | Definition 8.11.1 | `784df742e6d6c147f90645bfef73a6ad9fa60cb34e9b2d3006401857ed88a32e` |
| [OG07](https://stacky.net/files/written/Stacks/Stacks.pdf) | Theorem 31.7 and Remark 31.8 classification/lifting paragraphs, PDF125–127; not a complete rereading of every diagram in §31 | `716bf95c7a200194d5fd1f2af48372253fde5ea65487b5d362bcccb5e0b7426a` |
| [Milne IV](https://www.jmilne.org/math/Books/ECpup4.pdf) | Printed pp.8–9, gerbes, classification, lifting and injective-band paragraph | `1aef1301a554ae7c3dd153aea53e8c8a1bdeefe3a5b6c561a280857816618bb7` |
| [Breen94](https://www.numdam.org/item/AST_1994__225__1_0.pdf) | Printed pp.52–57, in particular §2.13 and Proposition 2.14 with proof | `04505e408bc436c4eb2281c8517cc41234ceebadb8df4c52f95aeaf449967801` |
| [AJT11 v2](https://arxiv.org/pdf/0907.2087v2) | §2.2, Definition 2.2 and Remark 2.4, PDF5–6 | `8d07faa51c1917d2e1f0ffe8c9b55b6f79a031fb1e8ec4a158ef058d86351bbc4` |
| [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf) | Definition 2.6/self-equivalence and Construction 2.8, pp.514–519; no reread of E9's p.540 in this continuation | `f2231145778b0a3fb57ce241ce0014fc4299f0de536d3e19daf4206d146c3e07` |
| [BV12 v5](https://arxiv.org/pdf/1204.1260v5) | §2 conventions, §3 through Proposition 3.9, §4 through Definition 4.6, PDF3–9 | `c2a803a6a63837670f8d5eb1b2fa19606b74ab59c81335c6df9b631fa9b21eed` |
| [BV19 published](https://msp.org/ant/2019/13-3/ant-v13-n3-p01-s.pdf) | §3 Proposition 3.1 and proof, Definitions 3.4–3.6, Remark 3.7, factorization 3.8 and Propositions 3.9–3.11, pp.536–541 | `64fca3767f3c6cbd02fbf84f1fb456c7fda30c7bc95ddc8c8c84cd3bd8629111` |
| [Bresciani24](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf) | §2 including Lemmas 1–2, PDF5–7 | `77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e14812` |

For the nodes citing BV19's preprint page numbers, this published comparison does not certify those preprint locators: fetch the exact cited preprint or synchronize them to the published source in a continuation. No citations were silently switched between versions. Original E1–E9 verdicts are retained from the previous checkpoint; they were not all independently replayed here.

E10 is the preprint phrase “for each 2-arrow a : j → i” in the morphism compatibility square. The source defines Γa and ξa for one-arrows; a two-arrow relates parallel one-arrows and has its own Γa,b coherence equation. Thus the square requires **one-arrow**. The packet records this as `misprint`, affecting `nothing`, with a bounded confirmation verdict. Title/erratum/corrigendum and exact phrase searches found no separate correction. The AMS publication download returned HTML and the SNS publication/accepted-copy attempts returned HTTP 403, so `sourceVersions.accessNote` explicitly scopes the finding to arXiv v5. The institutional publication record is [SNS 11384/55844](https://ricerca.sns.it/handle/11384/55844). No author communication was sent and no exhaustive novelty assertion is made. Section 18 verdicts do not count as completed independent review until the whole review job finishes.

## Eight additional baseline statements read

Exact pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read statements together with their ambient category, universe and typeclass binders. Local Mathlib source bytes were compared with `git show` at the pin; Tau's module was read directly with `git show` at its pin. This authenticates source, not a full elaboration.

| Declaration | Module |
| --- | --- |
| `CategoryTheory.Sheaf.H` | Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean |
| `CategoryTheory.Sheaf.H.map` | Same |
| `CategoryTheory.InjectiveResolution.extAddEquivCohomologyClass` | Mathlib/CategoryTheory/Abelian/Injective/Ext.lean |
| `CategoryTheory.Abelian.Ext.eq_zero_of_injective` | Mathlib/Algebra/Homology/DerivedCategory/Ext/EnoughInjectives.lean |
| `TauCeti.CategoryTheory.Sheaf.H.δ` | TauCeti/CategoryTheory/Sites/SheafCohomology/LongExactSequence.lean |
| `TauCeti.CategoryTheory.Sheaf.H.exact_map_δ` | Same |
| `TauCeti.CategoryTheory.Sheaf.H.exact_δ_map` | Same |
| `TauCeti.CategoryTheory.Sheaf.H.δ_naturality` | Same |

The module hashes, in the order of the four distinct modules above, are `5d2f823958719336846ff7b64e334267bce67f1d224929db72553337679fe639`, `389fea95fa03233fd72c961d10f4b666ffe42ed650396b21057b6c22fde2dd6d`, `3d33509046db7e4a0bed84a5235709f6be04bafb071d5e48136dee379928facb`, and `982370059eca19ef8d11dd281c29a9a5c0b884204b9fd82ba8c53009c4e08d8e`.

Native H is Ext from the constant sheaf associated to ULift ℤ, under HasSheafify and HasExt. Its `map` changes coefficients on one site. The Basic module's cohomology-presheaf TODOs do not furnish the missing slice/global comparison. Injective coefficients give positive-degree vanishing. Tau δ is postcomposition with the short-exact-sequence Ext class, with indices n0+1=n1; exactness in degrees one/two gives the dimension shift. Its coefficient universe follows the site's morphism universe. None of these declarations supplies the quotient torsor, Kummer dictionary, geometric inverse-image cohomology map or the signed gerbe comparison automatically.

The previous ten baseline readings are historical; they are not newly counted in this run. The remaining baseline statements and every use-site hypothesis still require review before a verdict.

## Validation boundary and resumption

The corrected packet checker passes with zero errors/warnings. Source-finding schema/version checks, four-file intake checks, preservation checks and whitespace checks pass. The actual completion classifier reports this review unfinished.

An isolated extraction of the exact root class, the existing constant-diagram alias and the new twoComponents example elaborates at the Mathlib pin, with only the intended `sorry` warning. Reconstruction: use imports `Mathlib.CategoryTheory.Sites.Descent.IsStack`, `Mathlib.CategoryTheory.Bicategory.Functor.LocallyDiscrete` and `Mathlib.CategoryTheory.Discrete.Basic`; retain the source declarations' namespaces, universes and category binders. The disposable extraction's SHA256 is `f4ba012c9f2bdb5cfb45f55d1ae0f0167bf9ade60c13ffe2de0de902507103d5`. Its success checks this statement's types; it does not prove either assertion or elaborate the rest of the suggested file.

The full-file `lean-check` stops at the missing object file for `TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence`. Memory available before the fresh checks was 102 GB. Shared Mathlib is at its exact pin, but shared Tau Ceti is at `cf386627e9176a3827c1a5fe804989fd94a4d216`; no full-file or exact-Tau-pin compilation is claimed. No build, update, cache fetch or language server was started. Existing embedded implementation/proof archives were not replayed.

Resume by independently checking these nine edits and E10, then the H2 quotient/sign/choice-comparison proof and its supplier chains. Obtain the exact native build before full elaboration. Continue the remaining 603 node objects and all recursive prerequisites, baseline binders, secondary locators, stage targets, APIs/tests, planets and coherent-duality imports. Align the reserved gerbe contract before changing its status. Reader synchronization remains an orchestrator task because the reader is outside this issue's permitted deliverables. Keep the packet without a top-level review until the entire issue checklist is satisfied.

---

# Historical checkpoint: codex-izOPZo

The following record describes the preceding session's input, actions and evidence. Its counts and frontier are historical; the continuation above supersedes them for resumption.

# REV-AlgebraicModuliForArithmeticGeometry--A0-extension: independent review checkpoint

Worker: Codex — codex-izOPZo. Date: 2026-10-05. Refs #346.

**This is an unfinished review, with no overall verdict.** The packet deliberately has no top-level `review` object. The intake must merge this as a checkpoint and release the same review job for continuation. Individual source-finding verdicts are bounded evidence for that continuation; they do not accept the packet or certify implementation.

The input at commit `bc9f347fa6f5969919e5f0294eb19ab1512594b4` has 660 nodes and 248 baseline declarations. It was written by other sessions, including codex-a71f92 and codex-7e92bd. This session did none of the planning. Bot confirmation on issue #346 identifies claim comment 5992867541 and Codex — codex-izOPZo. The whole issue was read before claiming and again after confirmation.

## Work completed and counts

- Read the worker, blueprint, expansion and upstream protocols; read the whole upstream JacobianChallenge and AdicSpaces roadmap documents. An earlier truncated AlgebraicCurves output is not counted as a complete reading.
- Read the reviewed R09.4 library-audit row and AUDIT-01 review metadata, the R09.4 stage description, the complete reserved gerbe survey contract, its assignment and the packet's key-definition row. This does not claim a full eight-stage audit.
- Examined the complete objects for the 20 nodes listed below, checked their principal source statements and the applicable hypotheses, and inspected the initial gerbe/band/neutralization Lean signatures. Secondary sources and prerequisite chains are not all verified. In particular, Breen94 Proposition 2.14 and the later native adapter chains still need independent reading.
- Independently read 10 of the 248 baseline declaration statements, with their ambient binders, in six modules at the exact Mathlib pin. No baseline declaration was removed, replaced or added.
- Confirmed all eight incoming source findings at their quoted passages and added one proof finding, E9. Added E1's missing `source: OG07` association.
- Corrected four existing node objects and the neutrality signature. Added no nodes, API names, test names or planets. One API statement and one theorem acceptance condition were refined.
- All 660 node ids, all 248 baseline objects, the eight coverage rows, 10 gaps and 22 requests are retained. All implementation statuses remain unchecked. The raw API/test counts remain 596/589; the checker normalizes them to 588/556.

## Corrections

1. **Terminal object for global neutrality.** The packet requires a chosen terminal object S, but the Lean predicate previously accepted any object S without a terminality witness. `IsNeutral` and `Neutralization.isNeutral` now take the native `Limits.IsTerminal S` witness. The neutralization node lists that existing baseline declaration and its API explicitly distinguishes global neutrality from an object on a slice. `Neutralization F S` remains actual section data over arbitrary S, so the existing restriction construction still has its proper generality. The neutralization-equivalence and neutral-self-equivalence node hypotheses now explicitly locate their object at the chosen terminal S. The fibre-category/groupoid API and the geometric examples are still to review.
2. **Equivariant map in quotient exchange.** The commuting-quotient theorem retains its statement. Its proof now expressly keeps the map to N on Q ≅ P×_T P′. Descent of Q as a G1-torsor does not generally descend an equivariant map to a space on which G2 acts nontrivially. The source match names E3 for the test-base letters and E9 for this separate issue. An acceptance case records the constant C2 translation torsor.
3. **Source-finding evidence.** E1–E8 now have `confirmed` verdicts naming this review job and exact checked versions. The old reading records are preserved; fresh reads below reproduce the same bytes. E2's verdict confirms the published text only and does not claim to recheck its preprint. No inherited proof archive or alternative classification proof was independently replayed.

## Source findings checked

| Finding | Passage independently read | Result |
| --- | --- | --- |
| E1 | Olsson/Geraschenko, Theorem 31.7, PDF125–126 | Explicitly incomplete effectivity paragraph and inverse-classification exercise; theorem not disproved. |
| E2 | Borne–Vistoli, published Proposition 3.10, p.540 | Final two factorization labels concern condition (4), not (3). |
| E3 | Groechenig–Wyss–Ziegler, published Lemma 4.7, p.540 | Both descended torsors and their product belong over test scheme T. |
| E4 | Stacks 04W8, full proof, step 4 | Pulled-back cover is fpqc; undefined U_i must be U. |
| E5 | Stacks 023N, full proof | The contraction requires y_j in the intervening membership assertion. |
| E6 | Stacks 06NY, Lemma 8.11.5, diagram and full proof | F′/G′ projection identities are interchanged. |
| E7 | Olsson/Geraschenko, Lemma 31.3, PDF122 | Full-faithfulness paragraph cites the lemma being proved. |
| E8 | Same lemma, PDF123 | The descended object belongs in G1(U), not G1(S). |
| E9 (added) | Groechenig–Wyss–Ziegler, published Lemma 4.7, p.540 | The map to N stays on the torsor product; it need not descend to P′. |

For E9 take S=T=Spec(k), G1 trivial, G2 the constant C2, N=G2 with translation, P=Q=G2, and Q→N the identity. Effective torsor descent gives P′=T. An identity map on the two points cannot factor through the point. Its G2-equivariance is precisely what the product-map description retains. Both possible point-to-C2 functions were exhaustively checked; neither gives that factorization. This concerns the written proof, and does not refute the quotient-exchange theorem.

The new finding is scoped to the version of record. A bounded publisher/arXiv DOI/title search for corrections found no separate erratum; this is not an exhaustive novelty claim. Existing author-note warnings and the correction comment associated with E5 remain recorded as known context. No message has been sent to source authors.

## Fresh source reading records

All bytes below were fetched directly from the public URL on 2026-10-05, hashed, and compared with the packet's recorded version. Read: the complete mathematical content of Stacks 06NY and 06PD, and the full proofs at 04W8 and 023N; Olsson/Geraschenko PDF122–127; Borne–Vistoli published p.540 (PDF11), with the immediately preceding affine-gerbe context; GWZ published pp.514–516 and 539–540 (PDF10–12 and 35–36). Other sections, other versions and entire papers were not read. Source PDFs and HTML are disposable scratch, so these URLs, hashes and page boundaries are the reconstruction record.

| Source | SHA256 |
| --- | --- |
| [Stacks](https://stacky.net/files/written/Stacks/Stacks.pdf) | `716bf95c7a200194d5fd1f2af48372253fde5ea65487b5d362bcccb5e0b7426a` |
| [BV19](https://msp.org/ant/2019/13-3/ant-v13-n3-p01-s.pdf) | `64fca3767f3c6cbd02fbf84f1fb456c7fda30c7bc95ddc8c8c84cd3bd8629111` |
| [GWZ20](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf) | `f2231145778b0a3fb57ce241ce0014fc4299f0de536d3e19daf4206d146c3e07` |
| [06NY](https://stacks.math.columbia.edu/tag/06NY) | `784df742e6d6c147f90645bfef73a6ad9fa60cb34e9b2d3006401857ed88a32e` |
| [04W8](https://stacks.math.columbia.edu/tag/04W8) | `73b3474abccacb2ecd47229ff2322316368c60fa5f90112cb351a1f1b2fe315a` |
| [023N](https://stacks.math.columbia.edu/tag/023N) | `b8d9a77257d45cfdf1068727990ce4b697f54f311b97b80511c9ed85a5f37cbd` |
| [06PD](https://stacks.math.columbia.edu/tag/06PD) | `a4eab26748859af3d26e55c73177c294c74e19e8d5cfa1811a5f5b85913cb07b` |

## Baseline declarations read

Mathlib commit: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti source pin remains `f790474821cf4256814db967cb154e7af3d0c369`.

Each of the six Mathlib module files was also compared byte-for-byte against `git show` at the exact pinned commit in the existing shared Mathlib checkout. This authenticates the source snapshot; it is not a declaration elaboration claim.

| Declaration independently read | Module |
| --- | --- |
| `mathlib:CategoryTheory.Pseudofunctor.IsStack` | `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean` |
| `mathlib:CategoryTheory.Pseudofunctor.IsPrestack` | `Mathlib/CategoryTheory/Sites/Descent/IsPrestack.lean` |
| `mathlib:CategoryTheory.Pseudofunctor.sheafHom` | `Mathlib/CategoryTheory/Sites/Descent/IsPrestack.lean` |
| `mathlib:CategoryTheory.Aut` | `Mathlib/CategoryTheory/Endomorphism.lean` |
| `mathlib:CategoryTheory.Aut.autMulEquivOfIso` | `Mathlib/CategoryTheory/Endomorphism.lean` |
| `mathlib:CategoryTheory.Functor.mapAut` | `Mathlib/CategoryTheory/Endomorphism.lean` |
| `mathlib:CategoryTheory.Pseudofunctor.StrongTrans` | `Mathlib/CategoryTheory/Bicategory/NaturalTransformation/Pseudo.lean` |
| `mathlib:CategoryTheory.Pseudofunctor.StrongTrans.Modification` | `Mathlib/CategoryTheory/Bicategory/Modification/Pseudo.lean` |
| `mathlib:CategoryTheory.Pseudofunctor.isEquivalence_toDescentData` | `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean` |
| `mathlib:CategoryTheory.Limits.IsTerminal` | `Mathlib/CategoryTheory/Limits/Shapes/IsTerminal.lean` |

`IsStack` supplies effective object descent and extends `IsPrestack`; neither forces groupoid fibres. The separate invertibility field in `IsGerbe` is necessary. `sheafHom` uses the actual slice topology and preserves the two native pseudofunctor endpoint comparisons. `Aut` multiplication reverses `Iso.trans`; the band equations use the matching native conjugation and functor maps. The terminal-object abbreviation supplies exactly the witness added to the global-neutrality signature. The other 238 baseline citations remain unreviewed in this checkpoint.

## Node reading frontier

The rows are statement/source reading scopes, not final per-node acceptance verdicts. Every row still needs the outstanding closure, API/test and suggested-file checks appropriate to it. A simple source theorem can match while its planned prerequisite graph is still unreviewed.

| Node suffix (prefix `AlgebraicModuliForArithmeticGeometry:`) | Object examined |
| --- | --- |
| `key/gerbes` | Gerbes on the existing stack carrier |
| `R09.4/equivalence-invariance` | Gerbes are invariant under stack equivalence |
| `R09.4/relative-gerbe` | Relative gerbe morphisms |
| `R09.4/relative-pullback` | Relative gerbes under two-fibre-product base change |
| `R09.4/relative-composition` | Composition of relative gerbes |
| `R09.4/relative-descent` | Descent of the relative gerbe property |
| `R09.4/abelian-banding` | Abelian bandings with conjugation compatibility |
| `R09.4/abelian-aut-commute` | Banded automorphisms commute |
| `R09.4/banding-iso-independent` | Conjugation is independent of the chosen object isomorphism |
| `R09.4/intrinsic-abelian-band` | The intrinsic band of an abelian gerbe |
| `R09.4/band-preserving-morphism` | Band-preserving morphisms and their two-morphisms |
| `R09.4/isom-torsor` | Isom sheaves as band torsors |
| `R09.4/band-morphism-full-faithful` | Band-preserving morphisms are fully faithful |
| `R09.4/band-morphism-essential-surjective` | Band-preserving morphisms are essentially surjective |
| `R09.4/band-morphism-equivalence` | Every band-preserving gerbe morphism is an equivalence |
| `R09.4/classifying-abelian-gerbe` | The neutral classifying gerbe |
| `R09.4/neutralization` | Neutralizations of a banded gerbe |
| `R09.4/neutralization-equivalence` | A neutralization identifies the gerbe with BA |
| `R09.4/neutral-self-equivalences` | The groupoid of neutral-gerbe self-equivalences |
| `R09.4/commuting-quotient-exchange` | Exchange of commuting quotient stacks |

The two D0 supplier objects `stackification` and `groupoid-quotients-and-two-fibre-products` were read, including statements, API and proof sketches. They describe the requisite generic quotient/iso-comma constructions. Their own sources and mathematical correctness have not been independently audited here. The requests to SF.1 were inspected for precise sheaf/torsor descent boundaries, but the supplying SF.1 statements remain to check. Read the generic coherent-inverse request before accepting `band-morphism-equivalence`; fibrewise equivalence alone does not supply a coherent inverse transformation.

## API, tests, coverage and ownership boundary

The reserved gerbe id occurs as a node definition in exactly this packet in the packet-directory name scan. Its definition uses the existing stack carrier and its local conditions correctly. The broader reserved contract includes bandings, neutralizations, derived H² classification and compatible profinite fpqc limits. Its `keyDefinitions` status correctly remains partial; this checkpoint does not close that contract.

The root key has three mathematical tests, but `GerbeTests.classifying` and `GerbeTests.rootNotNeutral` are still only in the Lean omission ledger. The band-morphism, relative-gerbe and neutralization ledgers likewise retain substantial omitted fixtures. The key survey's eight sample API statements are distributed through downstream plans and are not all present in the root node's API/tests. A continuing reviewer must check the exact section 19 contract and account for these tests; a comment mentioning a test is not an elaborated example. Local signature checks and the structural checker cannot certify this alignment.

R09.4 includes substantial algebraicity, atlas and moduli-stack targets beyond the gerbe strand. No stage is marked planned or closed: A0-extension, R09.3, R09.4 and R09.5 are partial; R09.1, R09.2, R09.6 and R09.7 are not_read. The existing `complete` packet status means its budget-ended planning pass, not mathematical or review closure. These open-stage statuses are permitted and are not a rejection reason by themselves. Verification of the remaining 640 node objects, their source passages, and the recursive chains of the 20 examined nodes still stands between this checkpoint and an overall review verdict. The coherent-duality import contract also remains to audit; this source/name scan does not certify cross-roadmap ownership across the entire atlas.

## Validation and Lean boundary

- Incoming packet checker: zero errors and warnings.
- Corrected packet checker with the pinned declaration index: zero errors and warnings.
- Source-issue schema/version validation: passed for all nine findings. Intake file-scope check: four files, zero problems. Whitespace check: passed. The actual `issues.deliverables_complete` function classifies this job as an unfinished checkpoint. Preservation checks confirm the entire baseline, sources, source versions, coverage, gaps, requests and key-definition rows are unchanged, and exactly four existing node objects differ.
- Full suggested-file attempt: `lean-check` stopped on an unavailable object file for `TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence`. Available memory before the attempt was 97 GB. The shared Mathlib checkout is at the exact pin, but the shared Tau checkout is at `cf386627e9176a3827c1a5fe804989fd94a4d216`. Therefore no full-file or exact-Tau-baseline elaboration is claimed, and the corrected signature remains uncompiled. No language server, library build or cache download was started. No scratch Lean projection was created.

The intake is intentionally left with an incomplete review: retain no top-level `review` until the full issue checklist has been performed. A continuing independent session must recheck these bounded changes and complete the remaining evidence. Questions for the orchestrator: make an existing exact-Tau-pin build with the required module available if feasible, and authorize any needed reader-document synchronization through an appropriate job; the reader is not a deliverable of this issue and was not edited.
