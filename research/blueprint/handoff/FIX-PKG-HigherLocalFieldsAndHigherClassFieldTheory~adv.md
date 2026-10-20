# FIX-PKG-HigherLocalFieldsAndHigherClassFieldTheory~adv

Issue #11475; Codex, session `codex-LA7fPX`, 20 October 2026.
Branch `codex-LA7fPX-higher-local-fields`; starting main `a319be68d`.
The bot confirmed [claim comment 6296628032](https://github.com/CBirkbeck/tauceti-explorer/issues/11475#issuecomment-6296628032).
This is the only job undertaken in this run.

**Checkpoint; needs_changes.** R3 now has an exact accepted supplier,
and the mixed-characteristic comparison has a corrected functor, typed
triangles and a sign witness. R1 still needs stronger wild geometric
exports in the owning directions. The maintainer also needs to assign
the unlisted roadmaps a permitted dependency order. Those files are
outside this issue's four deliverables, so this checkpoint does not
certify readiness for an upstream draft.

The issue's named `REV-PKG-HigherLocalFieldsAndHigherClassFieldTheory~adv.md`
does not exist at starting main. Read the available
[independent review](../reviews/REV-PKG-HigherLocalFieldsAndHigherClassFieldTheory.md),
its [handoff](REV-PKG-HigherLocalFieldsAndHigherClassFieldTheory.md),
the [previous fix checkpoint](FIX-PKG-HigherLocalFieldsAndHigherClassFieldTheory~adv1.md)
and the current package. This run preserves their mathematical repairs.
It is a fix, not a fresh independent review of those sessions' work.

## Finding dispositions

| Finding | Change and evidence | Remaining work |
| --- | --- | --- |
| R1: finite-length logarithmic trace, DVR comparison and purity | Rechecked CR §4.8, CR Part II `WV.4/hodge-witt-pushforward`, MEK §§7.4–7.6 and Shiho Theorems 3.2, 5.2, 5.4 and Remark 5.5. The package retains separate field-symbol and geometric-comparison contracts, including imperfect fields and p=2. | The exact stronger geometric exports are still missing. Shiho's all-length Gersten exactness does not identify all finite-length geometric differentials on arbitrary excellent regular schemes. Do not mark this resolved by citing only the field symbol isomorphism. |
| R1: mixed-characteristic dualizing comparison | Corrected `Rf!T_s` to **`Rf^!T_s`**: T_s is on S and its exceptional pullback is on X. Added named `baseTriangle`, `exceptionalPullback`, `localizationSign` and `pointComparison` fields, their sources and three Checks. | The existing EDC input has invertible coefficients. A wild exceptional-pullback/homology export of the specified scope still needs an owner extension. The source has perfect residue field on the base trait; imperfect point fields do not remove that hypothesis. |
| R2: covers, purity and invertible arithmetic niveau theory | Retained the previous fix's CE Layer 3/PA, PBL §§0.1/2.2, LPV §0.10 and EDC §0.2 imports and the explicit §6.5 Kato homology construction. Rechecked the current EDC §0.2 statement and its coefficient scope. | The mathematical invertible-coefficient repair is retained. The wild portion depends on R1, and upstream ordering is not assigned. |
| R3: global prime-to-ℓ alteration | **Resolved the missing supplier.** Import accepted `AdicCoefficientsAndComparisonsPartII:PA.6/prime-to-ell-variety-alteration` (reader §PA.6.9), supplied by `PA.6/gabber-ell-prime-field` (§PA.6.7). Update Scope, Exact supplier contracts, §§6.8–6.9 dependencies and the Lean closing inventory. Verify against ILO X Theorem 2.1 and §2.3, pp. 149–152 of arXiv v1, and Jannsen Theorem 2.11, pp. 24–25. | No new geometric alteration node is needed. The accepted supplier must be included in the maintainer's order and upstream prerequisites; an accepted atlas plan is not an already-ported roadmap. |
| Dependency order | Checked both the maintainer global `decycle/ORDER.txt` and `upstream/CaraianiNewton.md` (17:00 status refresh). | HL, MEK, FFA, EDC Part II and ACC Part II lack an explicit assignment in these orders. No tier, bundle or move-down was invented. |

The previous checkpoint's request to extend SF §4.19 for R3 is superseded.
The accepted ACC Part II design already includes precisely that extension,
including the Jannsen consumer. Its review is
`independent-review-REV-DESIGN-AdicCoefficientsAndComparisonsPartII`,
accepted 19 October 2026. Its unrelated threefold projectivity gap G1
does not affect its field-base theorem. EDC Part II's regular covering
family and proper intermediate scheme still do not themselves put both
properties on one scheme; they are no longer being asked to supply R3.

## Exact resumption requirements

1. In the **CrystallineCohomology direction**, resolve the package's
   `logWittFieldTransfer`, `logWittDVRComparison` and
   `logWittRegularPurity` requirements to exported targets with the stated
   lengths, maps and source ranges. CR §4.8 supplies actual logarithmic
   sheaves and étale exact sequences. CR Part II WV.4 supplies
   Hodge–Witt pushforward for smooth schemes over a perfect field.
   MEK §7.4 already supplies the mod-p norm/trace comparison and §7.5
   the genuine prime-power field symbol. Reuse all of these; request
   only the remaining geometric identifications. Shiho Theorem 5.4 is
   length one; Remark 5.5, pp. 609–610 distinguishes the general-length
   comparison and the smooth-over-perfect-field result proved by JSS.
   Any further general excellent-regular theorem needs its own verified
   source and statement.
2. In the **étale-duality direction**, add the wild base coefficient and
   exceptional-pullback comparison required by
   `mixedKatoDualizingComparison`, together with its use in the wild
   `KatoEtaleHomology` construction. The README now gives all four
   named fields, the derived categories, every arrow's direction, the
   generic and closed restrictions, and `δ_val=−δ_loc`.
   JSS §3, pp. 33–46 has a henselian mixed-characteristic base DVR
   with perfect residue. Do not substitute an invertible-coefficient
   dualizing theorem or assert an imperfect-base extension from it.
3. Ask the **maintainer** to assign HL and its unlisted suppliers,
   including ACC Part II, an order after their actual imports. No
   foreign roadmap, packet, order or status file was edited here.
4. When those authorized owner changes exist, consume the exact exports,
   recheck the affected wild comparisons and set this package's review
   to accepted only if the remaining dependencies are closed. In an
   authorized packet job, reconcile the old G03/G04 and G12–G15 requests
   with the corrected package. In particular, G13's geometric owner is
   ACC Part II PA.6, not an unowned `PrimeToDegreeAlterations` direction.

R1's consumers remain §§2.5–2.7, 4.4–4.5, 5.4, 6.5, 6.8 and 7.4.
The field invariant/conductor and Kurihara proof routes from the prior
checkpoint remain intact; they are not replaced by mixed-scheme purity.
All 85 packet targets, including the higher-field end theorems, remain.

## Adversarial pass over the changed mathematics

| Statement/interface | Instantiation and computation | Result |
| --- | --- | --- |
| Base mapping fibre and its canonicity | The normalized valuation maps a uniformizer class to 1 and an integral unit to 0; its degree-one sheaf map is surjective. Check the degree ranges in JSS Definition 3.9.1 and Lemma 0.5.3(1). | The unique fibre is justified for this map; no general canonical-cone claim is made. |
| `E_X=Rf^!T_s` and pulled-back triangle | For f=j, E_X is μ_(p^s) on η. For f=i, it is Λ[−2] on the closed point. Direct image would take an X-object to S, so cannot be applied to this base object. | Fix the incorrect functor; state the base-change triangle on X. |
| Mixed homology shifts | At f=j, H_a=H^(2−a)(η,μ_(p^s)); at f=i, H_a=H^(−a)(z,Λ). | The shift by 2 in §6.5 is compatible with both restrictions. |
| Localization sign | On Spec ℤ_2 with Λ=ℤ/4, the Kummer class of 2 has δ_val=1 and δ_loc=3; units have both boundaries zero. At length one modulo 2 the two signs coincide. | Add the length-two p=2 witness; retain `δ_val=−δ_loc` before the last-slot conversion. |
| Point comparison and source generality | Generic point fields may be imperfect. A base with residue F_2 has perfect residue, while a base with residue F_2(u) does not satisfy JSS §3. | Keep all s≥1 and p=2; do not conflate point imperfection with base imperfection. |
| Global alteration import | Identity of a smooth projective SNC pair has constants and generic degree 1, including empty boundary and dimension zero. A degree-ℓ alteration fails the required degree condition. | Import ACC Part II PA.6.7/PA.6.9 with both degrees explicit. |
| Connected component and projectivity | A connected component of a smooth source is regular integral; maximal domination retains its dominant map. Proper X makes X' proper over L', and quasi-projectivity then gives projectivity. | The full Jannsen form follows from the supplying projective alteration. |
| Alteration descent, unchanged but rechecked with the new supplier | For F⊂F_s⊂F', radicial restriction is invertible only away from characteristic; cor∘res is multiplication by the separable degree. A degree ℓ scalar is zero mod ℓ. | Keep the higher-field application here and the geometric existence theorem in ACC Part II. |
| R3 proof route versus G1 | The base of ILO X Theorem 2.1 is a field. Its direct proof uses the Sylow quotient, log-smooth modification and monoidal resolution. | The unrelated global projectivity issue for a general threefold base is not inherited. |

The new mixed derived/sheaf objects are absent at the Lean pins. They
therefore remain README requirements and names in the closing inventory,
as required by PACKAGE_REVIEW's 19 October headline/example rule. No
numerical stand-in, admitted example, auxiliary theory or sorry-defined
carrier was added to Lean.

The three light definitions, five proved examples and eleven theorem
signatures are unchanged. Rechecked their variable blocks against §§0.7–0.9:
all coefficient indices are integers; admissibility has an inclusive
eventual-top threshold; boxes are translated in the generated topology;
the coefficient results use `NonarchimedeanAddGroup`; separation adds
`T2Space`; strictness adds nondiscreteness; the sequence has every term
nonzero. All-top and constant-proper boxes, the forbidden coefficient
at −1, discrete finite coefficients and nonzero convergent constants
retain the existing discriminating controls. The native reverse order
on topologies still gives outer ≤ higher.

## Source, supplier and library checks

Read WORKERS, the relevant protocols, PACKAGE_REVIEW, UPSTREAM_GUIDE and
the exemplar; inspect current LocalFieldsRamification and
Completed/RestrictedProducts forms. Read the reviewed HL.0–HL.7 library
audit. The supplied read-only roadmaps are at `0d144d044dacebca17b654695b6f1ad58f159b27`,
and current Tau Ceti is at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Object searches over the nine newer directions, Completed roadmaps and
current library found no supplied mixed Kato comparison or global
degree-controlled alteration. The exact latter supplier was found in
the accepted atlas ACC Part II plan, not invented here. Existing ordinary
restricted products, outer Laurent topology, one-local fields and
profinite abelianization remain imports.

Checked the current other-author EDC #1040 head
`9a0e8eeeb7bef06a13fdbda9d7c5551b368da248` and CR #857 head
`2c8b22a1737d1660f1baf397926b41e90139a80d` by reading the actual supplier
statements; their relevant scopes remain as recorded above. Checked
SF's current §4.19: its ordinary alteration statement does not assert
prime-to-ℓ degrees. The upstream open-PR list has no ACC Part II port.

Read the relevant primary statements and comparison/proof passages:
JSS §§0.5–0.6, 3.0–3.2 and 3.8–3.10; Shiho §§3 and 5;
Jannsen Theorem 2.11 and its use in the proof of 2.10; ILO X
Theorem 2.1 and proof §2.3. The new ILO reference uses the same
arXiv v1 pagination as ACC Part II. Only own-word statements and
numbered locators are in the deliverables.

| Public source/version | SHA-256 |
| --- | --- |
| JSS, arXiv:0910.3759v1 | `ed4198bd4f019c5ee57cd629ea0e044553d2999226c3fa5fad3f3f768bbc2109` |
| Shiho, publisher PDF | `510b1918c021da4030ecf0f281ae7c90f1071c2f7eeebb5723c78ea1db9cdbad` |
| Jannsen, Annals 183 (2016) | `26dde9260f6475e4f6acbfbe651e18fac0d443a5f318fbf3974efc9f809f7d71` |
| ILO, arXiv:1207.3648v1 | `18a6193d6b71ff5ac91eae4443e1c8a54ab8f27f2173fda200d4bec547e3644a` |

## Validation

- `lean-check` on the final Suggested.lean: exit 0, exactly eleven
  `declaration uses sorry` warnings and no other warnings/errors.
  Elaboration does not prove the admitted targets or close R1.
- `check_blueprint.py` on the unchanged HL packet: exit 0, 85 nodes,
  139 API items, 101 tests, 15 gaps, 27 requests, zero errors/warnings.
- `intake.py check-files` on the four deliverables: exit 0.
- `git diff --check`: passes. No Lean declaration changed; only its
  closing README-interface inventory changed.

No suspicious instruction was found or followed in fetched sources or
other authors' files. No source passages, source files or private paths
are included. All durable resumption information is above; disposable
scratch downloads and logs are not needed by the next worker.
