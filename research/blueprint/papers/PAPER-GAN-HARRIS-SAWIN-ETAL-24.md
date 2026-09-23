# PAPER-GAN-HARRIS-SAWIN-ETAL-24: Local parameters of supercuspidal representations

Wee Teck Gan, Michael Harris and Will Sawin, with an appendix by Raphaël Beuzart-Plessis, *Local parameters of supercuspidal representations*, [Forum of Mathematics, Pi 12 (2024), e13, 1–41](https://doi.org/10.1017/fmp.2024.10); arXiv [2109.07737](https://arxiv.org/abs/2109.07737).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1356). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-GAN-HARRIS-SAWIN-ETAL-24.result.json](PAPER-GAN-HARRIS-SAWIN-ETAL-24.result.json). It has:
- 75 items: 11 planned, 64 missing;
- 6 routes: one new Part II, four coalesced routes and one source route;
- 21 prerequisite entries;
- 14 recorded source issues.

## Sources read

- **The published version**, which is open access (CC BY 4.0), read in full. It is the version of record. Page numbers below are the journal's.
  - Fetched from Cambridge Core; SHA-256 `441e5e9d…bb0b79467`.
  - Received 14 August 2023, revised 10 April 2024, accepted 14 May 2024.
  - The formulas behind the recorded mistakes were checked on page images.
- **arXiv v3** (June 2022) predates the revision. It was consulted only to date the mistakes; most compared ones are already there.
- **Errata:** Crossref records no correction or update.
- **Cited inputs were not read.** Items resting on one state it as the paper uses it: Genestier–Lafforgue, Gan–Lomelí, Sawin–Templier, Heinloth–Ngô–Yun, Dat–Lanard, [BFHKT] and the others.

## What the paper proves

Let F be a local field of characteristic p and G a connected reductive group over F. Genestier–Lafforgue attach a semisimple parameter L^{ss}(π) to every irreducible representation π of G(F), and so do Fargues–Scholze; Li-Huerta showed the two agree.

**Theorem 1.2.** For a discrete series π, L^{ss}(π) has a unique completion to a pure Weil–Deligne parameter. So every tempered π gets an essentially tempered L-parameter refining Genestier–Lafforgue (Corollary 1.3).
- The proof globalises π with an *irreducible* global parameter. The Kloosterman representations of Heinloth–Ngô–Yun supply irreducibility at an auxiliary place.
- Sawin–Templier's local purity for irreducible Ĝ-local systems then gives the pure completion.
- Beuzart-Plessis's appendix handles discrete series that are not supercuspidal, through the Deligne–Kazhdan simple trace formula.

**Theorem 1.4.** Take F = F_q((t)) with q > 5, G unramified and not a torus, and π compactly induced from a compact open subgroup.
- (i) If L^{ss}(π) is pure, it is ramified.
- (ii) If the inducing subgroup is sufficiently small, L^{ss}(π) is wildly ramified.

**Theorem 1.5.** A representation with pure unramified parameter is a constituent of an unramified principal series, provided supercuspidals of Levi subgroups contain types.

**The method of Theorem 1.4 is global, over P^1.**
- Poincaré series, after Gan–Lomelí, give cusp forms with σ at every point of G_m(k), pro-p Iwahori level at ∞ and a regular tame character at 0.
- A *parahoric entry inequality* for matrix entries (Lemma 5.1) and the product formula control the intersection of G(K) with the chosen compact open subgroup (§6, Lemma 8.3).
- If L^{ss}(σ) were pure and unramified, Weil II would extend the tensor-induced local system over G_m. It would then split into rank-one systems.
- Kummer theory (Lemmas 4.6–4.7) and orthogonality of characters of k^× then isolate the highest root: a contradiction for q > 5.
- For (ii), two Poincaré series with different tame behaviour at ∞ contradict tameness through the tame fundamental group of G_m.

**Further results.**
- **§9:** depth-zero generic supercuspidals are pure, conditionally on Dat–Lanard.
- **§10:** tempered base change and incorrigible representations. For GL(n) (Proposition 10.10, Corollary 10.11), supercuspidals are ramified and either pure or wildly ramified, and become unramified principal series after cyclic base change.
- **§11:** a conjecture that Genestier–Lafforgue and Fargues–Scholze agree across close local fields.

## What the atlas already has

- **Planned (11 items):**
  - V. Lafforgue's global parametrisation (GS.5);
  - the Genestier–Lafforgue local parametrisation and Li-Huerta's comparison (GS.7), following PAPER-LAFFORGUE-18's reading;
  - Weil II local weights and monodromy filtrations (DWP.5, DWP.8), including pure Weil–Deligne representations;
  - L. Lafforgue's decomposition into mixed local systems (GS.6);
  - class field theory and Chebotarev over function fields (FA.4, FA.5);
  - buildings, parahoric and Moy–Prasad subgroups (RG2.2–RG2.4);
  - automorphic forms over function fields (FA.6), with SR.2–SR.4;
  - Fargues–Scholze parameters (ES5);
  - cyclic base change for p-adic groups (ML.5);
  - the finite-index closure of G(K) (AA.4).
- **Pending candidates that own inputs:**
  - KloostermanSheavesAndBesselIsocrystals (PAPER-XU-ZHU-22): Kloosterman sheaves;
  - SmoothRepresentationsPartII (PAPER-FINTZEN-21, PAPER-BUSHNELL-HENNIART-17): types;
  - GlobalShtukasPartIIRamanujanArthur (PAPER-CIUBOTARU-HARRIS-26): the Ciubotaru–Harris theorem;
  - ModPBernsteinCentersAndLocalBaseChange (PAPER-FENG-24): local cyclic base change.
- **Not planned anywhere:**
  - tempered refinements of Genestier–Lafforgue parameters and their ramification;
  - the Poincaré-series and simple-trace-formula globalisations over function fields;
  - Sawin–Templier's local purity;
  - close-field comparisons for general G.

## Routes

1. **New Part II: `GlobalShtukasPartIISupercuspidalParameters` (57 items).** Title "Global shtukas and Langlands over function fields, Part II: tempered local parameters and the ramification of supercuspidal parameters", area `functionfields`.
   - **Where it starts:** the parent plans the global and local parametrisations (GS.5, GS.7) but none of their temperedness or ramification properties.
   - **What it carries:**
     - pure Weil–Deligne completions and Sawin–Templier;
     - the globalisations (Gan–Lomelí Poincaré series, Appendix A);
     - local systems on P^1 and Kummer theory;
     - the parahoric entry inequality and the compact open subgroups;
     - §§7–8, §9, the base change discussion and GL(n) in §10, and §11.
   - **Proof obligations:** E1, E2 and E12.
   - **Source-gated inputs:** Sawin–Templier, Gan–Lomelí, Dat–Lanard, Beuzart-Plessis's elliptic orthogonality, Deligne's close-fields theorem and Ganapathy–Kazhdan.
   - **Why a separate Part II:** the nearest pending Part II (Ciubotaru–Harris, weight constraints) does not cover the ramification theorems, the globalisations or the base change discussion.
2. **Coalesced with `KloostermanSheavesAndBesselIsocrystals` (1 item).** Kl_Ǧ(φ, χ) as the parameter of Yun's π(φ, χ), with irreducible monodromy at ∞ (Heinloth–Ngô–Yun Theorem 2; Xu–Zhu 4.5.8–4.5.10).
3. **Coalesced with `SmoothRepresentationsPartII` (2 items).**
   - Fintzen's and Stevens's theorems that supercuspidals contain types. Stevens's classical-group result is the addition.
   - Bushnell–Kutzko's simple types for GL(n).
4. **Coalesced with `GlobalShtukasPartIIRamanujanArthur` (1 item).** The Ciubotaru–Harris theorem used in Theorem 9.4.
5. **Coalesced with `ModPBernsteinCentersAndLocalBaseChange` (1 item).** The [BFHKT] base change of large prime degree (now Compositio 160 (2024)) and Henniart–Lemaire's tempered base change for GL(n).
6. **Source of LP0 (2 items).** L-group-valued Weil–Deligne parameters, the Gross–Reeder dictionary, and tempered and essentially tempered parameters. LP0 owns L-parameters. PAPER-GAN-SAVIN-23-B routed Φ(G) with component groups for G_2 to ExceptionalThetaCorrespondencesForG2; its general definition should import from here.

## Source issues (`sourceIssues` E1–E14)

**Gap (E1): the proof of Theorem 7.2 (hence of Theorems 7.1 and 1.4(i)).**
- **The slip.** (7.5) correctly has tr(m_z^{−n}, L_j), and (7.6) gives tr(m_z, L_j) = μ(z)^{⟨α,β_j⟩}. But the orthogonality computation (7.7) substitutes μ(z)^{⟨α,β_j⟩}, dropping the factor −n.
- **When it matters.** With the correct exponent, the highest-root term is isolated only when (q − 1)/gcd(n, q − 1) ≥ 5.
  - For n = 1 this always holds when q > 5; the printed argument then works up to a sign.
  - For n ≥ 2 it can fail. Here n is the number of absolutely simple factors of the k-simple group, which the proof explicitly handles by tensor induction.
- **Example:** Res_{F_49/F_7} SL_3 with q = 7. There the constancy of the traces yields only two sums of terms that vanish, not the highest-root term, and no contradiction follows.
- **Status.** The theorem is not contradicted, but its printed proof does not cover these groups. Possible fixes are reduction along the Weil restriction or a different tame character at 0.

**Gap (E2): missing hypotheses.**
- Theorem 7.12 (= Theorem 1.5) omits q > 5, which its proof needs.
- Lemma 10.7 and Proposition 10.10 omit n ≥ 2. For n = 1 an unramified character of F^× is a case-(b) supercuspidal with unramified parameter.
- For 2 < q ≤ 5 the case-(b) supercuspidals of GL(n) rest on Theorem 1.4(i), which needs q > 5.

**Gap (E12): Corollary 11.8 omits σ ∈ A_n(G/F♯).** Conjecture 11.7 speaks only about A_n. An n-close field of characteristic p exists only for n ≤ e(F♯/Q_p).

**Misprints.**
- E3: Definition 3.3(iii) has N for N^i.
- E4: 𝒢_0(G) for 𝒜_0(G) in Theorem 2.1(ii).
- E5: ψ_k(az) for ψ_k(z^a) in Lemma 4.6.
- E6: W_i for W_k in §7.1.
- E7: 'Lemma 5.1(ii)' and G_{0,a+} in the proof of Lemma 8.3.
- E8: 'Proposition 8.1' and G(K) in Proposition 8.5.
- E9: 'Corollary 7.12' in Proposition 10.5.
- E10: §10.4's set-up:
  - 'block-diagonal' U_∞;
  - the undefined E^×(β, 𝔄) for E^×J(β, 𝔄);
  - λ for Λ;
  - GL_n(F) for GL_n(F_q(t)).
- E11: 'maximum n' for the least n in the definition of depth.
- E13: '0-close' for 1-close, and G 'over F' in Corollary 11.9.
- E14: condition '(iii)' for (iv) at the end of the proof of Lemma A.1.

## Prerequisites not yet covered

Twenty-one entries:
- **Parametrisations and globalisation:** Genestier–Lafforgue, Gan–Lomelí, Sawin–Templier, Gross–Reeder and Arthur 1984.
- **Kloosterman representations:** Heinloth–Ngô–Yun and Yun.
- **Types and depth zero:** Stevens, Bushnell–Kutzko, DeBacker–Reeder and Dat–Lanard (now Algebra & Number Theory 2026).
- **Base change:** [BFHKT] (now Compositio 2024), Henniart–Lemaire, Labesse and Harris's *Incorrigible representations*.
- **Close local fields:** Ganapathy, Deligne 1984 and Li-Huerta.
- **The appendix:** Bernstein–Deligne–Kazhdan, Deligne–Kazhdan–Vignéras and Beuzart-Plessis's elliptic orthogonality (a manuscript with no public record found).

DOIs were confirmed on Crossref and arXiv ids on arXiv.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GAN-HARRIS-SAWIN-ETAL-24.result.json` reports no errors.
- The E1 analysis (the exponent −n, and the example with q = 7, n = 2 and root system A_2) was worked by hand from (7.4)–(7.6) and Lemma 4.7 over k_n.
