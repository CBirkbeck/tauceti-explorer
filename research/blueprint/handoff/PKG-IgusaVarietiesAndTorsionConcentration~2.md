# PKG-IgusaVarietiesAndTorsionConcentration~2 — completed revision

Issue: #7907. Agent: Codex (GPT-6), session `codex-O3Hta3`. Date: 2026-10-10.
Branch: `codex-O3Hta3-igusa-package`.
Claim confirmed by the bot: https://github.com/CBirkbeck/tauceti-explorer/issues/7907#issuecomment-6092373802.

## Result

Completed the required correction in `REV-PKG-IgusaVarietiesAndTorsionConcentration.md`.
The package's similitude Hecke algebra, characteristic double-coset elements and inversion
now use the actual Tau Ceti convolution and anti-involution interfaces. The README states
this datum and its supplier obligations. No correction remains from that report.
`review.json` is deliberately unchanged; this revision does not supply an independent verdict.

The first available suitable job was this focus package revision. None of the manager's
priority issues was labelled `state:available` at selection. The two available top review
issues #5704 and #5702 had completed issue-scope reviews and handoffs documenting the
unresolved mismatch with the queue's wider scope, so they supplied no suitable unfinished
review job. One issue was claimed and no second job was taken.

## Mathematical change

- Moved the existing imaginary quadratic subfield and group-point declarations before the
  Hecke carrier. `GoodPrime E S` carries primality, exclusion from `S`, and splitting in
  the same fixed subfield `E`. `SphericalAdeles E S` is Mathlib's restricted product of
  `G(ℚ_q)` over these indices, with reference subgroup the image of `G(ℤ_q)`.
- `sphericalK` specializes the completed RestrictedProducts integral-subgroup interface:
  a product subgroup pulled back along Mathlib's `RestrictedProduct.coeMonoidHom`.
  It introduces no new general restricted-product theory. Its source expression is used
  because the newer general Tau Ceti interface is absent from the pinned build.
- Under the concrete datum's `IsHeckeTriple`, `HeckeAlgebra E S` abbreviates native
  `HeckeRing ⊤ (sphericalK E S) ℤ`. The `CommRing` extends its native convolution `Ring`
  using a separate `spherical_mul_comm` obligation, owned by SR.1. No claim that inversion
  fixes double cosets is used.
- `heckeBasis` uses `HeckeCosetModule.of (Finsupp.single c 1)` and `heckeDoubleCoset`
  uses native `HeckeCoset.mk`. Thus convolution and its basis have no unrelated carrier
  or untyped identification in between.
- `inverseAmbient` is the group inversion homomorphism to the opposite group.
  `heckeInverseAnti` is concretely `HeckeAntiInvolution.ofAmbient` with the actual
  subgroup-preservation and involutivity proofs. `heckeInvolution` lifts its
  `onHeckeCoset` permutation using `Finsupp.mapDomain`; ring-law proofs remain `sorry`
  obligations for the unimodular split reductive datum, as appropriate to this prototype.
- The compatibility theorem states the native basis action, inversion on represented
  double cosets, and uniqueness. Its named example explicitly uses both `ofAmbient`
  and `onHeckeCoset` and closes by simplification. A further example directly applies
  the library's `onHeckeCoset_onHeckeCoset` theorem to the same datum.
- Threaded `E` through all affected Hecke actions, ideals, residue embeddings, duality
  and vanishing interfaces, including the unitary comparison algebra. IG.0's operators
  now require primality and splitting proofs themselves; `heckeT` passes the proofs
  carried by `SplitPlace`. The geometric datum itself still needs no imaginary quadratic
  subfield. The separate full away-`S` adelic carrier used by boundary theory remains
  distinct from the split restricted product defining this spherical algebra.

## Sources and ownership checked

Read the binding worker, blueprint, expansion and upstream instructions, the accepted
packet, reader, original suggested file, previous package/review handoffs, and the full
revision issue and review. Read the current ReductiveGroups and
RepresentationTheory/InductionRestriction upstream READMEs in full for form and density.
Checked the current SmoothRepresentationsOfLocalGroups SR.1 Hecke signatures, completed
RestrictedProducts interfaces and current Tau Ceti library; no existing general target
is re-planned. Current upstream checkout: `d6f707516e7ede3181dac4b2420ba25c0799d22d`;
current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both were read only.
The reviewed library audit contains no dedicated Igusa coverage row.

Targeted source reading for this correction, in own words:

- Caraiani–Scholze, arXiv:1909.01898v2, 22 November 2023: introduction p.4,
  §5.1 p.64 for the split prime set and local factors/operators; proof of Corollary
  5.1.3 p.66 and proof of Theorem 1.1 p.36 for the dual ideal and inversion.
  PDF SHA-256: `803fc16ab30fa37fa1ce08c683885040c2034bbefc6ca6567e73026006229f2e`.
- Allen et al., arXiv:1812.09999v2, 16 June 2022: §2.2.19 pp.35–37,
  Proposition 2.2.20 and Corollary 2.2.21 for inversion, commutativity and
  Hecke-equivariant duality. PDF SHA-256:
  `7c882c4dc7208e08a0b1f4b3ce6e5c5234c9815f139a4c3a372898378a24d08c`.
  Also read the maintainer-cleared published author copy at pp.931–933: its corresponding
  section/proposition/corollary are 2.2.20/2.2.21/2.2.22. The README continues to cite the
  explicit arXiv v2 edition; no published numbering is silently substituted.

Both public PDF hashes match the accepted source receipts. No source passage or private
file was copied into the repository. No uncleared book was used. The accepted plan's
18 gaps and 47 supplier requests are preserved, not claimed discharged by elaboration.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/IgusaVarietiesAndTorsionConcentration.json`:
  exit 0, zero errors/warnings, 123 targets, 224 definition/construction API items,
  137 tests, 34 planets, 17 baseline declarations, eight planned layers and 47 requests.
- Final whole-file `lean-check research/blueprint/packages/IgusaVarietiesAndTorsionConcentration/Suggested.lean`:
  exit 0, zero errors, 1,304 warnings, all `declaration uses sorry`. The named native
  compatibility example and native coset involutivity example elaborate. A small native
  adapter probe also passed before integration. The only subsequent Lean edit clarified
  the introductory comment; imports, declarations and proofs are identical to the checked
  file. No language server, build, update or cache command was run. Memory was above 100 GB
  available before the final check; no compile remains running.
- Lean 4.34.0-rc2, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  baseline `f790474821cf4256814db967cb154e7af3d0c369`. Read `ofAmbient`, `onHeckeCoset`
  and the convolution ring declarations at those pins. Verified byte equality with pinned
  sources for all ten Tau Ceti modules in the transitive import closure of the two native
  Hecke imports, not just the two entry modules. The checker's Mathlib Git HEAD is the exact
  pin and its supplied build documents this Tau Ceti baseline.
- All 123 target anchors and 234 API names remain in the README. All 137 accepted named
  tests remain in Lean; namespace-local and existing alternate prototype spellings are
  preserved. All 143 explicit anchors are unique and all 217 internal links resolve.
  README size: 199,080 UTF-8 bytes. No programme-process or private-path text was added.
- `metadata.toml` remains exactly `topic = "math.NT"` plus newline; `review.json`, packet,
  original suggested file and reader are unchanged. `git diff --check` passes. Only the
  authorized package README, suggested file and this handoff are changed.

## Next step

The completed package revision is ready for the next independent package review. Check
IG.0's concrete spherical datum and IG.5's native compatibility statements first, then
rerun the same whole-file Lean check. There is no unfinished revision work or checkpoint.
