# Review continuation: codex-2ahsNe

Codex — codex-2ahsNe, 2026-10-05. Refs #346. Input commit `300bb4cef8937635f6ae26056f1e3b16f42b4eca`; branch `codex-2ahsNe-review-346`. [Claim](https://github.com/CBirkbeck/tauceti-explorer/issues/346#issuecomment-5995810022) confirmed by [bot reply](https://github.com/CBirkbeck/tauceti-explorer/issues/346#issuecomment-5995812680). The whole issue was read before claiming and again after confirmation. This session did none of the input planning.

**Unfinished independent review checkpoint; no overall verdict.** No top-level packet `review` or final per-node disposition is supplied. The complete planning pass retains its four partial and four not_read coverage rows, partial gerbe contract and unchecked implementation statuses. Those honest planning boundaries are not a rejection. Historical reports below remain attributed to their sessions and are not recertified here.

## Corrections

Five existing node objects change, incoming zero-based indices 109, 112, 115, 116 and 120. No node or baseline citation is added or removed.

- `band-center-sections` now exposes `mk` for the actual compatible family of units of native `CatCenter`, and `val_mk`, `val_one`, `val_mul`, `val_inv`. These specify the components and retain every base arrow and the pinned categorical multiplication convention. The suggested file includes their typed signatures.
- Six original tests now have explicit suggested signatures on the existing `BandFixtures` and `ConnectedBandFixtures` carriers: C3 cardinality/evaluation bijectivity, terminal-fibre triviality, S3 cardinality/non-surjectivity, a specified C3 generator section, conjugation along any connecting isomorphism in the two-object C3 fibre, and exclusion of the actual S3 transposition. No second fixture carrier is created. Each body is `sorry`; these are planning tests, not proved computations. Their comparison with geometric classifying stacks remains open. The historical omission ledger acknowledges exactly these added signatures.
- Test kinds on these nodes use `computation` and `characterisation` instead of inherited aliases. Tests themselves are retained.
- `band-center-sheaf` drops the unnecessary SF.1 stage prerequisite. Its local central-section descent chain uses native Mathlib Hom descent and the stronger `band-center-prestack-sheaf` result. This does not implement generic slice-sheaf descent. The separate `band-center-glued-comparison` is now an explicit consumer of the existing SF.1 effective-descent request; that request remains unresolved.
- `BandSheafTests.rootNonneutral` now states the actual boundary: algebraically closed k, n≥2 invertible in k, X=P¹_k with its small étale site. A global nth root of O(1) would require n times its degree to equal 1. For n=1 the fibre is nonempty, so the former unrestricted wording was false. The geometric Lean fixture and H² class/sign interpretation remain omitted. This is a correction to a packet test, not a newly found error in a published source.
- One gap records the remaining geometric fixture, nonconstant/terminal-free test, fixed-band inversion, slice comparison and H² review obligations. Existing continuation signatures for some of these tests are present, but are not independently certified by this run.

All 660 ids, 255 baseline entries, 72 source objects, 22 requests, eight coverage rows, key-definition rows, fourteen source findings and ten planets are preserved. The SF.1 request gains one consumer. Raw API/tests: 605/589→610/589; checker-normalized: 597/556→602/556. Gaps: 15→16. Source versions and all existing source-finding verdicts remain unchanged. No final planet or ownership verdict is claimed.

## Fresh reading and source boundary

Read the worker, blueprint, expansion and upstream rules, previous handoff/report, and the complete upstream JacobianChallenge and ReductiveGroups readers. Read the R09.3/R09.4 reviewed audit rows and AUDIT-01 metadata. Read SF.1's stage and inspected its supplier packet for the existing slice-sheaf request; the broad stage description does not supply the requested interface by itself. Consulted the gerbe key entry and reserved ownership records as leads, without completing the entire sample-API or coherent-duality audit. The other six stage-audit rows and all cross-atlas duplication checks remain pending.

Read the full JSON objects for **46 nodes, indices 109–154 inclusive**: the intrinsic central-section carrier, reindexing, extensionality, evaluation and band comparisons, separatedness/locality, objectwise descent, cover-centre construction, arbitrary-base compatibility and simultaneous gluing. This is bounded independent reading of statements, hypotheses, proof routes and API/test text, not final verification of every secondary locator, recursive prerequisite or native suggested declaration. Root-gerbe indices 27–28 were consulted as contextual leads, not added to this frontier.

Together with the historical 101-node frontier, 147 distinct nodes have bounded readings: **0–65, 67, 75–154**. The remaining **513** are **66, 68–74, 155–659**. Every one of the 660 still needs reconciliation and a final checked disposition before a verdict.

Freshly read [Stacks Section 8.11, tag 06NY](https://stacks.math.columbia.edu/tag/06NY), including its gerbe definition, relative characterization and Lemmas 8.11.2–8.11.8 with proofs; the [standalone Lemma 8.11.8, tag 0CJY](https://stacks.math.columbia.edu/tag/0CJY); and [Definition 8.4.1, tag 026F](https://stacks.math.columbia.edu/tag/026F). The source's band construction assumes abelian automorphism sheaves and glues slice sheaves; it omits the final varying-base conclusion. The packet's central-section sheaf for an arbitrary prestack is an authored closure argument, explicitly labelled as such, not a theorem printed in this source. Its proof descends local automorphisms through fully faithful native Hom descent, proves naturality at every object, pulls back covering sieves, retains the pseudofunctor composition constraint, and glues all slice components. Evaluation onto inertia and identification with the imported slice-glued band are separate obligations.

The twenty pinned Mathlib baseline statements listed below were freshly read with their ambient binders and hypotheses. In particular, `IsPrestack` does not assume groupoids; `sheafHom` lives on the slice; `isSheaf_comp_of_isSheaf` has an explicit limit-preservation hypothesis. No declaration is replaced by a name-only search. This does not certify the other 235 entries or every baseline leaf of indices 140–154.

- `CategoryTheory.Pseudofunctor.IsPrestack`, `CategoryTheory.Pseudofunctor.sheafHom`, `CategoryTheory.Pseudofunctor.isPrestackFor'`, `CategoryTheory.Pseudofunctor.IsPrestackFor.fullyFaithful`.
- `CategoryTheory.Pseudofunctor.toDescentData`, `CategoryTheory.Pseudofunctor.DescentData.hom_ext`, `CategoryTheory.Functor.FullyFaithful.map_injective`.
- `CategoryTheory.Aut.autMulEquivOfIso`, `CategoryTheory.Functor.mapAut`, `CategoryTheory.Aut.unitsEndEquivAut`, `CategoryTheory.NatIso.ofComponents`.
- `CategoryTheory.CatCenter`, `CategoryTheory.CatCenter.ext`, `CategoryTheory.CatCenter.naturality`, `CategoryTheory.CatCenter.mul_app`.
- `CategoryTheory.GrothendieckTopology.pullback_stable`, `CategoryTheory.Presheaf.isSheaf_comp_of_isSheaf`, `CategoryTheory.isSheaf_iff_isSheaf_of_type`, `CategoryTheory.Presieve.IsSheaf.isSeparated`, `CategoryTheory.Presieve.IsSeparatedFor.ext`.

Source downloads on 2026-10-05 are reconstructible by the URLs above and SHA256:

| Tag | SHA256 |
| --- | --- |
| 06NY | `784df742e6d6c147f90645bfef73a6ad9fa60cb34e9b2d3006401857ed88a32e` |
| 026F | `0024923a8e370df81c72261a9765c15c3e1d3bbb8b59a46ab41605f2f2ae60a0` |
| 0CJY | `41dd0c0a1e20dfe2fd60212274a30f259ae0875225b1540b069adf3f89f27a9e` |

Each following module was compared byte-for-byte with Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`; paths below are relative to `Mathlib/CategoryTheory/`:

| Module | SHA256 |
| --- | --- |
| Center/Basic.lean | `a94d5510ede4d946248e08dd97bbfee277f0f873b4175a9f0bf4a7881f76cc3f` |
| Endomorphism.lean | `7c9eb33bb74caeacb6efe3bab7f7e57ad77c07b42489ba91952eebf866fcca4f` |
| Functor/FullyFaithful.lean | `94c995fd165ad4c7a422bca4b64d422deb2207bc490967487bb20b16b2d3315e` |
| NatIso.lean | `c2e8b0662cae553808f1973dfc6027272b8ec2697a105a487ce1b1044330d103` |
| Sites/Descent/DescentData.lean | `2292153f538142a8c3879094fed08f38a619a6dd13af91ab1c2f29448fb5e13e` |
| Sites/Descent/IsPrestack.lean | `470b75a20ab5cb1de6de12444a84d4b50352cbd1b6bba9224cd54779dd8b22b2` |
| Sites/Grothendieck.lean | `7cfa1dbe1bc7ac44fabb7cef395478d7978e72e5282fa67310bf7248ff1d611d` |
| Sites/IsSheafFor.lean | `b47fe14e505dce52cac9e86a823b4b0e4968c16a898da7447c37fd705cf73653` |
| Sites/Sheaf.lean | `e186b91a924c25ec3bdf802a47a2f83aeacac23e085e93025c0c875c07f4b1de` |
| Sites/SheafOfTypes.lean | `2b322b717166426aaa4390a7f5157e1fce28e636618c3d995e54f76fbec3d5f9` |

## Validation and continuation

Packet checker: zero errors and warnings. Intake file/private-path checks, historical preservation, source-finding schema, semantic edit scope and whitespace checks pass. The actual completion classifier returns false. There is no overall acceptance.

An isolated **278-line Mathlib fragment** containing the native central-section block, added API and six new examples elaborates with **seventeen `sorry` warnings, zero errors and no other warnings**. SHA256: `3f3fa702514bc76780a636efdb21350c77ef5cd0066990b51f0c6ab2a54cc5d1`. It was temporarily written only to the authorized suggested-file path, with the complete text retained in memory and restored in `finally`. This validates signatures with admissions, not mathematical proofs or full-file elaboration.

To reconstruct the fragment, import Mathlib's Sites.Descent.IsStack, Center.Basic, SingleObj, Products.Basic, Discrete.Basic, CodiscreteCategory, Bicategory.Functor.LocallyDiscrete, Data.ZMod.Basic, SetTheory.Cardinal.Finite and GroupTheory.Perm.Fin. Open CategoryTheory/Opposite/Bicategory and declare the four original outer universes. Take the intrinsic-band continuation namespace block through the point immediately before the packaging comment for `band-center-sheaf`, and close IntrinsicBandSections and TauCeti.AlgebraicGeometry. Take BandFixtures' header through immediately before `constantSection`, then its commutative component-construction block from `variable (I : Type fixture_u) (G : Type fixture_v) [CommGroup G]` through immediately before `component_eval_bijective`, and close BandFixtures. Take ConnectedBandFixtures' header through immediately before `connectedCenter` and close it. Append the final IntrinsicBandReviewTests namespace. Preserve the selected blocks verbatim. Existing fixture equivalences also contain admissions, so a successful elaboration cannot establish their computations.

Available memory before the full-file attempt was 95 GB. The full file fails before elaboration because `TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence.olean` is missing. Shared Mathlib matches the exact pin, but shared Tau HEAD is `cf386627e9176a3827c1a5fe804989fd94a4d216`, not required `f790474821cf4256814db967cb154e7af3d0c369`. **No full-file or exact-Tau-pin compilation is claimed.** No builds, updates, cache fetches, language servers or background Lean processes were used.

Resume by rechecking the five edited nodes, the added constructor/component signatures, concrete test fragment and SF.1 dependency separation. Complete the geometric comparisons, root-gerbe signature and fixed-band inversion. Then review indices 66, 68–74 and 155 onward, all remaining baseline/source/closure/API/test/planet checks, reserved gerbe sample contract and coherent-duality import. Earlier E12–E14 and other source findings remain attributable to their original bounded reports and require final reconciliation. H² quotient/sign/two-inverse identities and arbitrary affine/profinite-group supplier scope remain open.

The reader is outside this issue's authorized paths. A separately authorized orchestrator edit must synchronize the five affected node/API/test passages and omission summary. No reader edit is made here. Scratch is discarded after opening the PR; the report and handoff carry all continuation information. This run submits one checkpoint and takes no second job.

---

# Historical checkpoints before codex-2ahsNe

# Review continuation: codex-tBJmUU

Codex — codex-tBJmUU, 2026-10-05. Refs #346. Input commit `47691b70c799f852c05c363ec26dd72468741503`. [Claim comment 5994904624](https://github.com/CBirkbeck/tauceti-explorer/issues/346#issuecomment-5994904624) was confirmed by [bot reply 5994907736](https://github.com/CBirkbeck/tauceti-explorer/issues/346#issuecomment-5994907736). The entire issue was read before claiming and again after confirmation. This session did none of the input planning.

**This is an unfinished independent review checkpoint, with no overall verdict.** There is no top-level packet `review` object or final node disposition. The planning pass's `status: complete` remains appropriate to its budget-ended pass; its four partial and four not_read stages are not grounds for rejection. No stage, key definition or implementation status is promoted. Prior sessions' reports below remain historical evidence attributed to their authors.

## Corrections saved

Twelve existing node objects change: incoming indices 33, 35, 40, 50–52 and 79–84. No node is added. All 660 ids, 72 source catalogue objects, eight coverage rows, key-definition rows and ten planets are preserved. The 22 requests remain, with the invertible-sheaf pullback request also naming the rigidified consumer. Two baseline declarations, eight API entries, three gaps, three source findings and four source-version records are added. Final counts: 255 baseline declarations, 605/589 raw API/tests, 597/556 checker-normalized API/tests, 15 gaps and 14 source findings. No existing source finding's verdict is changed.

1. The compatible-family API now supplies its actual category, componentwise identity/composition, evaluation functors and componentwise invertibility. Its pullback accepts a supplied same-universe strong transformation between index diagrams and exposes the resulting object component. This conditional interface does not construct the geometric site-restriction diagrams. Three native tests retain arrows: an arbitrary singleton pseudofunctor, a cofiltered constant one-object group diagram, and the singleton C3 diagram with one isomorphism class and three endomorphisms. Their packet text and omission ledger agree. The distinct Boolean cofiltered 2-category convention is preserved.
2. The nonempty-limit proof chooses a point of the nonempty scheme and restricts the compatible object to its residue field. This supplies the affine field chart; it does not claim the original nonaffine X itself is an affine chart or infer a rational neutralization. The locally-full-limit lemma explicitly requires a small nonempty cofiltered index so its coordinate diagram is filtered.
3. Kernel rigidification now identifies the quotient source Isom sheaf with Isom in the **middle** gerbe at g(x),g(y). The faithful map from the middle to the original final target need only embed that sheaf. The uniqueness proof makes both facts explicit. The B1→B(C2) test distinguishes the middle and final-target Hom sheaves; an admitted native faithful/non-full one-object functor fixture records their cardinalities one and two. Its geometric comparison remains omitted.
4. All six Picard nodes now name S, X, B, f, the scheme test objects and the small-étale invertible-module convention. Sections and the universal structure-sheaf isomorphism appear precisely where used. The rigidified groupoid can be defined without the latter hypothesis; trivial automorphisms require it.
5. Relative Picard sheafification imports pinned Mathlib's ordinary sheafification, replacing the D0 generic stackification prerequisite. Its abelian group structure uses finite-product-compatible sheafification after a native site/universe instantiation. The quotient is by **im(f_T*)**, without presuming injectivity. The scheme Picard inverse remains imported from upstream JacobianChallenge Layer A, rather than attributed to the pinned commutative monoid.
6. The fixed-base rigidified groupoid needs no D0 groupoid quotient. It imports the SF.1 invertible-module comparison instead. Four added API clauses give its constructor, the exact arrow equation σ_T*(φ)∘α=β, arrow extensionality and the trivial object. Pullback explicitly consumes the unit and section-square comparison. These unavailable geometric signatures remain honest mathematical omissions.
7. Three gaps preserve the unresolved arbitrary affine-group supplier boundary, the Picard native interfaces and explicit representative-obstruction non-example, and the geometric compatible-family/factorization comparisons. They do not certify the existing requests as supplied theorems.

## Fresh reading and its limits

Read the binding worker, blueprint, expansion and upstream protocols, the complete upstream JacobianChallenge and ReductiveGroups readers, the preceding handoff/report, the A0-extension and R09.4 reviewed library-audit rows and their review metadata. Read D0's stackification and groupoid-quotient supplier node objects, and the relevant local supplier requests. No complete re-audit of those supplier roadmaps, all restructuring proposals, the coherent-duality owner or the other six stage-audit rows is claimed.

Examined the full JSON objects for these 24 nodes, comparing statement, hypotheses, proof route, API/test text and principal sources:

- `AlgebraicModuliForArithmeticGeometry:R09.4/finite-etale-gerbe`
- `AlgebraicModuliForArithmeticGeometry:R09.4/compatible-limit-family`
- `AlgebraicModuliForArithmeticGeometry:R09.4/limit-stack-descent`
- `AlgebraicModuliForArithmeticGeometry:R09.4/nonempty-affine-limit-gerbe`
- `AlgebraicModuliForArithmeticGeometry:R09.4/profinite-etale-gerbe`
- `AlgebraicModuliForArithmeticGeometry:R09.4/locally-full`
- `AlgebraicModuliForArithmeticGeometry:R09.4/locally-full-isom-epi`
- `AlgebraicModuliForArithmeticGeometry:R09.4/locally-full-relative`
- `AlgebraicModuliForArithmeticGeometry:R09.4/locally-full-limit`
- `AlgebraicModuliForArithmeticGeometry:R09.4/z-hat-gerbe`
- `AlgebraicModuliForArithmeticGeometry:R09.4/z-hat-not-finite-type`
- `AlgebraicModuliForArithmeticGeometry:R09.4/z-hat-not-algebraic-fp`
- `AlgebraicModuliForArithmeticGeometry:R09.4/canonical-affine-factorization`
- `AlgebraicModuliForArithmeticGeometry:R09.5/affine-kernel-rigidification`
- `AlgebraicModuliForArithmeticGeometry:R09.4/canonical-factorization-unique`
- `AlgebraicModuliForArithmeticGeometry:R09.4/finite-etale-image`
- `AlgebraicModuliForArithmeticGeometry:R09.4/locally-full-finite-presentation`
- `AlgebraicModuliForArithmeticGeometry:R09.4/relative-profinite-gerbe-finite-stages`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-base-change`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-kernel`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/section-rigidified-picard`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/rigidified-picard-setoid`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split`

Eighteen of these were already bounded readings in the preceding gerbe checkpoint; six Picard nodes are new to that frontier. The cumulative historical bounded-reading frontier is now 101 distinct ids: indices 0–65, 67, 75–108. The remaining 559 are indices 66, 68–74 and 109–659. This is **not** a final review: every node still needs reconciliation with recursive closure, all secondary locators, native signatures and a final checked disposition. This session does not recertify earlier workers' other nodes, source findings or baseline readings.

For the six Picard nodes, read Stacks 0D24's Situation 99.11.1, restriction remark, Lemmas 99.11.2–99.11.4, the rigidified category definition and Lemma 99.11.7 with proofs. Read 0D02's Picard-stack definition as context. The Picard planet's name matches this source; the other nine planets were not independently certified. The general warning `PicardSheafTests.needSheafification` still lacks an explicit worked counterexample, now recorded as a gap. P1 degree/group laws and the section/function/unit dictionaries require the named supplier interfaces.

For the gerbe nodes, reread BV12 v5 §3 Definitions 3.2–3.5 and Remark 3.6/Proposition 3.7, BV19 v3 and published definitions/factorization/local-fullness/limit passages, and Bresciani's published §2/Lemma 2 proof. In BV12 the index 2-category is distinct from an arbitrary ordinary cofiltered category. E10 was reread and retained. Finite-stage synchronization and the geometric classifying-stack/profinite-limit comparisons remain obligations. E1–E9 and E11 were not freshly replayed.

## Baseline and ownership evidence

Seventeen packet baseline statements were freshly read at the exact pins, with their ambient assumptions: seven Sheafification declarations (`HasSheafify`, `presheafToSheaf`, `toSheafify_naturality`, `sheafify_hom_ext`, `sheafifyLift`, `toSheafify_sheafifyLift`, `sheafifyLift_unique`); SingleObj's `category`, `comp_as_mul`, `groupoid` and `MonoidHom.toFunctor`; `Pseudofunctor.StrongTrans`; the newly cited `IsCofiltered` and `Skeleton`; Tau Ceti's `IsInvertible`, `InvertibleSheaf` and `LineBundleClass`. Of the final 255 declarations, 238 were not freshly read in this session. No citation was removed from the catalogue; two unneeded cross-roadmap node prerequisites were replaced.

Mathlib local module bytes were compared to `git show` at `082e2d37e8b0463410cdb532e111cd43d5a66174`. Authenticated SHA256 values:

| Module | SHA256 |
| --- | --- |
| CategoryTheory/Sites/Sheafification.lean | `3df0b49f121a026db6d8c4d5c352830d46bfdeab1a340ff3bf6e214ccd27a360` |
| CategoryTheory/Filtered/Basic.lean | `9b490da3d94eb4b3b566dc17e4361ce1928cc2ee7aece62fd281a8864a5baa8b` |
| CategoryTheory/SingleObj.lean | `6aca3a01c2a4beddfb1c80f82695834762e1ca0b30fe33ab0bb78d43aa24da03` |
| CategoryTheory/Skeletal.lean | `5c56274abf5bf5a45e0557d2028a4858edb8b4c952e9d18cfa163897887fb77b` |
| CategoryTheory/Bicategory/NaturalTransformation/Pseudo.lean | `4485e8cf6de3421060a3c803f2c37495a63b8ad785f956b87687c3d324011406` |

Tau source was read using exact commit `f790474821cf4256814db967cb154e7af3d0c369`, independently of the shared checkout's HEAD. LineBundle/Basic.lean hash: `a5b3a45ddf3e6d8ecee349b6a85d8e6381127b7bfbe6a4d70ac761c0340e3e43`; LineBundle/Class.lean: `beab5ca378823b69dd002d1582f945f976ec005a8528c32bf39a7bb87bc013b4`; ModuleCat/Sheaf/Invertible/Basic.lean: `1b3caa1c6a44884c8d612909b05f57ae7599306d2fd4fa43dc72d5a535beb12f`. The line-bundle carrier is a full module subcategory, so its core is necessary for Picard arrows. Its class carrier has a commutative monoid, not a proved Picard-group inverse.

As supplier leads, read exact-Tau affine-group Image, HopfIdeal quotient image, isogeny, closed-subgroup and Fppf/Quotient/Basic statements. The image factorization has an injective coordinate inclusion but no generic faithful-flatness theorem. The fppf quotient constructs a group sheaf, explicitly without representability. SF.1's read stage does not plan the arbitrary affine-group results presently requested from it. ReductiveGroups Layer 3 owns the group direction but has finite-type standing hypotheses; profinite stabilizers require a scope extension/Part II. The new gap asks the orchestrator to resolve that ownership without pretending the finite-type roadmap already supplies it. These extra leads are not added as unconditional baseline citations.

## Source findings and reconstructible evidence

E12 records BV19 Proposition 3.9's final-target Hom error. For B1→B(C2) with trivial stabilizer kernel, the quotient source Hom sheaf is trivial, while the final target has C2 automorphisms. Changing f-images to g-images gives the middle-gerbe formula needed by the proof; the canonical-factorization proposition is not refuted. The formula is present in the publisher's p.539 and arXiv v3 p.9. Bounded MSP/title/erratum searches and the arXiv submission history found no separate correction. The publisher article HTML was inaccessible to the browser tool; its PDF was read. `known: new` has this bounded meaning.

E13 and E14 record two Stacks 0D24 notation slips: the normalization composite needs α_j inverse, and the base change of g:T→T′ must run X_T→X_T′. Domain/codomain checks establish both corrections. Both remain in public quot.tex. The live page had no comments offering a correction. Neither changes the intended theorem. All three have bounded confirmation by this unfinished review, which does not make them effective finished-review verdicts. No author was contacted.

Downloads read on 2026-10-05; public URLs and SHA256 values reconstruct the discarded evidence:

| Source | SHA256 |
| --- | --- |
| [BV12 arXiv v5](https://arxiv.org/pdf/1204.1260v5) | `c2a803a6a63837670f8d5eb1b2fa19606b74ab59c81335c6df9b631fa9b21eed` |
| [BV19 published](https://msp.org/ant/2019/13-3/ant-v13-n3-p01-s.pdf) | `64fca3767f3c6cbd02fbf84f1fb456c7fda30c7bc95ddc8c8c84cd3bd8629111` |
| [BV19 arXiv v3](https://arxiv.org/pdf/1610.07341v3) | `820bc690bb5753e990b580716b93aff2326d873ae03b7bf2aee8e9e935e55ed6` |
| [Bresciani published](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf) | `77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e148` |
| [Stacks 0D24](https://stacks.math.columbia.edu/tag/0D24) | `d0d28a2cc8b6be6b6d0874c36e7ce653c25484bb337af1b67253eb6c71c2e3e7` |
| [Stacks 0D02](https://stacks.math.columbia.edu/tag/0D02) | `613260ff0de0fc52e9dcec0b9192fb421e550bfb79322980a88a1a0fe7aef495` |
| [Public quot.tex](https://raw.githubusercontent.com/stacks/stacks-project/master/quot.tex) | `dd8e6fe1c77fbc372252abbfc7f449a5d9a344d1e83acabcc55a53edf3f750e0` |

## Validation and continuation

Packet checker: zero errors and warnings. Source issue/version schemas, allowed-file/private-path check, historical preservation, semantic scope and whitespace checks pass. The actual intake completion classifier returns false. There is no overall acceptance.

Serial `lean-check` of the Mathlib-only compatible-family block plus its four test examples succeeds with only twelve `sorry` warnings. The checked fragment SHA256 is `b3649a446350963ce3e0cb9e3b170ee76bc0ffc332e56b812d9fab2066cb50bf`. It comprises the block from `universe uI vI` through the end of `CanonicalFactorTests`, with the nine Mathlib imports needed for LocallyDiscrete, Pseudo natural transformations, Discrete, Filtered, Skeletal, SingleObj, ZMod, TypeTags.Finite and Cardinal.Finite, the CategoryTheory/Opposite/Bicategory opens, four outer universes and the existing namespace. The final check temporarily placed that fragment at the authorized suggested-file path, retained the full file in process memory and restored its bytes in `finally`. The isolated signature check is not a proof or full-file elaboration. Initial checks mistakenly used a scratch Lean file contrary to the issue's restriction; that file was removed and the final check used the authorized path.

Available memory was 95 GB immediately before both final checks. The full suggested file then fails before elaboration at the unavailable TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence object file. Shared Mathlib matches its pin; shared Tau HEAD is `cf386627e9176a3827c1a5fe804989fd94a4d216`, not the required Tau pin. **No full-file or exact-Tau-pin compilation is claimed.** No library build, cache fetch, dependency update or language server was used. No Lean process is left running.

Resume with independent rechecks of these twelve node edits, E12–E14, the native fragment and the three gaps. Resolve the arbitrary affine-group supplier scope and geometric limit diagrams. Build the Picard/rigidified native interfaces and explicit nonrepresentative sheaf point test. Complete all 559 nodes outside the cumulative bounded frontier, then reconcile all 660 with final closure/source/API/test/baseline/planet dispositions. H2 quotient/sign/two-inverse identities, coherent duality imports and the reserved gerbe sample contract from earlier checkpoints remain open.

The reader is outside this issue's authorized files. The orchestrator must arrange synchronization of the twelve affected passages, added API clauses, new source findings and omission summary in a separately authorized reader edit. No reader is edited here. This run submits one checkpoint and claims no second job.

---

# Historical checkpoints before codex-tBJmUU

# Review continuation: codex-BTpcaN

Codex — codex-BTpcaN, 2026-10-05. Refs #346. Input commit: `0fbbbfccdad9e3c5e0db40cd5e401ea500b23b65`. Claim comment 5994365139 was confirmed by bot reply 5994367586. The issue was read before claiming and again after confirmation. This session did none of the planning under review.

**Unfinished review checkpoint; no overall verdict.** The packet still has no top-level `review`. Its planning `status: complete`, eight partial/not_read coverage rows, partial reserved gerbe contract and all unchecked implementation statuses remain unchanged. An open gap or partial stage is permitted by the protocol; those facts are not a rejection verdict. The two earlier checkpoints below remain historical evidence from their named sessions.

## Corrections in this session

1. **All-module Hom calculation.** `R09.3/affine-pullback-tensor` used the mapping property of tilde and the pullback adjunction without naming either adjunction among its direct inputs. Add the actual baseline `AlgebraicGeometry.tilde.adjunction`, `AlgebraicGeometry.moduleSpecΓFunctor` and the already cited scheme-module pullback adjunction. The affine equivalence `tildeEquiv` alone handles quasi-coherent targets; the proof uses the tilde adjunction on arbitrary sheaf-module targets. Record the native global-sections/pushforward/restrictScalars comparison as an outstanding transport obligation rather than silently inferring it from an equivalence of fibres.
2. **Existing coherence.** `R09.3/quasicoherent-pseudofunctor` now explicitly imports the three existing scheme-module associativity/left-unit/right-unit equations. They live beside the already existing `Adj(Cat)`-valued scheme-module pseudofunctor. Restricting its left-adjoint constraints to the full quasi-coherent subcategories reuses that mathematics. The generic coherence is not a new construction; the quasi-coherence-preservation and restricted comparisons remain obligations.
3. **Faithfully flat hypotheses.** Replace the unrelated schemes boilerplate in `affine-module-descent-equivalence.hypotheses` by the actual ring map, faithful flatness, module universes and unrestricted module morphisms its statement uses. No theorem is generalized or weakened.
4. **Common-refinement members.** Spell out the actual finite affine refinement members and their products over S in the fullness proof, leaving the intersections possibly nonaffine. Record E11 for the source's undefined base U and mistaken V_k member labels. The corrected proof uses the mathematical refinement already intended by the source.
5. **Space-to-scheme reduction.** The algebraic-space descent proof now names scheme charts Tij→Xi and applies the scheme theorem to U×X Tij, after using X's representable diagonal. It no longer writes the unrefined U×X Xi as though it were automatically a scheme. The final original-datum comparison remains required.
6. **Suggested signatures and discriminating examples.** State the actual affine pullback naturality square. Replace a generic tilde-is-quasi-coherent example by the particular countably infinite free module over a field, including its failure of finite generation. Replace the ModuleCat-only noninvertibility check by the actual tilde sheaf-module map. Add the nonflat Z→Z/2Z fixture: the monomorphism multiplication by two pulls back to zero on a nonzero sheaf and loses monicity. Remove exactly the three corresponding omission-ledger entries; composition, localization, unit comparisons and all other omissions remain. These are suggested signatures with `sorry`, not compiled definitions or proofs.
7. **Explicit boundary.** Add one gap for the native structure-sheaf unit/slice comparisons used by quasi-coherence pullback, the global-sections transport used by affine pullback, the remaining signatures and the small-étale/Zariski comparison. This does not close the older chosen-overlap adapter gap or any supplier request.

Exactly five existing node objects change: indices 57, 58, 60, 63 and 78 in the incoming array. No node is added or removed. All 660 ids, 72 source objects, 22 requests, coverage rows, key-definition rows, planets and implementation statuses are preserved. Baseline declarations increase 248→253 (five confirmed additions, no removal), gaps 11→12, source findings 10→11. Raw API/test counts stay 597/589; checker-normalized counts stay 589/556. The corresponding reader document is outside the issue's permitted files and was not edited; its affected paragraphs and generated omission summaries need synchronization by an authorized reader job.

## Fresh reading scope

Read the binding worker, blueprint, expansion and upstream instructions; read both upstream JacobianChallenge and ReductiveGroups documents in full, and this roadmap's campaign reader. AdicSpaces and AlgebraicCurves were read only in part and are not counted toward the two-document requirement. Read the reviewed R09.3 audit row with AUDIT-01 review metadata, and the SF.1 atlas stage plus the exact requests this strand places on it. Those requests cover topology refinements, ordinary gluing, charts, rank comparison and scheme-site comparison; the SF.1 description is broad, not a proof that every requested interface is already supplied. No complete cross-atlas ownership screen, gerbe sample-API audit or coherent-duality import audit is claimed.

Examined the statement, hypotheses, proof sketches and API/test text of the following 38 existing objects, with principal-source comparison. This is a bounded reading record, **not** final per-node verification: secondary locators, recursive closure, every baseline binder and each omitted native signature are not all checked. The previous records concern 57 other ids. Together their reading frontiers and this one identify 95 distinct objects; the remaining 565 objects still need even that bounded pass. All 660 still need a reconciled final checked disposition before a verdict.

| Incoming zero-based index | Node suffix after `AlgebraicModuliForArithmeticGeometry:` |
| --- | --- |
| 56 | `R09.3/quasicoherent-pullback` |
| 57 | `R09.3/affine-pullback-tensor` |
| 58 | `R09.3/quasicoherent-pseudofunctor` |
| 59 | `R09.3/module-descent-coaction` |
| 60 | `R09.3/affine-module-descent-equivalence` |
| 61 | `R09.3/affine-fpqc-quasicoherent-descent` |
| 62 | `R09.3/fpqc-quasicoherent-descent-faithful` |
| 63 | `R09.3/fpqc-quasicoherent-descent-full` |
| 64 | `R09.3/fpqc-quasicoherent-descent-effective` |
| 65 | `R09.3/fpqc-quasicoherent-descent` |
| 75 | `R09.3/finite-presentation-module-descent` |
| 76 | `R09.3/finite-locally-free-descent` |
| 77 | `R09.3/space-quasicoherent-modules` |
| 78 | `R09.3/space-fpqc-quasicoherent-descent` |
| 85 | `R09.3/module-overlap-datum` |
| 86 | `R09.3/tensor-comonad-coordinates` |
| 87 | `R09.3/overlap-diagonal` |
| 88 | `R09.3/overlap-to-coalgebra` |
| 89 | `R09.3/coaction-transition-maps` |
| 90 | `R09.3/coaction-transition-inverses` |
| 91 | `R09.3/coaction-transition-cocycle` |
| 92 | `R09.3/coalgebra-to-overlap` |
| 93 | `R09.3/overlap-coaction-roundtrips` |
| 94 | `R09.3/overlap-coalgebra-morphisms` |
| 95 | `R09.3/overlap-coalgebra-equivalence` |
| 96 | `R09.3/overlap-comparison-canonical` |
| 97 | `R09.3/canonical-overlap-functor` |
| 98 | `R09.3/overlap-pullback-coordinates` |
| 99 | `R09.3/overlap-pullback-diagonal` |
| 100 | `R09.3/overlap-pullback-triple` |
| 101 | `R09.3/overlap-to-chosen-descent` |
| 102 | `R09.3/chosen-descent-to-overlap` |
| 103 | `R09.3/chosen-overlap-roundtrips` |
| 104 | `R09.3/chosen-overlap-morphisms` |
| 105 | `R09.3/chosen-overlap-equivalence` |
| 106 | `R09.3/native-module-descent-coalgebra` |
| 107 | `R09.3/native-module-canonical-comparison` |
| 108 | `R09.3/descent-equalizer-module-coordinates` |

The overlap/coalgebra strand fixes the first and second scalar-factor actions. In particular, its reverse transition formula uses the coaction, the two inverse calculations use different trilinear maps, and its object correspondence needs no flatness. Faithful flatness enters when comparing ModuleCat R to these presentation categories. The chosen/all-test-object equivalence and equalizer/counit compatibility still need complete pinned-carrier and baseline verification; reading their mathematical route is not an elaboration or closure claim.

The source proof of 023N omits the categorical equivalence and inverse-functor checks; the packet rightly supplies separate native comparison leaves instead of treating those omitted details as printed proofs. The full scheme-descent proof keeps arbitrary modules and nonaffine intersections. Its local-to-global comparison must return an isomorphism of the original descent data, not only a sheaf with isomorphic local modules. The space reduction likewise retains its final original-datum comparison. For finite local freeness, finite presentation plus flatness gives projectivity, and the rank/invertibility dictionary is still a precise SF.1 supplier boundary.

## Baseline reading

Freshly read 19 Mathlib declaration statements with their ambient binders at `082e2d37e8b0463410cdb532e111cd43d5a66174`, and one Tau Ceti statement directly using `git show` at `f790474821cf4256814db967cb154e7af3d0c369`. Existing Mathlib files were compared byte-for-byte to `git show` at the pin. No declaration name search alone is counted as verification. Other module hashes inspected as authentication aids do not certify unread declarations.

| Module | Declaration statements read |
| --- | --- |
| Mathlib/CategoryTheory/Bicategory/Functor/Pseudofunctor.lean | `CategoryTheory.Pseudofunctor` |
| Mathlib/Algebra/Category/ModuleCat/Descent.lean | `comonadicExtendScalars` |
| Mathlib/Algebra/Category/ModuleCat/Pseudofunctor.lean | `CommRingCat.moduleCatExtendScalarsPseudofunctor` |
| Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean | `SheafOfModules.IsQuasicoherent` |
| Mathlib/AlgebraicGeometry/Modules/Tilde.lean | `AlgebraicGeometry.tildeEquiv`, **added** `AlgebraicGeometry.tilde.adjunction`, **added** `AlgebraicGeometry.moduleSpecΓFunctor` |
| Mathlib/AlgebraicGeometry/Modules/Sheaf.lean | `AlgebraicGeometry.Scheme.Modules.pullback`, `.pullbackPushforwardAdjunction`, `.pullbackId`, `.pullbackComp`; **added** `.pseudofunctor_associativity`, `.pseudofunctor_left_unitality`, `.pseudofunctor_right_unitality` |
| Mathlib/CategoryTheory/Sites/Descent/DescentData.lean | `CategoryTheory.Pseudofunctor.DescentData` |
| Mathlib/RingTheory/Finiteness/Descent.lean | `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat` |
| Mathlib/Algebra/Module/FinitePresentation.lean | `Module.FinitePresentation.fg_ker_iff` |
| Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean | `Module.Flat.of_flat_tensorProduct` |
| Mathlib/RingTheory/Flat/EquationalCriterion.lean | `Module.Flat.projective_of_finitePresentation` |
| TauCeti/Algebra/Category/ModuleCat/Sheaf/Invertible/Basic.lean | `TauCeti.SheafOfModules.IsInvertible` |

The Tau predicate uses a covering with freely generating singleton basis types, not a bare abstract rank-one label. The generic Mathlib PullbackFree unit/free isomorphisms were additionally read as leads: their hypotheses include finality of the underlying site functor. That hypothesis must be discharged for the actual scheme/slice transport before they can serve the new gap; they were not added as unconditional citations. Of the packet's 253 baseline objects, 233 were not freshly read in this session. Earlier sessions' readings remain attributed to them; the native adapter baseline citations are not certified by this session merely because the containing modules were authenticated.

## Sources and source findings

Fresh HTML downloads on 2026-10-05 match the packet's source SHA256 values below. Reading is limited to the listed sections; no whole catalogue or whole-book reading is claimed. These public URLs and hashes reconstruct the disposable source evidence.

| Source | Reading scope | SHA256 |
| --- | --- | --- |
| [Stacks 01BG](https://stacks.math.columbia.edu/tag/01BG) | Lemma 17.10.4 and proof | `f68bf1a4192d956d97ff7493ae1c8696d66b89432f25a8dfeb14285cf2537c6a` |
| [Stacks 01I6](https://stacks.math.columbia.edu/tag/01I6) | Lemmas 26.7.1 and 26.7.3, mapping property and pullback comparison | `a84434c8fbcd635e95c75c323faea1f5e1f47367b3ef88e161f424d8ef10cc3d` |
| [Stacks 023F](https://stacks.math.columbia.edu/tag/023F) | Definition 35.3.1, Lemmas 35.3.2–35.3.3 and tensor/cocycle formulas | `d5b82802e667aa651dffd7498d362bb9a5aadf49f838b1351233d2dc3536c282` |
| [Stacks 023N](https://stacks.math.columbia.edu/tag/023N) | Proposition 35.3.9 and proof/comments; E5 rechecked | `b8d9a77257d45cfdf1068727990ce4b697f54f311b97b80511c9ed85a5f37cbd` |
| [Stacks 023S](https://stacks.math.columbia.edu/tag/023S) | Lemma 35.5.1 and full finite-union reduction | `ed24079eb360cc593bf8c7b473873c56f3eb6194957c0a19dff051279e2d58f4` |
| [Stacks 023T](https://stacks.math.columbia.edu/tag/023T) | Proposition 35.5.2 and full proof/comments | `ca9e9d7885ae6176696fac333dbb27776f82c57818c2be11b4cb674135ec6508` |
| [Stacks 023E](https://stacks.math.columbia.edu/tag/023E) | Lemma 35.2.4 and proof | `5135f4c1fbb1cad92a08ea0e970a889a030984be299b76f26133870dca7e6e71` |
| [Stacks 05B0](https://stacks.math.columbia.edu/tag/05B0) | Lemma 35.7.3 and its affine-reference boundary | `6c99f3e956fdfdee18972fc6a4bfdd63f0bb44e981a5cc16d5086cb1667b56fb` |
| [Stacks 05B2](https://stacks.math.columbia.edu/tag/05B2) | Lemma 35.7.6 and proof | `4cbed905704a364eaded1c82d97dc23a78d6fdca51096d9753c7be72311c5dd6` |
| [Stacks 03G5](https://stacks.math.columbia.edu/tag/03G5) | Definition 66.29.1 and Lemmas 66.29.2–66.29.3 | `77482e373a8d7168affeb85119eb59094943dd3418abc864558699bdc48a9f0b` |
| [Stacks 04W8](https://stacks.math.columbia.edu/tag/04W8) | Proposition 74.4.1 and all seven proof steps | `73b3474abccacb2ecd47229ff2322316368c60fa5f90112cb351a1f1b2fe315a` |

Rechecked E5 at 023N: its contracted sum uses y_j where the intervening membership sentence prints y_i; the existing verdict is preserved. E1–E4 and E6–E10 were not freshly replayed. E11 was checked in both 023T HTML and the public [descent.tex](https://raw.githubusercontent.com/stacks/stacks-project/master/descent.tex), under `proposition-fpqc-descent-quasi-coherent`. The public TeX hash is `49483b3bcb36427a607a8227f4ea67730fcddf1eeccb8e992ca61915ace3b31d`. The comments' 2023 correction concerns the domains of restricted maps, not these two remaining labels; current TeX still contains both. `known: new` records this bounded search, not an exhaustive novelty claim. The two slips affect notation only; the theorem is not refuted. SourceVersions records both texts. No author was contacted.

## Validation and continuation

The packet checker reports zero errors and warnings. Source-finding/version schemas, intake four-file scope, preservation checks and whitespace checks pass. The actual completion classifier reports this review unfinished. No overall verdict is added.

The final suggested file was checked serially with `lean-check`; memory available immediately beforehand was 95 GB (102 GB at the first attempt). Both attempts stop at the unavailable `TauCeti.CategoryTheory.Sites.SheafCohomology.LongExactSequence` object file. Shared Mathlib matches its exact pin; shared Tau Ceti is `cf386627e9176a3827c1a5fe804989fd94a4d216`, not the required Tau pin. **No full-file or new-signature elaboration is claimed.** No scratch Lean file, language server, library build, dependency update or cache download was created. Existing embedded proofs were not replayed.

Resume by rechecking the five edits, E11 and new suggested statements; obtain an already built exact-Tau-pin environment for elaboration. Finish the unit/slice and Gamma transport gap, affine identity/composition/localization examples, restricted QCoh constraints, chosen-overlap native carriers and all baseline statements those adapters cite. Continue all unexamined nodes and reconcile each earlier bounded reading with full recursive closure/API/test/source checks. The H2 quotient/sign/inverse identities, reserved gerbe contract, coherent-duality imports and full eight-stage coverage/ownership checklist from the preceding handoff remain outstanding. Reader synchronization needs authorization in a separate issue or expanded deliverables; this review does not edit it.

---

# Historical checkpoints before codex-BTpcaN

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
