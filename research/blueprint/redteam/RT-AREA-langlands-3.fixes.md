# RT-AREA-langlands-3: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #3969, job FIX-RT-AREA-langlands-3).
- Findings: `RT-AREA-langlands-3.result.json`, 4 findings (2 high, 2 medium), by `cc-7b31c4`.
- Verdicts: `RT-AREA-langlands-3.review.json` and `research/blueprint/reviews/REV-RT-AREA-langlands-3.md`, by
  `codex-hjdg0j`. Findings /1 and /4 are confirmed with a scoped repair; /2 and /3 are rejected.
- Everything below was checked at origin/main `09710a95`. None of the files named has changed since the verification.
- Graph checks use the atlas as `scripts/build.py` assembles it at that commit (2840 stages, 7792 stage edges).
  "The cycle test for A → B" asks whether the assembled graph has a path B → … → A. "Acyclic" means it has none.

## How to read this report

This report is the job's only deliverable, and the intake accepts no other file for it. Every fix is written as
an exact edit for the maintainer, or for the blueprint and design jobs of these roadmaps:
- **roadmap prose** (`content/campaign/<Roadmap>/README.md`): quoted old text, full new text;
- **stage records** in `data/atlas.json`;
- **paper routes** (`research/blueprint/papers/PAPER-<id>.result.json`): the field, old value and new value.

The new sub-stages use the atlas's existing pattern for sub-stages: a `key` with a colon under the parent, as
`AdicCoefficientsAndComparisons:L5` / `ClassicalAdicEtaleCohomology:H1:henselian`. Their parents require them.

**Route verdicts.** The paper-route edits below keep every route's kind and roadmap; they only replace a coarse
stage id by the new sub-stage ids of the same roadmap. So the existing `accept` verdicts still describe them.

**Disclosure.** This session wrote neither the red team nor its verification, and none of the five roadmaps. It
extracted none of the eleven papers whose routes are edited here.

## Summary

| # | Finding | Verdict | Fix |
|---|---|---|---|
| /1 | high, missing | confirmed | ML.4 gets five explicit construction sub-stages that own the classification inputs routed to it: Gan–Takeda's local GSp_4 with the archimedean GSp_4 packets; Arthur's GSp_4 classification (Gee–Taïbi); the classical Sp/SO classification including non-quasi-split odd SO; real Adams–Johnson packets; Xu's PGSp_6 packets. ML.4 stays the conditional-status registry. The unconditional local theorems are kept apart from the multiplicity formulas, which stay conditional on the twisted weighted fundamental lemma. Nine paper routes and the GSp_4 Part II brief point to the sub-stages. |
| /2 | high, missing | rejected | No change. |
| /3 | medium, missing | rejected | No change. A note is left for R20.3's blueprint. |
| /4 | medium, missing | confirmed | Two new R31 sub-stages: R31.1:definite (the definite quaternionic tower, C⁰(X), its classical comparison, Hecke algebras, localisation and Galois representation) and R31.4:definite (Emerton's compatibility Theorem 5.4 with its §13 proof, and the globalisation Theorem 5.5). Dospinescu–Le Bras route 5 points to them. The curve degree-one theorem is unchanged. |

## /1 (high, missing): ML.4's classification inputs get explicit construction sub-stages

### What the verifier corrected
- **The gap is real.** ML.4 is asked, by accepted routes, to supply Gan–Takeda, Arthur's packets and multiplicities. ET.6 constructs local Langlands only for GL_m and its inner forms. ET.7a proves a scoped unitary transfer. ET.3 excludes a general weighted fundamental lemma. AS.6's invariant trace formula does not supply a classification.
- **The accepted GSp_4 Part II does not fill it.** `GSp4LocalLanglandsAndGaloisRepresentations` (BOXER-CALEGARI-GEE-PILLONI-21 route 4) imports Gan–Takeda, Definition 2.3.1 and Arthur's transfer/multiplicities from ML.4, and builds the explicit local theory on top. A new classification branch must keep that proposal's local, archimedean and Galois ownership.
- **The repair is narrower than the red team's blanket classification roadmap.** Either make ML.4's construction branches explicit, or coalesce them into one scoped continuation. Name for each consumer:
  - the local parameters and component groups;
  - packet construction and exhaustion, and the normalisation;
  - the endoscopic character relations and the exact multiplicity formula it needs.

  Link the GSp_4 proposal to these suppliers. Keep conditional global branches visible in the endpoint registry until their assumptions are proved.
- **Gan–Takeda is unconditional.** It proves its local correspondence over nonarchimedean characteristic-zero fields (Annals 173, Main Theorem, pp. 1842–1843). No blanket statement that every GSp_4 result is conditional is justified.
- **Keep the scopes distinct.** Odd orthogonal inner forms and generic global parameters (Gan–Ichino), Xu's similitude packets, and real/cohomological packet comparisons are not one interchangeable theorem. Keep the exact group, inner form, genericity and parameter restrictions.
- **AGIKMS** (arXiv:2410.13504v3) closes the earlier local-intertwining assertions but retains the twisted weighted fundamental lemma (§0.4). Neither ET.3 nor a weak generic transfer removes that.
- **Nine papers, not eight.** RS-21 is unreviewed and proves no live ownership.
- **Acceptance:**
  - an owner and a source statement for each routed classification input;
  - the hypotheses propagated into each consumer;
  - a normalisation-compatible packet/transfer interface.

### State on main (09710a95)
- **ML.4** (`content/campaign/ModularityAndLanglandsExtensions/README.md`) still reads: "**Construct and export.** Give Arthur/Mok/KMSW classification inputs explicit proof-source owners: stabilization, transfer, fundamental lemma, packets, multiplicities and local-global compatibilities. Preserve any source-specific conditional hypotheses until the exact missing result and applicable replacement are verified." Its inputs are ML.0 and AutomorphicSpectralTheory AS.6. Its acceptance: "The symplectic torsion branch has a named source-verification/construction task; it cannot be marked unconditional because a related unitary theorem is available."
- **Nine accepted source routes send 34 missing items to ML.4.** All nine papers have overall verdict accept. The classification items, by branch:

  | Branch | Items |
  |---|---|
  | local GSp_4 | BCGP21/14 and /161; GAN-SAVIN-23/gsp4-llc; CG20/ext-sorensen-transfer-infinitesimal-character and /archimedean-transfer-gsp4-gl4; PILLONI-20/ext-bhr-archimedean-L-packet |
  | Arthur for GSp_4 | BCGP21/32, /33, /206 and /207; CG20/ext-arthur-gsp4-classification, /ext-mok-archimedean-packet and /unitary-descent-of-gl4-transfer; PILLONI-20/arthur-classification-nongeneral-type-reducible, /ext-arthur-classification-gsp4 and /ext-schmidt-packet-types-with-limit-of-discrete-series |
  | classical Sp/SO | GAN-ICHINO-18/llc-so-inner, /lemma-5-1, /lemma-5-5 and /amf-nonsplit; JIANG-ZHANG-20/prop-b-1 |
  | real packets | CHENEVIER-TAIBI-20/amr18-adams-johnson and /moeglin-renard; ICHINO-PRASANNA-23/101 |
  | Xu's packets | GAN-SAVIN-23-B/67–72 |

  The remaining items on those routes are not classification inputs. They stay with ML.0/ML.1, where their routes also point:
  - BCGP21/186 (Shahidi's exterior-square L-functions);
  - BCGP21/200 (residual modularity);
  - CG20/conj-weight-22-abelian-varieties (a heuristic, not used);
  - PILLONI-20/remark-5-3-2-expected-newton-above-hodge.
- **Sources read for this fix** (29 September 2026, as rendered text):
  - **Gan–Takeda, Main Theorem**, printed pp. 1842–1843: "There is a surjective finite-to-one map L : Π(GSp4) → Φ(GSp4)" with properties (i)–(vii), and "The map L is uniquely determined by the properties (i), (iii), (v) and (vi), with r ≤ 2 in (v) and (vi)."
  - **Gee–Taïbi** (J. Éc. polytech. Math. 6 (2019), 469–535, doi:10.5802/jep.99):
    - Theorem 3.1.1 (p. 486) constructs the local packets Π_ψ for GSpin_5 ≅ GSp_4 with their stable and endoscopic character identities;
    - Theorem 7.4.1 (p. 512) is the multiplicity formula L²_disc(GSpin_5) ≅ ⊕_χ ⊕_ψ ⊕_{π∈Π_ψ(ε_ψ)} π;
    - Proposition 7.3.1 derives Conjecture 2.5.3 from Gan–Takeda;
    - p. 472: "While we have said that the results of this paper are unconditional, they are only as unconditional as the results of [Art13] and [MW16a, MW16b]. In particular, they depend on cases of the twisted weighted fundamental lemma that were announced in [CL10], but whose proofs have not yet appeared in print, as well as on the references [A24], [A25], [A26] and [A27] in [Art13]".
  - **AGIKMS**, arXiv:2410.13504v3, p. 5: "The goal of this paper is to prove all unproven assertions that [Ar3] and [Mok] rely on, apart from the twisted weighted fundamental lemma". §0.4, p. 15: "the stabilization of the twisted trace formula depends on the twisted weighted fundamental lemma … which remains conditional to the best of our knowledge"; the Lie-algebra weighted fundamental lemma is complete "for split groups by Chaudouard–Laumon"; "no written account has appeared on the proof of (i) for non-split groups, or on the proof of (ii)".
  - **The other branches' sources** (Arthur 2013 and 2004, Mœglin–Renard, Ishimoto, Mok, Blasius–Harris–Ramakrishnan, Sorensen, Arancibia–Mœglin–Renard, Xu) were not re-read. Their statements are those recorded, with locators, in the reviewed items listed above.

### Fix

**1. `content/campaign/ModularityAndLanglandsExtensions/README.md`, ML.4.**
- **"Construct and export".** Replace the paragraph quoted above with:
  > **Construct and export.** ML.4 is the registry of classical-group classification inputs and their conditional status. The constructions are its five sub-stages, each the single owner of the inputs routed to it:
  > - [ML.4:gsp4-local](#stage-ML.4:gsp4-local): the local Langlands correspondence for GSp_4 over nonarchimedean fields of characteristic zero (Gan–Takeda) and over R, and the spin transfer to GL_4;
  > - [ML.4:gsp4-arthur](#stage-ML.4:gsp4-arthur): Arthur's classification of the discrete spectrum of GSp_4, as proved by Gee–Taïbi;
  > - [ML.4:classical-arthur](#stage-ML.4:classical-arthur): the endoscopic classification of quasi-split symplectic and special orthogonal groups (Arthur 2013), and its extension to non-quasi-split odd special orthogonal groups;
  > - [ML.4:real-packets](#stage-ML.4:real-packets): Adams–Johnson packets as Arthur packets for real classical and unitary groups;
  > - [ML.4:xu-packets](#stage-ML.4:xu-packets): Xu's packets for similitude groups, as used for PGSp_6.
  >
  > Record for every export whether it is unconditional or conditional:
  > - **Unconditional:** the local correspondences of Gan–Takeda and of the archimedean theory.
  > - **Conditional on the twisted weighted fundamental lemma:** every global multiplicity formula resting on Arthur 2013 (Gee–Taïbi, p. 472; Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, arXiv:2410.13504v3, §0.4). This includes the GSp_4 formula and the non-quasi-split extension, and holds until that lemma is proved for the groups involved. AGIKMS remove the other unproven references of Arthur's book but not this one.
  >
  > A consumer imports the specific sub-stage, and states the conditional hypothesis where the export is conditional. Stabilization, transfer and the fundamental lemma are imported from AutomorphicSpectralTheory AS.6 and EndoscopicTransferAndUnitaryTraceComparison ET.3–ET.4, never re-planned here.
- **"Inputs".** Replace "`ModularityAndLanglandsExtensions:ML.0`, `AutomorphicSpectralTheory:AS.6`" with "`ModularityAndLanglandsExtensions:ML.0`, `AutomorphicSpectralTheory:AS.6`, and the five sub-stages ML.4:gsp4-local, ML.4:gsp4-arthur, ML.4:classical-arthur, ML.4:real-packets, ML.4:xu-packets".
- **"Acceptance".** Replace the sentence quoted above with:
  > **Acceptance.** Every classification input routed to ML.4 names its owning sub-stage, the source statement with its locator, and its conditional status; a consumer that uses a conditional multiplicity formula carries the hypothesis in its own statement. The symplectic torsion branch has a named source-verification/construction task in ML.4:classical-arthur; it cannot be marked unconditional because a related unitary theorem is available.

**2. The same README: five new sub-stage sections**, inserted after ML.4 and before ML.5.

> <a id="stage-ML.4:gsp4-local"></a>
> ### ML.4:gsp4-local — The local Langlands correspondence for GSp_4
>
> **Construct and export.** For F a nonarchimedean local field of characteristic zero, Gan–Takeda's Main Theorem (Ann. of Math. 173 (2011), pp. 1842–1843): a surjective finite-to-one map L : Π(GSp_4) → Φ(GSp_4) with properties (i)–(vii) (discrete series, fibres parametrised by characters of A_φ ∈ {1, Z/2} with the generic member indexed by the trivial character, sim ∘ φ_π = ω_π, twisting, Shahidi's local factors for generic or non-supercuspidal π, Plancherel measures for non-generic supercuspidals, the adjoint-L-function criterion for a generic member), uniquely determined by (i), (iii), (v) and (vi) with r ≤ 2. The proof runs through theta correspondences for GSp_4 × GSO(V) with V of dimension 4 and 6, the local Langlands correspondence and Jacquet–Langlands for GL_2, and for GL_4. Also export:
> - the compatibility with the Roberts–Schmidt tables (Gan–Takeda 2011b, Proposition 13.1, as recorded in PAPER-BOXER-CALEGARI-GEE-PILLONI-21/14);
> - the Galois-side L-packet L(ρ) of Boxer–Calegari–Gee–Pilloni Definition 2.3.1, with the half-twist |ν|^{−3/2} fixed by ι_p (their Remarks 2.3.2–2.3.3: independence of ι_p is used only for unramified representations and for the rank of the monodromy operator);
> - over R, the archimedean L-packets of GSp_4(R) with a limit-of-discrete-series member (Blasius–Harris–Ramakrishnan, Prop. 5.3.7, as recorded in PAPER-PILLONI-20/ext-bhr-archimedean-L-packet), and the transfer of π_∞ to GL_4(R) through the spin representation with its infinitesimal character (Sorensen §2.1.2, as recorded in PAPER-CALEGARI-GERAGHTY-20/ext-sorensen-transfer-infinitesimal-character).
>
> **Status.** Unconditional: no trace-formula input.
>
> **Inputs.** EndoscopicTransferAndUnitaryTraceComparison ET.6 (local Langlands for GL_m and its inner forms); MetaplecticAutomorphicForms MP.3 (dual pairs and local theta); AutomorphicLFunctionsAndLocalFactors AL.3 (Rankin–Selberg and Shahidi local factors); SmoothRepresentationsOfLocalGroups SR.4.
>
> **Consumers.** GSp4LocalLanglandsAndGaloisRepresentations (BOXER-CALEGARI-GEE-PILLONI-21 route 4), which builds the explicit local theory on rec_GT; ML.4:gsp4-arthur; the exceptional theta correspondences of PAPER-GAN-SAVIN-23.
>
> **Acceptance.** For unramified π the parameter is the Satake parameter; the Steinberg representation has the parameter with principal nilpotent monodromy; an A_φ = Z/2 packet has exactly one generic member.

> <a id="stage-ML.4:gsp4-arthur"></a>
> ### ML.4:gsp4-arthur — Arthur's classification for GSp_4
>
> **Construct and export.** Gee–Taïbi's proof of Arthur's 2004 announcement (J. Éc. polytech. Math. 6 (2019), 469–535):
> - the local packets Π_ψ for GSpin_5 ≅ GSp_4 with their stable and endoscopic character identities (Theorem 3.1.1, p. 486);
> - their compatibility with Gan–Takeda (Proposition 7.3.1);
> - the multiplicity formula for the discrete spectrum (Theorem 7.4.1, p. 512).
>
> Export these in the forms the consumers record:
> - the six types (a)–(f) of discrete automorphic representations;
> - the notions of discrete, general type, symplectic type with multiplier and transfer to GL_4 (PAPER-BOXER-CALEGARI-GEE-PILLONI-21/206);
> - for a parameter of general type, trivial S_ψ, multiplicity one and the archimedean Arthur packet equal to the L-packet (PAPER-CALEGARI-GERAGHTY-20/ext-arthur-gsp4-classification and /ext-mok-archimedean-packet; PAPER-PILLONI-20/ext-arthur-classification-gsp4);
> - descent from GL_4 of symplectic type (PAPER-BOXER-CALEGARI-GEE-PILLONI-21/32, Theorem 2.9.3);
> - the reducibility of the Galois representations of discrete representations not of general type (/207, Lemma 2.9.1; PAPER-PILLONI-20/arthur-classification-nongeneral-type-reducible);
> - the packet types allowed by a limit-of-discrete-series archimedean component (PAPER-PILLONI-20/ext-schmidt-packet-types-with-limit-of-discrete-series);
> - the descent of the GL_4 transfer to a unitary group used by PAPER-CALEGARI-GERAGHTY-20 Lemma 6.9, importing Mok's unitary classification from ML.4:classical-arthur.
>
> **Status.** Conditional, as PAPER-BOXER-CALEGARI-GEE-PILLONI-21/33 and Gee–Taïbi p. 472 record: as unconditional as Arthur 2013 and Mœglin–Waldspurger's stabilisation, so dependent on the twisted weighted fundamental lemma (AGIKMS §0.4). Every consumer statement that uses the multiplicity formula carries this hypothesis.
>
> **Inputs.** ML.4:gsp4-local; ML.4:classical-arthur (Arthur's Sp_4 results, used by Gee–Taïbi); AutomorphicSpectralTheory AS.6; EndoscopicTransferAndUnitaryTraceComparison ET.3 and ET.4.
>
> **Consumers.** GSp4LocalLanglandsAndGaloisRepresentations; ML.0's conditional-status register.

> <a id="stage-ML.4:classical-arthur"></a>
> ### ML.4:classical-arthur — Endoscopic classification of symplectic and orthogonal groups
>
> **Construct and export.** Arthur's classification for quasi-split symplectic and special orthogonal groups (The Endoscopic Classification of Representations, 2013), and Mok's for unitary groups, with the local packets, their endoscopic character relations and the multiplicity formula. Also:
> - **for non-quasi-split odd special orthogonal groups:**
>   - the local Langlands correspondence for SO(V) for all V, with Vogan packets and the (5.3) bijections recorded in PAPER-GAN-ICHINO-18/llc-so-inner (Langlands–Shelstad over R; Arthur for SO(V⁺); Mœglin–Renard for SO(V⁻));
>   - the multiplicity formula for generic elliptic parameters (Ishimoto, IMRN 2024, Theorems 3.13–3.14, as recorded in /amf-nonsplit), with the expected decomposition (i) kept as a hypothesis until a source is read for the classes Gan–Ichino's Lemma 6.10 meets;
> - the irreducibility statements of Gan–Ichino Lemmas 5.1 and 5.5 (via Mœglin–Waldspurger and Mœglin);
> - Jiang–Zhang Proposition B.1 (irreducible standard modules for generic parameters of pure inner forms).
>
> **Status.**
> - The local classifications (tempered and generic cases as stated) are unconditional where their sources are local.
> - The global multiplicity formulas are conditional on the twisted weighted fundamental lemma (AGIKMS §0.4); AGIKMS supply the local intertwining relations and co-tempered packets.
> - The non-quasi-split global statement keeps Gan–Ichino's recorded hypothesis until Ishimoto's result is checked against each use.
>
> **Inputs.** AutomorphicSpectralTheory AS.6; EndoscopicTransferAndUnitaryTraceComparison ET.3, ET.4 and ET.6; MetaplecticAutomorphicForms MP.3.
>
> **Consumers.** ML.4:gsp4-arthur; PAPER-GAN-ICHINO-18's Shimura–Waldspurger roadmap; PAPER-JIANG-ZHANG-20.

> <a id="stage-ML.4:real-packets"></a>
> ### ML.4:real-packets — Adams–Johnson packets are Arthur packets
>
> **Construct and export.**
> - For Adams–Johnson parameters of real classical groups: Arthur's packet Π(ψ_R) equals the Adams–Johnson packet, each member with multiplicity one, with the character map U ↦ χ_U of Arancibia–Mœglin–Renard (PAPER-CHENEVIER-TAIBI-20/amr18-adams-johnson).
> - Mœglin–Renard's criterion for the packets containing ρ_k(g), with its sign δ for the Whittaker datum (/moeglin-renard).
> - For cohomological parameters of U(p,q): the same identification (Arancibia–Mœglin–Renard; Johnson 1990), with the explicit A_q(λ) description of PAPER-ICHINO-PRASANNA-23/101.
>
> **Status.** These are local archimedean comparisons with Arthur's packets. They inherit the definition of those packets from ML.4:classical-arthur, and no global conditional hypothesis.
>
> **Inputs.** ML.4:classical-arthur.

> <a id="stage-ML.4:xu-packets"></a>
> ### ML.4:xu-packets — Xu's packets for similitude groups
>
> **Construct and export.** For an L-parameter φ^♭ of Sp_6 with trivial central character: the sets Π̃_{φ♭} and Φ̃_{φ♭}, their partition into Xu's packets, and the rest of PAPER-GAN-SAVIN-23-B/67–72 (Xu 1–3):
> - restriction to Sp_6;
> - the parametrisation by Irr(S_φ/Z(Spin_7));
> - stability and endoscopic character identities;
> - stabilisers and the number of packets;
> - the global packets and the multiplicity formula for the tempered spectrum of PGSp_6.
>
> **Status.**
> - The local statements are as Xu proves them.
> - The global multiplicity formula rests on Arthur 2013 and is conditional on the twisted weighted fundamental lemma.
> - The misprints recorded as PAPER-GAN-SAVIN-23-B/E8 are corrected in the statements.
>
> **Inputs.** ML.4:classical-arthur; AutomorphicSpectralTheory AS.6.
>
> **Consumers.** The G_2 local Langlands roadmap of PAPER-GAN-SAVIN-23-B.

**3. `data/atlas.json`.**
- Add the five stage records. Each has owner `ModularityAndLanglandsExtensions`, `parentStageId` `ModularityAndLanglandsExtensions:ML.4`, the key and title above, and the `requires` of its "Inputs" line.
- Add the five ids to ML.4's `requires`.

**Cycle test.** Every input is outside the classification chain, and the test is acyclic for each (A → ML.4 and its sub-stages): AS.6, ET.3, ET.4, ET.6, MP.3, AL.3, SR.4 and ML.0. The sub-stages' only atlas consumer is ML.4.

**4. Paper routes** (`research/blueprint/papers/`). In each route, the `stages` value changes as shown, the kind and roadmap stay, and each listed item's `note` gains "Owner: <sub-stage> (FIX-RT-AREA-langlands-3 /1)."

| Paper, route | `stages` now | `stages` after | Items → owner |
|---|---|---|---|
| BOXER-CALEGARI-GEE-PILLONI-21, route 8 | ML.0, ML.1, ML.4 | ML.0, ML.1, ML.4:gsp4-local, ML.4:gsp4-arthur | 14, 161 → gsp4-local; 32, 33, 206, 207 → gsp4-arthur; 186, 200 stay with ML.0/ML.1 |
| CALEGARI-GERAGHTY-20, route 15 | ML.0, ML.4 | ML.0, ML.4:gsp4-local, ML.4:gsp4-arthur | ext-sorensen…, archimedean-transfer… → gsp4-local; ext-arthur-gsp4-classification, ext-mok-archimedean-packet, unitary-descent-of-gl4-transfer → gsp4-arthur; conj-weight-22… stays with ML.0 |
| PILLONI-20, route 14 | ML.0, ML.4 | ML.0, ML.4:gsp4-local, ML.4:gsp4-arthur | ext-bhr… → gsp4-local; arthur-classification-nongeneral…, ext-arthur-classification-gsp4, ext-schmidt… → gsp4-arthur; remark-5-3-2… stays with ML.0 |
| GAN-SAVIN-23, route 4 | ML.4 | ML.4:gsp4-local | gsp4-llc |
| GAN-ICHINO-18, route 3 | ML.4 | ML.4:classical-arthur | llc-so-inner, lemma-5-1, lemma-5-5, amf-nonsplit |
| JIANG-ZHANG-20, route 4 | ML.4 | ML.4:classical-arthur | prop-b-1 |
| CHENEVIER-TAIBI-20, route 8 | ML.4 | ML.4:real-packets | amr18-adams-johnson, moeglin-renard |
| ICHINO-PRASANNA-23, route 7 | ML.4 | ML.4:real-packets | 101 |
| GAN-SAVIN-23-B, route 4 | ML.4 | ML.4:xu-packets | 67–72 |

All stage ids are `ModularityAndLanglandsExtensions:…`.

**5. `PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json`, route 4 (the GSp_4 Part II), `brief`.**
- Replace "owns Arthur's classification for GSp_4 with the transfer to GL_4 (this paper's Lemma 2.9.1, Theorem 2.9.3) and Gan–Takeda's rec_GT with its L-packets and Definition 2.3.1 (ML.4)" with "owns Arthur's classification for GSp_4 with the transfer to GL_4 (this paper's Lemma 2.9.1, Theorem 2.9.3; ML.4:gsp4-arthur, conditional on the twisted weighted fundamental lemma) and Gan–Takeda's rec_GT with its L-packets and Definition 2.3.1 (ML.4:gsp4-local, unconditional)".
- Replace "Gan–Takeda's correspondence with its L-packets (ModularityAndLanglandsExtensions ML.4)" with "Gan–Takeda's correspondence with its L-packets (ModularityAndLanglandsExtensions ML.4:gsp4-local)".
- Replace "Gan–Takeda, Arthur's transfer and multiplicities come from ML.4" with "Gan–Takeda comes from ML.4:gsp4-local, and Arthur's transfer and multiplicities from ML.4:gsp4-arthur".
- Replace "Both theorems carry the conditional status of Arthur's multiplicity formula recorded at ML.0 and ML.4." with "Both theorems carry the conditional status of Arthur's multiplicity formula recorded at ML.0 and ML.4:gsp4-arthur."
- Replace "The proof uses ML.4's descent from GL_4" with "The proof uses ML.4:gsp4-arthur's descent from GL_4".
- Replace "- From ML.0/ML.4: the archimedean L-packet of GSp_4(R) and the infinitesimal character of the transfer of π_∞ to GL_4(R)." with "- From ML.0/ML.4:gsp4-local: the archimedean L-packet of GSp_4(R) and the infinitesimal character of the transfer of π_∞ to GL_4(R)."

The Part II keeps its own ownership of the explicit local theory, the archimedean conversions and the Galois representations. This edit only names its suppliers.

### Not done, and why
- **Sources not re-read.** Arthur's 2013 book and the 2004 announcement, Mok, Mœglin–Renard, Ishimoto, Arancibia–Mœglin–Renard, Xu, Blasius–Harris–Ramakrishnan and Sorensen were not re-read here. The sub-stage texts cite the reviewed extraction items, which record their statements and locators. The blueprint job of ModularityAndLanglandsExtensions must read each at the step that uses it.
- **Non-quasi-split odd SO.** Ishimoto's coverage of Gan–Ichino's step (i) stays an open check, as the Gan–Ichino review asked.
- **No separate roadmap.** A coalesced classification Part II, the verifier's second option, is not proposed: the five sub-stages keep the consumers' current routes and titles.

## /2 (high, missing): rejected, no change
- **The verdict.** ML.2 and ML.3 own construction targets (the final potential-automorphy theorem; source-scoped symmetric-power automorphy). PA.5 leaves lifting to its owner. BOXER-CALEGARI-GEE-ETAL-25 route 1 already places the Bianchi package with ML.0/ML.2/ML.3.
- **The recount** is 100 items on 21 routes from 19 papers, not 101.
- **Change.** None. Finding /1 addresses the real ML.4 gap.

## /3 (medium, missing): rejected, no change
- **The verdict.** The reviewed fine node `AlgebraicModularFormsAndSerreWeights:R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k` assigns the proof of Edixhoven's Theorem 4.5 to R20.3, with Gross's companion-form input and the Coleman–Voloch extension.
- **The route status is different from the finding's.** IYENGAR-KHARE-MANNING-24 route 8 is rejected.
- **The red team's statement is wrong.** Coleman–Voloch treat 2 < k ≤ p (Theorem 0.1) and p > 2 (Corollary 0.2), and leave k = p = 2 open.
- **Change.** None. A note for R20.3's blueprint, from the verdict: expand the existing R20.3 obligation with exact sources and separate hypotheses, keeping three statements apart:
  - Gross's split ordinary companion criterion (Prop. 13.8, Thm 13.10, Cor. 13.11);
  - lowering to Katz weight one;
  - the Frobenius recovery.

## /4 (medium, missing): the definite quaternionic branch of R31

### What the verifier corrected
- **The route and the gap.** DLB17 route 5 has exactly 26 missing items and is accepted. R31.1 specialises to curves; R31.4's concrete theorem is Emerton's degree-one promodular branch. R18.4 gives finite-level quaternionic and Jacquet–Langlands inputs, and CC.8 generic completed objects, but neither proves the definite Banach compatibility.
- **What Dospinescu–Le Bras prove:**
  - The setting: B̄/Q split at p and ramified at infinity, with sufficiently small tame level.
  - The objects: Definition 4.3 (the compact inverse limit X of finite double quotients), Lemmas 4.4–4.5 (the analytic quotient model, the classical coefficient spaces), and §5.1 (spherical Hecke actions, their limit, the residual localisation A, its Galois representation).
  - The standing assumption: absolute irreducibility of the **local** residual representation at p.
- **The proof to plan (§13):**
  1. the finite-orbit model and locally algebraic density;
  2. Π^univ from the local correspondence in families;
  3. the multiplicity module M and finite generation of its dual;
  4. dense crystalline points with nonzero fibres (Proposition 13.5);
  5. injectivity of the completed evaluation map, by reduction and residual irreducibility;
  6. surjectivity, from closed image plus density;
  7. the fibre identity giving Theorem 5.4 with positive multiplicity.

  Emerton's tensor-product lemmas are explicit inputs.
- **The repair.** Add the definite model, classical comparison, Hecke/Galois localisation and compatibility branches inside R31. Identify C⁰(X) with the degree-zero specialisation of the generic CC construction. Import R18.4, the determinant/Galois infrastructure and R30.5's family correspondence. Keep the curve degree-one theorem unchanged.
- **The reason is the degree, not the base field.** B̄ is over Q, so the "other number fields" warning does not apply. What is missing is the group, tower and cohomological degree, with its own proof.

### State on main (09710a95)
- **R31.1:** "Specialize [CompletedCohomologyPartII CC.0–CC.8](../CompletedCohomologyPartII/README.md) to modular/Shimura curves."
- **R31.4:** plans Emerton's 2011 Theorem 1.2.1 for promodular representations of G_Q in completed degree-one cohomology.
- **DLB17 route 5:** `stages` ["…:R31.1", "…:R31.2", "…:R31.4"], 26 items, all missing. Route 1 (the Drinfeld-tower Part II `PadicLocalLanglandsForGL2QpPartIIGeometricRealisation`) is the consumer of Theorem 5.4.
- **Read for this fix** (Dospinescu–Le Bras, arXiv:1509.00606v2, §4.1 pp. 20–22, §5.1 pp. 25–26, §13 pp. 69–73; the arXiv v2 pagination equals the printed one):
  - Définition 4.3: "X = X(K^p) = B̄*(Q)\B̄*(A_f)/K^p … L'espace C⁰(X) est l'espace des formes automorphes p-adiques pour le groupe B̄*".
  - Lemme 4.4: X = ⊔_{i=1}^r Γ_i\G with Γ_i discrete cocompact.
  - Lemmes 4.5–4.7: the classical comparisons.
  - §5.1: T_Σ, T̃_Σ(K_p), T̃_Σ; Définition 5.2; "Hypothèse. La représentation r̄|G_{Q_p} est absolument irréductible"; Définition 5.3 (A, the m-adic completion, flat, local, noetherian, reduced); the representation r_m over A via Carayol's theorem; Π(𝔭).
  - Théorème 5.4: "Pour tout idéal maximal 𝔭 de A[1/p], on a un isomorphisme de représentations de G : C⁰(X)[𝔭] ≃ Π(𝔭)^{⊕r}, pour un certain entier r > 0."
  - Théorème 5.5 with Lemme 5.6.
  - §13: Lemmes 13.1–13.2, Définition 13.3, Remarque 13.4, Proposition 13.5, Lemmes 13.6–13.9 and the proof of 5.4 (the evaluation map (Π^univ ⊗̂_A M)[1/p] → C⁰(X)_m, using Emerton's Lemmas 3.1.16–3.1.17 and B.6).

### Fix

**1. `content/campaign/CompletedCohomologyAndLocalGlobalCompatibility/README.md`: two new sub-stage sections.** R31.1:definite goes after R31.1; R31.4:definite goes after R31.4.

> <a id="stage-R31.1:definite"></a>
> ### R31.1:definite — The definite quaternionic tower and its completed cohomology
>
> Let B̄ be a quaternion algebra over Q, split at p and ramified at infinity, with B̄*(Q_p) ≅ G = GL_2(Q_p), and K^p = ∏_{ℓ≠p} K_ℓ open compact with some K_{ℓ₀} torsion-free (Dospinescu–Le Bras, arXiv:1509.00606v2, §4.1). Construct:
> - X = B̄*(Q)\B̄*(A_f)/K^p, the inverse limit of the finite sets X(K_p), with its right G-action (Définition 4.3). Prove X = ⊔ Γ_i\G with Γ_i discrete cocompact (Lemme 4.4), so X is a compact p-adic analytic manifold.
> - C⁰(X) = C⁰(X, L). Identify it with the degree-zero case of CompletedCohomologyPartII's generic completed cohomology of the tower (CC.2, CC.8) through a named comparison isomorphism, not a second carrier.
> - The classical comparisons: Hom_{K_p}(W*, C⁰(X)) ≅ A_{K_p}(W) (Lemme 4.5), its complex form through ι (Lemme 4.6), and the K_p-algebraic vectors as ⊕ W_∞ ⊗ π_f^{K_p} (Lemme 4.7), with the global Jacquet–Langlands correspondence imported from HilbertModularVarietiesAndShimuraCurves R18.4.
> - The Hecke algebras T_Σ, T̃_Σ(K_p) and T̃_Σ (§5.1); associated representations and modular residual representations (Définition 5.2); under the Hypothèse that r̄|G_{Q_p} is absolutely irreducible, the m-adic completion A (Définition 5.3) and the representation r_m : G_{Q,Σ} → GL_2(A), from the classical Galois representations through AutomorphicGaloisRepresentations R19.6 (Carayol's theorem), and Π(𝔭) for 𝔭 ∈ MaxSpec A[1/p].
>
> This is degree zero for a definite group. It does not use the degree-one curve theorem of R31.4.
>
> **Inputs.** CompletedCohomologyPartII CC.2, CC.6, CC.8; HilbertModularVarietiesAndShimuraCurves R18.4; AutomorphicGaloisRepresentations R19.6.

> <a id="stage-R31.4:definite"></a>
> ### R31.4:definite — Emerton's local–global compatibility for the definite quaternion algebra
>
> Under the Hypothèse of R31.1:definite (r̄|G_{Q_p} absolutely irreducible), prove Dospinescu–Le Bras Théorème 5.4: for every maximal ideal 𝔭 of A[1/p], C⁰(X)[𝔭] ≅ Π(𝔭)^{⊕r} as G-representations for some r > 0. Follow the §13 proof:
> - GL_2(Z_p) acts freely on X with finitely many orbits (Lemme 13.1), and the GL_2(Z_p)-algebraic vectors are dense in every topological direct summand (Lemme 13.2, Mahler);
> - Π^univ, the orthonormalisable A-module with Π^univ ⊗_A k(𝔭) ≅ Π(𝔭), imported from the local correspondence in families (PadicLocalLanglandsForGL2Qp R30.5);
> - the module M = Hom^cont_{A[G]}(Π^univ, C⁰(X, O_L)_m) and its Schikhof dual (Définition 13.3, Remarque 13.4), with M* finitely generated (Lemme 13.6) and the fibre description (Lemme 13.7);
> - the family 𝒞 of classical crystalline points, Zariski dense (Lemme 13.8), in the support by Berger–Breuil's universal unitary completions (Lemme 13.9, imported from R30.4), hence Proposition 13.5;
> - injectivity of (Π^univ ⊗̂_A M)[1/p] → C⁰(X)_m by reduction modulo π_L and irreducibility of Π^univ/m, and surjectivity by closed image and density, importing Emerton's Lemmas 3.1.16–3.1.17 and B.6 as named inputs;
> - the 𝔭-part, giving Théorème 5.4.
>
> Then prove Théorème 5.5 (a weight-2 quaternionic form with p-component π ⊗ ξ∘det, ξ unramified, and r̄_f|G_{Q_p} absolutely irreducible) with Lemme 5.6 and Hecke's weight-2 CM forms, as the source does.
>
> This is not the degree-one theorem of R31.4 applied by analogy, and it asserts nothing when r̄|G_{Q_p} is reducible.
>
> **Inputs.** R31.1:definite; PadicLocalLanglandsForGL2Qp R30.4 and R30.5.
>
> **Consumers.** The Drinfeld-tower Part II of PAPER-DOSPINESCU-LEBRAS-17 (route 1).

**2. The same README, R31.1.** After "Specialize [CompletedCohomologyPartII CC.0–CC.8](../CompletedCohomologyPartII/README.md) to modular/Shimura curves.", insert: "The definite quaternionic tower, in degree zero, is the sub-stage [R31.1:definite](#stage-R31.1:definite)."

**3. The same README, R31.4.** At the end of the section, add: "The definite quaternionic analogue (Dospinescu–Le Bras Théorème 5.4, degree zero) is the sub-stage [R31.4:definite](#stage-R31.4:definite); nothing here is transferred to it by analogy."

**4. `data/atlas.json`.**
- Add R31.1:definite, with `parentStageId` R31.1 and `requires` [CC.2, CC.6, CC.8, R18.4, R19.6].
- Add R31.4:definite, with `parentStageId` R31.4 and `requires` [R31.1:definite, R30.4, R30.5].
- Add them to the `requires` of R31.1 and R31.4 respectively.
- **Cycle test.** Acyclic for each of CC.2, CC.6, CC.8, R18.4, R19.6, R30.4 and R30.5 into R31.1 and R31.4. The new stages have no other atlas consumers.

**5. `PAPER-DOSPINESCU-LEBRAS-17.result.json`, route 5.**
- `stages`: ["…:R31.1", "…:R31.2", "…:R31.4"] → ["CompletedCohomologyAndLocalGlobalCompatibility:R31.1:definite", "CompletedCohomologyAndLocalGlobalCompatibility:R31.4:definite"].
- Append to `reason`: "The definite branch has its own sub-stages (FIX-RT-AREA-langlands-3 /4): R31.1:definite takes Definition 4.3, Lemmas 4.4–4.7, the Hecke algebras, Definitions 5.2–5.3 and r^m; R31.4:definite takes §13, Theorem 5.4 and Theorem 5.5 with Lemma 5.6 and Hecke's CM forms."
- The kind and roadmap are unchanged.
- Route 1's brief should import R31.4:definite for Theorem 5.4. Its design job reads this.

### Not done, and why
- **Emerton's paper [33] was not read** (its Lemmas 3.1.16–3.1.17 and B.6); they are named inputs of R31.4:definite. Nor were Berger–Breuil and Carayol; their contents are as Dospinescu–Le Bras cite them.
- **No decomposition or packet** of R31 is edited. The branch's nodes are for the R31 blueprint job.

## Sources read

All on 29 September 2026, with the worker user agent.
- **Gan and Takeda**, *The local Langlands conjecture for GSp(4)*, Ann. of Math. 173 (2011), 1841–1882. https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n3-p12-p.pdf (SHA-256 68cd44f6…). Main Theorem, pp. 1842–1843; §7, pp. 1862–1864.
- **Gee and Taïbi**, *Arthur's multiplicity formula for GSp_4 and restriction to Sp_4*, J. Éc. polytech. Math. 6 (2019), 469–535, doi:10.5802/jep.99 (Crossref). https://jep.centre-mersenne.org/item/10.5802/jep.99.pdf (SHA-256 939a72d8…). Pages 470–472 (the introduction and disclosure), 484–486 (Theorem 2.6.1, Theorem 3.1.1), 509–513 (§7, Theorem 7.4.1).
- **Atobe, Gan, Ichino, Kaletha, Mínguez and Shin**, *Local intertwining relations and co-tempered A-packets of classical groups*, arXiv:2410.13504v3. https://arxiv.org/pdf/2410.13504v3 (SHA-256 7aef4423…). Pages 1, 5 and 14–15 (§§0.1, 0.3, 0.4).
- **Dospinescu and Le Bras**, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*, arXiv:1509.00606v2 (Ann. of Math. 186 (2017)). https://arxiv.org/pdf/1509.00606v2 (SHA-256 bdf8f14f…). Pages 20–22, 25–27 and 69–73.
