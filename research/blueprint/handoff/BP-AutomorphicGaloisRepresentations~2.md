# Handoff: BP-AutomorphicGaloisRepresentations~2 (revision round 2)

Agent: Claude (Claude Code), session `claude-sMV3ZX`, issue #6924, 7 October 2026, base `115f2914`. This is the complete revision round 2, not a checkpoint. It revises the plan that REV-AutomorphicGaloisRepresentations (Codex `codex-BsbIeh`) sent back. The review object is left in place for the next reviewer.

The packet has `status: complete` and **66 declarations**: 13 constructions, 2 definitions, 48 theorems and 3 lemmas. They carry 90 API items, 65 unit tests and 27 planets (at most six per layer). The plan has 51 supplier requests and 11 gaps. All six layers R19.1–R19.6 are **planned**, none closed. Every `implementationStatus` is `unchecked`. The 61 earlier node ids are kept, and the reviewer's in-place corrections are kept.

## What this round changed, by review task

1. **One global Hilbert object and proved adapters.**
   - `R19.2/all-cohomological-hilbert-representation` now defines ρ_{π,λ} for every π of infinity type (k,w). The infinity type is Carayol 0.2 / Skinner §1: discrete series D_{k_τ,w}, central character sgn^{k_τ}|t|^{−w}. ρ_{π,λ} has geometric Frobenius polynomial X² − t_vX + q_vs_v, where t_v, s_v are the eigenvalues of the positive-uniformiser double cosets T_v and S_v. This is Kisin's ρ_{π,λ} (§4.1) and Skinner's ρ_π (equation (1), and the trace identity of §2.4.2).
   - The new theorem `R19.2/hilbert-normalisation-dictionary` proves the conversions:
     - Carayol: σ_λ(π) = ρ_{π,λ} ⊗ χ_{π,λ}^{−1} = ρ_{π^∨,λ} = ρ_{π,λ}^∨ ⊗ ε^{−1}.
     - Saito: ρ_{f,λ} = σ̌_h(π_f) = σ_λ(π_f). His operators use ϖ^{−1}, so τ = t/s and ρ = s^{−1}, and his multiweight (k, w_S) is infinity type (k, 2 − w_S).
     - Kisin and Skinner: identity, with "local Langlands" meaning π_v ↦ Rec_v(π_v ⊗ |·|^{−1/2}).
     - Skinner–Wiles (3.3): σ_λ(π). CDN: ρ_{π,λ}^∨.
     - Classical: π_f of infinity type (k, k − 2) gives ρ_{π_f,λ} = M_{f,λ}, and Deligne's ρ_{f,λ} = M_{f,λ}^∨.
     - Determinant, twists, Hodge degrees (w − k_τ + 2)/2 and (w + k_τ)/2, L-factors L(s − 1/2, π_v) and conductors.
     - Each identity is checked on 11a1 and on Δ.
   - The local step is Carayol 0.5 (σ̌(π_v) = Rec_v(π_v ⊗ |·|^{1/2})) together with π_v^∨ ≅ π_v ⊗ χ_{π_v}^{−1}. The global step is Čebotarev and Brauer–Nesbitt.
   - The six nodes the review could not verify are rewritten in this normalisation: R19.2/all-cohomological-hilbert-representation and R19.2/hilbert-uniqueness-determinant-oddness-irreducibility; R19.3/fixed-eigenform-compatible-family; R19.4/all-hilbert-local-global-compatibility; R19.5/kisin-hilbert-coefficient-prime and R19.5/skinner-full-hilbert-coefficient-prime. Their determinant, Hodge degrees, conductor and local factors are recomputed through the dictionary.
2. **Purity outside Saito's scope.**
   - New `R19.3/hilbert-ramanujan-conjecture`: Blasius 2006, Theorem 1. It reduces to unramified places by a finite-order twist. The motivic cases use Weil I; the parallel-weight-two case uses the quaternionic Shimura surface with weight–monodromy for surfaces.
   - New `R19.3/monodromy-weight-purity-of-the-family`: Blasius's Corollary 7 and Proposition 5 argument, plus Skinner's theorem at v | ℓ. Every member is pure of weight w + 1 at every place.
   - The Saito node `R19.3/strict-compatibility-and-the-monodromy-weight-purity` is restated in Saito's and in this roadmap's labelling. It now includes the classical case from Saito's 2000 supplement (Theorems 1 and 3). Its planet moved to the family-purity node.
3. **Reader synchronised.** The reader document is regenerated from the corrected packet, so every statement, hypothesis, proof outline, API, test, input, coverage record, gap and request agrees. The layer narratives are rewritten, and the process and history remarks of the earlier reader are removed.
4. **R34.6 dependency.** Node 25 no longer leans on the R34.6 Hilbert export, which imports the retired PadicHodgeTheory R06.6 application. It imports the geometric model R34.3/saito-semistable-comparison-model and requests from R34.6 Saito's weight statement on the geometric realisations, with no R06.6/R19.5 input. It also records a gap. Purity for all forms does not depend on this.
5. **Skinner's inputs named exactly.**
   - New `R19.2/hilbert-hodge-tate-property` covers the geometric cases and Skinner §2.4.1. In the latter, Sym²π ⊗ |·|^{−1} is realised on Picard modular surfaces and Wintenberger lifting is applied along GL₂ → GL₂/{±1}. This lets irreducibility (Skinner's Remark p. 256) avoid any forward use of the coefficient-prime theorem.
   - Requests:
     - AG2.1–AG2.2: the early realisations only, not the late AG2.5/AG2.6 nodes that consume R19.
     - PadicHodgeTheory R06.2: Wintenberger lifting.
     - R06.3: Kisin 2003 (5.14)–(5.15), analytic continuation of crystalline periods.
     - R06.5: Faltings and Katz–Messing.
     - PadicFamilies L2a: Buzzard gluing.
     - PadicFamilies L2: the totally definite quaternionic eigenvariety over F, which no layer states yet.
   - The classical all-weight irreducibility is the new `R19.3/classical-newform-irreducibility`. It uses Hodge–Tate weights 0 and k − 1, locally algebraic characters and the R34.6 eigenform Ramanujan bound. It sits in R19.3 so that it closes no stage loop with R34.6. Node 13 no longer claims irreducibility.

The CM definition, Skinner–Wiles, CDN, Carayol and Kisin nodes gain the dictionary as an input or hypothesis. The Saito comparison node drops its forward use of the all-Hilbert local theorem. Eleven inherited unit tests of kind "example" or "invariance" are reclassified as computation or characterisation. Fifteen `sourceVersions` of kind "public copy" are given their section 18 kinds.

## Red-team findings and routed items

The ten assigned findings keep the dispositions of the earlier round. They are now stated in the single normalisation:
- RT-AREA-langlands-2/2: one all-Hilbert object, Carayol's geometric subset retained.
- RT-AREA-langlands-2/4: cyclic and non-normal cubic base change at extraordinary places.
- RT-AREA-langlands-2/10: R24.5:operations carrier, with purity now from Blasius rather than a narrowed Saito statement.
- RT-AREA-langlands-2/14: Kisin's arbitrary-A° quotient.
- RT-AREA-padic-2/22: generic comparison from R06, arithmetic applications owned here.
- The remaining findings (langlands-1/25, langlands-2/5, /6, /8, /9) are unchanged from the earlier round's handoff.

The routed paper items keep their nodes (Dimitrov, Ribet–Momose, Dasgupta–Kakde, CDN, Skinner 2020).

## New source issue

AutomorphicGaloisRepresentations/E4 is new. In Skinner 2009, the Hodge–Tate degrees printed in Theorem 1, (w − k_i)/2 and (w + k_i − 2)/2, are shifted by one against the §1 central-character convention. The paper's own §2.3.3 dictionary and the elliptic-curve test give (w − k_i + 2)/2 and (w + k_i)/2. §2.4 uses "w = 2" with unitary archimedean parameters, consistently with the printed formula. Effect: nothing. No erratum was found on the EMS Press article page.

## Structure proposals (packet `restructure`)

- **Sub-layer R19.3b after R19.5.** It would hold the strict family, family purity, Dimitrov, Ribet–Momose and Skinner-density nodes, which use R19.4 and R19.5.
- **AG2 late comparisons and the R34.6 export.** AG2.5/late-gl2-modular-comparison and AG2.6/rank-two-comparison-with-r19 should move to a consumer sub-layer (AG2.7), and AG2.1–AG2.2 must not import R19. The R34.6 Hilbert export should be restated on the geometric realisations only.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentations.json`: 0 errors, 0 warnings.
- `scripts/check_errata.py` on the packet: only the expected "protocol must be errata-v1" error, because the script is for errata files. All `sourceVersions` kinds are valid.
- Every excerpt quoted from Skinner, Kisin, Saito and Blasius in the new and rewritten nodes was matched, whitespace-normalised, against the pdftotext of the downloaded files. Carayol's 0.5 and Saito 2000 have no usable text layer; they were read on page images and their locators say so. The reused Carayol, DDT and Dieulefait–Pacetti anchors are those the earlier review verified.
- A node-level cycle search over the union of all packets finds no cycle. Every packet API item and unit-test name occurs in the suggested file.
- `lean-check research/blueprint/suggested/AutomorphicGaloisRepresentations.lean` at Mathlib `082e2d37e8`: exit 0, no errors, 28 warnings, all "declaration uses `sorry`". The new section prototypes the two Frobenius polynomials, the Hodge-degree formula and Skinner's printed variant (closed by `decide`), and the numerical Ramanujan and Eisenstein checks (closed by `norm_num`). Only Mathlib is imported.

## Sources read this round

All are public, with hashes in the packet.
- Skinner 2009: §1–§2.4.2 and the bibliography.
- Kisin 2008: §4.1–4.3.
- Saito 2009: §1, and §2 pp. 8–13.
- Carayol 1986: 0.1–0.7, on page images.
- Blasius 2006, arXiv v1 (new source): introduction, §1, §2, §3 opening, §4.
- Saito 2000 supplement, author-hosted scan (new source): whole paper.
- Ribet 1985: introduction, rechecked.

Not obtainable from public sources: Taylor 1989 and 1995, Saito 1997, Kisin 2003, Wintenberger 1995/1997, Blasius–Rogawski 1993. Each is a named gap or an exact supplier request.

## What remains

The 11 gaps in the packet are the precise remaining items:
- Taylor's original proofs.
- Skinner's remaining-case inputs.
- Saito's geometric weight theorem as an import.
- The classical Saito 1997 proof.
- The Scholl/GH.0 descent transcription.
- The bad-reduction imports.
- The endpoint and Wach lattice comparisons.
- The higher-weight generic module.
- The integral local conditions.
- The quaternionic family line.
- The large-image refinements.

Notes for the maintainer:
- Two loops between layer links are older than this round. Node R19.1/geometric-construction-and-the-eichler-congruence-relation imports the R34.6 stage while R34.6 imports R19.1. The R19.2/R19.5 nodes import OrdinaryAutomorphicFormsAndModularityLifting R21.3 while R21.3 consumes R19.6.
- The queue issue #5871 (REV-FIX-RT-AREA-langlands-2~3) still lists 7 outputs while queue.json lists 27; it was not taken.

No scratch file is needed to resume.
