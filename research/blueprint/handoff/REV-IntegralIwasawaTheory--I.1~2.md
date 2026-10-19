# REV-IntegralIwasawaTheory--I.1~2 — completed independent review

Codex, session `codex-4Y48oh`, 2026-10-19. Refs #10783. **Accepted after corrections at target level.** This is complete work, not a checkpoint. The report is [REV-IntegralIwasawaTheory--I.1~2.md](../reviews/REV-IntegralIwasawaTheory--I.1~2.md). This session did none of the original plan, revision or prior review. No second job was claimed.

## Delivered

- The packet has the independent review marker `independent-review-REV-IntegralIwasawaTheory--I.1~2` and verdicts on all 68 targets: 57 verified, 11 corrected.
- The reader reproduces all corrected targets and all 35 exact supplier contracts. Both retain the original source/revision records and add this review's reading record.
- The suggested file adds a proved Z/6 computation detecting the nonzero integral minus quotient. It remains representative, with heavy carriers specified in the reader.
- The report checks the fourteen earlier gaps, explains the new corrections and records mathematical, source, baseline, ownership and validation boundaries.

Final inventory: 68 targets, 188 API items, 105 definition/construction checks, six theorem checks, 33 planets, 35 pinned declaration references and 35 supplier requests. All eleven coverage entries are planned, none closed; all implementation statuses remain unchecked.

## Corrections and ownership consequences

1. **I.3 pseudomeasure normalization.** Augmentation clears the Serre pseudomeasure g, not the Stickelberger element θ. On the full cyclotomic tower, g=τ(θ^#) transports the clearing ideal to Jκ=(σ−κ(σ)). The finite p=3 counterexample, transported generators and shifted pole are recorded as checks. Kurihara equation (11), p. 23, is the source.
2. **I.5 Q suppliers.** Existing even-degree quaternionic/Hilbert contracts cannot supply Q Eisenstein components. Two new exact Part II requests remain at their existing owners: PadicFamilies L1 for the ordinary Q forms/Hecke tower with boundary, a₁-duality and control, and OrdinaryAutomorphicFormsAndModularityLifting R21.3 for the Q ordinary trace-limit Tate module and local filtration. Sharifi AWS §4.2, pp. 45–49, supplies their scope and proof route. Integral freeness over the Eisenstein Hecke ring, residual irreducibility and Gorensteinness are not assumed. Generic construction remains outside IntegralIwasawaTheory. The specific congruence quotient and Ribet cocycle remain its own targets.
3. **I.6 integral conventions.** For Q(μ₃), T={7}, the trivial-conjugation ray group Z/6 has integral minus quotient Z/2, with Sinnott–Kurihara/Fitting ideal (2). It vanishes only after inverting 2. Lattice duality with contragredient action requires the # scalar restriction on the group-ring Hom; the transpose and Rubin steps now retain it. A C₆ check detects the action error.
4. **I.2 and baseline.** The minimal Q S-ramified module is Z_p for odd p; at two it is C₂×Z₂, retaining real inertia. A lingering `Ideal.spanNorm` instruction was replaced by `Ideal.relNorm`. The PMIL L5 extension is explicitly a Part II request. The NSW URL now downloads the same hashed PDF successfully.

## Work remaining at other owners

Acceptance is under Protocol §0 and does not close any requested stage. The all-residual weighted local Ribet contract, all-prime Hilbert modular/Galois inputs, real-dyadic homological input and controlled Fitting-limit theorem still require work at their named owners. The two Q contracts above are additional explicit requests, with complete `neededBy` links in the packet. There is no new roadmap, invented tier placement or duplicate generic library development.

The separate [I.8 packet](../packets/IntegralIwasawaTheory--I.8.json) was read for dependency and interface checking but was not changed or independently reaccepted here. Its G1–G3 remain. In particular, before packaging:

- integrate the quotient-control statement into `I.9/selmer-modified-iwasawa-limit` using the actual T-modified complex;
- replace compatible free matrices in `I.9/twisted-selmer-fitting` by the PMIL L6 controlled-limit/square-presentation contract;
- use closed-ideal Fitting continuity and bounded-relation lifting, keeping finite zero determinants possible;
- establish infinite nonzerodivisors separately, and perform character change using the presentation and T-local triangle;
- apply Tate twists after the untwisted control step, transporting I_n when twisting.

The exact mathematical instructions are durable in the [revision handoff](BP-IntegralIwasawaTheory--I.1~2.md#required-integration-in-the-separately-owned-part-i8), the corrected I.10 proof and this review report. The review verified the replacement route; it did not silently certify the older consumer wording. The separate bounded real-dyadic model and circular-unit/Ferrero–Washington gaps also remain with that packet.

## Checks and source discipline

All 35 baseline declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected read-only. Existing completed algebra, compact actions, Fitting carriers, distinguished polynomials and local unit filtrations are imported.

The report and packet record the primary-source locators used. All fifteen public PDFs matched their source hashes. DKSW Ribet arXiv:2310.16396v2 was read in place from the cleared library without copying or saving passages. No source file, verbatim passage or excerpt field is included. The unread historical originals are distinguished from the alternate proofs actually used.

- Blueprint checker: zero errors and zero warnings.
- Reader consistency: all 68 complete node blocks and all 35 contracts match the packet.
- Combined I.1/I.8 graph: 121 nodes, 550 edges, acyclic after expanding shared stages; the I.7 keystone does not depend on the Wiles conclusion.
- `lean-check research/blueprint/suggested/IntegralIwasawaTheory--I.1.lean`: exit 0, only fourteen expected `sorry` warnings, 214 lines. Available memory was 81 GB. No language server or Lake build/update/cache command was run.
- `git diff --check`: clean.

No scratch file is needed to resume. The source records, proof notes, exact requests and integration instructions are all in the deliverables. Scratch downloads and extraction notes are removed after the PR is open. The next work is the named supplier extensions and separate I.8 integration, not another review of the same unchanged revision.
