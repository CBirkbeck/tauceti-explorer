# Roadmap: p-adic regulators and the local K₃ calculation

This roadmap constructs the local maps that turn p-adic Galois classes and
algebraic K-theory classes into periods. Its two strands meet at the Bloch–Kato
exponential and logarithm. The dilogarithmic strand compares the étale and
syntomic regulators, proves the unramified local K₃ calculation, and exports its
normalization to number fields and curves. The Iwasawa strand passes from
Fontaine's ψ-fixed vectors to Perrin–Riou regulators, interpolation formulas,
Coleman coordinates and their local conditions.

The principal local target is the following: for p > 3 and a finite unramified
étale Q_p-algebra A, the normalized regulator identifies K₃(A; Z_p) with
p² O_A, and root-of-unity classes generate the completed K₃ group. The global
construction retains the distinction between a regulator on rational K₃ and
its Q_p-linear extension. Its injectivity is a proposition to be investigated,
with the special-unit formulas and semilocal compatibility stated separately.
For crystalline representations with nonnegative Hodge–Tate weights and no
trivial quotient, the intrinsic Perrin–Riou map takes values in the analytic
distribution algebra tensored with D_cris. Arbitrary crystalline twists use a
meromorphic target until logarithmic-factor cancellation has been proved.

## Scope and boundaries

The scope is L0–L4 and D.1–D.5. Every node below has its stable identifier,
hypotheses, proof route, supplier references, API and acceptance tests. A
statement marked as a required imported contract needs its named supplier;
an open proof or comparison is recorded beside the consumer. These are plans,
not claims of formalization. The good-reduction curve model comparison is
unresolved, and D.5 still lacks sourced target nodes for specialization in
families and the full semistable symbol formula.

The [upstream link maps](../links/) and the following owner boundaries determine
which constructions this roadmap imports.

| Owner | Imported contract and regulator-specific work here |
| --- | --- |
| [Local fields and ramification](../../../content/tau-ceti/LocalFieldsRamification/README.md), Layers 1–2 | Import the unit filtration, Teichmüller splitting, deep-unit log/exp, unramified extensions and arithmetic Frobenius. D.1 compares their pinned sections and Coleman branch; D.3 uses their finite-product/Witt interface. These are the explicit upstream link-map edges into D.1 and D.3. |
| [Number-field arithmetic](../../../content/tau-ceti/NumberFieldArithmetic/README.md), Layer 5 | Import F ⊗ Q_p ≃ ∏_{v∣p} F_v and its integral version. D.1, D.4 and L1 apply the regulator componentwise. |
| [Profinite cohomology](../../../content/tau-ceti/ProfiniteCohomology/README.md); ArithmeticGaloisDuality R02.1/R02.4 and D7; SelmerIwasawaCohomology L0–L3 | Import continuous cochains, rational and lattice local pairings, Kummer limits, corestriction Iwasawa cohomology, Shapiro and control. L1 constructs the Bloch–Kato conditions and maps; L2 supplies their regulator-specific comparison squares. The normalized local Iwasawa pairing remains a precise request, not an inferred consequence of control. |
| PadicHodgeTheory R06/P7; PhiGammaModulesAndIwasawaCohomology PG.1–PG.6 | Import period rings, filtered period functors, annuli, actual φ/ψ, Herr/ψ complexes, Fontaine equivalence and Wach modules. L0 fixes conventions; L2 applies the cohomological comparison. L3/L4 construct regulators and good-basis consequences. General de Rham N_rig and Nakamura comparisons stay with this supplier direction. |
| PadicMeasuresIwasawaAlgebras; LocallyAnalyticDistributions | Import bounded Iwasawa algebras, Amice/Mellin module equivalences, characters, analytic division, seminorms and determinant theory. The bounded Amice map is distinct from the requested unbounded Mellin map. L3/L4 specialize these tools to regulator growth and image constraints. |
| ColemanIntegration; ColemanPowerSeries; Polylogarithms; K3BlochGroups | Import field polylogarithms, Coleman integration, norm-fixed power series, their raw/normalized Coleman maps, Bloch symbols and de Jeu complexes. D.1 extends the field dilogarithm componentwise, D.2 compares regulators, and L3 compares the actual Tate Kummer map to the fixed Coleman normalization. |
| KTheoryFiniteLocalFields; MotivicEtaleKTheory | Import spectrum-level p-completion, local K-theory ranks and étale realization. Soulé classes must be produced once in an early M.7 prefix before M.8, avoiding a D.2/M.8 dependency cycle. D.3 proves the normalized p²-lattice calculation. |
| CrystallineCohomology; DerivedDeRhamCohomology; AInfCohomology; CohomologyComparisons | Import crystalline/de Rham complexes and comparison foundations. The generic classical integral/open log-syntomic package belongs in an early CohomologyComparisons Part II prefix after CR.5/CR.6, still to be named and planned. The four retained D.2 contract IDs are imports; late CP.4's proper rational B_st theorem does not construct that package. The smooth rigid good-reduction path is independent of it. |
| HabiroNumberFields; EllipticRegulators; ModularIwasawaMainConjectures; AutomorphicGaloisRepresentations | D.4 exports the normalized semilocal K₃ map, D.5 supplies curve regulator comparisons, and L4 exports specified Coleman kernels. Habiro gluing, global signed Selmer groups, global main conjectures and modular geometric comparison inputs remain with those roadmaps. |

L0 is an interface layer and introduces no new period carrier. A proposed merge
into the opening of L1 retains its three stable IDs. It is recorded in the
[assembly handoff](../handoff/ASM-PadicHodgeRegulators.md), along with the other
ownership proposals; this document uses the current layer IDs.

## Conventions and notation

K is a finite extension of Q_p; O_K is its integer ring. E/Q_p is a finite
coefficient extension, O_E its integer ring and varpi a uniformizer. A denotes a
finite étale Q_p-algebra in D.1–D.4; in a generic linear-algebra construction it
may denote a target coefficient algebra, as specified in that node. Arithmetic
Frobenius is primary: σ(ζ)=ζ^p on prime-to-p roots over an unramified Q_p-field.
A source's geometric Frobenius is inverted before comparison.

Hodge–Tate weights use HT(Q_p(1))=+1: h occurs when
Fil^(−h)D_dR differs from Fil^(−h+1)D_dR. Fix compatible roots
ε=(ζ_{p^n}), t=log[ε], and distinguish

| Symbol | Meaning |
| --- | --- |
| v_r=ε^(⊗r) | Chosen representation basis of Q_p(r); changes by a^r under ε↦ε^a. |
| d_r=t^(−r)⊗v_r | Canonical de Rham/crystalline Tate period; unchanged by that root change and φ(d_r)=p^(−r)d_r. |
| e_r in L0, L1 and the D layers | The period d_r. |
| e_r inside L2 modules/cocycles, or in L3/L4's expressions t^(−r)e_r | The representation vector v_r. |
| ∂=(1+π)d/dπ | The period-module differential; ∂' = a^(−1)∂ under ε↦ε^a. It is distinct from a connecting homomorphism ∂^r. |
| G=Δ×Γ₁, γ a generator of Γ₁, X=γ−1 | The cyclotomic Galois group and chosen Iwasawa chart, for odd p. |
| Λ_{O_E}(G), Λ_E(G)=Λ_{O_E}(G)[1/varpi] | Integral and bounded rational Iwasawa algebras. On one character component, Λ_E=O_E[[X]][1/varpi]; coefficients have a uniform denominator bound. |
| H_E(G), Frac(H_E) | The locally analytic distribution algebra and its componentwise total fraction algebra. Mellin is a module equivalence for the group action, not an assertion of ordinary pointwise ring multiplicativity. |
| Tw_η([g])=η(g)^(−1)[g] | The semilinear Iwasawa twist. Specialization at η uses V(η^(−1)); there is no general finite-level map H¹(K,V)→H¹(K,V(r)). |
| ι([g])=[g^(−1)] | Involution in the second variable of the regulator/Iwasawa pairing; σ_{−1} has χ(σ_{−1})=−1. |

The logarithm is Coleman's Iwasawa branch log_p(p)=0. Define
D_p(z)=Li₂(z)+½log_p(z)log_p(1−z), the weight-two modified
dilogarithm, with the stipulated symbol convention at 1. Bernoulli numbers have
B₁=−1/2. K₃(L;Z_p) means π₃ of the p-completed K-theory spectrum;
it is not a rational K-group with an arbitrarily chosen lattice.

For field regulators, reg_syn=η∘c^syn and
r^et=exp_BK∘reg_syn with the normalized edge/boundary map.
The completed K₃ sign is fixed by D_p([ζ])=Li₂(ζ), and Gros's
weight-two operator is (1−σ/p²)D_p. Higher-weight factorial conventions require
their own symbol comparison. The curve identities
regP=Θ∘reg_syn=log_BK∘r^et and regSynCan=(1−φ/q²)regP
remain conditional on the modified-versus-rigid model comparison.

Bloch–Kato's logarithm is the inverse of exp on H¹_e only under its stated
injectivity condition. The finite, exponential and de Rham conditions are
distinct; the dual exponential has target Fil⁰ and kernel H¹_g. Semilocal maps
are componentwise over finitely many fields, with the logarithm hypothesis
imposed at every factor.

Matrix coefficient vectors are rows and basis vectors are columns. If n'=U n
and the target basis changes by B, then c'=c U^(−1) and
M'=U M B^(−1), applying the coefficient homomorphism where necessary.
Principal determinant ideals are compared by association of generators.
Over O_E, a nonzero determinant need not be a unit, and a finite integral
cokernel does not imply surjectivity.

## Sources and layer overview

The dilogarithmic calculation follows Garoufalidis–Scholze–Wheeler–Zagier,
with Besser–de Jeu, Huber–Kings, Tamme and Nekovář–Nizioł supplying regulator
comparisons. The local Iwasawa strand uses Cherbonnier–Colmez, Berger,
Lei–Loeffler–Zerbes and Loeffler–Zerbes; Rodrigues Jacinto supplies the admitted
de Rham character-domain extension, and Rubin the ordinary/multiplicative map.
The bibliography below keeps editions separate because numbering and formulas
change between preprints and published texts. In particular `Berger2003` in
the D.1 packet is the arXiv text, while `Berger2003` in the L3 packet is the
Documenta publication. Source references below identify both the key and part.

The layers are read in prerequisite order within each strand. L0–L2 establish
the finite-level and Iwasawa interfaces; D.1–D.5 develop the K-theory and curve
applications; L3–L4 then develop analytic regulators and their coordinates.
The two strands share L1 and L2, rather than making a crystalline regulator
depend on the K₃ calculation.

| Layer | Export | Planning boundary |
| --- | --- | --- |
| [L0](#layer-l0) | Conventions and the imported period interface | planned; see layer obligations below |
| [L1](#layer-l1) | Bloch–Kato local conditions and maps | planned; see layer obligations below |
| [L2](#layer-l2) | Fontaine’s Iwasawa map and normalization squares | planned; see layer obligations below |
| [D.1](#layer-d-1) | Local and semilocal dilogarithms | planned; see layer obligations below |
| [D.2](#layer-d-2) | Étale, syntomic and polylogarithmic regulator comparisons | planned; see layer obligations below |
| [D.3](#layer-d-3) | The unramified local K₃ calculation | planned; see layer obligations below |
| [D.4](#layer-d-4) | The global p-adic K₃ regulator and Habiro export | planned; see layer obligations below |
| [D.5](#layer-d-5) | Regulators of curves | partial; see layer obligations below |
| [L3](#layer-l3) | Perrin–Riou regulators and explicit reciprocity | planned; see layer obligations below |
| [L4](#layer-l4) | Coleman coordinates, images and the de Rham extension | planned; see layer obligations below |

### Source editions

<a id="source-d-1-gswz2024"></a>
- **`GSWZ2024` (D.1):** Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier, [The Habiro ring of a number field](https://arxiv.org/abs/2412.04241v2). arXiv:2412.04241v2 (27 August 2025); no journal version.
  Relevant passages recorded in the input packets: §1.5: (18)–(22), Definition 1.3, Theorem 1; §3.1: (172)–(183), Lemma 3.1, Propositions 3.2–3.3, Theorem 9 and its proof; §4.4: Example 4.3, (270)–(275); Bibliography entries [6], [7], [8], [11], [30], [46].

<a id="source-d-1-bdj2003"></a>
- **`BdJ2003` (D.1):** Amnon Besser, Rob de Jeu, [The syntomic regulator for the K-theory of fields](https://arxiv.org/abs/math/0110334v2). arXiv:math/0110334v2 (15 December 2001); published Ann. Sci. École Norm. Sup. (4) 36 (2003), 867–924.
  Relevant passages recorded in the input packets: §1 (Theorems 1.6, 1.10, 1.12, Remarks 1.7–1.16, Conjecture 1.14); §2 (Definition 2.1, Remark 2.3, Proposition 2.6, Proposition 2.10); §4 (Definition 4.6, Lemma 4.7, (4.1)–(4.4)); Proposition 7.10 and the proof of Theorem 1.12.

<a id="source-d-1-hk2011"></a>
- **`HK2011` (D.1):** Annette Huber, Guido Kings, [A p-adic analogue of the Borel regulator and the Bloch–Kato exponential map](https://arxiv.org/abs/math/0612611v1). arXiv:math/0612611v1 (20 December 2006); published J. Inst. Math. Jussieu 10 (2011), 149–190.
  Relevant passages recorded in the input packets: §0.4 (Definition 0.4.5, Remark 0.4.6); §1.2–1.3 (Definition 1.2.3, Theorem 1.3.2, Remarks 1.3.1–1.3.3); §2.2–2.5 (Definition 2.2.1, Example 2.2.4, Definition 2.2.5, Propositions 2.2.7, 2.2.9, 2.3.4, Definition 2.3.3, Example 2.5.2).

<a id="source-d-1-tamme2014"></a>
- **`Tamme2014` (D.1):** Georg Tamme, [Karoubi's relative Chern character, the rigid syntomic regulator, and the Bloch–Kato exponential map](https://arxiv.org/abs/1111.4109v4). arXiv:1111.4109v4 (21 July 2014).
  Relevant passages recorded in the input packets: Introduction (main Theorem and Corollary); §5: Theorem 5.15, Corollary 5.19 and proof, Remark 5.20, Corollary 5.21.

<a id="source-d-1-nn2016"></a>
- **`NN2016` (D.1):** Jan Nekovář, Wiesława Nizioł (appendix by Laurent Berger), [Syntomic cohomology and p-adic regulators for varieties over p-adic fields](https://arxiv.org/abs/1309.7620v5). arXiv:1309.7620v5 (22 September 2016).
  Relevant passages recorded in the input packets: Introduction (Theorems A and B, Proposition 1.1); §2.3 (Corollary 2.4, Remarks 2.13–2.14, Proposition 2.16); §3.2 ((32), Proposition 3.8, Remark 3.10, Lemma 3.19); §4.1 (Corollary 4.5, Proposition 4.6, Theorem 4.8, Corollary 4.11, Proposition 4.13, Remark 4.14); §5 (Propositions 5.6–5.7, Remark 5.8, Theorem 5.9); Appendix A (Lemma A.6).

<a id="source-d-1-cn2017"></a>
- **`CN2017` (D.1):** Pierre Colmez, Wiesława Nizioł, [Syntomic complexes and p-adic nearby cycles](https://arxiv.org/abs/1505.06471v4). arXiv:1505.06471v4 (29 May 2016); published Invent. Math. 208 (2017).
  Relevant passages recorded in the input packets: §1 (Theorem 1.1, (1.2)–(1.3), Corollary 1.4); §2.4.3 and Lemma 2.23; §3 (Proposition 3.12, Lemmas 3.14, 3.17, Corollary 3.16, Remark 3.18, Proposition 3.19); §4.7; §5 (5.1.1, Remark 5.1, Corollary 5.2, Theorem 5.4, Lemma 5.9, Corollaries 5.11–5.12).

<a id="source-d-1-berger2003"></a>
- **`Berger2003` (D.1):** Laurent Berger, [Bloch and Kato's exponential map: three explicit formulas](https://arxiv.org/abs/math/0209283v1). arXiv:math/0209283v1 (21 September 2002).
  Relevant passages recorded in the input packets: Introduction; §I.2; §II (Lemma II.1, Theorems II.2, II.6, II.10, II.14, Proposition II.5, Remarks II.13, II.15).

<a id="source-d-1-berger2003dm"></a>
<a id="source-l3-berger2003"></a>
- **`Berger2003DM` (D.1), `Berger2003` (L3):** Laurent Berger, [Bloch and Kato's exponential map: three explicit formulas](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf). Documenta Mathematica, Extra Volume Kato (2003), 99–129.
  Relevant passages recorded in the input packets: Proposition I.8, Lemma I.9 (pp. 110–111); Propositions II.6–II.8, Theorem II.10 (pp. 116–119); Appendix A (A.1–A.8, pp. 124–126); SectionII.4 TheoremII.10 and RemarkII.11; SectionII.5 obstruction sequence and DefinitionII.12/TheoremII.13/RemarksII.14-II.15; SectionII.6 TheoremII.16 and sign warningII.17. Cited upstream comparison proofs are supplier obligations, not silently treated as read..

<a id="source-d-1-cc99"></a>
- **`CC99` (D.1):** Frédéric Cherbonnier, Pierre Colmez, [Théorie d'Iwasawa des représentations p-adiques d'un corps local](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf). J. Amer. Math. Soc. 12 (1999), 241–268; author's recompiled PDF (28 pp.), page numbers of that PDF.
  Relevant passages recorded in the input packets: §I.4–I.5 (Proposition I.4.1, Lemme I.4.2, Remarque I.5.4); §II (Propositions II.1.2, II.3.1, Théorème II.1.3, Lemme II.2.1, Remarque II.3.2); §IV.2 (proof of Théorème IV.2.1); §V.2–V.3 (Propositions V.2.1, V.2.4, V.3.2).

<a id="source-d-1-limites2004"></a>
- **`Limites2004` (D.1):** Laurent Berger, [Limites de représentations cristallines](https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf). Compos. Math. 140 (2004) 1473–1498; author PDF.
  Relevant passages recorded in the input packets: Propositions II.1.1, II.2.1, Lemma II.1.3; Propositions III.4.2, Theorem III.4.4, Corollary III.4.5.

<a id="source-d-1-llzwach"></a>
- **`LLZWach` (D.1):** Antonio Lei, David Loeffler, Sarah Livia Zerbes, [Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3). arXiv:0912.1263v3 (18 October 2010); published Asian J. Math. 14 (2010).
  Relevant passages recorded in the input packets: §1 (p. 4); §2.1–2.3; §3.1 and Lemma 3.21.

<a id="source-d-1-lz2014"></a>
<a id="source-l3-lz2014"></a>
- **`LZ2014` (D.1), `LZ2014` (L3):** David Loeffler, Sarah Livia Zerbes, [Iwasawa theory and p-adic L-functions over Z_p^2-extensions](https://arxiv.org/pdf/1108.5954v3). arXiv:1108.5954v3 (22 April 2014); accepted version of Int. J. Number Theory 10(8) (2014) / arXiv:1108.5954v3, 22 April 2014; accepted version of International Journal of Number Theory 10(8) (2014), 2045–2095.
  Relevant passages recorded in the input packets: §2 (Lemma 2.4, Theorems 2.5–2.6); §4 (Definition 4.14, Remark 4.16); §6.4.2; Appendix B (Definition B.3, Lemma B.4); Cyclotomic specialization of Proposition4.8; Section4.4 equation(10), Remark4.16; Section6.4.2 Tate Kummer/Coleman diagram; AppendixB completely, PropositionsB.1-B.2, LemmaB.4, TheoremsB.5-B.6 including proofs; AppendixC distribution-order conventions. No planning of the two-variable extension here..

<a id="source-d-1-fo"></a>
- **`FO` (D.1):** Jean-Marc Fontaine, Yi Ouyang, [Theory of p-adic Galois representations](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf). book draft (author PDF).
  Relevant passages recorded in the input packets: §6.3 (Propositions 6.35–6.36, Remark 6.37); §7.1–7.4 (Theorems 7.26, 7.28, Remark 7.29); §9.1 (Definition 9.4, Lemma 9.5); §9.3 (Definitions 9.22–9.23, (9.11)–(9.17), Proposition 9.26, Theorem 9.27, Corollary 9.30).

<a id="source-d-1-rubin2000"></a>
<a id="source-l3-rubines"></a>
- **`Rubin2000` (D.1), `RubinES` (L3):** Karl Rubin, [Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf). Annals of Mathematics Studies 147 (2000); author PDF of 4 August 1999 / Public draft of Euler Systems, Annals of Mathematics Studies 147 (2000); supplied URL, rather than the issue’s Kolyvagin1990 bibliographic label.
  Relevant passages recorded in the input packets: Chapter I §§1–4, 6–7 (Definitions I.1.3, I.3.1, I.3.4, Lemma I.3.2, Remark I.3.6, Theorem I.4.1, Propositions I.4.2–I.4.3, §I.6 (6), (7), (9), Remark I.7.1); Chapter II §2; Chapter III §5.2; Appendix B (Proposition 4.2, Corollaries 5.2–5.3); ChapterIII Section5.8: local finite/singular modules, cyclotomic notation, Proposition5.14 and adjacent discussion of construction in Rubin1998 appendix.; ChapterIII Section5.1, pp.47-48: exp*_omega is the dual differential coordinate; rescaling omega rescales this coordinate inversely..

<a id="source-d-1-hk2"></a>
- **`HK2` (D.1):** Annette Huber, Guido Kings, [Bloch–Kato conjecture and main conjecture of Iwasawa theory for Dirichlet characters](https://arxiv.org/abs/math/0101071v2). arXiv:math/0101071v2; published Duke Math. J. 119 (2003).
  Relevant passages recorded in the input packets: §1.1; Appendix A (Lemma A.1, Proposition A.3, Corollary A.5); Appendix B (proof of Lemma B.3.1).

<a id="source-d-1-bnqd2002"></a>
- **`BNQD2002` (D.1):** Denis Benois, Thong Nguyen Quang Do, [Les nombres de Tamagawa locaux et la conjecture de Bloch et Kato pour les motifs Q(m) sur un corps abélien](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf). Ann. Sci. École Norm. Sup. (4) 35 (2002), 641–672 (numdam).
  Relevant passages recorded in the input packets: §1.3 (Lemme 1.3.2 and proof); Théorème 2.1 and Remarque; §2.2 (Proposition 2.2.4, Lemme 2.2.2); §2.3.2 diagram.

<a id="source-d-1-fontainebpr1994"></a>
- **`FontaineBPR1994` (D.1):** Jean-Marc Fontaine, [Appendice: Sur un théorème de Bloch et Kato (lettre à B. Perrin-Riou)](https://www.imo.universite-paris-saclay.fr/~fontaine/bpr.pdf). Invent. Math. 115 (1994), 151–161; author PDF.
  Relevant passages recorded in the input packets: §2.1 (p. 153); §4.1 (p. 158).

<a id="source-d-1-benois2014"></a>
- **`Benois2014` (D.1):** Denis Benois, [p-adic heights and p-adic Hodge theory](https://arxiv.org/abs/1412.7305v1). arXiv:1412.7305v1.
  Relevant passages recorded in the input packets: §2.2–2.3 (Theorem 2.3.3); §2.8 (Proposition 2.8.2).

<a id="source-d-1-am18"></a>
- **`AM18` (D.1):** Masanori Asakura, Kei Miyatani, [F-isocrystal and syntomic regulators via hypergeometric functions](https://arxiv.org/abs/1711.08854v2). arXiv:1711.08854v2.
  Relevant passages recorded in the input packets: §6 (Proposition 6.4); §9 (Theorem 9.1 and the surrounding definitions, pp. 44–45).

<a id="source-d-1-ac20"></a>
- **`AC20` (D.1):** Masanori Asakura, Masataka Chida (Appendix B by François Brunault), [A numerical approach toward the p-adic Beilinson conjecture for elliptic curves over Q](https://arxiv.org/pdf/2003.08888v2). arXiv:2003.08888v2 (8 September 2020).
  Relevant passages recorded in the input packets: §3.2 (p. 12) and Remark 3.2; Footnote 4 (p. 43).

<a id="source-d-1-bdj2012"></a>
- **`BdJ2012` (D.1):** Amnon Besser, Rob de Jeu, [The syntomic regulator for K4 of curves](https://arxiv.org/pdf/1208.0516v1). arXiv:1208.0516v1 (2 August 2012).
  Relevant passages recorded in the input packets: §1 (pp. 1–4, Remark 1.10); §5 ((5.1)–(5.2), (5.7), Definition 5.8); (9.13).

<a id="source-d-1-ara2003"></a>
- **`Ara2003` (D.1):** Amnon Besser, [p-adic Arakelov theory](https://arxiv.org/abs/math/0301029v1). arXiv:math/0301029v1; published J. Number Theory 111 (2005).
  Relevant passages recorded in the input packets: §3 (Definition 3.1, Lemmas 3.3, 3.6, 3.7).

<a id="source-d-1-bz2017"></a>
- **`BZ2017` (D.1):** Amnon Besser, Sarah Livia Zerbes, [Vologodsky integration on curves with semi-stable reduction](https://arxiv.org/abs/1711.06950v1). arXiv:1711.06950v1 (19 November 2017).
  Relevant passages recorded in the input packets: §1 (Theorem 1.1); §3.

<a id="source-d-1-taucetiteichmuller"></a>
- **`TauCetiTeichmuller` (D.1):** The Tau Ceti contributors, [TauCeti/NumberTheory/LocalField/Teichmuller.lean](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369). Tau Ceti commit f790474821cf4256814db967cb154e7af3d0c369.
  Relevant passages recorded in the input packets: Module docstring; teichmuller, residue_teichmuller, eq_teichmuller, range_teichmuller.

<a id="source-d-1-besser2000"></a>
- **`Besser2000` (D.1):** Amnon Besser, [Syntomic regulators and p-adic integration I: rigid syntomic regulators](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz). Public author PostScript; Israel J. Math. 120 (2000), 291–334.
  Relevant passages recorded in the input packets: §6: syntomic fibre product; §8: Proposition 8.6(2),(3), Remark 8.7(3), Proposition 8.8; §9: Propositions 9.9,9.11 and Corollary 9.10; §10: Proposition 10.1(3) and Proposition 10.3.

<a id="source-l3-llz2011"></a>
- **`LLZ2011` (L3):** Antonio Lei, David Loeffler, Sarah Livia Zerbes, [Coleman maps and the p-adic regulator](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf). Algebra & Number Theory 5(8) (2011), 1095–1131; version of record.
  Relevant passages recorded in the input packets: Sections1C3-1C6; Proposition1.6; Corollary1.12; Sections2A-2C including proofs2.4-2.11; Section3A; Sections4A-4C and5A-5C including the image, specialization and integral proofs..

<a id="source-l3-llz2010v2"></a>
- **`LLZ2010v2` (L3):** Antonio Lei, David Loeffler, Sarah Livia Zerbes, [Coleman maps and the p-adic regulator](https://arxiv.org/pdf/1006.5163v2). arXiv:1006.5163v2, 17 October 2010.
  Relevant passages recorded in the input packets: Compared Proposition5.9 and Proposition5.11/Remark5.12 with the version of record; the maximal-ideal repair is explicit in Remark5.12..

<a id="source-l3-llzwach2010"></a>
- **`LLZWach2010` (L3):** Antonio Lei, David Loeffler, Sarah Livia Zerbes, [Wach modules and Iwasawa theory for modular forms](https://antoniolei.com/wp-content/uploads/2014/09/modularforms.pdf). Author accepted manuscript; published Asian Journal of Mathematics 14(4) (2010), 475–528.
  Relevant passages recorded in the input packets: Theorem3.5 and complete Lemmas3.6-3.10/Proposition3.11 proof chain; Lemma3.15 basis transport; Proposition4.11 and preceding convergence argument, with (C),(D) scope retained..

<a id="source-l3-rj2018"></a>
- **`RJ2018` (L3):** Joaquín Rodrigues Jacinto, [(phi,Gamma)-modules de de Rham et fonctions L p-adiques](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf). Algebra & Number Theory 12(4) (2018), 885–934; version of record.
  Relevant passages recorded in the input packets: Sections0E3,IA TheoremI.1; IB3 PropositionI.3 and IB10 PropositionI.9/TheoremI.10; IC2 PropositionI.13; IC3 Gauss bases; IC4 equation(3); IC5-IC6 TheoremI.15/LemmaI.17 and annulus estimates; IC7-IC8 PropositionsI.22-I.26/TheoremI.27; IC9 PropositionI.28/CorollaryI.29 and crystalline discussion. Nakamura’s underlying comparison proof is an explicit unread dependency..

### Pinned library baseline

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The [reviewed library audit](../../../data/library-coverage.json) supplies the layer baseline; the declaration statements at these commits determine what can be reused. The algebraic suggested file uses the existing polynomial, finite-field, matrix, basis, submodule and tensor carriers. The pinned finite Kummer map does not supply a continuous p-adic identification; `IsArithFrobAt` is a congruence predicate rather than an existence theorem; Witt Frobenius does not identify an unramified integer ring by itself. Actual period, Wach, continuous Iwasawa and syntomic carriers remain supplier work.

| Declaration | Module at the pin | Reused statement |
| --- | --- | --- |
| `mathlib:Algebra.norm` | `Mathlib/RingTheory/Norm/Defs.lean` | The norm S →* R of an R-algebra as the determinant of multiplication. |
| `mathlib:Algebra.trace` | `Mathlib/RingTheory/Trace/Defs.lean` | The trace S →ₗ[R] R of an R-algebra as the trace of multiplication. |
| `mathlib:FreeAbelianGroup` | `Mathlib/GroupTheory/FreeAbelianGroup.lean` | The free abelian group on a type, the group of formal symbols [z]. |
| `mathlib:IsArithFrobAt` | `Mathlib/RingTheory/Frobenius.lean` | Predicate stating the arithmetic residue congruence at an ideal; it does not construct the unramified Frobenius automorphism (imported upstream). |
| `mathlib:Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean` | The predicate that a module is free. |
| `mathlib:OrzechProperty` | `Mathlib/RingTheory/OrzechProperty.lean` | Commutative rings have the Orzech property: a surjection onto a finitely generated module from a submodule (or through an injection) is injective; used for 'surjective between free modules of equal rank implies injective'. |
| `mathlib:PadicComplex` | `Mathlib/NumberTheory/Padics/Complex.lean` | ℂ_[p], the completion of the algebraic closure of ℚ_[p]. |
| `mathlib:Polynomial` | `Mathlib/Algebra/Polynomial/Basic.lean` | Polynomial rings, the carrier of the finite polylogarithm. |
| `mathlib:Submodule.span` | `Mathlib/LinearAlgebra/Span/Defs.lean` | The span of a set in a module. |
| `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot` | `Mathlib/RingTheory/Nakayama.lean` | Nakayama's lemma: for N' finitely generated and I ≤ jacobson ⊥, N' ≤ N ⊔ I•N' implies N' ≤ N; used to lift spanning modulo p. |
| `mathlib:WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean` | p-typical Witt vectors W(R). |
| `mathlib:WittVector.frobenius` | `Mathlib/RingTheory/WittVector/Frobenius.lean` | Witt-vector Frobenius ring homomorphism; the unramified integer-ring classification and equality with arithmetic Frobenius are imported upstream, not supplied by this declaration alone. |
| `mathlib:ZMod` | `Mathlib/Data/ZMod/Defs.lean` | ℤ/nℤ, in particular 𝔽_p. |
| `mathlib:bernoulli` | `Mathlib/NumberTheory/Bernoulli.lean` | Bernoulli numbers with B_1 = −1/2 (bernoulli n = (−1)^n bernoulli' n). |
| `tauceti:TauCeti.teichmuller` | `TauCeti/NumberTheory/LocalField/Teichmuller.lean` | The Teichmüller lift 𝓀[K]ˣ →* 𝒪[K]ˣ of a nonarchimedean local field. |
| `tauceti:TauCeti.residue_teichmuller` | `TauCeti/NumberTheory/LocalField/Teichmuller.lean` | The Teichmüller lift is a section of reduction. |
| `tauceti:TauCeti.eq_teichmuller` | `TauCeti/NumberTheory/LocalField/Teichmuller.lean` | A (q−1)-torsion unit reducing to α is the Teichmüller lift of α. |
| `tauceti:TauCeti.range_teichmuller` | `TauCeti/NumberTheory/LocalField/Teichmuller.lean` | The image of the Teichmüller lift is μ_{q−1}(𝒪[K]). |
| `tauceti:TauCeti.kummerClassMap` | `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean` | Finite-coefficient injective Kummer class map Kˣ/(Kˣ)^n→H¹(G_K,μ_n); the continuous p-adic identification and inverse-limit compatibility are supplied by SelmerIwasawaCohomology L0. |
| `mathlib:IsLocalRing.isUnit_one_sub_self_of_mem_nonunits` | `Mathlib.RingTheory.LocalRing.Basic` | For a nonunit a in a local ring, 1-a is a unit. |
| `mathlib:IsLocalRing.maximalIdeal` | `Mathlib.RingTheory.LocalRing.MaximalIdeal.Defs` | Existing maximal ideal as the ideal of nonunits. |
| `mathlib:Module.Basis` | `Mathlib.LinearAlgebra.Basis.Defs` | Existing algebraic basis carrier and coordinate equivalence; no new generic basis type. |
| `mathlib:Module.Basis.extend` | `Mathlib.LinearAlgebra.Basis.VectorSpace` | Extend a linearly independent subset of an E-vector space to a basis. |
| `mathlib:Module.Basis.constr_apply_fintype` | `Mathlib.LinearAlgebra.Basis.Defs` | A linear map is the finite sum of input coordinates times its values on basis vectors. |
| `mathlib:Lagrange.interpolate` | `Mathlib.LinearAlgebra.Lagrange` | Existing polynomial interpolation operator. |
| `mathlib:Lagrange.eval_interpolate_at_node` | `Mathlib.LinearAlgebra.Lagrange` | Interpolation evaluates to the prescribed value when the nodal map is injective on the finite index set. |
| `mathlib:Matrix.det_mul` | `Mathlib.LinearAlgebra.Matrix.Determinant.Basic` | Multiplicativity of finite matrix determinants over a commutative ring. |
| `mathlib:Matrix.vecMulBilin` | `Mathlib.LinearAlgebra.Matrix.ToLin` | Bilinear row-vector matrix multiplication with the stated scalar compatibility. |
| `mathlib:TensorProduct.map` | `Mathlib.LinearAlgebra.TensorProduct.Map` | Tensor product of semilinear maps; maps pure tensors to their respective image tensors. |
| `mathlib:TensorProduct.rid` | `Mathlib.LinearAlgebra.TensorProduct.Associator` | Existing right-unitor linear equivalence H tensor_E E ~= H, sending h tensor e to e smul h. |
| `mathlib:LinearMap.ker` | `Mathlib.Algebra.Module.Submodule.Ker` | Existing submodule kernel, defined as comap f bottom; membership iff f x=0. |

<a id="layer-l0"></a>
## L0: Conventions and the imported period interface

Fix the Hodge–Tate and Tate-basis conventions before constructing any boundary map. The three fundamental exact sequences have different middle terms and boundary signs. The integral small-weight interface is imported separately: a rational period ring does not determine an integral lattice.

<a id="padichodgeregulators-l0-hodge-tate-and-twist-conventions"></a>
### Hodge–Tate, twist and period conventions for the regulator

`PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions` · comparison

Throughout PadicHodgeRegulators: (i) t = log[ε] ∈ B_dR^+ is the period of Z_p(1) for a fixed compatible system ε = (ζ_{p^n}) of p-power roots of unity; Fil^i B_dR = t^i B_dR^+, g(t) = χ(g)t for the cyclotomic character χ, and φ(t) = pt in B_cris (arithmetic Frobenius). (ii) Hodge–Tate weights: h is a weight of V when Fil^{−h}D_dR(V) ≠ Fil^{−h+1}D_dR(V); with this convention Q_p(1) has weight +1 and V_pA of an abelian variety has weights 0 and 1, matching the L3–L4 packet, PadicHodgeTheory R06.4 and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3 (HT(χ) = +1). (iii) For r ∈ Z, e_r := t^{−r} ⊗ ε^{⊗r} is a basis of D_cris(Q_p(r)) = K_0·e_r and of D_dR(Q_p(r)) = K·e_r, independent of ε, with φ(e_r) = p^{−r}e_r, Fil^{−r} = D_dR and Fil^{−r+1} = 0; hence D_dR(Q_p(r))/Fil^0 = K·e_r for r ≥ 1 and 0 for r ≤ 0. (iv) Twisting: D_cris(V(i)) = D_cris(V)⟨i⟩ via d ↦ d ⊗ e_i, with Fil^j(D⟨i⟩) = Fil^{j+i}D and φ|_{D⟨i⟩} = p^{−i}φ|_D. (v) Crystalline representations have N = 0; the monodromy operator is used only for semistable inputs (D.5's boundary). Sources using the opposite weight sign (Benois: Q_p(1) of weight −1) are translated, never mixed.

**Hypotheses.** K/Q_p finite with maximal unramified subfield K_0; V a p-adic representation of G_K.

**Prerequisites.** `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`; `PadicHodgeTheory:R06.1/fontaine-element-t`; `PadicHodgeTheory:R06.1/bdr-filtration-and-graded`; `PadicHodgeTheory:R06.1/frobenius-on-acris`; `PadicHodgeTheory:R06.2/ddr-of-tate-twists`; `PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`.

**Proof route.**

1. (i)–(iii) are properties of the imported period rings and functors (PadicHodgeTheory R06.1/fontaine-element-t, R06.1/bdr-filtration-and-graded, R06.2/ddr-of-tate-twists and R06.2/hodge-tate-weight-convention); this node pins how the regulator layers read them; e_r is G_K-invariant because g acts on t^{−r} by χ(g)^{−r} and on ε^{⊗r} by χ(g)^r.
2. (iv) is Fontaine–Ouyang Definition 9.4 and Lemma 9.5.
3. The weight convention is fixed by comparing with Berger §I.2 and Lei–Loeffler–Zerbes §2.1.

**Acceptance requirements.** D_dR(Q_p(2)) = K·e_2 with φ(e_2) = p^{−2}e_2 and D_dR(Q_p(2))/Fil^0 = K: the target of the weight-two regulator. D_dR(Q_p)/Fil^0 = 0 and D_dR(Q_p(−1))/Fil^0 = 0. A source stating 'Q_p(1) has Hodge–Tate weight −1' is translated by h ↦ −h before use.

**Sources.**

- [FO (D.1)](#source-d-1-fo), Definition 9.4 and Lemma 9.5, pp. 218–219. The twist convention (iv).
- [Berger2003 (D.1)](#source-d-1-berger2003), §I.2, p. 6. The sign convention, with Q_p(1) of weight +1 in the conventions used here.
- [BNQD2002 (D.1)](#source-d-1-bnqd2002), §1.3, p. 646. The canonical basis e_r of (iii).

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-l0-fundamental-exact-sequences"></a>
### The fundamental exact sequences used by the Bloch–Kato maps

`PadicHodgeRegulators:L0/fundamental-exact-sequences` · comparison

From PadicHodgeTheory R06.1 (its nodes fundamental-exact-sequence, bcris-twisted-frobenius-sequences and divided-frobenius-exact-sequence), with the conventions of L0/hodge-tate-and-twist-conventions: (a) with B_e := B_cris^{φ=1}, the sequences 0 → Q_p → B_e → B_dR/B_dR^+ → 0 and 0 → Q_p → B_e ⊕ B_dR^+ → B_dR → 0 are exact; (b) 0 → Q_p → B_cris --(φ − 1, mod Fil^0)--> B_cris ⊕ B_dR/B_dR^+ → 0 is exact; (c) for every r ∈ Z, 0 → Q_p(r) → Fil^r B_cris --(p^{−r}φ − 1)--> B_cris → 0 is exact (Fontaine); (d) integrally, 0 → Z_p(r)' → Fil^r A_cr --(p^r − φ)--> A_cr has cokernel killed by p^r, with Z_p(r)' = p^{−a(r)}Z_p(r) for r = (p − 1)a(r) + b(r). Tensoring (a)–(c) with any p-adic representation V gives exact sequences of G_K-modules; for de Rham V, H^0(K, (B_dR/B_dR^+) ⊗ V) = D_dR(V)/Fil^0 and H^0(K, B_e ⊗ V) = D_cris(V)^{φ=1}.

**Hypotheses.** K/Q_p finite; V any p-adic representation for exactness, de Rham for the identification of invariants.

**Prerequisites.** `PadicHodgeTheory:R06.1/fundamental-exact-sequence`; `PadicHodgeTheory:R06.1/bcris-twisted-frobenius-sequences`; `PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence`; `PadicHodgeTheory:R06.1/period-ring-invariants`; `PadicHodgeTheory:R06.2/period-functors`; [`PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`](#padichodgeregulators-l0-hodge-tate-and-twist-conventions).

**Proof route.**

1. (a) is PadicHodgeTheory:R06.1/fundamental-exact-sequence (Fontaine–Ouyang Theorem 7.28(4) and Remark 7.29); the second form follows by adding B_dR^+.
2. (b) is Fontaine–Ouyang (9.12), obtained from (a); (c) is PadicHodgeTheory:R06.1/bcris-twisted-frobenius-sequences; (d) is PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence (Colmez–Nizioł §2.4.3, Lemma 2.23).
3. Tensoring over Q_p with V is exact; invariants are computed by the period functors of R06.2.

**Acceptance requirements.** For V = Q_p(r), r ≥ 1: H^0(K, B_e(r)) = D_cris(Q_p(r))^{φ=1} = 0, so the connecting map of (a) ⊗ V is injective on D_dR/Fil^0. For V = Q_p: H^0(K, B_e) = K_0^{φ=1} = Q_p and D_dR(Q_p)/Fil^0 = 0.

**Sources.**

- [FO (D.1)](#source-d-1-fo), Theorem 7.28(4), p. 170. (a), second form.
- [FO (D.1)](#source-d-1-fo), Remark 7.29, p. 171. (a), first form.
- [CN2017 (D.1)](#source-d-1-cn2017), §2.4.3, p. 23. (d), with t^{r} = t^{b(r)}(t^{p−1}/p)^{a(r)} spanning Z_p(r)'.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-l0-integral-period-interface"></a>
### Integral comparison interface for small weights

`PadicHodgeRegulators:L0/integral-period-interface` · comparison

For K/Q_p finite unramified and a crystalline G_K-stable Z_p-lattice T with Hodge–Tate weights in [0, p − 2] (HT(χ) = +1), the Fontaine–Laffaille correspondence T ↔ M (strongly divisible W(k)-lattice in D_cris(V^∨)) of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3 is imported with its normalisation; for T = Z_p(r), 0 ≤ r ≤ p − 2, the lattice is W(k)·e_{−r} in D_cris(Q_p(−r)). The integral Bloch–Kato statement of L1/integral-logarithm-unramified and the integral period map of D.2/fontaine-messing-kato-period-map are formulated against these lattices and the integral sequence L0/fundamental-exact-sequences (d); no further integral period carrier is introduced here.

**Hypotheses.** K unramified over Q_p; weights in [0, p − 2]; p odd.

**Prerequisites.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/strongly-divisible-lattices`; `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`; `PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary`; [`PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`](#padichodgeregulators-l0-hodge-tate-and-twist-conventions).

**Proof route.**

1. The lattice correspondence is FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence; its small-weight interface (indices translated to HT(χ) = +1) is PadicHodgeTheory R06.4.
2. For a rank-one Tate twist the strongly divisible lattice is W(k)·e_{−r}: p^{−i}Φ(M ∩ Fil^i) = M holds because Φ(e_{−r}) = p^r e_{−r} and Fil^r ∩ M = M.

**Acceptance requirements.** T = Z_p(2) with p ≥ 5 lies in the Fontaine–Laffaille range [0, p − 2]. T = Z_p(p − 1) is outside the range; the integral statements of L1 are not asserted there.

**Sources.**

- [BNQD2002 (D.1)](#source-d-1-bnqd2002), §1.3, p. 647. The integral lattice O_K·e_m in D_dR(Q_p(m)) against which the integral statements are measured.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

### Completion obligations for L0

- Restructure proposal: merge into L1 (audit verdict 'process').

<a id="layer-l1"></a>
## L1: Bloch–Kato local conditions and maps

Construct H¹_e, H¹_f and H¹_g as distinct kernels, then construct the exponential as a connecting map and its logarithmic inverse on the admitted domain. The dual exponential uses the de Rham logarithmic cocycle and local Tate pairing. Propagated lattice/quotient conditions, traces, Shapiro and Tate tests pin the interface. The unramified small-weight lattice is an exact sublattice computation, not just an index formula. The general de Rham duality descent remains an explicit gap.

**Atlas landmarks:** Bloch–Kato local conditions; Bloch–Kato exponential; Kato's dual exponential; Integral Bloch–Kato logarithm.

<a id="padichodgeregulators-l1-bloch-kato-subgroups"></a>
### The Bloch–Kato local conditions H¹_e, H¹_f, H¹_g

`PadicHodgeRegulators:L1/bloch-kato-subgroups` · definition · `blochKatoF`

Let K/Q_p be finite and V a p-adic representation of G_K. Define H^1_e(K, V) := ker(H^1(K, V) → H^1(K, B_e ⊗ V)), H^1_f(K, V) := ker(H^1(K, V) → H^1(K, B_cris ⊗ V)) and H^1_g(K, V) := ker(H^1(K, V) → H^1(K, B_dR ⊗ V)), so H^1_e ⊆ H^1_f ⊆ H^1_g. For a G_K-stable Z_p-lattice T ⊂ V and W = V/T, H^1_f(K, T) is the preimage of H^1_f(K, V) and H^1_f(K, W) the image of H^1_f(K, V); these are the finite local conditions. For ℓ ≠ p (K/Q_ℓ finite) H^1_f := H^1_ur. The singular quotient is H^1_s := H^1/H^1_f.

**Hypotheses.** K/Q_p finite (or K/Q_ℓ finite with ℓ ≠ p for the unramified condition); V finite-dimensional continuous.

**Prerequisites.** [`PadicHodgeRegulators:L0/fundamental-exact-sequences`](#padichodgeregulators-l0-fundamental-exact-sequences); `PadicHodgeTheory:R06.1/crystalline-period-ring`; `PadicHodgeTheory:R06.1/de-rham-period-ring`; `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`; `ArithmeticGaloisDuality:R02.1/rationalization`; `SelmerIwasawaCohomology:L0/padic-kummer-identification`.

**Proof route.**

1. The maps are induced by V → B_* ⊗ V on continuous cohomology (ArithmeticGaloisDuality R02.1).
2. The inclusions follow from B_e ⊂ B_cris ⊂ B_dR.
3. The integral conditions are the propagated conditions of Rubin, Euler Systems, Definition I.3.4 and Remark I.3.6.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `blochKatoE` | data | blochKatoE K V : Submodule ℚ_p (H^1(K, V)). |
| `blochKatoF` | data | blochKatoF K V : Submodule ℚ_p (H^1(K, V)). |
| `blochKatoG` | data | blochKatoG K V : Submodule ℚ_p (H^1(K, V)). |
| `blochKatoE_le_F` | relation | blochKatoE K V ≤ blochKatoF K V ≤ blochKatoG K V. |
| `blochKatoF_lattice` | constructor | blochKatoF K T := preimage under H^1(K, T) → H^1(K, V); blochKatoF K (V/T) := image. |
| `blochKatoF_map` | functoriality | For a G_K-map V → V', H^1(K, V) → H^1(K, V') maps blochKatoF into blochKatoF (same for e, g). |
| `blochKatoF_res` | functoriality | For L/K finite, restriction maps blochKatoF K V into blochKatoF L V and corestriction maps back. |
| `blochKatoF_unramified` | compatibility | For ℓ ≠ p, blochKatoF := H^1_ur. |
| `blochKatoE_extensionality` | extensionality | Two Bloch–Kato submodules agree iff their membership predicates agree on every class, by Submodule.ext. Each inherits the ambient Q_p-module operations; membership is stable under zero, addition and scalar multiplication. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `blochKatoF_trivial` | computation | For V = Q_p and K = Q_p, blochKatoF = H^1_ur(Q_p, Q_p) = Hom(Gal(Q_p^ur/Q_p), Q_p), of dimension 1, while H^1(Q_p, Q_p) has dimension 2. |
| `blochKatoF_negative_twist` | degenerate | For V = Q_p(−1), H^1_e = H^1_f = H^1_g = 0 although H^1(K, Q_p(−1)) has dimension [K : Q_p]. |
| `blochKatoF_rubin_compat` | compatibility | For V = Q_p(1), blochKatoF agrees with Rubin's U_{L,v} ⊗ Φ condition (Euler Systems, §I.6.3, (7)) and with the Kummer image of the completed units. |
| `blochKatoG_not_all` | non-example | For V = Q_p, H^1_g(K, Q_p) = H^1_f(K, Q_p) ≠ H^1(K, Q_p): the de Rham condition is a proper subspace (the ramified homomorphisms are excluded). |

**Acceptance requirements.** V = Q_p: H^1_f = H^1_ur (dimension 1) while dim H^1 = [K : Q_p] + 1. V = Q_p(1): H^1_f is the image of (O_K^×)^∧ ⊗ Q_p under the Kummer map, of dimension [K : Q_p].

**Uses.** SelmerIwasawaCohomology:L4/bloch-kato-condition: H^1_f(F_v, V) = ker(H^1 → H^1(B_cris ⊗ V)) and its integral propagation (RJW Definition 13.19(2)) GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class: loc_v κ(P) ∈ H^1_f = H^1_e for abelian varieties with good reduction HeegnerPointEulerSystems:HE.3: Kummer classes and exact Selmer conditions GeneralizedHeegnerCycles:GH.2: ring-class trace and local conditions PadicHodgeRegulators:L3/ramified-interpolation: the finite-part class for which the Bloch–Kato logarithm is used

**Sources.**

- [FO (D.1)](#source-d-1-fo), Definition 9.22, (9.8), p. 232. The definitions, with (9.7) and (9.10) for e and g.
- [Rubin2000 (D.1)](#source-d-1-rubin2000), Remark I.3.6, p. 7. The finite condition at p and its integral propagation (Definition I.3.4).

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-l1-bloch-kato-exponential"></a>
### The Bloch–Kato exponential

`PadicHodgeRegulators:L1/bloch-kato-exponential` · construction · `blochKatoExp`

For K/Q_p finite and V a de Rham representation, exp_{K,V} : D_dR(V)/Fil^0 D_dR(V) → H^1(K, V) is the connecting homomorphism of 0 → V → B_e ⊗ V → (B_dR/B_dR^+) ⊗ V → 0 (L0/fundamental-exact-sequences (a) ⊗ V). There are exact sequences 0 → H^0(K, V) → D_cris(V)^{φ=1} → D_dR(V)/Fil^0 → H^1_e(K, V) → 0 and 0 → H^0(K, V) → D_cris(V) → D_cris(V) ⊕ D_dR(V)/Fil^0 → H^1_f(K, V) → 0 (the first map x ↦ (φx − x, x̄)); in particular im(exp_{K,V}) = H^1_e(K, V) and ker(exp_{K,V}) is the image of D_cris(V)^{φ=1}. Explicitly, exp(x) is the class of g ↦ (g − 1)b for any b ∈ B_e ⊗ V with b − x ∈ B_dR^+ ⊗ V.

**Hypotheses.** K/Q_p finite; V de Rham (for the identification of the source with D_dR(V)/Fil^0).

**Prerequisites.** [`PadicHodgeRegulators:L0/fundamental-exact-sequences`](#padichodgeregulators-l0-fundamental-exact-sequences); [`PadicHodgeRegulators:L1/bloch-kato-subgroups`](#padichodgeregulators-l1-bloch-kato-subgroups); `PadicHodgeTheory:R06.2/period-functors`; `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`.

**Proof route.**

1. Take the long exact cohomology sequence of the tensored fundamental sequence; H^0(K, B_e ⊗ V) = D_cris(V)^{φ=1} and H^0(K, (B_dR/B_dR^+) ⊗ V) = D_dR(V)/Fil^0 for de Rham V.
2. The H^1_f sequence uses L0/fundamental-exact-sequences (b) ⊗ V.
3. The cocycle description is the definition of the connecting map.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `blochKatoExp` | data | blochKatoExp K V : D_dR(V) ⧸ Fil^0 →ₗ[ℚ_p] H^1(K, V). |
| `blochKatoExp_range` | characterisation | LinearMap.range (blochKatoExp K V) = blochKatoE K V. |
| `blochKatoExp_ker` | characterisation | ker (blochKatoExp K V) = image of D_cris(V)^{φ=1} in D_dR(V)/Fil^0. |
| `blochKatoExp_injective_iff` | characterisation | blochKatoExp K V is injective iff D_cris(V)^{φ=1} = H^0(K, V). |
| `blochKatoExp_cocycle` | simp | blochKatoExp K V x is represented by g ↦ (g − 1)b for b ∈ B_e ⊗ V lifting x. |
| `blochKatoExp_map` | functoriality | Natural in V for G_K-equivariant maps of de Rham representations. |
| `blochKatoExp_f_sequence` | relation | The exact sequence 0 → H^0 → D_cris → D_cris ⊕ D_dR/Fil^0 → H^1_f → 0. |
| `blochKatoExp_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `blochKatoExp_twist_two` | computation | For K = Q_p and V = Q_p(2), blochKatoExp is an isomorphism Q_p·e_2 ≅ H^1(Q_p, Q_p(2)) ≅ Q_p. |
| `blochKatoExp_trivial` | degenerate | For V = Q_p, D_dR(Q_p)/Fil^0 = 0, so blochKatoExp = 0 and H^1_e(K, Q_p) = 0. |
| `blochKatoExp_kummer` | compatibility | For V = Q_p(1) and u ∈ 1 + p^c O_K (c > 1/(p − 1)), blochKatoExp(log u · e_1) = κ(u), the Kummer class (Bloch–Kato 3.10.1). |
| `blochKatoExp_not_onto_f` | non-example | For V = Q_p(1), H^1_e = H^1_f has dimension [K : Q_p] but H^1(K, Q_p(1)) has dimension [K : Q_p] + 1: the exponential does not reach the valuation direction. |

**Acceptance requirements.** V = Q_p(1): exp agrees with the usual p-adic exponential on a neighbourhood of 0 of K (Bloch–Kato p. 358 as recalled by Huber–Kings). V = Q_p(r), r ≥ 2: exp is an isomorphism K·e_r ≅ H^1(K, Q_p(r)).

**Uses.** PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison: r^et = exp_BK ∘ reg_syn on K_{2n−1}(O_K) PadicHodgeRegulators:D.2/syntomic-exponential: the syntomic exponential composed with the period map is exp_BK PadicHodgeRegulators:L3/ramified-interpolation: the interpolation formula of the big logarithm at j ≤ −1 uses the Bloch–Kato logarithm PhiGammaModulesAndIwasawaCohomology:PG.5: the Bloch–Kato normalisation comparison at the end of PG.5 (RS-26 link L1 → PG.5)

**Sources.**

- [FO (D.1)](#source-d-1-fo), (9.11), p. 233. The exponential and its exact sequence.
- [Berger2003 (D.1)](#source-d-1-berger2003), Introduction, p. 2. The definition.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-l1-bloch-kato-logarithm"></a>
### The Bloch–Kato logarithm

`PadicHodgeRegulators:L1/bloch-kato-logarithm` · construction · `blochKatoLog`

Let K/Q_p be finite and V de Rham with D_cris(V)^{φ=1} = H^0(K, V) (so exp_{K,V} is injective). The Bloch–Kato logarithm is log_BK := exp_{K,V}^{−1} : H^1_e(K, V) → D_dR(V)/Fil^0 D_dR(V). For V = Q_p(r), r ≥ 2, H^1_e = H^1(K, Q_p(r)) and log_BK : H^1(K, Q_p(r)) ≅ K·e_r ≅ K; for V = Q_p(1), log_BK ∘ κ = log_p on O_K^× (Iwasawa branch), with κ the Kummer map.

**Hypotheses.** D_cris(V)^{φ=1} = H^0(K, V).

**Prerequisites.** [`PadicHodgeRegulators:L1/bloch-kato-exponential`](#padichodgeregulators-l1-bloch-kato-exponential); `ColemanIntegration:L0/iwasawa-logarithm`; `tauceti:TauCeti.kummerClassMap`; `SelmerIwasawaCohomology:L0/padic-kummer-identification`.

**Proof route.**

1. exp is injective under the hypothesis and has image H^1_e (L1/bloch-kato-exponential); define log_BK as its inverse on the image.
2. For Q_p(r), r ≥ 2: D_cris(Q_p(r))^{φ=1} = 0 = H^0, and dim H^1 = [K : Q_p] = dim D_dR/Fil^0 (H^0 = H^2 = 0), so H^1_e = H^1.
3. For Q_p(1): Bloch–Kato's comparison of exp with the usual exponential (Bloch–Kato 3.10.1, recalled by Huber–Kings Remark 1.3.3) gives log_BK ∘ κ = log_p.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `blochKatoLog` | data | blochKatoLog K V : blochKatoE K V →ₗ[ℚ_p] D_dR(V) ⧸ Fil^0 (under the injectivity hypothesis). |
| `blochKatoLog_exp` | simp | blochKatoLog (blochKatoExp x) = x. |
| `blochKatoExp_log` | simp | blochKatoExp (blochKatoLog y) = y for y ∈ blochKatoE K V. |
| `blochKatoLog_twist` | equivalence | For r ≥ 2, blochKatoLog K (ℚ_p(r)) : H^1(K, ℚ_p(r)) ≃ₗ K·e_r. |
| `blochKatoLog_kummer` | compatibility | For r = 1 and u ∈ 𝒪_Kˣ, blochKatoLog (κ u) = log_p u · e_1. |
| `blochKatoLog_map` | functoriality | Natural for G_K-maps between representations satisfying the hypothesis. |
| `blochKatoLog_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `blochKatoLog_principal_unit` | computation | For K = Q_p (p odd), blochKatoLog (κ(1 + p)) = log(1 + p)·e_1 = (p − p²/2 + p³/3 − …)·e_1. |
| `blochKatoLog_teichmuller` | degenerate | For a Teichmüller unit ω, blochKatoLog (κ ω) = 0 (κ(ω) is torsion in H^1(K, Z_p(1)) and log_p(ω) = 0). |
| `blochKatoLog_coleman_compat` | compatibility | blochKatoLog ∘ κ = ColemanIntegration's Iwasawa logarithm on 𝒪_Kˣ (ColemanIntegration:L0/iwasawa-logarithm). |
| `blochKatoLog_not_defined_trivial` | non-example | For V = Q_p, D_cris^{φ=1} = Q_p = H^0 but D_dR/Fil^0 = 0 and H^1_e = 0, so blochKatoLog has zero source: H^1_f(K, Q_p) ≠ 0 is not in its domain. |

**Acceptance requirements.** log_BK(κ(1 + p)) = log(1 + p) for K = Q_p, p odd. For V = Q_p(1) the class of p itself is not in H^1_e, so log_BK(κ(p)) is undefined.

**Uses.** PadicHodgeRegulators:D.3/local-regulator: D_L = ε·log_BK ∘ c_{2,1} on completed K_3 EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: z = log_BK(reg_et(u)) for weight-two elliptic classes GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class: log_BK ∘ κ = log_A for abelian varieties with good reduction GeneralizedHeegnerCycles:GH.8/differential-evaluation: naturality of log_BK for the quotient and its formal-group comparison

**Sources.**

- [HK2011 (D.1)](#source-d-1-hk2011), Remark 1.3.3, p. 9. The weight-one case.
- [HK2011 (D.1)](#source-d-1-hk2011), §1.3, p. 8. The exponential for Q_p(n), an isomorphism for n > 1.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [ArithmeticGaloisDuality:R02.4](#request-d-1-17).

<a id="padichodgeregulators-l1-dual-exponential"></a>
### Kato's dual exponential

`PadicHodgeRegulators:L1/dual-exponential` · construction · `dualExp`

For K/Q_p finite and V de Rham, the dual exponential exp*_{K,V^*(1)} : H^1(K, V) → Fil^0 D_dR(V) is the composite H^1(K, V) → H^1(K, B_dR ⊗ V) ≅ D_dR(V), the isomorphism being x ↦ (g ↦ log χ(g)·x) (Kato); its image lies in Fil^0 D_dR(V) and its kernel is H^1_g(K, V). It is the transpose of exp_{K,V^*(1)} for the Tate pairing ⟨ , ⟩ : H^1(K, V) × H^1(K, V^*(1)) → H^2(K, Q_p(1)) = Q_p and the de Rham pairing [ , ] : D_dR(V) × D_dR(V^*(1)) → D_dR(Q_p(1)) = K --Tr_{K/Q_p}--> Q_p: [x, exp*(y)] = ⟨exp(x), y⟩ for x ∈ D_dR(V^*(1))/Fil^0, y ∈ H^1(K, V), with the sign convention pinned here (the sources warn that signs vary).

**Hypotheses.** K/Q_p finite; V de Rham.

**Prerequisites.** [`PadicHodgeRegulators:L1/bloch-kato-exponential`](#padichodgeregulators-l1-bloch-kato-exponential); [`PadicHodgeRegulators:L1/bloch-kato-subgroups`](#padichodgeregulators-l1-bloch-kato-subgroups); `SelmerIwasawaCohomology:L1/orthogonal-complement`; `PadicHodgeTheory:R06.1/de-rham-invariants`; `ArithmeticGaloisDuality:D7/duality-after-localization`; `ArithmeticGaloisDuality:R02.4`.

**Proof route.**

1. Fontaine–Ouyang Proposition 6.35 computes H^1(K, t^iB_dR^+/t^jB_dR^+) via cup product with log χ; passing to the limit gives the isomorphism H^1(K, B_dR ⊗ V) ≅ D_dR(V) (Berger Proposition II.5).
2. The image lies in Fil^0 because the map factors through H^1(K, B_dR^+ ⊗ V); its kernel is H^1_g by definition.
3. The adjunction is the definition via the perfect Tate pairing (local Tate duality from ArithmeticGaloisDuality:R02.4/class-formation-ext-duality, orthogonality formalism from SelmerIwasawaCohomology:L1/orthogonal-complement).

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `dualExp` | data | dualExp K V : H^1(K, V) →ₗ[ℚ_p] Fil^0 D_dR(V). |
| `dualExp_ker` | characterisation | ker (dualExp K V) = blochKatoG K V. |
| `dualExp_adjoint` | characterisation | deRhamPairing x (dualExp K V y) = tatePairing (blochKatoExp K V^*(1) x) y. |
| `dualExp_formula` | simp | dualExp K V is H^1(K, V) → H^1(K, B_dR^+ ⊗ V) ≅ Fil^0 D_dR(V) via ∪ log χ. |
| `dualExp_map` | functoriality | Natural in V; compatible with corestriction and trace (L1/twist-and-change-of-field). |
| `dualExp_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `dualExp_trivial_log_chi` | computation | For K = Q_p and V = Q_p, dualExp (log χ) = 1. |
| `dualExp_positive_twist` | degenerate | For V = Q_p(r) with r ≥ 1, dualExp = 0. |
| `dualExp_adjoint_compat` | compatibility | For V = Q_p and x ∈ D_dR(Q_p(1))/Fil^0 = K·e_1: [x, dualExp y] = ⟨exp_{Q_p(1)}(x), y⟩, matching the Kummer/local class field theory pairing. |
| `dualExp_kernel_not_f` | non-example | For V = Q_p(1), ker dualExp = H^1_g = H^1 ≠ H^1_f: the kernel is H^1_g, not H^1_f. |

**Acceptance requirements.** V = Q_p: exp*(η) for η ∈ H^1(K, Q_p) = Hom(G_K, Q_p) is the coefficient of log χ in η (η = a·log χ + unramified part gives exp*(η) = a). V = Q_p(r), r ≥ 1: exp* vanishes, since Fil^0 D_dR(Q_p(r)) = 0.

**Uses.** PadicHodgeRegulators:L3/ramified-interpolation: B_j = exp* for j ≥ 0 in the interpolation formula of the big logarithm PadicHodgeRegulators:L4/derham-interpolation-growth: Rodrigues Jacinto's interpolation uses exp* for j ≥ 0 L3/rubin-coleman-map: Rubin's Coleman map is defined through exp*_{ω_A} KatoEulerSystems:L3: explicit reciprocity expresses exp* of Kato's classes by modular forms

**Sources.**

- [Berger2003 (D.1)](#source-d-1-berger2003), Introduction, p. 2. The definition by duality.
- [Berger2003 (D.1)](#source-d-1-berger2003), §II, p. 13. Image and kernel.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [ArithmeticGaloisDuality:R02.4](#request-d-1-17).

<a id="padichodgeregulators-l1-dimension-formulas"></a>
### Dimensions of the Bloch–Kato subspaces

`PadicHodgeRegulators:L1/dimension-formulas` · theorem

Let K/Q_p be finite and V a de Rham representation. Then dim H^1_f(K, V) = dim_{Q_p} D_dR(V)/Fil^0 + dim H^0(K, V); dim H^1_f/H^1_e = dim D_cris(V)^{φ=1}; dim H^1_g(K, V) = dim H^1_f(K, V) + dim D_cris(V^*(1))^{φ=1}; and dim H^1(K, V) = [K : Q_p]·dim V + dim H^0(K, V) + dim H^0(K, V^*(1)).

**Hypotheses.** K/Q_p finite; V de Rham (crystalline for nothing further).

**Prerequisites.** [`PadicHodgeRegulators:L1/bloch-kato-exponential`](#padichodgeregulators-l1-bloch-kato-exponential); [`PadicHodgeRegulators:L1/local-duality-of-conditions`](#padichodgeregulators-l1-local-duality-of-conditions); `ArithmeticGaloisDuality:D7/duality-after-localization`.

**Proof route.**

1. Count dimensions in the exact sequences of L1/bloch-kato-exponential; the two D_cris(V) terms cancel in the H^1_f sequence.
2. The H^1_g formula follows from H^1_g(V) = H^1_e(V^*(1))^⊥ (L1/local-duality-of-conditions) and the H^1_e count for V^*(1).
3. The Euler characteristic formula Σ(−1)^i dim H^i = −[K : Q_p] dim V with H^2(V) dual to H^0(V^*(1)) gives dim H^1.

**Acceptance requirements.** V = Q_p(2), K = Q_p: dim H^1_f = 1 = dim H^1. V = Q_p(1): dim H^1_f = [K : Q_p] and dim H^1 = [K : Q_p] + 1. V = Q_p: dim H^1_f = 1 and dim H^1_g = 1 + dim D_cris(Q_p(1))^{φ=1} = 1.

**Sources.**

- [Benois2014 (D.1)](#source-d-1-benois2014), Proposition 2.8.2(i), p. 44. The H^1_f formula (for (φ,Γ)-modules, which covers V via D†_rig(V)).
- [FO (D.1)](#source-d-1-fo), (9.16), p. 235. The quotient H^1_f/H^1_e.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [ArithmeticGaloisDuality:R02.4](#request-d-1-17).

<a id="padichodgeregulators-l1-local-duality-of-conditions"></a>
### Local duality of the Bloch–Kato conditions

`PadicHodgeRegulators:L1/local-duality-of-conditions` · theorem

Let K/Q_p be finite and V de Rham. Under the perfect cup-product pairing H^1(K, V) × H^1(K, V^*(1)) → H^2(K, Q_p(1)) = Q_p: H^1_f(K, V^*(1)) = H^1_f(K, V)^⊥, H^1_e(K, V^*(1)) = H^1_g(K, V)^⊥ and H^1_g(K, V^*(1)) = H^1_e(K, V)^⊥. For a G_K-stable lattice T, H^1_f(K, T) and H^1_f(K, V^*(1)/T^*(1)) (propagated conditions; V^*(1)/T^*(1) = Hom(T, μ_{p^∞})) are exact annihilators under the induced pairing H^1(K, T) × H^1(K, V^*(1)/T^*(1)) → Q_p/Z_p. For a finite extension K_ℓ/Q_ℓ with ℓ ≠ p and a finite unramified p-primary G_{K_ℓ}-module M, H¹_un(K_ℓ,M) and H¹_un(K_ℓ,M^D) are exact annihilators under finite local Tate duality; no unrestricted ramified torsion-module assertion is made.

**Hypotheses.** K/Q_p finite; V de Rham (Bloch–Kato Proposition 3.8; Fontaine–Ouyang state it for semistable V).

**Prerequisites.** [`PadicHodgeRegulators:L1/bloch-kato-subgroups`](#padichodgeregulators-l1-bloch-kato-subgroups); [`PadicHodgeRegulators:L1/bloch-kato-exponential`](#padichodgeregulators-l1-bloch-kato-exponential); `ArithmeticGaloisDuality:R02.4/unramified-exact-annihilators`; `SelmerIwasawaCohomology:L1/orthogonal-complement`; `SelmerIwasawaCohomology:L1/lattice-pairing-compatibility`; `ArithmeticGaloisDuality:D7/duality-after-localization`; `ArithmeticGaloisDuality:D7/local-invariant-trivialization`; `ArithmeticGaloisDuality:D7/local-duality-maps`; `ArithmeticGaloisDuality:D7/derived-local-duality`; `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`.

**Proof route.**

1. Orthogonality: the cup product of H^1_f(V) and H^1_f(V^*(1)) factors through H^2(K, B_cris ⊗ Q_p(1)) computations which vanish (Bloch–Kato Proposition 3.8, quoted in Fontaine–Ouyang Theorem 9.27).
2. Do not invoke L1/dimension-formulas here: that node already uses this duality theorem. FO Theorem 9.27 gives exact annihilators for semistable V. For de Rham V import potential semistability, choose finite Galois L/K with V|_{G_L} semistable, and descend using restriction/corestriction, exact finite-group invariants over Q_p and the descent of D_cris/D_dR local conditions. The required descent of H_f is a separate supplier obligation if not proved; it is recorded as a gap. The e/g pairing is equivalently the exponential/dual-exponential adjunction, without the circular dimension argument.
3. Integral version: Rubin Proposition I.4.3, using the lattice compatibility of the pairings (SelmerIwasawaCohomology:L1/lattice-pairing-compatibility).

**Acceptance requirements.** V = Q_p: H^1_f(Q_p) = H^1_ur is the annihilator of H^1_f(Q_p(1)) = Kummer image of units, which is local class field theory's statement that units are the norms killing unramified characters. V = Q_p(2), V^*(1) = Q_p(−1): H^1_f(Q_p(2)) = H^1 and H^1_f(Q_p(−1)) = 0 are annihilators.

**Sources.**

- [FO (D.1)](#source-d-1-fo), Theorem 9.27, p. 235. The statement (citing Bloch–Kato Proposition 3.8).
- [Rubin2000 (D.1)](#source-d-1-rubin2000), Remark I.7.1, p. 17. The same, in Rubin's notation V^* = V^*(1).

**Open obligations.** [Noncircular de Rham local-duality descent](#gap-d-1-11); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [ArithmeticGaloisDuality:R02.4](#request-d-1-17).

<a id="padichodgeregulators-l1-twist-and-change-of-field"></a>
### Twists, restriction and corestriction for the Bloch–Kato maps

`PadicHodgeRegulators:L1/twist-and-change-of-field` · lemma

Let L/K be a finite extension of finite extensions of Q_p and V de Rham over K. (a) Restriction: res_{L/K} ∘ exp_{K,V} = exp_{L,V} ∘ ι, with ι : D_dR,K(V) → L ⊗_K D_dR,K(V) = D_dR,L(V) the inclusion. (b) Corestriction: cor_{L/K} ∘ exp_{L,V} = exp_{K,V} ∘ Tr_{L/K}, and Tr_{L/K} ∘ exp*_L = exp*_K ∘ cor_{L/K}. (c) Twisting: for i ∈ Z, D_cris(V(i)) = D_cris(V) ⊗ e_i and D_dR(V(i)) = D_dR(V) ⊗ e_i with Fil^j shifted by i and φ multiplied by p^{−i}; there is no finite-level map H^1(K, V) → H^1(K, V(i)), and twisting enters the exponentials only through Iwasawa cohomology (L2/local-iwasawa-twist). (d) Shapiro: for V a representation of G_L, H^1(K, Ind_L^K V) ≅ H^1(L, V) carries H^1_f to H^1_f and exp_{K, Ind V} to exp_{L, V} under D_dR,K(Ind V) = D_dR,L(V).

**Hypotheses.** K ⊆ L finite over Q_p; V de Rham.

**Prerequisites.** [`PadicHodgeRegulators:L1/bloch-kato-exponential`](#padichodgeregulators-l1-bloch-kato-exponential); [`PadicHodgeRegulators:L1/dual-exponential`](#padichodgeregulators-l1-dual-exponential); [`PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`](#padichodgeregulators-l0-hodge-tate-and-twist-conventions); `PadicHodgeTheory:R06.2/de-rham-base-change`; `PadicHodgeTheory:R06.2/induction-and-restriction-of-scalars`; `ArithmeticGaloisDuality:D7/duality-after-localization`.

**Proof route.**

1. (a) Naturality of connecting maps for the restriction of the tensored fundamental sequence; D_dR descends along finite extensions (PadicHodgeTheory:R06.2/de-rham-base-change).
2. (b) Corestriction on H^0 of B_dR ⊗ V is the trace; Berger states the corresponding commutative diagrams (proofs of his Theorems II.2 and II.6).
3. (c) Fontaine–Ouyang Lemma 9.5 and L0/hodge-tate-and-twist-conventions.
4. (d) Shapiro's lemma (Rubin Appendix B, Corollary 5.2) and D_dR of induced representations (PadicHodgeTheory:R06.2/induction-and-restriction-of-scalars); B_* ⊗ Ind V = Ind(B_* ⊗ V) gives the compatibility of H^1_f and exp.

**Acceptance requirements.** For L/K unramified of degree f and V = Q_p(2): cor ∘ exp_L = exp_K ∘ Tr, so log_BK on H^1(K, Q_p(2)) of a corestricted class is the trace. Twisting is not a finite-level map: H^1(Q_p, Q_p) and H^1(Q_p, Q_p(1)) have different dimensions over the same field.

**Sources.**

- [Berger2003 (D.1)](#source-d-1-berger2003), Proof of Theorem II.2, p. 11. The corestriction–trace square (bracketed text paraphrases a diagram).
- [Rubin2000 (D.1)](#source-d-1-rubin2000), Appendix B, Corollary 5.2, p. 157. Shapiro's lemma in the form used for semilocal conditions.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-l1-tate-twist-examples"></a>
### The Bloch–Kato conditions for Tate twists

`PadicHodgeRegulators:L1/tate-twist-examples` · theorem

Let K/Q_p be finite. (i) V = Q_p: H^1_e = 0, H^1_f = H^1_g = H^1_ur (dimension 1). (ii) V = Q_p(1): H^1_e = H^1_f = κ((O_K^×)^∧ ⊗ Q_p) of dimension [K : Q_p], H^1_g = H^1 (dimension [K : Q_p] + 1); exp_BK(log_p u·e_1) = κ(u) for u ∈ O_K^× and log_BK ∘ κ = log_p. (iii) V = Q_p(r), r ≥ 2: H^1_e = H^1_f = H^1_g = H^1(K, Q_p(r)) of dimension [K : Q_p], and exp : K·e_r ≅ H^1(K, Q_p(r)). (iv) V = Q_p(r), r ≤ −1: H^1_e = H^1_f = H^1_g = 0 while dim H^1 = [K : Q_p]. Integrally: H^1_f(K, Z_p(1)) = (O_K^×)^∧ and H^1_f(K, Z_p(r)) = H^1(K, Z_p(r)) for r ≥ 2.

**Hypotheses.** K/Q_p finite.

**Prerequisites.** [`PadicHodgeRegulators:L1/bloch-kato-logarithm`](#padichodgeregulators-l1-bloch-kato-logarithm); [`PadicHodgeRegulators:L1/dimension-formulas`](#padichodgeregulators-l1-dimension-formulas); [`PadicHodgeRegulators:L1/local-duality-of-conditions`](#padichodgeregulators-l1-local-duality-of-conditions); `SelmerIwasawaCohomology:L0/padic-kummer-identification`; `SelmerIwasawaCohomology:L0/local-completion`; `ArithmeticGaloisDuality:D7/duality-after-localization`.

**Proof route.**

1. Compute D_cris and D_dR/Fil^0 of Q_p(r) (L0/hodge-tate-and-twist-conventions) and apply L1/dimension-formulas.
2. (ii) Bloch–Kato p. 358 (quoted by Huber–Kings) identify exp with the classical exponential; the Kummer identification is SelmerIwasawaCohomology:L0/padic-kummer-identification.
3. (iv) H^1_g(Q_p(r)) = H^1_e(Q_p(1 − r))^⊥ = 0 for r ≤ −1 by duality and (iii).

**Acceptance requirements.** K = Q_5, r = 2: H^1(Q_5, Q_5(2)) ≅ Q_5 via log_BK. K = Q_p, V = Q_p(−1): H^1 ≠ 0 but H^1_g = 0 (a non-split extension 0 → Q_p(−1) → E → Q_p → 0 is never de Rham).

**Sources.**

- [HK2 (D.1)](#source-d-1-hk2), Appendix A, p. 46. Case (ii).
- [HK2011 (D.1)](#source-d-1-hk2011), §1.3, p. 8. Case (iii): exp_BK : K → H^1(K, Q_p(n)).

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [ArithmeticGaloisDuality:R02.4](#request-d-1-17).

<a id="padichodgeregulators-l1-abelian-variety-logarithm"></a>
### The Bloch–Kato logarithm of Kummer classes of abelian varieties

`PadicHodgeRegulators:L1/abelian-variety-logarithm` · comparison

Let K/Q_p be finite and A/K an abelian variety with good reduction, V = V_pA. Then H^1_e(K, V) = H^1_f(K, V) = H^1_g(K, V) = κ(A(K) ⊗ Q_p), with κ the Kummer map; D_dR(V)/Fil^0 ≅ Lie(A) ⊗ K; and log_BK ∘ κ = log_A on A(K) ⊗ Q_p, where log_A : A(K) → Lie(A) is the logarithm of the formal group (extended to A(K) by finite index). For an isogeny or a quotient map π : A → B of abelian varieties with good reduction, log_BK is natural: log_B(π(x)) = dπ(log_A(x)). Pairing with an invariant differential ω ∈ Fil^0 D_dR(V^*(1)) = H^0(A, Ω^1) gives ⟨log_BK κ(P), ω⟩ = log_ω(P).

**Hypotheses.** A has good reduction over O_K; the sign convention of exp is that of L1/bloch-kato-exponential.

**Prerequisites.** [`PadicHodgeRegulators:L1/bloch-kato-logarithm`](#padichodgeregulators-l1-bloch-kato-logarithm); [`PadicHodgeRegulators:L1/bloch-kato-subgroups`](#padichodgeregulators-l1-bloch-kato-subgroups); `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`; `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`; `PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion`.

**Proof route.**

1. For the formal group Â of finite height over O_K with Tate module T, Berger states the commutative square exp_G / Kummer δ_G / exp_{K,V} with D_dR(V)/Fil^0 = tan(G(K)) (Bloch–Kato 3.10.1).
2. A(K) ⊗ Q_p = Â(m_K) ⊗ Q_p since A(K)/Â(m_K) is finite, so the square for Â gives log_BK ∘ κ = log_A.
3. H^1_e = H^1_f = H^1_g: D_cris(V)^{φ=1} = 0 = D_cris(V^*(1))^{φ=1} by the Weil bounds on Frobenius eigenvalues (purity), so the dimension formulas coincide.
4. Naturality follows from functoriality of the Kummer map and of the formal logarithm.

**Acceptance requirements.** For an elliptic curve E/Q_p with good reduction and P ∈ E_1(Q_p) (kernel of reduction), log_BK κ(P) = log_{Ê}(P) ∈ Lie(E) ⊗ Q_p. For a quotient π : J_0(N) → E, log_{E,ω_E}(π(x)) = c_π·AJ_dR(x)(ω_f) when π^*ω_E = c_π ω_f (GeneralizedHeegnerCycles:GH.8/differential-evaluation); c_π is not assumed to be 1.

**Sources.**

- [Berger2003 (D.1)](#source-d-1-berger2003), Introduction, p. 2. The formal-group square (Bloch–Kato 3.10.1).
- [Rubin2000 (D.1)](#source-d-1-rubin2000), §I.6.4, (9), p. 16. H^1_f of V_pA is the Kummer image.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-l1-integral-logarithm-unramified"></a>
### The integral Bloch–Kato logarithm for unramified fields

`PadicHodgeRegulators:L1/integral-logarithm-unramified` · theorem

Let p be odd, L/Q_p finite unramified and 2 ≤ r ≤ p − 2. Then H^1(L, Z_p(r)) is torsion-free of rank [L : Q_p], H^1_f(L, Z_p(r)) = H^1(L, Z_p(r)), and log_BK(H^1(L, Z_p(r))) = (r − 1)!·p^r·O_L·e_r = p^r·O_L·e_r. For r = 1, log_BK(H^1_f(L, Z_p(1))/tors) = p·O_L·e_1 (the logarithm of the principal units). Equivalently, Fontaine's map ∂^r : L → H^1(L, Q_p(r)), the connecting map of L0/fundamental-exact-sequences (c), equals ±exp_BK ∘ (1 − p^{−r}σ)^{−1} and maps O_L isomorphically onto H^1(L, Z_p(r)), because (1 − p^{−r}σ)^{−1}O_L = p^r O_L. The statement is not asserted for ramified L, for r ≥ p − 1, or for p = 2.

**Hypotheses.** p odd; L unramified; 2 ≤ r ≤ p − 2 (Fontaine–Laffaille range).

**Prerequisites.** [`PadicHodgeRegulators:L1/bloch-kato-logarithm`](#padichodgeregulators-l1-bloch-kato-logarithm); [`PadicHodgeRegulators:L1/tate-twist-examples`](#padichodgeregulators-l1-tate-twist-examples); [`PadicHodgeRegulators:L0/integral-period-interface`](#padichodgeregulators-l0-integral-period-interface); [`PadicHodgeRegulators:L0/fundamental-exact-sequences`](#padichodgeregulators-l0-fundamental-exact-sequences); `KTheoryFiniteLocalFields:L.6/h1-of-tate-twists`; `KTheoryFiniteLocalFields:L.6/h0-of-tate-twists`.

**Proof route.**

1. Torsion-freeness: H^1(L, Z_p(r))_tors ≅ H^0(L, Q_p/Z_p(r)), which vanishes because L is unramified and (p − 1) ∤ r (KTheoryFiniteLocalFields:L.6/h0-of-tate-twists and h1-of-tate-twists).
2. Index: Benois–Nguyen Quang Do Lemma 1.3.2 and Theorem 2.1 give (exp(O_L·e_r) : H^1(L, Z_p(r)))·w^{(p)}_{1−r}(L) = q^r·|(r − 1)!|_p^{−[L:Q_p]} for unramified L, with w^{(p)}_{1−r}(L) = 1 here.
3. Exact lattice, not just its index: BNQD §2.3.2 and Proposition 2.2.4 identify H^1(L,Z_p(r)) with (r−1)! exp(Tr_{L(ζ_p)/L} Ξ_{r,1}(R_{L,1})). For unramified L and n=1, R_{L,1} is generated over O_L by 1+X. Their displayed formula gives Ξ_{r,1}(a(1+X)) = p^{r−1}(σ^{-1}(a)ζ_p − (1−p^rσ^{-1})^{-1}σ^{-1}(a)). Since Tr(ζ_p)=−1 and [L(ζ_p):L]=p−1, its trace is −p^r(1−p^{r−1}σ^{-1})(1−p^rσ^{-1})^{-1}σ^{-1}(a). For r≥2 these three factors are Z_p-linear automorphisms of O_L, so the image is exactly p^rO_L. The torsion obstruction H^0(L,Q_p/Z_p(r−1)) vanishes in 2≤r≤p−2. This proves the lattice equality, while the index formula alone would not.
4. Lattice identity: 1 − p^{−r}σ = −p^{−r}σ(1 − p^rσ^{−1}) with 1 − p^rσ^{−1} invertible on O_L, so (1 − p^{−r}σ)^{−1}O_L = p^r O_L; this gives the Fontaine-normalised form.
5. r = 1: Benois–Nguyen Quang Do Lemma 1.3.2 at m = 1 with e = 1, and the Iwasawa logarithm U^1_L ≅ pO_L.

**Acceptance requirements.** L = Q_5, r = 2: log_BK(H^1(Q_5, Z_5(2))) = 25Z_5·e_2; consistent with Li_2(ω(2)) ≡ 25 mod 125. Index check: q^r·|(r−1)!|^{−N} equals [O_L : p^r O_L] = q^r for r ≤ p − 2. For p = 3 and r = 2 the range 2 ≤ p − 2 fails and H^1(Q_3, Z_3(2)) has torsion Z/3.

**Sources.**

- [BNQD2002 (D.1)](#source-d-1-bnqd2002), Lemme 1.3.2, p. 647. The index form.
- [BNQD2002 (D.1)](#source-d-1-bnqd2002), Théorème 2.1, p. 648. The local Tamagawa number, which with Lemme 1.3.2 gives the index; the lattice form is derived in proofSteps (no open source states it in one line).
- [FontaineBPR1994 (D.1)](#source-d-1-fontainebpr1994), §2.1, p. 153. Fontaine's map ∂^r.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group](#request-d-1-15).

<a id="padichodgeregulators-l1-semilocal-bloch-kato"></a>
### Semilocal Bloch–Kato maps

`PadicHodgeRegulators:L1/semilocal-bloch-kato` · construction · `semilocalBlochKatoExp`

For a finite étale Q_p-algebra A = ∏_v K_v (for instance F ⊗ Q_p = ∏_{v|p} F_v for a number field F) and a p-adic representation V of G_{Q_p} (or a family V_v of de Rham representations of the G_{K_v}), put H^1(A, V) := ⊕_v H^1(K_v, V), H^1_*(A, V) := ⊕_v H^1_*(K_v, V) for * ∈ {e, f, g}, D_dR(A, V) := ⊕_v D_dR,K_v(V), and define exp_{A,V} and exp*_{A,V} componentwise. Define log_{A,V} on ⊕_v H^1_e(K_v,V_v) only when D_cris,K_v(V_v)^{φ=1} = H^0(K_v,V_v) for every v. Under Shapiro's isomorphism H^1(Q_p, Ind_{K_v}^{Q_p} V) ≅ H^1(K_v, V) these are the Bloch–Kato maps of the induced representation (L1/twist-and-change-of-field (d)). For a number field F the semilocal Kummer map E_F ⊗ Q_p → H^1_f(F ⊗ Q_p, Q_p(1)) composed with log is the unit regulator of D.1/unit-logarithm-kernel.

**Hypotheses.** A finite étale over Q_p; V de Rham at each factor. The componentwise logarithm requires the injectivity hypothesis of L1/bloch-kato-logarithm at every factor; the subgroup construction does not.

**Prerequisites.** [`PadicHodgeRegulators:L1/bloch-kato-exponential`](#padichodgeregulators-l1-bloch-kato-exponential); [`PadicHodgeRegulators:L1/bloch-kato-logarithm`](#padichodgeregulators-l1-bloch-kato-logarithm); [`PadicHodgeRegulators:L1/dual-exponential`](#padichodgeregulators-l1-dual-exponential); [`PadicHodgeRegulators:L1/twist-and-change-of-field`](#padichodgeregulators-l1-twist-and-change-of-field); `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Proof route.**

1. Componentwise definition; the decomposition of A into fields is canonical.
2. Compatibility with Shapiro is L1/twist-and-change-of-field (d) applied to each factor.
3. For F ⊗ Q_p use the semilocal equivalence of NumberFieldArithmetic layer 5.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `semilocalBlochKatoF` | data | semilocalBlochKatoF A V : Submodule ℚ_p (⨁ v, H^1(K_v, V)). |
| `semilocalBlochKatoExp` | constructor | semilocalBlochKatoExp A V := ⨁ v, blochKatoExp K_v V. |
| `semilocalBlochKatoLog` | constructor | The componentwise logarithm on ⨁ v, blochKatoE K_v V. It requires injective exp at every factor, and is its inverse on the direct sum of the images. |
| `semilocal_shapiro` | compatibility | Under Shapiro's isomorphism, semilocalBlochKatoExp A V = blochKatoExp ℚ_p (Ind_A V). |
| `semilocal_prod` | simp | For A = A' × A'', the semilocal maps are the direct sums of those of A' and A''. |
| `semilocalBlochKatoF_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `semilocal_split_quadratic` | computation | For F = Q(√2), p = 7: dim_{Q_7} semilocalBlochKatoF (F ⊗ Q_7) Q_7(1) = 2. |
| `semilocal_zero_algebra` | degenerate | For A = 0 all semilocal groups are 0. |
| `semilocal_field_compat` | compatibility | For A = K a field, the semilocal maps are the local maps of L1. |
| `semilocal_independent_factors` | non-example | For p odd and A = Q_p × Q_p, let c = κ(1+p) ≠ 0 in H^1_f(Q_p,Q_p(1)). Both (c,0) and (0,c) belong to semilocalBlochKatoF A Q_p(1) and are independent; replacing this group by the one-dimensional diagonal {(x,x)} fails. The two-factor group agrees with H^1_f(Q_p,Q_p(1) ⊕ Q_p(1)). |

**Acceptance requirements.** For F = Q(√2) and p = 7 (split), H^1_f(F ⊗ Q_7, Q_7(1)) = H^1_f(Q_7, Q_7(1))², and log of the semilocal Kummer class of 1 + √2 is (log_7(1 + √2), log_7(1 − √2)).

**Uses.** Rubin, Euler Systems, Chapter II §2: H^1(K_p, ·) = ⊕_{v|p} H^1(K_v, ·), and similarly for H^1_f and H^1_s SelmerIwasawaCohomology:L4/bloch-kato-condition: the local condition at every place above p of a number field PadicHodgeRegulators:D.4/global-p-adic-regulator: the regulator to F ⊗ Q_p is the semilocal log_BK of the étale regulator Huber–Kings 2003, Appendix A: exp_p : O_F ⊗ Q_p → H^1_f(F ⊗ Q_p, Q_p(1)) is an isomorphism

**Sources.**

- [Rubin2000 (D.1)](#source-d-1-rubin2000), Chapter II §2, p. 25. The semilocal convention.
- [HK2 (D.1)](#source-d-1-hk2), Appendix A, p. 21. A semilocal exponential.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places](#request-d-1-14).

### Completion obligations for L1

- Cross-check the sign of the dual-exponential adjunction against L3/explicit-reciprocity.
- Close the noncircular de Rham local-duality descent and rational Euler-characteristic request.

<a id="layer-l2"></a>
## L2: Fontaine’s Iwasawa map and normalization squares

Use the ψ-complex comparison supplied by the φ/Γ owner to identify actual ψ-one vectors with inverse-corestriction Iwasawa classes. Record generator, roots, semilinear twists, character specialization, coefficient and lattice squares at this map. Berger’s Wach range supplies the ψ-one equality needed by L3. The Kummer–Coleman statement carries an unresolved sign: every later use of a normalized Kummer formula must retain that obligation.

**Atlas landmarks:** Fontaine's ψ-isomorphism; Berger's ψ-invariants theorem.

<a id="padichodgeregulators-l2-fontaine-iwasawa-map"></a>
### Fontaine's isomorphism h_Iw : D(T)^{ψ=1} ≅ H¹_Iw

`PadicHodgeRegulators:L2/fontaine-iwasawa-map` · construction · `fontaineIwasawaEquiv`

Assume H₀. Let D(T) be the étale (φ, Γ)-module of T over O_E ⊗ A_{Q_p} with the operator ψ (PhiGammaModulesAndIwasawaCohomology PG.1, PG.4). Define h_{Iw,T} : D(T)^{ψ=1} → H^1_Iw(Q_p, T) as the H^1-comparison of the ψ-complex [D(T) --(ψ − 1)--> D(T)] with the inverse-corestriction Iwasawa complex (PG.5, SelmerIwasawaCohomology L3). Then: (a) h_{Iw,T} is a Λ-linear bijection; (b) for n ≥ 1, a topological generator γ_n of Gal(Q_p(μ_{p^∞})/Q_p(μ_{p^n})) and ℓ_n(γ_n) := log_p χ(γ_n)/p^n, pr_n(h(y)) is the class of σ ↦ ℓ_n(γ_n)((σ − 1)/(γ_n − 1)·y − (σ − 1)b), where x_n ∈ D(T)^{ψ=0} solves (γ_n − 1)x_n = (φ − 1)y and b ∈ A ⊗ T solves (φ − 1)b = x_n; (c) cor ∘ pr_{n+1} = pr_n and pr_0 = cor_{Q_p(μ_p)/Q_p} ∘ pr_1; (d) h_{Iw,V} := h ⊗ Q is independent of the lattice; (e) the Λ_E-torsion of D(V)^{ψ=1} is V^{H_{Q_p}} and maps onto the torsion of H^1_Iw(Q_p, V); H^1_Iw(Q_p, T) has no Z_p-torsion.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** `PhiGammaModulesAndIwasawaCohomology:PG.5`; `PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex`; `PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex-h1`; `PhiGammaModulesAndIwasawaCohomology:PG.4/psi-zero-splitting`; `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex`; `PhiGammaModulesAndIwasawaCohomology:PG.1`; `SelmerIwasawaCohomology:L3/iwasawa-cohomology`; `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`; `PadicMeasuresIwasawaAlgebras:L1/convolution-algebra`; [`PadicHodgeRegulators:L1/bloch-kato-exponential`](#padichodgeregulators-l1-bloch-kato-exponential).

**Proof route.**

1. The actual comparison of the ψ-complex with Iwasawa cohomology is requested from PG.5 (its packet has the abstract ψ-complex homology only).
2. The level-n cocycle is Cherbonnier–Colmez Proposition I.4.1 and Theorem II.1.3 (ii); compatibility with corestriction is Berger's Lemma I.9.
3. Torsion: Berger Proposition II.7 (V^{H_K} ⊂ D(V)^{ψ=1} is its Λ-torsion).

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `fontaineIwasawaEquiv` | data | fontaineIwasawaEquiv T : D(T)^{ψ=1} ≃ₗ[Λ] H1Iw T. |
| `fontaineIwasawaEquiv_pr` | characterisation | pr_n (fontaineIwasawaEquiv T y) is the class of the explicit cocycle of (b). |
| `fontaineIwasawaEquiv_cor` | relation | cor ∘ pr_{n+1} = pr_n; pr_0 = cor ∘ pr_1. |
| `fontaineIwasawaEquiv_rat` | compatibility | The rationalisation is independent of T ⊂ V. |
| `fontaineIwasawaEquiv_torsion` | characterisation | Torsion of D(V)^{ψ=1} = V^{H_{Q_p}} ↦ torsion of H1Iw V. |
| `H1Iw_noZpTorsion` | other | H1Iw T has no ℤ_p-torsion. |
| `fontaineIwasawaEquiv_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `fontaineIwasawa_trivial` | computation | For V = Q_p, the class h(1) is nonzero and fixed by G_∞. |
| `fontaineIwasawa_unramified_char` | degenerate | For V = E(μ) with μ unramified nontrivial, H^1_Iw(Q_p, V) is torsion-free (Q_p(μ_{p^∞}) ∩ Q_p^ur = Q_p). |
| `fontaineIwasawa_cor_compat` | compatibility | cor_{Q_p(μ_{p^2})/Q_p(μ_p)} ∘ pr_2 ∘ h = pr_1 ∘ h, matching SelmerIwasawaCohomology's inverse system. |
| `fontaineIwasawa_not_D_itself` | non-example | h is defined on D(T)^{ψ=1}, not on D(T)^{φ=1}: for V = Q_p(1), (1 + π)/π ⊗ e_1 lies in D^{ψ=1} but not in D^{φ=1}. |

**Acceptance requirements.** V = Q_p: h(1) is a nonzero G_∞-fixed class spanning the torsion of H^1_Iw(Q_p, Q_p). h(σ_{−1}·y) = σ_{−1}·h(y) for σ_{−1} ∈ Δ with χ(σ_{−1}) = −1.

**Uses.** PadicHodgeRegulators:L3/crystalline-regulator: L_V = (Mellin^{−1} ⊗ 1)∘(1 − φ)∘h_Iw^{−1} PadicHodgeRegulators:L3/explicit-reciprocity: the Iwasawa pairing is transported through h_Iw PadicHodgeRegulators:L4/signed-local-condition: ker Col_j is exported to H^1_Iw through the proved h_Iw comparison Berger, Bloch and Kato's exponential map, Theorem II.6: exp*(h^1_{F_n}(y)) = p^{−n}∂_V(φ^{−n}y)

**Sources.**

- [CC99 (D.1)](#source-d-1-cc99), Théorème II.1.3, p. 12. The isomorphism.
- [Berger2003DM (D.1)](#source-d-1-berger2003dm), Theorem II.8, p. 118. The integral and rational forms.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [PhiGammaModulesAndIwasawaCohomology:PG.5](#request-d-1-9); [PhiGammaModulesAndIwasawaCohomology:PG.1](#request-d-1-12).

<a id="padichodgeregulators-l2-generator-independence"></a>
### Independence of the generator of Γ

`PadicHodgeRegulators:L2/generator-independence` · lemma

Assume H₀. For generators γ, γ' = γ^a (a ∈ Z_p^×) of Γ_n, u := (γ − 1)/(γ' − 1) is a unit of Λ, and the cochain map ι_{γ,γ'} := (u, u ⊕ id, id) : C_{φ,γ} → C_{φ,γ'} is an isomorphism with ℓ(γ)[c_{x,y}] = ℓ(γ')[c_{ux,y}] in H^1. Hence the level-n formula of L2/fontaine-iwasawa-map (b) does not depend on γ_n, and replacing γ by γ^a only changes the variable X = γ − 1 of Λ to (1 + X)^a − 1. For γ' = γ^m with p ∤ m, PG.3's generator map equals Q_m·ι_{γ,γ^m} on H^1.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-generator-map`; `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-generator-isomorphism`.

**Proof route.**

1. Check that (u, u ⊕ id, id) commutes with the Herr differentials d0 = (φ − 1, γ − 1) (Cherbonnier–Colmez Lemme I.4.2).
2. Λ acts on H^1 of the Herr complex through augmentation, so the integer-power generator map of PG.3 differs from ι by the scalar Q_m.

**Acceptance requirements.** γ' = γ^{−1}: u = −γ, X ↦ (1 + X)^{−1} − 1. The independence statement in Berger's Proposition I.8 is an exercise there; this node supplies it.

**Sources.**

- [CC99 (D.1)](#source-d-1-cc99), Lemme I.4.2, p. 7. The generator change.
- [Berger2003DM (D.1)](#source-d-1-berger2003dm), Proposition I.8, p. 110. The independence asserted by Berger.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-l2-root-change"></a>
### Changing the compatible system of roots of unity

`PadicHodgeRegulators:L2/root-change` · comparison

Assume H₀ and let a ∈ Z_p^×, σ_a ∈ G_∞ with χ(σ_a) = a, ε' = σ_a(ε) = ε^a. (i) The embeddings ι_ε : A_{Q_p} → Ã (π ↦ [ε] − 1) satisfy ι_{ε'} = ι_ε ∘ γ_a on A, A^+ and B^+_rig; D(T), N(T), ψ, the G_∞-action and h_{Iw,T} are unchanged. (ii) t' = a·t, e'_j = a^j e_j, ∂' = a^{−1}∂; the localisation maps ι_n are unchanged as maps (coordinates ζ' = ζ^a). (iii) For the Mellin transform M_ε(λ) = λ·(1 + π_ε): M_{ε'}(λ) = M_ε(λσ_a), so M_{ε'}^{−1} = [σ_a]^{−1}M_ε^{−1}. (iv) Twisting by e'_j is a^j times twisting by e_j. (v) Coleman power series: f^{ε'}_u(π_{ε'}) = f^ε_u(π_ε) in A^+ and Δ(f^{ε'}_u) ⊗ e'_1 = Δ(f^ε_u) ⊗ e_1.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-gamma-action`; `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-element-t`; `PadicHodgeTheory:P7:annulus-foundations/localisation-at-roots-of-unity`; `PadicMeasuresIwasawaAlgebras:L2/amice-dilation`; `PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence`; `ColemanPowerSeries:L2/coleman-interpolation-equivariance`.

**Proof route.**

1. ε enters only through π = [ε] − 1, t = log[ε], e_j and the Mellin/Coleman coordinates; Cherbonnier–Colmez's cocycle and Berger's h^1 involve γ and b only, so h_Iw is ε-free.
2. Compute each coordinate change from π_{ε'} = (1 + π_ε)^a − 1.

**Acceptance requirements.** The regulator distribution changes by [σ_a]^{−1} (Loeffler–Zerbes 2014, Remark 4.16), as L3/naturality-and-lattice records. a = −1: t' = −t and e'_1 = −e_1, so ⊗e_1 changes sign while h_Iw does not.

**Sources.**

- [LZ2014 (D.1)](#source-d-1-lz2014), Remark 4.16, p. 20. The effect of a root change on the regulator; the coordinate dictionary is derived in proofSteps (no source states it as one lemma).

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-l2-local-iwasawa-twist"></a>
### Twisting local Iwasawa cohomology by characters of G_∞

`PadicHodgeRegulators:L2/local-iwasawa-twist` · construction · `iwasawaTwist`

Assume H₀. For a continuous character η : G_∞ → O_E^×, choose n(k) ≥ k with η ≡ 1 mod p^k on Gal(Q_p(μ_{p^∞})/Q_p(μ_{p^{n(k)}})); using H^1_Iw(Q_p, T) = lim_k H^1(Q_p(μ_{p^{n(k)}}), T/p^k) define Tw_η := lim_k (x ↦ x ∪ ē_η) with ē_η ∈ H^0(Q_p(μ_{p^{n(k)}}), (O_E/p^k)(η)). Then Tw_η : H^1_Iw(Q_p, T) → H^1_Iw(Q_p, T(η)) is a well-defined O_E-linear bijection, independent of the choices, with Tw_1 = id, Tw_η ∘ Tw_η' = Tw_{ηη'}, and Tw_η(λx) = Tw_η(λ)Tw_η(x) where Tw_η(σ) = η(σ)^{−1}σ on Λ (SelmerIwasawaCohomology's convention Tw_k for η = χ^k). For ω of finite order trivial on G_{Q_p(μ_{p^n})}: pr_n(Tw_ω x) = pr_n(x) ⊗ e_ω.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** `SelmerIwasawaCohomology:L3/iwasawa-cohomology`; `SelmerIwasawaCohomology:L3/iwasawa-shapiro`; `SelmerIwasawaCohomology:L3/iwasawa-twist`; `PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom`.

**Proof route.**

1. At finite level the cup product with ē_η is an isomorphism H^1(Q_p(μ_{p^{n(k)}}), T/p^k) ≅ H^1(·, T(η)/p^k), compatible with corestriction because ē_η is restricted from lower levels modulo p^k.
2. Pass to the limit; for η = χ^j compare with Cherbonnier–Colmez Proposition II.1.2 and with the Shapiro twist of SelmerIwasawaCohomology:L3/iwasawa-shapiro.
3. SelmerIwasawaCohomology:L3/iwasawa-twist is stated for the global Q-tower; the local Q_p version is owned here.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `iwasawaTwist` | data | iwasawaTwist η : H1Iw T ≃+ H1Iw (T(η)). |
| `iwasawaTwist_smul` | relation | iwasawaTwist η (λ • x) = Tw_η(λ) • iwasawaTwist η x. |
| `iwasawaTwist_one` | simp | iwasawaTwist 1 = id. |
| `iwasawaTwist_mul` | relation | iwasawaTwist η ∘ iwasawaTwist η' = iwasawaTwist (η * η'). |
| `iwasawaTwist_pr_finite` | characterisation | For ω of finite order trivial on level n, pr_n ∘ iwasawaTwist ω = (· ⊗ e_ω) ∘ pr_n. |
| `iwasawaTwist_eq_shapiro` | compatibility | For η = χ^j, iwasawaTwist agrees with the Shapiro-lemma twist of SelmerIwasawaCohomology. |
| `iwasawaTwist_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `iwasawaTwist_inverse` | computation | iwasawaTwist η⁻¹ (iwasawaTwist η x) = x. |
| `iwasawaTwist_trivial` | degenerate | iwasawaTwist 1 x = x. |
| `iwasawaTwist_level_cyclotomic` | compatibility | For η = χ^j and n ≥ 1, pr_n(Tw_{χ^j}x) ≡ pr_n(x) ∪ ε_n^{⊗j} modulo p^n. |
| `iwasawaTwist_not_linear` | non-example | iwasawaTwist χ is not Λ-linear: iwasawaTwist χ (σ • x) = χ(σ)^{−1} σ • iwasawaTwist χ x ≠ σ • iwasawaTwist χ x for χ(σ) ≠ 1. |

**Acceptance requirements.** Tw_η ∘ Tw_{η^{−1}} = id. Tw_{χ^j}(σ_{−1}x) = (−1)^j σ_{−1}Tw_{χ^j}(x).

**Uses.** PadicHodgeRegulators:L3/meromorphic-twist-extension: L_V(z) = (ℓ_{−1}…ℓ_{−m})^{−1} Tw_{χ^m}(L_{V(m)}(z ⊗ e_m)) ⊗ t^m e_{−m} PadicHodgeRegulators:L3/ramified-interpolation: z_{η,0} is the specialisation of the twisted class PadicHodgeRegulators:L4/derham-interpolation-growth: twists by finite-order characters of conductor p^n

**Sources.**

- [CC99 (D.1)](#source-d-1-cc99), Proposition II.1.2, p. 12. The twist by χ^k.
- [LZ2014 (D.1)](#source-d-1-lz2014), Lemma 2.4, p. 7. Twisting by arbitrary characters of G_∞.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-l2-twist-compatibility"></a>
### Compatibility of h_Iw with twists

`PadicHodgeRegulators:L2/twist-compatibility` · comparison

Assume H₀. (i) D(T(η)) = D(T) ⊗ e_η with φ, ψ acting on the first factor and g(x ⊗ e_η) = η(g)g(x) ⊗ e_η, so ⊗e_η : D(T)^{ψ=1} → D(T(η))^{ψ=1} is Tw_η-semilinear. (ii) h_{Iw,T(η)}(y ⊗ e_η) = Tw_η(h_{Iw,T}(y)). (iii) For η = χ^j the level-n cocycle of h(y ⊗ e_j) is σ ↦ ℓ(γ_n)((σ − 1)/(γ_n − 1)·y(j) − (σ − 1)b) with y(j) the image of y in D(V(j))^{ψ=1} (Cherbonnier–Colmez, proof of Theorem IV.2.1). (iv) For crystalline V, N(T(j)) = π^{−j}N(T) ⊗ e_j.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L2/local-iwasawa-twist`](#padichodgeregulators-l2-local-iwasawa-twist); `PhiGammaModulesAndIwasawaCohomology:PG.1`; `PhiGammaModulesAndIwasawaCohomology:PG.6`; `PadicHodgeTheory:P7/robba-realisation-comparison`.

**Proof route.**

1. (i) is the tensor compatibility of the Fontaine equivalence (request to PG.1).
2. (ii) compare the level-k cocycles of L2/fontaine-iwasawa-map (b) with the cup product defining Tw_η; for η of finite order use Loeffler–Zerbes 2014 Lemma 2.4, in general reduce modulo p^k.
3. (iv) Berger's observation N(T(−1)) = πN(T) ⊗ e_{−1}, iterated (Wach modules from PG.6).

**Acceptance requirements.** η = χ: h(y ⊗ e_1) = Tw_χ h(y). For V = Q_p, N(Z_p(1)) = π^{−1}N(Z_p) ⊗ e_1 = π^{−1}A^+ ⊗ e_1.

**Sources.**

- [CC99 (D.1)](#source-d-1-cc99), Proof of Théorème IV.2.1, p. 21. (i) and (iii).
- [Berger2003DM (D.1)](#source-d-1-berger2003dm), Appendix A, p. 124. (iv).

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [PhiGammaModulesAndIwasawaCohomology:PG.6](#request-d-1-10); [PhiGammaModulesAndIwasawaCohomology:PG.1](#request-d-1-12).

<a id="padichodgeregulators-l2-wach-psi-fixed-vectors"></a>
### Berger: ψ-fixed vectors lie in the Wach module

`PadicHodgeRegulators:L2/wach-psi-fixed-vectors` · theorem

Assume H₀ and let V be E-linear crystalline with Hodge–Tate weights in [a; b], T ⊂ V a G-stable O_E-lattice and N(T) its Wach module (PG.6). (i) D(T)^{ψ=1} ⊂ π^{a−1}N(T). (ii) If V has no quotient isomorphic to E(a), then D(T)^{ψ=1} ⊂ π^a N(T). (iii) In particular, if a ≥ 0 and V has no quotient isomorphic to E (equivalently, as a Q_p-representation, no quotient Q_p), then ψ(N(T)) ⊂ N(T), N(T)^{ψ=1} = D(T)^{ψ=1}, N(V)^{ψ=1} = D(V)^{ψ=1}, and h_Iw restricts to Λ-isomorphisms N(T)^{ψ=1} ≅ H^1_Iw(Q_p, T) and N(V)^{ψ=1} ≅ H^1_Iw(Q_p, V).

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T). V crystalline with weights in [a; b]; for (iii) a ≥ 0 and no quotient E.

**Prerequisites.** `PhiGammaModulesAndIwasawaCohomology:PG.6`; `PhiGammaModulesAndIwasawaCohomology:PG.4`; [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L2/twist-compatibility`](#padichodgeregulators-l2-twist-compatibility); `PadicHodgeTheory:P7/wach-dcris-comparison`; `PadicHodgeTheory:R06.1/fundamental-exact-sequence`; `PadicHodgeTheory:R06.2/period-functors`; `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

**Proof route.**

1. Twist to weights in [0; b − a] (L2/twist-compatibility (iv)).
2. Berger Lemmas A.4–A.7: ψ(π^{−m}) = π^{−m}(p^{m−1} + πQ_m(π)) and D(T)^{ψ=1} ⊂ π^{−1}N(T) for weights ≥ 0 (where N(T) ⊂ φ^*N(T) gives ψ(N(T)) ⊂ N(T)).
3. If an element of D(T)^{ψ=1} had a pole of order one, its leading coefficient would give a nonzero vector of D_cris(V)^{φ=1} = (N(V)/πN(V))^{φ=1}; for weights ≥ 0 such a vector forces a quotient Q_p (an eigenvalue 1 in D_cris(V^*) with Fil^0 = everything gives (V^*)^{G} ≠ 0 by the fundamental exact sequence) — this is the step Berger states without proof.
4. Combine with L2/fontaine-iwasawa-map.

**Acceptance requirements.** V = E(1) (a = 1): (1 + π)/π ⊗ e_1 ∈ D(V)^{ψ=1} ∩ N(V). V = E (a = 0, quotient E): 1/π ∈ D(E)^{ψ=1} ∖ A^+, so the hypothesis of (ii) and the exponent a − 1 in (i) are sharp.

**Sources.**

- [Berger2003DM (D.1)](#source-d-1-berger2003dm), Theorem A.3, p. 124. The theorem.
- [LLZWach (D.1)](#source-d-1-llzwach), §1, p. 4. Form (iii), used by the L3 regulator.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [PhiGammaModulesAndIwasawaCohomology:PG.6](#request-d-1-10); [PhiGammaModulesAndIwasawaCohomology:PG.4](#request-d-1-11).

<a id="padichodgeregulators-l2-character-specialisation"></a>
### Specialisation of Iwasawa classes at characters

`PadicHodgeRegulators:L2/character-specialisation` · construction · `charSpecialization`

Assume H₀. For x ∈ H^1_Iw(Q_p, T) and a continuous character η of G_∞, put x_η := Tw_{η^{−1}}(x) ∈ H^1_Iw(Q_p, T(η^{−1})) and x_{η,n} := pr_n(x_η) ∈ H^1(Q_p(μ_{p^n}), T(η^{−1})). (a) (λx)_{η,0} = η(λ)x_{η,0} for λ ∈ Λ. (b) If x = h_Iw(y) and η = χ^jω with ω of conductor p^m, then for n ≥ max(m, 1): x_{η,n} = pr_n(h_{Iw,T(η^{−1})}(y ⊗ e_{−j} ⊗ e_{ω^{−1}})) and x_{η,0} = cor_{Q_p(μ_{p^n})/Q_p}(x_{η,n}), independent of n. (c) With T' = T(η^{−1}): 0 → (H^1_Iw(T')_{Γ_1})^Δ → H^1(Q_p, T') → (H^2_Iw(T')^{Γ_1})^Δ → 0.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L2/local-iwasawa-twist`](#padichodgeregulators-l2-local-iwasawa-twist); [`PadicHodgeRegulators:L2/twist-compatibility`](#padichodgeregulators-l2-twist-compatibility); `SelmerIwasawaCohomology:L3/iwasawa-descent`; `PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom`.

**Proof route.**

1. (a) from L2/local-iwasawa-twist's semilinearity and the projection to level 0.
2. (b) from L2/twist-compatibility (ii) and the corestriction compatibility of L2/fontaine-iwasawa-map (c).
3. (c) is SelmerIwasawaCohomology:L3/iwasawa-descent for Γ_1 ≅ Z_p followed by Δ-invariants (|Δ| = p − 1 prime to p).

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `charSpecialization` | data | charSpecialization η : H1Iw T →ₗ[O_E] H^1(ℚ_p, T(η⁻¹)). |
| `charSpecialization_smul` | relation | charSpecialization η (λ • x) = η(λ) • charSpecialization η x. |
| `charSpecialization_fontaine` | characterisation | charSpecialization η (h y) = cor (pr_n (h (y ⊗ e_{−j} ⊗ e_{ω⁻¹}))) for n ≥ max(m,1). |
| `charSpecialization_descent` | relation | The descent exact sequence (c). |
| `charSpecialization_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `charSpecialization_trivial` | computation | charSpecialization 1 = pr_0. |
| `charSpecialization_zero` | degenerate | charSpecialization η 0 = 0. |
| `charSpecialization_level_independence` | compatibility | For ω of conductor p, the formula of (b) gives the same class for n = 1 and n = 2. |
| `charSpecialization_not_equivariant` | non-example | charSpecialization χ is not Λ-linear into a Λ-module: σ_{−1} acts on the target through χ(σ_{−1}) = −1. |

**Acceptance requirements.** x_{1,0} = pr_0 x. (σ_{−1}x)_{χ,0} = −x_{χ,0}.

**Uses.** PadicHodgeRegulators:L3/ramified-interpolation: z_{η,0} in the interpolation formula at η = χ^jω PadicHodgeRegulators:L3/unramified-interpolation: z_{χ^j,0} at unramified characters PadicHodgeRegulators:L4/derham-regulator: specialisation of Iwasawa classes for de Rham modules

**Sources.**

- [LZ2014 (D.1)](#source-d-1-lz2014), Definition 4.14, p. 20. The specialisation.
- [Berger2003DM (D.1)](#source-d-1-berger2003dm), §II, p. 118. The level-n projection through h^1.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-l2-lattice-and-coefficient-squares"></a>
### Lattice and coefficient-change squares

`PadicHodgeRegulators:L2/lattice-and-coefficient-squares` · comparison

Assume H₀. (a) For lattices U ⊂ T ⊂ V: D(U) ⊂ D(T) ⊂ D(V) compatibly with φ, ψ, G_∞ and h_Iw; H^1_Iw(Q_p, T) → H^1_Iw(Q_p, V) is injective with image h(D(V)^{ψ=1} ∩ D(T)); N(U) = N(V) ∩ D(U), and U ↦ N(U) is an inclusion-preserving bijection between G-stable lattices and Wach lattices in N(V); under L2/wach-psi-fixed-vectors (iii), H^1_Iw(Q_p, T) = h(N(T)^{ψ=1}). (b) For E'/E finite, D, N, ψ, H^1_Iw, h, Λ and the Mellin transform commute with O_{E'} ⊗_{O_E} −; restriction of scalars to Z_p changes none of D, ψ, h.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).

**Prerequisites.** [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L2/wach-psi-fixed-vectors`](#padichodgeregulators-l2-wach-psi-fixed-vectors); `PhiGammaModulesAndIwasawaCohomology:PG.1`; `PhiGammaModulesAndIwasawaCohomology:PG.5`; `PhiGammaModulesAndIwasawaCohomology:PG.6`; `PadicHodgeTheory:P7/integral-dcris-lattice`; `PadicHodgeTheory:P7:annulus-foundations/coefficient-extension`; `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-amice`.

**Proof route.**

1. (a) N(T) = N(V) ∩ D(T) and the lattice bijection are Berger, Limites, Lemma II.1.3 and Proposition III.4.2 (requested from PG.6); injectivity on H^1_Iw holds because H^1_Iw(T) has no Z_p-torsion.
2. (b) Each construction is O_E-linear and commutes with finite flat base change; Lei–Loeffler–Zerbes §2.2–2.3 record the E-linear forms.

**Acceptance requirements.** For T = Z_p(1) ⊂ V: H^1_Iw(Q_p, Z_p(1)) = h(N(Z_p(1))^{ψ=1}). Changing T to pT multiplies h(D(T)^{ψ=1}) by p.

**Sources.**

- [LLZWach (D.1)](#source-d-1-llzwach), §2.2, p. 8. Lattices of Wach modules.
- [Limites2004 (D.1)](#source-d-1-limites2004), Proposition III.4.2, p. 21. The lattice bijection.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [PhiGammaModulesAndIwasawaCohomology:PG.5](#request-d-1-9); [PhiGammaModulesAndIwasawaCohomology:PG.6](#request-d-1-10); [PhiGammaModulesAndIwasawaCohomology:PG.1](#request-d-1-12).

<a id="padichodgeregulators-l2-kummer-coleman-comparison"></a>
### Kummer classes and Coleman power series

`PadicHodgeRegulators:L2/kummer-coleman-comparison` · comparison

Assume H₀ with T = Z_p(1). For a norm-compatible system u ∈ U_∞ of principal units of the tower Q_p(μ_{p^n}) with Coleman power series f_u (f_u(ε^{(n)} − 1) = u_n), Δ(f_u) := (1 + π)f_u'/f_u lies in A^{ψ=1}, and h_{Iw,Z_p(1)}(Δ(f_u) ⊗ e_1) = s·κ(u), where κ : U_∞ → H^1_Iw(Q_p, Z_p(1)) is the Kummer map of SelmerIwasawaCohomology (cocycle τ ↦ τ(α)/α) and s ∈ {±1} is a sign whose value remains to be checked against Cherbonnier–Colmez's Proposition V.3.2 iii) and the cocycle of L2/fontaine-iwasawa-map (b). Independently of that sign, Δ(f_u) ⊗ e_1 ∈ N(Z_p(1))^{ψ=1}, and by L2/root-change (v) the element is independent of ε.

**Hypotheses.** p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ = Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T). T = Z_p(1).

**Prerequisites.** [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L2/root-change`](#padichodgeregulators-l2-root-change); [`PadicHodgeRegulators:L2/wach-psi-fixed-vectors`](#padichodgeregulators-l2-wach-psi-fixed-vectors); `ColemanPowerSeries:L1/coleman-equivalence`; `ColemanPowerSeries:L2/logarithmic-derivative`; `ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map`; `SelmerIwasawaCohomology:L4/local-units-iwasawa-cohomology`; `SelmerIwasawaCohomology:L0/kummer-limit-map`.

**Proof route.**

1. ψ(Δ f_u) = Δ f_u (ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map).
2. Cherbonnier–Colmez V.3.2 iii) identify Exp*(δ(u)) with ι̂(u)^{−1}∇ι̂(u); compare their δ with the Kummer cocycle τ ↦ τ(α)/α: with τ[u_n] = [ε]^{c(τ)}[u_n], (1 − τ)(log[u_n]·t^{−1} ⊗ e_1) = −c(τ)e_1, which suggests a minus sign but does not settle the comparison of CC99’s δ with the supplier’s Kummer convention (recorded gap).
3. Membership in N(Z_p(1)) follows from L2/wach-psi-fixed-vectors (iii) applied to Z_p(1) (weights ≥ 0, no quotient Q_p).

**Acceptance requirements.** The sign s is the input of L3/tate-coleman-comparison (Col = −Col_0 there). For a = 1 + p and the norm-compatible principal units u_n = (ζ_{p^n}^a − 1)/(ζ_{p^n} − 1), f_u(π) = ((1 + π)^a − 1)/π and Δ(f_u) = a(1 + π)^a/((1 + π)^a − 1) − (1 + π)/π is explicit.

**Sources.**

- [CC99 (D.1)](#source-d-1-cc99), Proposition V.3.2 iii), p. 27. The rank-one comparison.
- [CC99 (D.1)](#source-d-1-cc99), §V.3, p. 27. Cherbonnier–Colmez's normalisation of δ_n, whose sign against the Kummer cocycle is computed in proofSteps (sourceIssues).

**Open obligations.** [Sign of Cherbonnier–Colmez's δ_n against the Kummer cocycle](#gap-d-1-3); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

### Completion obligations for L2

- Requests to PhiGammaModulesAndIwasawaCohomology PG.1, PG.4, PG.5, PG.6 (their packet has nodes only in PG.3–PG.5).
- Fix the sign of Cherbonnier–Colmez's δ_n (gap).

<a id="layer-d-1"></a>
## D.1: Local and semilocal dilogarithms

Import the upstream local-field unit and Frobenius structure, and compare it to the pinned Teichmüller section and Coleman branch. Extend the field dilogarithm componentwise to finite étale algebras and then use the upstream semilocal equivalence for number fields. Keep admissible points, free symbols and Bloch classes distinct. The normalization dictionary connects field regulators to L1; the unit-logarithm matrix and norm-to-trace identity provide independent checks.

**Atlas landmarks:** p-adic dilogarithm D_p on étale algebras; Combined p-adic dilogarithm D_p.

<a id="padichodgeregulators-d-1-teichmuller-unit-decomposition"></a>
### Teichmüller decomposition of the units of a local field

`PadicHodgeRegulators:D.1/teichmuller-unit-decomposition` · comparison

Let L be a nonarchimedean local field with valuation ring O_L, maximal ideal m_L and residue field F_q, q = p^f. Write ω = TauCeti.teichmuller L : F_q^× → O_L^× for the Teichmüller lift and U^1_L = 1 + m_L for the principal units. Then every u ∈ O_L^× factors uniquely as u = ω(ū)·⟨u⟩ with ū the residue of u and ⟨u⟩ := u·ω(ū)^{-1} ∈ U^1_L, so that O_L^× = μ_{q-1}(O_L) × U^1_L is an internal direct product; u ↦ ⟨u⟩ is a continuous group homomorphism onto U^1_L. The decomposition is natural for continuous field embeddings L → L' of local fields and for automorphisms of L, and, if L is a finite extension of Q_p, for every branch log_a of the p-adic logarithm (ColemanIntegration:L0/log-branch) one has log_a(u) = log(⟨u⟩), the series logarithm of the principal-unit part, because log_a vanishes on roots of unity.

**Hypotheses.** L is a nonarchimedean local field of residue characteristic p (Mathlib's IsNonarchimedeanLocalField with Tau Ceti's valuative structure). For the logarithm clause, L is identified with a subfield of C_p by a continuous embedding. The logarithm clause is only for mixed characteristic L/Q_p finite. The unit decomposition is imported from LocalFieldsRamification Layer 1, not replanned here.

**Prerequisites.** `tauceti:TauCeti.teichmuller`; `tauceti:TauCeti.range_teichmuller`; `tauceti:TauCeti.residue_teichmuller`; `tauceti:TauCeti.eq_teichmuller`; `ColemanIntegration:L0/log-branch`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Proof route.**

1. Import the unit filtration and Teichmüller decomposition of LocalFieldsRamification Layer 1. The following steps check its agreement with the pinned Tau Ceti section and with the regulator branch.
2. The residue map O_L^× → F_q^× is a surjective homomorphism with kernel U^1_L; TauCeti.residue_teichmuller says ω is a section, so u·ω(ū)^{-1} has residue 1 and lies in U^1_L.
3. Uniqueness: if ζ·v = ζ'·v' with ζ, ζ' ∈ μ_{q-1} and v, v' ∈ U^1_L, then ζ'^{-1}ζ ∈ μ_{q-1} ∩ U^1_L = {1}, since a (q−1)-torsion principal unit reduces to 1 and TauCeti.eq_teichmuller forces it to be ω(1) = 1. TauCeti.range_teichmuller identifies the first factor with μ_{q-1}(O_L).
4. Naturality: a continuous embedding L → L' maps O_L into O_{L'}, induces F_q → F_{q'} on residues, and sends (q−1)-torsion units to (q'−1)-torsion units; TauCeti.eq_teichmuller in L' identifies the image of ω_L(α) with ω_{L'}(ᾱ).
5. Logarithm: log_a is a homomorphism vanishing at roots of unity (ColemanIntegration:L0/log-branch), so log_a(u) = log_a(ω(ū)) + log_a(⟨u⟩) = log(⟨u⟩), and on U^1_L the branch agrees with the series.

**Acceptance requirements.** For L = Q_5 and u = 7: ū = 2, ω(2) is the unique 4th root of unity ≡ 2 mod 5, and ⟨7⟩ = 7·ω(2)^{-1} ≡ 1 mod 5. μ_{q-1}(O_L) ∩ U^1_L = {1}: a decomposition with a nontrivial root of unity in the principal-unit factor is rejected. For p = 2 and L = Q_2 the first factor is trivial (q − 1 = 1) and −1 lies in U^1_{Q_2}: the factor of order prime to p does not contain the 2-power roots of unity.

**Sources.**

- [TauCetiTeichmuller (D.1)](#source-d-1-taucetiteichmuller), TauCeti/NumberTheory/LocalField/Teichmuller.lean, module docstring (pinned commit f790474). The library supplies the Teichmüller section; this node states the resulting internal product decomposition that the layer needs.
- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §3.1, (176), p. 38. The regulator calculation works with the Teichmüller (order prime to p) roots of unity and principal units separately.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group](#request-d-1-15).

<a id="padichodgeregulators-d-1-unramified-frobenius-on-roots"></a>
### Frobenius on the roots of unity of an unramified field

`PadicHodgeRegulators:D.1/unramified-frobenius-on-roots` · lemma

Let L be a finite unramified extension of Q_p with residue field F_q and let φ_L be its arithmetic Frobenius, the unique field automorphism of L over Q_p whose reduction is x ↦ x^p on F_q (an arithmetic Frobenius in the sense of IsArithFrobAt for the extension O_L/Z_p). Then φ_L(ω(α)) = ω(α^p) for every α ∈ F_q^×, hence φ_L(ζ) = ζ^p for every ζ ∈ μ_{q-1}(L); for p odd μ(L) = μ_{q-1}(L), so φ_L(ζ) = ζ^p for every root of unity of L. For a finite product L = ∏_i L_i of such fields put φ_L := ∏_i φ_{L_i}; then φ_L(ζ) = ζ^p componentwise. This is the rank-one relation φ_p ζ = ζ^p of GSWZ (176).

**Hypotheses.** L/Q_p finite unramified (ramification index one); p any prime for the first two assertions, p odd for μ(L) = μ_{q−1}(L).

**Prerequisites.** [`PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`](#padichodgeregulators-d-1-teichmuller-unit-decomposition); `tauceti:TauCeti.eq_teichmuller`; `mathlib:IsArithFrobAt`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Proof route.**

1. φ_L(ω(α)) is a (q−1)-torsion unit reducing to α^p, so it equals ω(α^p) by TauCeti.eq_teichmuller; and ω(α)^p is also (q−1)-torsion with residue α^p.
2. For p odd an unramified L contains no nontrivial p-power root of unity (Q_p(ζ_p)/Q_p is totally ramified of degree p − 1 > 1), so μ(L) = μ_{q−1}(L).
3. On a finite product, Frobenius and the Teichmüller lift are taken componentwise.

**Acceptance requirements.** L = Q_{25} (p = 5): φ_L has order 2 and fixes exactly μ_4 ⊂ μ_{24}. For p = 2 and L = Q_2, −1 ∈ μ(L) is not of order prime to 2; the identity φ(ζ) = ζ^2 fails for ζ = −1, so the odd-p hypothesis is needed for the full μ(L).

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §3.1, (176), p. 38. The relation stated here, extended to finite products of unramified fields.
- [TauCetiTeichmuller (D.1)](#source-d-1-taucetiteichmuller), TauCeti/NumberTheory/LocalField/Teichmuller.lean, eq_teichmuller. The uniqueness used to identify φ(ω(α)) with ω(α^p).

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius](#request-d-1-16).

<a id="padichodgeregulators-d-1-etale-algebra-dilogarithm"></a>
### Coleman's p-adic dilogarithm on a finite étale Q_p-algebra

`PadicHodgeRegulators:D.1/etale-algebra-dilogarithm` · construction · `etaleDilog`

Let A be a finite étale Q_p-algebra, with its canonical decomposition A = ∏_{i∈I} A_i into finite field extensions A_i/Q_p (the primitive idempotents). Put A^adm := {z ∈ A : z_i ∉ {0, 1} for every i}. For a finite extension M/Q_p and x ∈ M ∖ {0, 1} define D_M(x) := ι^{-1}(D^0(ι(x))) for any Q_p-embedding ι : M → C_p, where D^0(z) = Li_2(z) + ½·log_p(z)·log_p(1 − z) is Coleman's dilogarithm for the Iwasawa branch log_p(p) = 0 (ColemanIntegration:L2/dilogarithm-identities with a = 0); it lies in M and does not depend on ι. Define D_A : A^adm → A by D_A(z) := (D_{A_i}(z_i))_{i∈I}, and extend it additively to D_A : Z[A^adm] → A on the free abelian group of formal symbols [z]. This is GSWZ's D_p of (174) applied factor by factor.

**Hypotheses.** A is a finite étale (equivalently finite reduced) commutative Q_p-algebra; p is any prime. The branch of the logarithm is the Iwasawa branch log_p(p) = 0 (ColemanIntegration:L0/iwasawa-logarithm).

**Prerequisites.** `ColemanIntegration:L2/dilogarithm-identities`; `ColemanIntegration:L0/iwasawa-logarithm`; `ColemanIntegration:L2/galois-equivariance`; `ColemanIntegration:L2/values-in-finite-extensions`; `mathlib:PadicComplex`; `mathlib:FreeAbelianGroup`.

**Proof route.**

1. Values in M: D^0 maps M ∖ {0,1} into M for every finite M ⊂ C_p (ColemanIntegration:L2/values-in-finite-extensions with a = 0).
2. Independence of ι: two embeddings differ by a continuous automorphism σ of C_p over Q_p, and σ(D^0(z)) = D^0(σ z) because the Iwasawa branch is Galois equivariant (ColemanIntegration:L2/galois-equivariance and L2/dilogarithm-identities (f)).
3. The decomposition of A into fields is canonical, so D_A is well defined; additivity defines it on the free abelian group.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `etaleDilog` | data | etaleDilog A : A → A is a componentwise total extension of the map on A^adm, assigning 0 at 0 and 1 in each field factor. Only its restriction to A^adm has mathematical content; it is not required to be zero as an entire vector whenever one component is inadmissible. |
| `etaleAdmissible` | other | etaleAdmissible z : every component of z differs from 0 and 1 (the domain A^adm). |
| `etaleDilog_apply_pi` | simp | For A = ∏_i A_i and admissible z, (etaleDilog A z)_i = etaleDilog A_i z_i. |
| `etaleDilog_field` | compatibility | For a finite field extension M ⊂ C_p of Q_p and x ∈ M ∖ {0,1}, etaleDilog M x = D^0(x), Coleman's D for the Iwasawa branch. |
| `etaleDilog_map` | functoriality | For a Q_p-algebra homomorphism f : A → B of finite étale algebras with f(A^adm) ⊆ B^adm, etaleDilog B (f z) = f (etaleDilog A z). |
| `etaleDilog_one_sub` | relation | etaleDilog A (1 − z) = −etaleDilog A z for admissible z. |
| `etaleDilog_inv` | relation | etaleDilog A z⁻¹ = −etaleDilog A z for admissible z. |
| `etaleDilog_fiveTerm` | relation | For x, y ∈ A^adm with x − y a unit, D(x) − D(y) + D(y/x) − D((1 − x⁻¹)/(1 − y⁻¹)) + D((1 − x)/(1 − y)) = 0 componentwise (ColemanIntegration:L2/five-term-relation). |
| `etaleDilog_rootOfUnity` | simp | For ζ ∈ A with ζ^m = 1 and all components ≠ 1, etaleDilog A ζ = (Li_2(ζ_i))_i, since log_p vanishes on roots of unity. |
| `etaleDilogHom` | constructor | The additive extension FreeAbelianGroup A^adm →+ A, [z] ↦ etaleDilog A z. |
| `etaleDilog_extensionality` | extensionality | Two dilogarithm values in a finite product agree iff all component values agree. The additive extension is determined by its values on admissible FreeAbelianGroup generators; it preserves zero and addition, whereas D_A on admissible points is not an additive map. |
| `etaleDilogHom_of` | simp | etaleDilogHom D (FreeAbelianGroup.of z) = etaleDilog D z.val for z∈A^adm. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `etaleDilog_neg_one` | computation | For p odd, etaleDilog Q_p (−1) = 0: the inversion relation gives D(−1) = −D(−1). |
| `etaleDilog_teichmuller_two_mod` | computation | For p = 5 and ω = TauCeti.teichmuller Q_5 2 (a primitive 4th root of unity), etaleDilog Q_5 ω ∈ 25·Z_5 and etaleDilog Q_5 ω ≡ 25 mod 125 (by D.3/finite-polylogarithm-reduction, since li_{2,5}(2) = 1 in F_5); this is the Q_5-component of D_5(ζ_24) in GSWZ (273). |
| `etaleDilog_zero_algebra` | degenerate | For the zero algebra A = 0 (empty product), A^adm = {0} and etaleDilog A 0 = 0. |
| `etaleDilog_diag` | compatibility | For the diagonal Q_p → Q_p × Q_p and x ∉ {0,1}, etaleDilog (Q_p × Q_p) (x, x) = (D^0(x), D^0(x)), agreeing with ColemanIntegration's D^0. |
| `etaleDilog_not_branch_one` | non-example | With the branch log_1 (log_1(p) = 1) instead of the Iwasawa branch, D^1(p) − D^0(p) = ½·log_p(1 − p) ≠ 0 (ColemanIntegration:L2/dilogarithm-identities (d)); a definition with an unpinned branch is wrong at z = p ∈ Q_p^adm. |

**Acceptance requirements.** For A = Q_p × Q_p and z = (x, y), D_A(z) = (D(x), D(y)). D_A is defined at z = (−1, 2) ∈ Q_5 × Q_5 but not at (1, 2): admissibility is componentwise.

**Uses.** GSWZ §3.1, paragraph after (174): the functions D_σ for the embeddings σ : K → C_p are combined into one map with values in K_p, factor by factor PadicHodgeRegulators:D.3/local-regulator: the regulator on completed K_3 of an unramified algebra is compared with D_A on symbols of special units and of roots of unity HabiroNumberFields:HB.7/pochhammer-sections: the factor exp(−Li_2(ζ)/(m² log q)) of the explicit sections is D_A(ζ) for roots of unity HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm: the potential specialises to φ_p(D_p(ξ))/p − p·D_p(ξ) with D_p evaluated componentwise

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §3.1, (174), p. 37. The function D^0 used factor by factor.
- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §3.1, paragraph after (174), p. 38. The combination into an algebra-valued map; here it is done for any finite étale Q_p-algebra.
- [BdJ2003 (D.1)](#source-d-1-bdj2003), §1, after Remark 1.5 (Galois equivariance), p. 3. Values in the field of the argument, for a branch with log p = 0.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-1-dilogarithm-scalar-extension"></a>
### Frobenius and extension-of-scalars squares for the p-adic dilogarithm

`PadicHodgeRegulators:D.1/dilogarithm-scalar-extension` · lemma

Let A → B be an injective homomorphism of finite étale Q_p-algebras (for instance K ⊗ Q_p → K' ⊗ Q_p for an extension of number fields K ⊂ K', or the inclusion of a factor-wise extension of local fields). (a) Extension of scalars: for z ∈ A^adm, D_B(ι z) = ι(D_A(z)). (b) Automorphisms: for every Q_p-algebra automorphism τ of A, D_A(τ z) = τ(D_A(z)); in particular, for a finite unramified product A with Frobenius φ_A (D.1/unramified-frobenius-on-roots), D_A(φ_A z) = φ_A(D_A(z)) and D_A(ζ^p) = φ_A(D_A(ζ)) for every root of unity ζ of order prime to p with all components ≠ 1. (c) Trace: if B is free over A, then Tr_{B/A}(D_B(ι z)) = [B : A]·D_A(z) for z ∈ A^adm. (d) Frobenius-modified value: for A unramified and ζ ∈ μ(A) of order prime to p with all components ≠ 1, (1 − p^{-2}φ_A)(D_A(ζ)) = ℓ_2(ζ), the integral modified dilogarithm of ColemanIntegration:L2/integral-modified-polylogarithm, which lies in O_A. (e) Frobenius behaviour on residue discs of special units: for p odd, A unramified and z ∈ O_A with z and 1 − z units in every factor, D_A(z) − p^{−2}D_A(z^p) = Li^{(p)}_2(z) − ½·log_p(z)·Li^{(p)}_1(z) componentwise, and this lies in O_A (Li^{(p)}_k = ℓ_k is bounded by 1 off the residue disc of 1, and log_p(z) ∈ pO_A).

**Hypotheses.** A, B finite étale Q_p-algebras; the Iwasawa branch throughout. In (b) for Frobenius and in (d), A is a finite product of finite unramified extensions of Q_p.

**Prerequisites.** [`PadicHodgeRegulators:D.1/etale-algebra-dilogarithm`](#padichodgeregulators-d-1-etale-algebra-dilogarithm); [`PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`](#padichodgeregulators-d-1-unramified-frobenius-on-roots); `ColemanIntegration:L2/galois-equivariance`; `ColemanIntegration:L2/values-at-tame-roots-of-unity`; `ColemanIntegration:L2/integral-modified-polylogarithm`; `ColemanIntegration:L2/frobenius-relation`; [`PadicHodgeRegulators:D.1/unit-logarithm-kernel`](#padichodgeregulators-d-1-unit-logarithm-kernel); `mathlib:Algebra.trace`.

**Proof route.**

1. (a) and (b) are etaleDilog_map applied to the injection and to τ; the decomposition of A and B into fields is respected by algebra maps, and on each factor the claim is Galois equivariance of D^0 for the Iwasawa branch.
2. For Frobenius, φ_A(ζ) = ζ^p (D.1/unramified-frobenius-on-roots), so D_A(ζ^p) = D_A(φ_A ζ) = φ_A D_A(ζ).
3. (c) Tr_{B/A}∘ι is multiplication by the rank on ι(A).
4. (d) D(ζ) = Li_2(ζ) since log_p ζ = 0; ColemanIntegration:L2/values-at-tame-roots-of-unity (a) with k = 2 gives Li_2(ζ) − p^{-2}Li_2(ζ^p) = ℓ_2(ζ), and Li_2(ζ^p) = φ_A(Li_2(ζ)) by (b).
5. (e) is ColemanIntegration:L2/dilogarithm-identities (e) on each factor, with ColemanIntegration:L2/frobenius-relation identifying Li^{(p)}_k with the integral function ℓ_k on P¹ ∖ D⁻(1,1) and D.1/unit-logarithm-kernel giving log_p(z) ∈ pO_A.

**Acceptance requirements.** For A = Q_{25}, p = 5, ζ = ζ_24: D(ζ_24^5) = φ(D(ζ_24)), checked on the expansions of GSWZ (273) as a 5-adic identity in Z_{25}. (1 − p^{-2}φ)D(ζ) is a unit multiple of ℓ_2(ζ) ∈ O_A, while D(ζ) ∈ p²O_A: the two normalisations differ by a factor of p² in the lattice they generate.

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §3.1, (176), p. 38. The Frobenius compatibility on roots of unity.
- [BdJ2003 (D.1)](#source-d-1-bdj2003), Remark 1.13, p. 6. Frobenius equivariance at roots of unity of order prime to p.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-1-combined-dilogarithm"></a>
### The combined p-adic dilogarithm of a number field

`PadicHodgeRegulators:D.1/combined-dilogarithm` · construction · `blochDilog`

Let K be a number field, p a prime and K_p := K ⊗_Q Q_p, a finite étale Q_p-algebra identified with ∏_{v|p} K_v by Tau Ceti's semilocal equivalence (NumberFieldArithmetic layer 5). Define D_{K,p} on the free abelian group Z[K^×] by [z] ↦ D_{K_p}(z ⊗ 1) for z ≠ 1 (D.1/etale-algebra-dilogarithm; z ⊗ 1 is admissible) and [1] ↦ 0. Its v-component is D_σ([z]) = D^0(σ_v(z)) for the embedding σ_v : K → K_v ⊂ C_p, as in GSWZ §3.1. D_{K,p} kills the five-term relations, hence factors through the pre-Bloch group P(K) of K3BlochGroups:V.3/pre-bloch-group, and restricts to D_{K,p} : B(K) → K_p on Suslin's Bloch group. On B(K) the map does not depend on the branch of the logarithm used to define D.

**Hypotheses.** K a number field, p any prime; the integrality statements of D.3–D.4 add p > 3 unramified in K. The Iwasawa branch is used to define D; branch independence is asserted only on B(K).

**Prerequisites.** [`PadicHodgeRegulators:D.1/etale-algebra-dilogarithm`](#padichodgeregulators-d-1-etale-algebra-dilogarithm); `K3BlochGroups:V.3/pre-bloch-group`; `K3BlochGroups:V.3/bloch-group`; `K3BlochGroups:V.3/five-term-relation`; `ColemanIntegration:L2/five-term-relation`; `ColemanIntegration:L2/dilogarithm-identities`; `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Proof route.**

1. The five-term relation of ColemanIntegration:L2/five-term-relation holds in every factor K_v ⊂ C_p, so the additive extension kills the five-term subgroup and descends to P(K).
2. Branch independence on B(K): by ColemanIntegration:L2/dilogarithm-identities (d), D^a(z) − D^b(z) = ½(a − b)·Φ(z ∧ (1 − z)) with Φ(x ∧ y) = v(x)·log_b(y) − v(y)·log_b(x) an alternating biadditive form; it vanishes on the kernel of the boundary, which is B(K) (for Suslin's antisymmetric target, Φ factors through it since Φ(x ∧ x) = 0).
3. The identification of components with the D_σ is the definition of the semilocal equivalence.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `combinedDilog` | data | combinedDilog K p : FreeAbelianGroup Kˣ →+ K ⊗[ℚ] ℚ_[p], with [1] ↦ 0. |
| `combinedDilog_of` | simp | combinedDilog K p [z] = etaleDilog (K ⊗ ℚ_[p]) (z ⊗ 1). |
| `combinedDilog_component` | projection | Under K ⊗ Q_p ≅ ∏_{v\|p} K_v, the v-component of combinedDilog K p [z] is D^0(σ_v z). |
| `combinedDilog_fiveTerm` | relation | combinedDilog vanishes on the five-term subgroup, giving preBlochDilog K p : P(K) →+ K ⊗ Q_p. |
| `blochDilog` | constructor | blochDilog K p : B(K) →+ K ⊗ Q_p, the restriction of preBlochDilog to Suslin's Bloch group. |
| `blochDilog_branch_indep` | characterisation | For any branch parameter a ∈ Q_p, the Bloch-group map built from D^a equals blochDilog K p. |
| `blochDilog_map` | functoriality | For a field embedding K → K', blochDilog K' p ∘ B(ι) = (ι ⊗ 1) ∘ blochDilog K p. |
| `blochDilog_galois` | functoriality | For τ ∈ Aut(K), blochDilog K p ∘ B(τ) = (τ ⊗ 1) ∘ blochDilog K p. |
| `combinedDilog_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `combinedDilog_rat` | compatibility | For K = Q, combinedDilog Q p [z] = D^0(z) ∈ Q_p, the ColemanIntegration value. |
| `combinedDilog_zero` | degenerate | combinedDilog K p 0 = 0, and blochDilog vanishes on the subgroup generated by [x] + [x⁻¹] for x ≠ 0, 1. |
| `blochDilog_cubic_five` | computation | For K = Q(α), α³ − α² + 1 = 0, ξ = 2[1 − α²] + [1 − α] ∈ B(K) and p = 5, blochDilog K 5 ξ = (3·5² + 5³ + 2·5⁴ + …)α² + (5² + 3·5³ + …)α + (2·5² + 3·5³ + …), GSWZ (271). |
| `combinedDilog_not_on_bloch_branch` | non-example | On the pre-Bloch group the map depends on the branch: for p odd the symbol [p] ∈ P(Q) has D^1([p]) − D^0([p]) = ½·log_p(1 − p) ≠ 0, so branch independence is not asserted off B(K) ([p] ∉ B(Q) since p ∧ (1 − p) ≠ 0). |

**Acceptance requirements.** For K = Q, D_{Q,p}([z]) = D^0(z) ∈ Q_p. For K = Q(α), α³ − α² + 1 = 0 and p = 5, D_{K,5}(2[1 − α²] + [1 − α]) is the value printed in GSWZ (271), with K_5 ≅ Q_{25} × Q_5.

**Uses.** GSWZ §1.5, (19) and (22): the regulator D_p(ξ) entering the formal completion f̂ of an invertible section PadicHodgeRegulators:D.4/special-unit-formula: equals the global p-adic regulator on Bloch elements presented by special units at p HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm: D_p(ξ) = Σ_j D_p(z_j) for the Nahm-equation solutions z_j HabiroNumberFields:HB.7/invertible-local-sections: the normalisation of the local sections uses D_p(ξ)

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §3.1, paragraph after (174), p. 38. The construction; here for all p, with the integrality restricted to unramified p > 3.
- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Example 4.3, (270)–(271), p. 54. The computation test; z_2 = z_1² − z_1 + 2 = 1 − α and z_3 = z_1.
- [BdJ2003 (D.1)](#source-d-1-bdj2003), Remark 1.15, p. 6. Branch independence on the weight-two cohomology, proved here directly for B(K) from the explicit branch difference.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places](#request-d-1-14).

<a id="padichodgeregulators-d-1-regulator-normalisation-dictionary"></a>
### Dictionary of dilogarithm and regulator normalisations

`PadicHodgeRegulators:D.1/regulator-normalisation-dictionary` · comparison

Fix the Iwasawa branch. On C_p ∖ {0,1}: (i) GSWZ's D_p(z) = Li_2(z) + ½ log(z) log(1 − z) (GSWZ (174)) equals Coleman's D(z) (ColemanIntegration:L2/dilogarithm-identities with a = 0), Besser–de Jeu's L_mod,2(z) = L_2(z) + ½ log(z) L_1(z) = Li_2(z) − ½ log(z) Li_1(z) (BdJ §1, the unique choice for n = 2), and the n = 2 case L^mod_2 = Li_2 + B_1 Li_1 log of ColemanIntegration:L3/padic-regulator-polylogarithm (B_1 = −1/2, Li_1(z) = −log(1 − z)). (ii) Besser–de Jeu's regulator formula carries the factor ±(n − 1)!, which is ±1 for n = 2; the sign is the indeterminacy of BdJ Remark 1.7 and is fixed once in D.3/local-regulator. (iii) Gros's syntomic regulator on an unramified field satisfies reg^Gros = (1 − Frob/p²)·reg^Besser in weight two (BdJ Remark 1.13); on a root of unity ζ of order prime to p it takes the value ℓ_2(ζ) = Li_2(ζ) − p^{-2}Li_2(ζ^p) ∈ O, while the Besser value Li_2(ζ) lies in p²O (D.1/dilogarithm-scalar-extension (d)). (iv) The Bloch–Kato normalisation: under D_dR(Q_p(2)) = L·e_2, e_2 = t^{-2}⊗ε^{⊗2}, with t = log[ε] the period of Q_p(1), the regulator of GSWZ is ε·log_BK∘c_{2,1} for one sign ε ∈ {±1} (D.2/syntomic-etale-regulator-comparison). (v) On roots of unity ζ ≠ 1 every branch gives the same value D(ζ) = Li_2(ζ), and on special units (|z| = |1 − z| = 1) D is branch independent.

**Hypotheses.** p any prime for (i), (ii) and (v); (iii) and (iv) concern unramified, respectively arbitrary, finite extensions L/Q_p.

**Prerequisites.** `ColemanIntegration:L2/dilogarithm-identities`; `ColemanIntegration:L3/padic-regulator-polylogarithm`; `ColemanIntegration:L2/branch-dependence`; [`PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`](#padichodgeregulators-d-1-dilogarithm-scalar-extension); `mathlib:bernoulli`.

**Proof route.**

1. (i) Li_1(z) = −log(1 − z) turns L_2 + ½ log·L_1 into Li_2 + ½ log z log(1 − z); with B_0 = 1, B_1 = −1/2 the Bernoulli formula gives the same function.
2. (ii) and (iii) are BdJ Theorem 1.6(2) with n = 2 and BdJ Remark 1.13; (iii) at roots of unity is ColemanIntegration:L2/values-at-tame-roots-of-unity (a) with k = 2.
3. (v) is ColemanIntegration:L2/branch-dependence (i) and (iv) at k = 2, combined with log_a(ζ) = 0.

**Acceptance requirements.** L_mod,2 = D on every z ∈ C_p ∖ {0,1}, checked symbolically from the definitions. For p = 5 and ζ = ω(2) ∈ Q_5: Li_2(ζ) ≡ 25 mod 125 while ℓ_2(ζ) = (1 − 5^{-2})Li_2(ζ) ≡ −1 mod 5 is a unit.

**Sources.**

- [BdJ2003 (D.1)](#source-d-1-bdj2003), §1, after Remark 1.5's preamble, p. 3. Identity (i).
- [BdJ2003 (D.1)](#source-d-1-bdj2003), Remark 1.13, p. 6. Identity (iii).
- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §1.5, (19), p. 9. The normalisation GSWZ adopt; see sourceIssues E101 for the scope of the cited theorem.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-1-unit-logarithm-kernel"></a>
### Kernel of the logarithm on local units and the p-adic regulator matrix

`PadicHodgeRegulators:D.1/unit-logarithm-kernel` · lemma

(a) Let L/Q_p be finite. The Iwasawa logarithm restricts to a continuous homomorphism log_p : O_L^× → L whose kernel is the finite group μ(L) of all roots of unity in L (including those of p-power order, and ±1 when p = 2) and whose image is an open Z_p-submodule of L; hence log_p induces an isomorphism (O_L^×)^∧_p ⊗_{Z_p} Q_p ≅ L, and for L unramified and p odd it maps U^1_L = 1 + pO_L isomorphically onto pO_L. (b) Let F be a number field, E_F its unit group and ε_1, …, ε_r a basis of E_F modulo torsion. The composite E_F ⊗ Z_p → ∏_{v|p}(O_v^×)^∧_p → ∏_{v|p} F_v = F ⊗ Q_p (completion followed by log_p), after the scalar extension F ⊗ Q_p ⊗_{Q_p} C_p ≅ C_p^{Hom(F, C_p)}, has matrix (log_p σ_j(ε_i))_{i ≤ r, j ≤ [F:Q]}. In particular rr_p(F), the rank of this matrix (Polylogarithms:P.6/padic-regulator), is the Z_p-rank of the image of E_F ⊗ Z_p in ∏_{v|p}(O_v^×)^∧_p, and Leopoldt's conjecture for (F,p) is injectivity of the rational unit logarithm (E_F/μ(F))⊗_Z Q_p → F⊗_Q Q_p. This is equivalent to full rank r of the displayed logarithm matrix; torsion is removed before stating the rank criterion.

**Hypotheses.** log_p is the Iwasawa branch (log_p(p) = 0); embeddings σ_j : F → C_p are the [F:Q] field embeddings.

**Prerequisites.** `ColemanIntegration:L0/iwasawa-logarithm`; `ColemanIntegration:L0/log-one-add-convergence`; `ColemanIntegration:L0/log-branch-field-compatibility`; [`PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`](#padichodgeregulators-d-1-teichmuller-unit-decomposition); `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Proof route.**

1. (a) By the Teichmüller decomposition log_p(u) = log(⟨u⟩); on U^1_L the logarithm is a homomorphism whose kernel is the p-power torsion (a principal unit with log 0 is a root of unity: the series log and exp are inverse on 1 + p^c O_L for c > 1/(p − 1)), and it is an isomorphism 1 + p^c O_L ≅ p^c O_L for such c. So the kernel on O_L^× is μ(L) and the image contains p^c O_L, an open lattice.
2. For L unramified and p odd, c = 1 works and U^1_L contains no nontrivial p-power roots of unity.
3. (b) Under the semilocal equivalence the v-component is log_p on F_v; extending scalars to C_p and decomposing by embeddings gives the entries log_p σ_j(ε_i) by ColemanIntegration:L0/log-branch-field-compatibility.

**Acceptance requirements.** For L = Q_p (p odd), log_p(Z_p^×) = pZ_p and the kernel is μ_{p−1}. For p = 2 and L = Q_2 the kernel is {±1}: the torsion kernel must include 2-power roots of unity. For F = Q(√2), p = 7 and ε = 1 + √2, the 1 × 2 matrix (log_7(1 + √2), log_7(1 − √2)) has rank 1 because ε is not a root of unity.

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §3.1, p. 37. The branch fixed throughout the layer.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places](#request-d-1-14); [tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group](#request-d-1-15).

<a id="padichodgeregulators-d-1-logarithm-norm-trace"></a>
### The logarithm takes norms to traces

`PadicHodgeRegulators:D.1/logarithm-norm-trace` · lemma

Let A → B be a finite free extension of finite étale Q_p-algebras (for instance an extension of finite products of p-adic fields, or K ⊗ Q_p → K' ⊗ Q_p for number fields K ⊂ K'). For every u ∈ B^× with log_p defined componentwise, log_p(N_{B/A}(u)) = Tr_{B/A}(log_p(u)). In particular, for an extension of p-adic fields L'/L, log_p ∘ N_{L'/L} = Tr_{L'/L} ∘ log_p on L'^×, and the same holds on the completed unit groups.

**Hypotheses.** log_p is the Iwasawa branch, applied factor by factor.

**Prerequisites.** `ColemanIntegration:L0/iwasawa-logarithm`; `ColemanIntegration:L0/log-branch-field-compatibility`; `mathlib:Algebra.norm`; `mathlib:Algebra.trace`.

**Proof route.**

1. Reduce to fields by decomposing A and B; for L'/L separable, N(u) = ∏_σ σ(u) and Tr(x) = Σ_σ σ(x) over the L-embeddings of L' into C_p.
2. log_p is a homomorphism and commutes with every continuous automorphism of C_p (the Iwasawa branch is Galois equivariant), so log_p(∏_σ σ u) = Σ_σ σ(log_p u).

**Acceptance requirements.** For L' = Q_{p²}, L = Q_p and u = ω(α) a Teichmüller unit, both sides vanish. With a branch a ∉ Q_p the identity fails at u = p (log_a(p^{[L':L]}) = [L':L]·a while Tr(a) = [L':L]·a only if the branch parameter is fixed by Galois): the Galois-equivariant branch is needed.

**Sources.**

- [BdJ2003 (D.1)](#source-d-1-bdj2003), §1, after Remark 1.5's preamble, p. 3. Galois equivariance, the input that turns norms into traces.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

### Completion obligations for D.1

- At lemma level, split D.1/etale-algebra-dilogarithm's API (functoriality, five-term, roots of unity) into lemma nodes.
- The field-general projective five-term and Bloch descent inherit ColemanIntegration's recorded supplier gap.

<a id="layer-d-2"></a>
## D.2: Étale, syntomic and polylogarithmic regulator comparisons

The smooth rigid-syntomic strand constructs the regulator from Chern classes and the normalized quotient/edge map. Besser–de Jeu’s comparison is asserted on special units or the stated cyclotomic symbols; its arbitrary-presentation conjecture is retained separately. The final four contract nodes import the classical integral/open log-syntomic package from the required early CohomologyComparisons Part II prefix. That producer is still missing, and the exact integral twist range and period normalization remain gaps; they are not supplied by a late rational comparison.

**Atlas landmarks:** Soulé's étale regulator; Besser's syntomic regulator; Besser–de Jeu dilogarithm formula.

<a id="padichodgeregulators-d-2-etale-regulator"></a>
### Soulé's étale regulator to continuous Galois cohomology

`PadicHodgeRegulators:D.2/etale-regulator` · construction · `etaleRegulator`

Let F be a field of characteristic 0 (a number field, a finite extension of Q_p, or a finite product of such), p a prime and n ≥ 1. The étale regulator r^et_n : K_{2n−1}(F) → H^1(F, Z_p(n)) is the composite of the reductions K_{2n−1}(F) → K_{2n−1}(F; Z/p^ν), Soulé's étale Chern classes c_{n,1} : K_{2n−1}(F; Z/p^ν) → H^1(F, μ_{p^ν}^{⊗n}) (compatible in ν), and the inverse limit H^1(F, Z_p(n)) = lim_ν H^1(F, μ_{p^ν}^{⊗n}) of continuous cohomology; it factors through the completion K_{2n−1}(F; Z_p) and induces r^et_n ⊗ Q : K_{2n−1}(F) ⊗ Q_p → H^1(F, Q_p(n)). For n = 1 it is the Kummer map F^× → H^1(F, Z_p(1)). For F a finite extension of Q_p and n ≥ 2 the map on completed K-theory is the isomorphism of KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1.

**Hypotheses.** F of characteristic 0; Chern classes in the normalisation of Soulé (Chern classes, not Chern character components); n ≥ 1.

**Prerequisites.** `MotivicEtaleKTheory:M.7`; `MotivicEtaleKTheory:M.1`; `KTheoryFiniteLocalFields:L.1/k-theory-mod-m`; `KTheoryFiniteLocalFields:L.1/completed-k-theory`; `KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1`; `KTheoryFiniteLocalFields:L.7/etale-chern-class-completion`; `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`; `tauceti:TauCeti.kummerClassMap`; `SelmerIwasawaCohomology:L0/padic-kummer-identification`.

**Proof route.**

1. Soulé's Chern classes c_{n,1} with Z/p^ν-coefficients are supplied by MotivicEtaleKTheory (request on M.7: the Chern-class part that needs only étale K-theory, as RT-AREA-ktheory-2/18 directs); their compatibility with the coefficient maps ν ↦ ν ± 1 gives the limit.
2. ArithmeticGaloisDuality:R02.1/tate-inverse-limit identifies lim_ν H^1(F, μ_{p^ν}^{⊗n}) with continuous H^1(F, Z_p(n)) (the lim¹ term vanishes since the H^0 are finite).
3. For n = 1, c_{1,1} is the Kummer map (KTheoryFiniteLocalFields:L.7/etale-chern-class-completion, degree one).

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `etaleRegulator` | data | etaleRegulator F p n : K_{2n−1}(F) →+ H^1(F, ℤ_p(n)). |
| `etaleRegulator_completed` | constructor | The factorisation through K_{2n−1}(F; ℤ_p), a ℤ_[p]-linear map. |
| `etaleRegulator_one` | compatibility | For n = 1, etaleRegulator F p 1 is the Kummer map F^× → H^1(F, ℤ_p(1)). |
| `etaleRegulator_map` | functoriality | For a field embedding F → F', res ∘ etaleRegulator F = etaleRegulator F' ∘ K_{2n−1}(ι). |
| `etaleRegulator_transfer` | functoriality | For F'/F finite, cor ∘ etaleRegulator F' = etaleRegulator F ∘ N_{F'/F} (transfer). |
| `etaleRegulator_local_equiv` | equivalence | For F/ℚ_p finite and n ≥ 2, the completed map is the isomorphism of KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1. |
| `etaleRegulator_completion` | compatibility | For a number field F and v \| p, res_v ∘ etaleRegulator F = etaleRegulator F_v ∘ c_v. |
| `etaleRegulator_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `etaleRegulator_kummer` | compatibility | For F = Q_p, n = 1 and u ∈ Z_p^×, etaleRegulator F p 1 u is the image of u under lim_ν of Tau Ceti's kummerClassMap. |
| `etaleRegulator_rank_q5` | computation | For F = Q_5, n = 2, the completed etaleRegulator is a ℤ_5-linear isomorphism between free modules of rank 1. |
| `etaleRegulator_torsion_Q` | degenerate | For F = Q and n = 2, K_3(Q) ≅ Z/48 is torsion, so the image of etaleRegulator Q p 2 lies in the torsion of H^1(Q, Z_p(2)) and its rationalisation is 0. |
| `etaleRegulator_not_basis_functional` | non-example | For F = Q_{p²} and p > 3, a ℤ_p-isomorphism K_3(F; ℤ_p) ≅ ℤ_p² chosen from bases is not etaleRegulator: etaleRegulator commutes with the Frobenius automorphism of F, while a generic basis isomorphism does not. |

**Acceptance requirements.** For F = Q_p and n = 1, r^et_1(u) for u ∈ Z_p^× is the Kummer class of u, Tau Ceti's kummerClassMap in the limit. For F = Q_5 and n = 2, the completed map K_3(Q_5; Z_5) → H^1(Q_5, Z_5(2)) ≅ Z_5 is an isomorphism.

**Uses.** Huber–Kings 2011, §1.3 and Theorem 1.3.2: Soulé's regulator r_p, compared with the Bloch–Kato exponential of the p-adic Borel regulator PadicHodgeRegulators:D.3/local-regulator: the p-adic regulator on completed K_3 is ε·log_BK∘r^et_2 EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: z = log_BK(reg_et(u)) is the étale side of the elliptic Frobenius factor KatoEulerSystems:L1: étale Chern classes of symbols on modular curves, imported through D.2

**Sources.**

- [HK2011 (D.1)](#source-d-1-hk2011), §1.3, p. 8. Soulé's regulator r_p as Chern classes, the definition used here.
- [NN2016 (D.1)](#source-d-1-nn2016), §5.2, p. 59. The étale regulator for varieties; for X = Spec F and i = 0 it is the map of this node.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [MotivicEtaleKTheory:M.7](#request-d-1-1); [MotivicEtaleKTheory:M.1](#request-d-1-2).

<a id="padichodgeregulators-d-2-rigid-syntomic-cohomology"></a>
### Rigid syntomic cohomology of smooth schemes over a p-adic integer ring

`PadicHodgeRegulators:D.2/rigid-syntomic-cohomology` · definition · `rigidSyntomicCohomology`

Let R be a complete discrete valuation ring of characteristic 0 with perfect residue field k of characteristic p and fraction field K, R_0 = W(k), K_0 = R_0[1/p], and n ∈ Z. For a smooth R-scheme X with syntomic data (a smooth P_0 over R_0 with a σ-semilinear Frobenius lift Φ, a smooth P over R, X ↪ P and P_0 → P), Besser's rigid syntomic complex is RΓ_syn(X, n) := Cone(Fil^n RΓ_dR(X_K) ⊕ RΓ_rig(X_k/K_0) → RΓ_rig(X_k/K) ⊕ RΓ_rig(X_k/K_0))[−1], (a, b) ↦ (a − b, (1 − Φ*/p^n)b), with RΓ_rig from overconvergent de Rham complexes on the tubes; its cohomology H^i_syn(X, n) is independent of the syntomic data and functorial in X. For X = Spec R and n ≥ 1, H^i_syn(Spec R, n) = 0 for i ≠ 1 and the de Rham component η : H^1_syn(Spec R, n) ≅ K is an isomorphism (1 − σ/p^n being bijective on K_0).

**Hypotheses.** R a complete DVR, char K = 0, k perfect of characteristic p (finite in the arithmetic applications); X smooth, separated and of finite type over R.

**Prerequisites.** `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/overconvergent-de-rham-complex`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison`; `DerivedDeRhamCohomology:DD.2`.

**Proof route.**

1. The cone is formed in the derived category of Q_p-vector spaces (Φ is σ-semilinear, so 1−Φ/p^n is generally only Q_p-linear) from the rigid cohomology of the special fibre (RD.4, with its Frobenius) and the Hodge filtration on algebraic de Rham cohomology of the generic fibre.
2. Independence of the syntomic data: two choices are dominated by their product, and the Frobenius lifts are homotopic on overconvergent de Rham complexes (PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lifts-induce-homotopic-maps).
3. For Spec R, put A = 1−σ/p^n. The cone differential is b ↦ (−b,Ab), consistent with (a,b) ↦ (a−b,Ab). Its cokernel identifies with K by η[(a,c)] = a + A^{-1}c, since η(−b,Ab)=0. Thus H^1_syn ≅ K and the other groups vanish for n≥1. Transporting the K-vector-space structure along η is possible at this point, not a K_0-linear structure on the general cone.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `rigidSyntomicCohomology` | data | rigidSyntomicCohomology X n i : the Q_p-vector space H^i_syn(X,n); 1−Φ/p^n is Q_p-linear. At Spec R, η transports the K-module structure if desired. |
| `rigidSyntomicCohomology_map` | functoriality | A morphism of smooth R-schemes X → Y induces H^i_syn(Y, n) → H^i_syn(X, n), with map_id and map_comp. |
| `rigidSyntomic_long_exact` | relation | The long exact sequence … → H^{i−1}_rig(X_k/K_0) ⊕ Fil^n H^{i−1}_dR → H^{i−1}_rig(X_k/K) ⊕ H^{i−1}_rig(X_k/K_0) → H^i_syn(X, n) → … . |
| `rigidSyntomic_spec_eta` | equivalence | η : H^1_syn(Spec R, n) ≃ K for n ≥ 1. |
| `rigidSyntomic_spec_vanish` | characterisation | H^i_syn(Spec R, n) = 0 for i ≠ 1 and n ≥ 1. |
| `rigidSyntomic_independent` | other | Independence of the syntomic data up to canonical isomorphism. |
| `rigidSyntomicCohomology_extensionality` | extensionality | The cohomology carrier is obtained from the specified Q_p-linear cone. Functorial induced maps are equal when the corresponding chain maps are homotopic; cohomology-map equality is pointwise. A homotopy does not assert equality of raw complexes. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `rigidSyntomic_zp_two` | computation | For R = Z_p, H^1_syn(Spec Z_p, 2) ≅ Q_p via η, and, with Huber–Kings' cone map (a, b) ↦ (a − b, (1 − Φ/p^n)b), the class of (0, c) with c ∈ Q_p maps to (1 − 1/p²)^{−1}c. |
| `rigidSyntomic_weight_zero` | degenerate | For n = 0 and X = Spec R, H^0_syn(Spec R, 0) ≅ Q_p (the kernel of 1 − σ on K_0 is Q_p) and the η-isomorphism of the n ≥ 1 case does not hold. |
| `rigidSyntomic_monsky_washnitzer` | compatibility | For X smooth affine, the rigid terms are Monsky–Washnitzer cohomology of the dagger algebra (PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison). |
| `rigidSyntomic_not_de_rham` | non-example | H^1_syn(Spec R, n) is not Fil^n H^0_dR(K) (which is 0 for n ≥ 1): the syntomic group sees the cone, not the filtration step. |

**Acceptance requirements.** H^1_syn(Spec Z_p, 2) ≅ Q_p through η. H^0_syn(Spec R, n) = 0 for n ≥ 1 because 1 − σ/p^n has no kernel on K_0.

**Uses.** Huber–Kings 2011, Definition 2.2.1 and Example 2.2.4: the target H^1_syn(Spec R, n) = K of the syntomic regulator on K_{2n−1}(R) Besser–de Jeu, §4: the modified syntomic cohomology H̃_ms receives Chern classes and computes the regulator on K_3 PadicHodgeRegulators:D.5/curve-syntomic-regulator: H^2_syn(X, 2) of a smooth proper curve with good reduction is identified with H^1_dR(X_K) ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements: the target K of Besser's regulator in the Coleman formula

**Sources.**

- [HK2011 (D.1)](#source-d-1-hk2011), Definition 2.2.1, p. 14. The rigid syntomic complex.
- [HK2011 (D.1)](#source-d-1-hk2011), Example 2.2.4, pp. 14–15. The computation for Spec R.
- [Besser2000 (D.1)](#source-d-1-besser2000), §6 and Proposition 8.6(3), author PDF pp. 26–28. Primary source independently read; the normalized versus raw modified-model map must be tracked as specified in the statement/proofSteps.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [DerivedDeRhamCohomology:DD.2](#request-d-1-8).

<a id="padichodgeregulators-d-2-syntomic-regulator"></a>
### Besser's syntomic regulator

`PadicHodgeRegulators:D.2/syntomic-regulator` · construction · `syntomicRegulator`

For a smooth R-scheme X (R as in D.2/rigid-syntomic-cohomology) and i, j ≥ 0, the syntomic Chern classes c^syn_{i,j} : K_j(X) → H^{2i−j}_syn(X, i) are obtained by evaluating the universal syntomic Chern classes c_i ∈ H^{2i}_syn(B_•GL_N, i) — characterised by mapping to the de Rham Chern classes in Fil^i H^{2i}_dR — through Gillet's formalism. For X = Spec R and n ≥ 1 the syntomic regulator is reg_syn := η ∘ c^syn_{n,2n−1} : K_{2n−1}(R) → K; for n ≥ 2 it factors through K_{2n−1}(R) ⊗ Q ≅ K_{2n−1}(K) ⊗ Q. It is compatible with finite extensions R → R' (reg_syn,R' ∘ K(ι) = ι ∘ reg_syn,R) and with automorphisms of R, and for n = 1 it is log_p on R^×.

**Hypotheses.** R a complete DVR of characteristic 0 with perfect residue field; for the arithmetic uses the residue field is algebraic over F_p and the branch of log is the Iwasawa branch.

**Prerequisites.** [`PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`](#padichodgeregulators-d-2-rigid-syntomic-cohomology); `SchemeKTheoryOperations:S.7/chern-character`; `SchemeKTheoryOperations:S.5/projective-bundle-theorem`; `KTheoryFiniteLocalFields:L.2/odd-k-ring-of-integers-equals-field`; `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`.

**Proof route.**

1. Syntomic cohomology satisfies the projective bundle formula and homotopy invariance needed by Gillet's construction; the universal classes on B_•GL_N are determined by their de Rham images (Huber–Kings Definition 2.3.3 after Besser Theorem 7.5).
2. Evaluating on BGL_N(R) and composing with the Hurewicz map gives c^syn_{n,2n−1} on K_{2n−1}(R).
3. Base change: Besser 2000, Lemma 8.8, as cited in Besser–de Jeu's proof of Theorem 1.12.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `syntomicChernClass` | data | syntomicChernClass X i j : K_j(X) →+ H^{2i−j}_syn(X, i). |
| `syntomicRegulator` | constructor | syntomicRegulator R n := η ∘ syntomicChernClass (Spec R) n (2n−1) : K_{2n−1}(R) →+ K. |
| `syntomicRegulator_one` | compatibility | syntomicRegulator R 1 u = log_p u for u ∈ Rˣ (Iwasawa branch). |
| `syntomicRegulator_baseChange` | functoriality | For a finite extension R → R' with fraction fields K ⊂ K', syntomicRegulator R' n ∘ K(ι) = ι ∘ syntomicRegulator R n. |
| `syntomicRegulator_aut` | functoriality | For an automorphism τ of R, syntomicRegulator R n ∘ K(τ) = τ ∘ syntomicRegulator R n. |
| `syntomicChernClass_deRham` | characterisation | The image of the universal class in Fil^i H^{2i}_dR(B_•GL_N) is the de Rham Chern class. |
| `syntomicChernClass_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `syntomicRegulator_log` | computation | For R = Z_p (p odd) and u = 1 + p, syntomicRegulator Z_p 1 u = log(1 + p) = p − p²/2 + p³/3 − … . |
| `syntomicRegulator_teichmuller_one` | degenerate | For n = 1 and u a Teichmüller unit, syntomicRegulator R 1 u = 0. |
| `syntomicRegulator_cyclotomic` | compatibility | For R = Z_p[ζ_m] with p ∤ m and ζ ≠ 1, syntomicRegulator R 2 [ζ]_2 = ±Li_2(ζ), the value of ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements at n = 2. |
| `syntomicRegulator_not_gros` | non-example | For R = Z_p, the Gros normalisation (1 − Frob/p²)·syntomicRegulator differs from syntomicRegulator by the factor 1 − p^{−2} ≠ 1, so the two are not interchangeable in integrality statements. |

**Acceptance requirements.** For n = 1 and u ∈ R^×, reg_syn(u) = log_p(u) (Huber–Kings Example 2.5.2). For R = Z_p, n = 2: reg_syn is a Z_p-linear map K_3(Z_p) → Q_p whose rationalisation is injective on K_3(Z_p) ⊗ Q_p (via D.2/syntomic-etale-regulator-comparison).

**Uses.** Besser–de Jeu, Theorem 1.6(2): the regulator K^{(n)}_{2n−1}(O) → K^{(n)}_{2n−1}(R) → K computed on special units ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements: reg_σ([ζ]_n) = ±(n−1)!·L^mod_n(σζ) Gros, Régulateurs syntomiques, as recalled in Besser–de Jeu Remark 1.13: reg^Gros = (1 − Frob/p^n)·reg for unramified fields

**Sources.**

- [HK2011 (D.1)](#source-d-1-hk2011), Definition 2.3.3, p. 16. The universal syntomic Chern class.
- [BdJ2003 (D.1)](#source-d-1-bdj2003), §1, p. 1. The regulator and its source in Besser's work.
- [NN2016 (D.1)](#source-d-1-nn2016), Proposition 5.6, p. 57. The generic-fibre version used for comparisons.
- [Besser2000 (D.1)](#source-d-1-besser2000), §§7,9,10; Proposition 8.8 and Proposition 10.3. Primary source independently read; the normalized versus raw modified-model map must be tracked as specified in the statement/proofSteps.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-2-syntomic-etale-regulator-comparison"></a>
### The syntomic regulator is the Bloch–Kato logarithm of the étale regulator

`PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison` · theorem

Let R be the integer ring of a finite extension K of Q_p and n ≥ 1. The natural map ρ_syn : H^1_syn(Spec R, n) → H^1(K, Q_p(n)) (compatible with Chern classes) equals exp_BK ∘ η, where exp_BK : K = D_dR(Q_p(n))/Fil^0 → H^1(K, Q_p(n)) is the Bloch–Kato exponential (L1/bloch-kato-exponential, with D_dR(Q_p(n)) = K·e_n (e_n=t^{−n}⊗ε^{⊗n})). Consequently, on K_{2n−1}(R): r^et_n ⊗ Q = exp_BK ∘ reg_syn, with no constant when both regulators use Chern classes. For n ≥ 2, exp_BK is an isomorphism and reg_syn = log_BK ∘ r^et_n; for n = 1 this is ∂ = exp_BK ∘ log_p on R^× (Bloch–Kato 3.10.1). For a smooth variety X over K the same Chern-class compatibility holds for the Nekovář–Nizioł syntomic regulator: ρ_syn ∘ c^syn_{i,j} = c^et_{i,j}, and the syntomic boundary followed by the arithmetic edge map H^q_dR(X)/F^r → H^1(G_K, H^q_et(X_K̄, Q_p(r))) is the Bloch–Kato exponential of H^q_et(X_K̄, Q_p(r)).

**Hypotheses.** K/Q_p finite (any ramification); n ≥ 1; Chern-class normalisation for both regulators.

**Prerequisites.** [`PadicHodgeRegulators:D.2/syntomic-regulator`](#padichodgeregulators-d-2-syntomic-regulator); [`PadicHodgeRegulators:D.2/etale-regulator`](#padichodgeregulators-d-2-etale-regulator); [`PadicHodgeRegulators:L1/bloch-kato-exponential`](#padichodgeregulators-l1-bloch-kato-exponential); [`PadicHodgeRegulators:L1/bloch-kato-logarithm`](#padichodgeregulators-l1-bloch-kato-logarithm); [`PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`](#padichodgeregulators-d-2-rigid-syntomic-cohomology); `SelmerIwasawaCohomology:L0/padic-kummer-identification`.

**Proof route.**

1. Besser constructs ρ_syn compatibly with Chern classes and identifies H^1_syn(Spec R, n) → H^1(K, Q_p(n)) with exp_BK ∘ η (Besser 2000, Propositions 9.9–9.11, as recalled in Huber–Kings Propositions 2.2.9 and 2.3.4 and Tamme, proof of Corollary 5.19).
2. The universal syntomic Chern class maps to the universal étale Chern class (Huber–Kings Proposition 2.3.4), hence r^et_n = exp_BK ∘ η ∘ c^syn_n on K_{2n−1}(R).
3. For varieties over K: Nekovář–Nizioł Proposition 5.7 (compatibility of Chern classes, no constant) and Proposition 4.13 (the boundary map is the Bloch–Kato exponential), with the sign convention of their Remark 2.14 fixed once.

**Acceptance requirements.** n = 1, K = Q_p, u = 1 + p: exp_BK(log_p(1 + p)) is the Kummer class of 1 + p. n = 2, K = Q_5: for ζ = ω(2), log_BK(r^et_2([ζ])) = ±Li_2(ζ), consistent with D.2/weight-two-dilogarithm-comparison. The Huber–Kings p-adic Borel regulator satisfies r^et_n = exp_BK ∘ b_p (Huber–Kings Theorem 1.3.2); Tamme's Corollary 5.21 writes this with the factor (−1)^n/(n−1)! when the étale regulator is normalised by the Chern character.

**Sources.**

- [HK2011 (D.1)](#source-d-1-hk2011), Proposition 2.3.4, p. 16. The identification of H^1_syn(R, n) → H^1(K, Q_p(n)) with exp_BK ∘ η.
- [Tamme2014 (D.1)](#source-d-1-tamme2014), Proof of Corollary 5.19, p. 20. The same comparison, for smooth projective R-schemes.
- [NN2016 (D.1)](#source-d-1-nn2016), Proposition 5.7, p. 58. Compatibility of Chern classes on the generic fibre.
- [Besser2000 (D.1)](#source-d-1-besser2000), Corollary 9.10 and Proposition 9.11, author PDF p. 32. Primary source independently read; the normalized versus raw modified-model map must be tracked as specified in the statement/proofSteps.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-2-weight-two-dilogarithm-comparison"></a>
### Besser–de Jeu: the weight-two regulator is Coleman's dilogarithm on special units

`PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison` · theorem

Let F be a field of characteristic 0, O ⊂ F a discrete valuation ring with residue field κ, and σ : F → K an embedding into a complete discretely valued subfield K ⊂ C_p with σ(O) ⊂ R (so κ is algebraic over F_p). Let ξ ∈ K_3(O) ⊗ Q be the image, under de Jeu's map H^1(M̃^{(2)}(O)) → K^{(2)}_3(O), of an element Σ_i n_i [x_i]_2 with n_i ∈ Q, x_i ∈ O^♭ special units (x_i, 1 − x_i ∈ O^×) and Σ_i n_i (1 − x_i) ∧ x_i = 0 in ∧²(O^×) ⊗ Q. Then reg_syn(σ_* ξ) = ±Σ_i n_i D(σ(x_i)), with D = L_mod,2 Coleman's dilogarithm (D.1/regulator-normalisation-dictionary), the sign being the single sign indeterminacy of de Jeu's map. For F a number field and O its localisation at a prime above p the same holds without further hypotheses, and for every root of unity ζ ≠ 1 of F (of any order) the cyclotomic element [ζ]_2 satisfies reg_syn(σ_*[ζ]_2) = ±Li_2(σζ). Combined with D.2/syntomic-etale-regulator-comparison: log_BK(r^et_2(σ_* ξ)) = ±Σ_i n_i D(σ x_i). For arbitrary elements of B(F) ⊗ Q (symbols that are not special units of O) the identity is Besser–de Jeu's Conjecture 1.14 and is not asserted.

**Hypotheses.** n = 2 (no Beilinson–Soulé hypothesis is needed in weight two). Every x_i is a special unit of O; the comparison of de Jeu's weight-two complex with Suslin's Bloch group (requested from Polylogarithms:P.4) transports the statement to B(F) ⊗ Q.

**Prerequisites.** [`PadicHodgeRegulators:D.2/syntomic-regulator`](#padichodgeregulators-d-2-syntomic-regulator); [`PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`](#padichodgeregulators-d-2-syntomic-etale-regulator-comparison); [`PadicHodgeRegulators:D.1/regulator-normalisation-dictionary`](#padichodgeregulators-d-1-regulator-normalisation-dictionary); [`PadicHodgeRegulators:D.1/combined-dilogarithm`](#padichodgeregulators-d-1-combined-dilogarithm); `Polylogarithms:P.4`; `K3BlochGroups:V.4/suslin-exact-sequence`; `K3BlochGroups:V.6/comparison-rational`.

**Proof route.**

1. Besser–de Jeu construct M̃^{(n)}(O) and a map H^1(M̃^{(n)}(O)) → K^{(n)}_{2n−1}(O) through multi-relative K-theory and localisation (their §3), natural up to sign.
2. The key computation, BdJ Proposition 7.10, evaluates the modified syntomic regulator on [z]_n for special units z as (−1)^n(n−1)!·L_n(z); for n = 2 the combination with the boundary term gives ±L_mod,2 = ±D.
3. Number fields (BdJ Theorem 1.10): no hypothesis is needed; roots of unity of order divisible by p (BdJ Theorem 1.12) follow from the distribution relation over F(μ_r) and the base-change compatibility of the syntomic regulator (Besser 2000, Proposition 8.8).
4. Transport to Suslin's B(F) ⊗ Q uses the weight-two comparison of de Jeu's complex with the Bloch–Suslin complex (request to Polylogarithms:P.4) and K3BlochGroups:V.6/comparison-rational.

**Acceptance requirements.** F = Q(ζ_m), p ∤ m, σ an embedding into Q_p(ζ_m): reg_syn([ζ_m]_2) = ±Li_2(σζ_m) ∈ p²Z_p[ζ_m]. GSWZ Example 4.3: all symbols 1 − α², 1 − α of ξ = 2[1 − α²] + [1 − α] and their complements are global units (norm ±1), so the theorem gives D.2's regulator of ξ at both places above 5 as ±D_5(ξ) of GSWZ (271). The symbol [p] ∈ P(Q) is not a special unit at p; no statement is made for presentations containing it.

**Sources.**

- [BdJ2003 (D.1)](#source-d-1-bdj2003), Theorem 1.6(2), p. 4. The theorem; n = 2 holds without the Beilinson–Soulé hypothesis.
- [BdJ2003 (D.1)](#source-d-1-bdj2003), Theorem 1.12, p. 6. Cyclotomic elements of every order.
- [BdJ2003 (D.1)](#source-d-1-bdj2003), Conjecture 1.14, p. 6. The general case, which remains conjectural and is not asserted here.

**Open obligations.** [The dilogarithm formula for arbitrary Bloch elements (Besser–de Jeu Conjecture 1.14, n = 2)](#gap-d-1-1); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [Polylogarithms:P.4](#request-d-1-3).

<a id="padichodgeregulators-d-2-higher-weight-polylogarithm-comparison"></a>
### Besser–de Jeu: the syntomic regulator in higher weight

`PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison` · theorem

Let F be a number field, O the localisation of O_F at a prime above p, σ : F → K an embedding into a complete discretely valued subfield K ⊂ C_p with σ(O) ⊂ R, and n ≥ 2. On de Jeu's H^1(M̃^{(n)}(O)) → K^{(n)}_{2n−1}(O) ≅ K^{(n)}_{2n−1}(F), the composite with σ_* and reg_syn maps [x]_n (x a special unit of O) to ±(n − 1)!·L_mod,n(σ(x)), and for every root of unity ζ ≠ 1 of F (of any order) maps the cyclotomic element [ζ]_n to ±(n − 1)!·L_mod,n(σζ) = ±(n − 1)!·Li_n(σζ). For a field F of characteristic 0 and a discrete valuation ring O ⊂ F, the same holds on special units under the Beilinson–Soulé conjecture for F and its residue field (n ≥ 3). L_mod,n is the modified polylogarithm of ColemanIntegration:L3/padic-regulator-polylogarithm. For n = 2 this is D.2/weight-two-dilogarithm-comparison.

**Hypotheses.** n ≥ 2; F a number field (no further hypothesis), or the Beilinson–Soulé conjecture for F and κ when n ≥ 3. The comparison of de Jeu's complexes with K-theory in weight n is requested from Polylogarithms:P.4.

**Prerequisites.** [`PadicHodgeRegulators:D.2/syntomic-regulator`](#padichodgeregulators-d-2-syntomic-regulator); [`PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`](#padichodgeregulators-d-2-weight-two-dilogarithm-comparison); `ColemanIntegration:L3/padic-regulator-polylogarithm`; `ColemanIntegration:L2/distribution-relation`; `Polylogarithms:P.4`.

**Proof route.**

1. BdJ Proposition 7.10: the modified syntomic regulator of [z]_n for a special unit z is (−1)^n(n − 1)!·L_n(z) in their normalisation; with the boundary terms of the complex this gives ±(n − 1)!·L_mod,n(z).
2. Number fields need no Beilinson–Soulé hypothesis (BdJ Theorem 1.10); roots of unity of order divisible by p follow from the distribution relation over F(μ_r) with r ≡ 1 mod p^s and base change (BdJ Theorem 1.12, Besser 2000 Lemma 8.8).
3. L_mod,n(ζ) = Li_n(ζ) because log_p vanishes on roots of unity.

**Acceptance requirements.** F = Q(ζ_N), n = 3, p ∤ N: reg_syn([ζ_N]_3) = ±2·Li_3(σζ_N). The input of ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements is this theorem with F = Q(ζ_N).

**Sources.**

- [BdJ2003 (D.1)](#source-d-1-bdj2003), Theorem 1.10(2), p. 5. The number-field theorem in weight n.
- [BdJ2003 (D.1)](#source-d-1-bdj2003), Theorem 1.12, p. 6. Cyclotomic elements.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [Polylogarithms:P.4](#request-d-1-3).

<a id="padichodgeregulators-d-2-gros-normalisation"></a>
### Gros's normalisation of the syntomic regulator

`PadicHodgeRegulators:D.2/gros-normalisation` · comparison

Let K/Q_p be finite unramified with Frobenius σ and n ≥ 1. Gros's syntomic regulator is reg^Gros_n = (1 − σ/p^n) ∘ reg_syn on K_{2n−1}(O_K), with reg_syn = η ∘ c^syn of D.2/syntomic-regulator. On a cyclotomic element [ζ]_n with ζ a root of unity of order prime to p it takes the value Li^{(p)}_n(ζ) = Li_n(ζ) − p^{−n}Li_n(ζ^p) if the cyclotomic symbol is normalized by the same de Jeu map as D.2/higher-weight-polylogarithm-comparison, with its sign and factor (n−1)!. Agreement with Gros’s own symbol normalization for n>2 is not inferred here; for n = 2 this is ±ℓ_2(ζ) ∈ O_K, whereas reg_syn([ζ]_2) = ±Li_2(ζ) ∈ p²O_K. The Gros regulator is defined only for unramified K.

**Hypotheses.** K/Q_p finite unramified, σ its Frobenius; p ∤ ord(ζ).

**Prerequisites.** [`PadicHodgeRegulators:D.2/syntomic-regulator`](#padichodgeregulators-d-2-syntomic-regulator); [`PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`](#padichodgeregulators-d-2-weight-two-dilogarithm-comparison); [`PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`](#padichodgeregulators-d-1-dilogarithm-scalar-extension); `ColemanIntegration:L2/values-at-tame-roots-of-unity`; [`PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison`](#padichodgeregulators-d-2-higher-weight-polylogarithm-comparison).

**Proof route.**

1. BdJ Remark 1.13 records reg^Gros = (1 − Frob/p^n) reg.
2. Galois equivariance gives σ(Li_n(ζ)) = Li_n(ζ^p), so (1 − σ/p^n)Li_n(ζ) = Li^{(p)}_n(ζ), which is ℓ_n(ζ) by ColemanIntegration:L2/values-at-tame-roots-of-unity (a).

**Acceptance requirements.** For K = Q_5 and ζ = ω(2): reg^Gros([ζ]_2) ≡ ∓1 mod 5 is a unit while reg_syn([ζ]_2) ∈ 25Z_5. The factor (n − 1)! present in BdJ Theorem 1.12 and absent from Gros's formula is 1 for n = 2; for n ≥ 3 the two normalisations also differ by it (unexplained in BdJ Remark 1.13; see sourceIssues).

**Sources.**

- [BdJ2003 (D.1)](#source-d-1-bdj2003), Remark 1.13, p. 6. Gros's value at roots of unity.
- [BdJ2003 (D.1)](#source-d-1-bdj2003), Remark 1.13, p. 6. The normalisation change.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-2-log-syntomic-complex"></a>
### Log-syntomic complexes S_n(r)

`PadicHodgeRegulators:D.2/log-syntomic-complex` · comparison

**Required imported contract:** the early classical log-syntomic producer in CohomologyComparisons Part II is still to be named and planned. This node specifies what D.2 needs; it does not introduce a second generic construction.

Let O_K be a complete discrete valuation ring of mixed characteristic (0, p) with perfect residue field k, O_F = W(k), and let X be an fs log-scheme, log-smooth over O_K^× (O_K with the log structure of its closed point); X_n := X ⊗ Z/p^n. For r ≥ 0 the mod-p^n log-syntomic complex is RΓ_syn(X, r)_n := [RΓ_cr(X, J^{[r]})_n --(p^r − φ)--> RΓ_cr(X)_n] (homotopy fibre), where RΓ_cr(X, J^{[r]})_n is absolute log-crystalline cohomology of X_n over W_n(k) with coefficients in the r-th divided-power ideal J^{[r]} (J^{[r]} = O for r ≤ 0) and φ is the crystalline Frobenius; its étale sheafification on X_0 is S_n(r)_X ≃ [J^{[r]}_{cr,n} --(p^r − φ)--> A_{cr,n}], with RΓ_syn(X, r)_n = RΓ(X_{0,ét}, S_n(r)_X). The completed version is RΓ_syn(X, r) := holim_n RΓ_syn(X, r)_n, with RΓ_syn(X, r)_n ≃ RΓ_syn(X, r) ⊗^L Z/p^n, and rationally RΓ_syn(X, r)_Q ≃ Cone(RΓ_cr(X, J^{[r]})_Q --(1 − φ_r)--> RΓ_cr(X)_Q)[−1] with φ_r = φ/p^r. This is CN §5.1.1’s undivided convention p^r−φ. A classical divided-Frobenius convention uses 1−φ_r on the appropriate Frobenius-divisible ideal. These are identified after inverting p; the integral comparison must be provided explicitly, not assumed termwise.

**Hypotheses.** X fs, log-smooth over O_K^×, of Cartier type where comparisons with Hyodo–Kato cohomology are used; O_K need not be unramified. r ≥ 0, n ≥ 1. Required supplier contract in the early classical log-syntomic prefix of CohomologyComparisons Part II, per the accepted verification of RT-AREA-iwasawa-2/3. CP.4 is only the routing anchor; its current rational proper B_st comparison does not supply this integral/open construction.

**Prerequisites.** `CrystallineCohomology:CR.5`; `CrystallineCohomology:CR.3`; `CrystallineCohomology:CR.0/pd-filtration`; `PadicHodgeTheory:R06.1/crystalline-period-ring`; `CohomologyComparisons:CP.4`.

**Proof route.**

1. Absolute log-crystalline cohomology with the divided-power filtration and its Frobenius are imported from CrystallineCohomology CR.3/CR.5 (request: the filtered absolute log-crystalline complexes RΓ_cr(X, J^{[r]})_n of fs log-smooth O_K^×-schemes with Frobenius).
2. The homotopy fibre of p^r − φ is formed in the derived category of Z/p^n-modules; étale localisation gives the sheaf version, and the derived limit gives the completed one.
3. Rationally, p^r − φ = p^r(1 − φ_r) on J^{[r]}, giving the cone form.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `logSyntomicComplex` | data | logSyntomicComplex X r n : the complex RΓ_syn(X, r)_n of Z/p^n-modules. |
| `logSyntomicSheaf` | data | S_n(r)_X on X_{0,ét}, with RΓ(X_{0,ét}, S_n(r)_X) ≃ logSyntomicComplex X r n. |
| `logSyntomicComplex_reduction` | relation | logSyntomicComplex X r n ≃ logSyntomicCompleted X r ⊗^L Z/p^n. |
| `logSyntomicComplex_rational` | equivalence | logSyntomicCompleted X r ⊗ Q ≃ Cone(1 − φ_r)[−1] on rational log-crystalline cohomology. |
| `logSyntomicComplex_map` | functoriality | Morphisms of fs log-smooth O_K^×-schemes induce maps, with map_id and map_comp; base change along O_K → O_{K'}. |
| `logSyntomicComplex_product` | structure | Cup products S_n(r) ⊗ S_n(s) → S_n(r + s). |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `logSyntomic_point_weight_two` | computation | For X = Spec O_K (log structure of the closed point), r = 2: H^1(logSyntomicCompleted X 2) is p^{N}-isomorphic to O_K and H^2 to 0. |
| `logSyntomic_weight_zero` | degenerate | For r = 0, J^{[0]} = O and S_n(0) is the fibre of 1 − φ on A_{cr,n}; on X = Spec O_K its H^0 is Z/p^n. |
| `logSyntomic_rigid_compat` | compatibility | For X smooth over O_K with trivial horizontal log structure and K unramified, the rational complex agrees with D.2/rigid-syntomic-cohomology (both compute the fibre of 1 − φ_r against the Hodge filtration). |
| `logSyntomic_not_naive_twist` | non-example | At r=p−1 the chosen Euclidean decomposition gives a(r)=1 and Z_p(r)′=p^{-1}Z_p(r), whereas at r=p−2 it gives a(r)=0 and the ordinary twist. Replacing all modified lattices by the ordinary lattice loses this normalization. |

**Acceptance requirements.** X = Spec O_K with its log structure and r ≥ 2: H^1_syn(X, r) is p^N-isomorphic to O_K and H^0 to 0 (Colmez–Nizioł Proposition 3.19, up to p^{N(r,e)}). r = 1: H^1_syn(O_K^×, 1) is p^N-isomorphic to O_K ⊕ Z_p, the extra Z_p accounting for the valuation, matching dim H^1(K, Q_p(1)) = [K:Q_p] + 1.

**Uses.** Colmez–Nizioł, Theorem 1.1: the source of the period map whose kernel and cokernel are bounded RT-AREA-iwasawa-2/3: the log-syntomic package (S_n(r), the period morphism, the small-twist isomorphism, the syntomic exponential) owned by this roadmap and imported by D.2 and D.5 PadicHodgeRegulators:D.5/semistable-input-boundary: the additional input for bad or semistable reduction Nekovář–Nizioł, Theorem A: rational log-syntomic cohomology of varieties over K via h-sheafification

**Sources.**

- [CN2017 (D.1)](#source-d-1-cn2017), §5.1.1, pp. 52–53. The definition.
- [NN2016 (D.1)](#source-d-1-nn2016), Introduction, (1), p. 2. The rational form.

**Open obligations.** [Early shared classical log-syntomic producer](#gap-d-1-9); [Integral period morphism and divided-Frobenius normalization](#gap-d-1-10); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [CrystallineCohomology:CR.5](#request-d-1-4); [CrystallineCohomology:CR.3](#request-d-1-5); [CohomologyComparisons:CP.4](#request-d-1-13).

<a id="padichodgeregulators-d-2-fontaine-messing-kato-period-map"></a>
### The Fontaine–Messing–Kato period morphism

`PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map` · comparison

**Required imported contract:** the early classical log-syntomic producer in CohomologyComparisons Part II is still to be named and planned. This node specifies what D.2 needs; it does not introduce a second generic construction.

For X as in D.2/log-syntomic-complex, i:X_0→X and j:X_tr→X, the required supplier defines the Fontaine–Messing–Kato morphism α^FM_{r,n}:S_n(r)_X→i^*Rj_*Z/p^n(r)′, r≥0, compatible with reduction and the source’s product convention. Here Z_p(r)′=p^{-a(r)}Z_p(r) with r=(p−1)a(r)+b(r), 0≤b(r)<p−1. CN §4.7 constructs its local map using period rings, the crystalline Poincaré lemma and the integral fundamental-sequence maps. The p^r-exact fundamental sequence gives only a p-power comparison; its backwards arrow cannot be inverted as an actual quasi-isomorphism in D(Z/p^n). The precise integral map, its direction and the comparison between undivided and divided complexes are required from the supplier (recorded gap); after inverting p these arrows become quasi-isomorphisms.

**Hypotheses.** X fs log-smooth over O_K^×; r ≥ 0; the normalisation of Z_p(r)' follows Colmez–Nizioł (Nekovář–Nizioł use (p^a a!)^{−1}Z_p(r), which agrees for r < p(p − 1)). Required supplier contract in the early classical log-syntomic prefix of CohomologyComparisons Part II, per the accepted verification of RT-AREA-iwasawa-2/3. CP.4 is only the routing anchor; its current rational proper B_st comparison does not supply this integral/open construction.

**Prerequisites.** [`PadicHodgeRegulators:D.2/log-syntomic-complex`](#padichodgeregulators-d-2-log-syntomic-complex); `AInfCohomology:AI.4`; `PadicHodgeTheory:R06.1/crystalline-period-ring`; `PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence`; `CrystallineCohomology:CR.2`; [`PadicHodgeRegulators:L0/fundamental-exact-sequences`](#padichodgeregulators-l0-fundamental-exact-sequences); `CohomologyComparisons:CP.4`.

**Proof route.**

1. A_cr and its filtration are imported (PadicHodgeTheory:R06.1/crystalline-period-ring; the relative rings A_cr(R) of small algebras are requested from AInfCohomology AI.4); the p^r-exact sequence 0 → Z_p(r)' → F^r A_cr → A_cr → 0 is the integral form of L0/fundamental-exact-sequences. Its cokernel is killed by p^r, not necessarily zero. This does not justify an inverse in the integral derived category.
2. The crystalline Poincaré lemma (CrystallineCohomology CR.2, log version CR.5) identifies Galois cochains with values in the PD de Rham complex of the envelope with the A_cr complex.
3. Gluing the local maps on an étale cover and passing to the étale sheaf i^*Rj_* gives α^FM.
4. The displayed backwards-arrow construction in the original packet is not a proof of an integral map. Obtain the integral Fontaine–Messing construction and its normalization from the early shared supplier before closing this contract.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `fmkPeriodMap` | data | fmkPeriodMap X r n : S_n(r)_X ⟶ i^* Rj_* (ℤ/p^n)(r)'_{X_tr} in the derived category of étale sheaves on X_0. |
| `fmkPeriodMap_local` | characterisation | On a small chart Spf R it agrees with CN §4.7’s explicitly directed integral map; p-power quasi-isomorphisms are not inverted integrally. The supplier must state and compare the divided and undivided conventions. |
| `fmkPeriodMap_mul` | structure | fmkPeriodMap is compatible with cup products S_n(r) ⊗ S_n(s) → S_n(r + s). |
| `fmkPeriodMap_reduction` | relation | Compatible with the reduction maps n → n − 1 and with the completed versions. |
| `fmkPeriodMap_degree_one` | example | For r = 1 on X = Spec O_K, it sends the syntomic class of u ∈ O_K^× to the Kummer class of u. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `fmk_kummer` | computation | For X = Spec Z_p, r = 1, n = 1 and u = 1 + p, the image of the syntomic class of u is the Kummer class of 1 + p in H^1(Q_p, μ_p). |
| `fmk_weight_zero` | degenerate | For r = 0, α^FM_{0,n} is the identification of S_n(0) with i^*Rj_*Z/p^n in degree 0 (both are Z/p^n on a connected X). |
| `fmk_twist_normalisation` | compatibility | For r < p − 1, a(r) = 0 and Z_p(r)' = Z_p(r), so the Colmez–Nizioł and Nekovář–Nizioł normalisations coincide. |
| `fmk_untwisted_fails` | non-example | At r=p−1, Z_p(r)′=p^{-1}Z_p(r) and its prescribed period generator has p-adic valuation one less than the ordinary generator; an ordinary generator cannot be silently substituted in the same normalized map. |

**Acceptance requirements.** For X = Spec O_K and r = 1, α^FM sends the syntomic class of a unit u to its Kummer class in H^1(K, Z/p^n(1)). For general r the integral fundamental sequence is p^r-exact; neither an actual quasi-isomorphism nor the impossibility of any map with an ordinary twist follows from that statement.

**Uses.** Colmez–Nizioł, Theorem 1.1: the period map whose kernel and cokernel are killed by p^N PadicHodgeRegulators:D.2/small-twist-comparison: the Kato–Kurihara–Tsuji isomorphism in degrees i ≤ r ≤ p − 1 PadicHodgeRegulators:D.2/syntomic-exponential: composed with the syntomic exponential it gives the Bloch–Kato exponential

**Sources.**

- [CN2017 (D.1)](#source-d-1-cn2017), §1, p. 2. The period morphism.
- [CN2017 (D.1)](#source-d-1-cn2017), §1, p. 2. The twist; see sourceIssues for the range of b(r).

**Open obligations.** [Early shared classical log-syntomic producer](#gap-d-1-9); [Integral period morphism and divided-Frobenius normalization](#gap-d-1-10); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [CrystallineCohomology:CR.2](#request-d-1-6); [AInfCohomology:AI.4](#request-d-1-7); [CohomologyComparisons:CP.4](#request-d-1-13).

<a id="padichodgeregulators-d-2-small-twist-comparison"></a>
### Kato–Kurihara–Tsuji: the period map is an isomorphism for small twists

`PadicHodgeRegulators:D.2/small-twist-comparison` · comparison

**Required imported contract:** the early classical log-syntomic producer in CohomologyComparisons Part II is still to be named and planned. This node specifies what D.2 needs; it does not introduce a second generic construction.

Let X be an fs log-scheme log-smooth over a henselian discrete valuation ring O_K of mixed characteristic (0, p). For integers i ≤ r ≤ p − 1 and n ≥ 1 the period map α^FM_{r,n} : H^i(S_n(r)_X) → i^* R^i j_* Z/p^n(r)_{X_tr} is an isomorphism (for r ≤ p − 2, Z_p(r)' = Z_p(r)). For general r, Colmez–Nizioł prove that the kernel and cokernel of α^FM_{r,n} on H^i, 0 ≤ i ≤ r, are killed by p^{Nr + c_p} if K contains enough roots of unity and by p^{N(K,p,r)} in general, for X semistable over O_K (or a base change of one). Consequently, for X proper and log-smooth over O_K^×, H^j_syn(X_{O_K̄}, r)_Q ≅ H^j_et(X_{tr,K̄}, Q_p(r)) for j ≤ r.

**Hypotheses.** X fs log-smooth over a henselian DVR of mixed characteristic; i ≤ r ≤ p − 1 for the exact statement (Nekovář–Nizioł use r ≤ p − 2, where both formulations agree). For the p^N statements, X semistable (or a base change of a semistable scheme) and 0 ≤ i ≤ r. Required supplier contract in the early classical log-syntomic prefix of CohomologyComparisons Part II, per the accepted verification of RT-AREA-iwasawa-2/3. CP.4 is only the routing anchor; its current rational proper B_st comparison does not supply this integral/open construction. The quoted exact small-range comparison requires identifying S_n(r) with the classical complex to which that exact theorem applies, including its divided-Frobenius convention; this integral identification remains a gap. The rational and p-power conclusions do not by themselves establish it. Applications here use r≤p−2.

**Prerequisites.** [`PadicHodgeRegulators:D.2/log-syntomic-complex`](#padichodgeregulators-d-2-log-syntomic-complex); [`PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`](#padichodgeregulators-d-2-fontaine-messing-kato-period-map); `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex`; `CohomologyComparisons:CP.4`.

**Proof route.**

1. Classical range (Kato, Kurihara, Tsuji, as quoted by Colmez–Nizioł): the symbol map and the computation of nearby cycles by Bloch–Kato's filtration identify both sides in degrees i ≤ r ≤ p − 1.
2. General range (Colmez–Nizioł): locally, syntomic cohomology is p^{Nr}-quasi-isomorphic to τ_{≤ r} Galois cohomology through (φ, Γ)-modules (Herr complex, PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex) and a Lazard-type map, which agrees with α^FM up to p^{Nr + c_p}; then descent from K(ζ_{p^i}) and the K(π,1)-lemma.
3. The geometric rational corollary follows by passing to O_K̄ and inverting p.

**Acceptance requirements.** X = Spec O_K (trivial log structure on X_tr = Spec K), i = r = 1 ≤ p − 1: H^1(S_n(1)) ≅ H^1(K, Z/p^n(1)) = K^×/p^n. Outside the small range the isomorphism can fail integrally; the statement is then only up to p^N.

**Sources.**

- [CN2017 (D.1)](#source-d-1-cn2017), §1, (1.3), p. 2. The classical range, with attribution to Kato, Kurihara and Tsuji.
- [CN2017 (D.1)](#source-d-1-cn2017), Theorem 1.1, p. 2. The general bounded comparison (stated with N(K, p, r) in Theorem 5.4; see sourceIssues).

**Open obligations.** [Upper end of the Kato–Kurihara–Tsuji range](#gap-d-1-2); [Early shared classical log-syntomic producer](#gap-d-1-9); [Integral period morphism and divided-Frobenius normalization](#gap-d-1-10); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [CohomologyComparisons:CP.4](#request-d-1-13).

<a id="padichodgeregulators-d-2-syntomic-exponential"></a>
### The syntomic exponential and the Bloch–Kato exponential

`PadicHodgeRegulators:D.2/syntomic-exponential` · comparison

**Required imported contract:** the early classical log-syntomic producer in CohomologyComparisons Part II is still to be named and planned. This node specifies what D.2 needs; it does not introduce a second generic construction.

Let X be a quasi-compact formal semistable scheme over O_K and r ≥ 1. There is a natural map α_{r,i} : H^{i−1}_dR(X_{K,tr}) → H^i_syn(X, r)_Q (the boundary of the syntomic fibre sequence, through the identification of crystalline cohomology modulo J^{[r]} with log de Rham cohomology modulo F^r), an isomorphism for i ≤ r − 1 and injective for i = r. For X proper semistable and 1 ≤ i ≤ r − 1, the composite α^FM ∘ α_{r,i} : D_dR(V_{i−1}) = H^{i−1}_dR(X_K) → H^1(G_K, V_{i−1}) ⊂ H^i_et(X_K, Q_p(r)), V_{i−1} := H^{i−1}_et(X_K̄, Q_p(r)), is the Bloch–Kato exponential of V_{i−1}. For X = Spec O_K, r≥2 and i=1 this is the statement H^0_dR(K) = K → H^1_syn → H^1(K, Q_p(r)) equals exp_BK, used in D.2/syntomic-etale-regulator-comparison.

**Hypotheses.** X quasi-compact formal semistable over O_K; for the Bloch–Kato identification, X proper semistable and 1 ≤ i ≤ r − 1. Required supplier contract in the early classical log-syntomic prefix of CohomologyComparisons Part II, per the accepted verification of RT-AREA-iwasawa-2/3. CP.4 is only the routing anchor; its current rational proper B_st comparison does not supply this integral/open construction.

**Prerequisites.** [`PadicHodgeRegulators:D.2/log-syntomic-complex`](#padichodgeregulators-d-2-log-syntomic-complex); [`PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`](#padichodgeregulators-d-2-fontaine-messing-kato-period-map); [`PadicHodgeRegulators:D.2/small-twist-comparison`](#padichodgeregulators-d-2-small-twist-comparison); [`PadicHodgeRegulators:L1/bloch-kato-exponential`](#padichodgeregulators-l1-bloch-kato-exponential); `CrystallineCohomology:CR.5`; `CohomologyComparisons:CP.4`.

**Proof route.**

1. Colmez–Nizioł Lemmas 3.14 and 3.17 identify crystalline cohomology modulo J^{[r]} with log de Rham cohomology modulo F^r; Proposition 3.12(ii) shows the Hyodo–Kato part is p^N-acyclic in degrees ≤ r − 1 (Corollary 3.16).
2. Composition with α^FM and comparison with the Bloch–Kato exponential: Colmez–Nizioł Corollary 1.4 / 5.11, citing Nekovář–Nizioł Proposition 4.13 (with the sign convention of their Remark 2.14).

**Acceptance requirements.** X = Spec O_K, r = 2, i = 1: α_{2,1} : K → H^1_syn(O_K, 2)_Q is an isomorphism and α^FM ∘ α_{2,1} = exp_BK : K → H^1(K, Q_p(2)). For dim X_K ≥ 1 and i = r the cokernel of α^FM ∘ α_{r,r} can be very large; no surjectivity is asserted there.

**Sources.**

- [CN2017 (D.1)](#source-d-1-cn2017), Corollary 3.16, p. 37. The syntomic exponential.
- [CN2017 (D.1)](#source-d-1-cn2017), §1, p. 3. The identification with the Bloch–Kato exponential.

**Open obligations.** [Early shared classical log-syntomic producer](#gap-d-1-9); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [CohomologyComparisons:CP.4](#request-d-1-13).

### Completion obligations for D.2

- Besser–de Jeu Conjecture 1.14 for non-special presentations (gap).
- Check the upper end of the Kato–Kurihara–Tsuji range at the original sources (gap).
- Name/plan the early shared classical log-syntomic supplier; specify the actual integral period map and divided/undivided normalization before asserting the exact integral comparison.

<a id="layer-d-3"></a>
## D.3: The unramified local K₃ calculation

Work at p>3 with finite unramified factors and spectrum-level p-completion. Reduce normalized dilogarithms of prime-to-p roots to finite polylogarithms, prove p²-integrality and residue spanning, and lift by Nakayama. Product spanning isolates factors using differences of admissible inputs, including the prime-residue-field base case. Surjectivity plus equal finite free ranks gives injectivity through the existing Orzech property. Root classes and their regulator normalization then give generation of completed K₃.

**Atlas landmarks:** Completed K₃ of an unramified p-adic algebra; p-adic regulator on completed K₃; Unramified K₃ regulator theorem; Roots of unity generate completed K₃.

<a id="padichodgeregulators-d-3-unramified-etale-algebra"></a>
### Finite unramified étale Q_p-algebras

`PadicHodgeRegulators:D.3/unramified-etale-algebra` · comparison

A finite unramified étale Q_p-algebra is a Q_p-algebra L isomorphic to a finite product ∏_{i∈I} L_i of finite unramified field extensions L_i/Q_p; equivalently L ≅ W(k)[1/p] for a finite reduced F_p-algebra k = ∏_i F_{q_i} (Witt vectors of a finite product of finite fields), with k ≅ O_L/pO_L. Its ring of integers is O_L = ∏_i O_{L_i} = W(k), the integral closure of Z_p in L; its rank is [L : Q_p] = Σ_i [L_i : Q_p] = dim_{F_p} k; its Frobenius φ_L = ∏_i φ_{L_i} is the Witt-vector Frobenius W(Frob_k)[1/p]. For a number field F and a prime p unramified in F, F ⊗_Q Q_p ≅ ∏_{v|p} F_v is such an algebra, with O_F ⊗ Z_p = ∏_v O_v.

**Hypotheses.** p any prime; I finite (I = ∅ gives the zero algebra). The local-field carrier, unramified classification and Witt identification are imported from LocalFieldsRamification Layer 2; the API below is the required specialized supplier interface. Formal unramifiedness of a characteristic-zero field algebra only detects separability and does not detect arithmetic ramification.

**Prerequisites.** `mathlib:WittVector`; `mathlib:WittVector.frobenius`; [`PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`](#padichodgeregulators-d-1-unramified-frobenius-on-roots); `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Proof route.**

1. A finite unramified extension of Q_p with residue field F_q is W(F_q)[1/p], and W commutes with finite products.
2. The Witt-vector Frobenius lifts x ↦ x^p, so it is the arithmetic Frobenius of D.1/unramified-frobenius-on-roots on each factor.
3. For p unramified in F, each completion F_v is unramified over Q_p, and the semilocal equivalence of NumberFieldArithmetic layer 5 identifies F ⊗ Q_p with ∏_v F_v.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `IsUnramifiedEtaleAlgebra` | structure | IsUnramifiedEtaleAlgebra p L : L is a finite product of finite unramified field extensions of ℚ_[p] (data: the factor decomposition up to isomorphism). |
| `unramifiedEtaleAlgebra_equiv_witt` | equivalence | L ≃ₐ[ℚ_[p]] Localization.Away (p : WittVector p k) for k := O_L ⧸ p, a finite reduced 𝔽_p-algebra. |
| `unramifiedEtaleAlgebra_rank` | characterisation | Module.finrank ℚ_[p] L = Module.finrank (ZMod p) k. |
| `unramifiedEtaleAlgebra_frobenius` | data | The Frobenius φ_L : L ≃ₐ[ℚ_[p]] L induced by WittVector.frobenius on W(k); it fixes exactly ℚ_[p]^{#π_0} componentwise. |
| `unramifiedEtaleAlgebra_prod` | instance | Finite products of unramified étale algebras are unramified étale. |
| `unramifiedEtaleAlgebra_tensor_padic` | example | For a number field F and p unramified in F, F ⊗[ℚ] ℚ_[p] is unramified étale. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `unramified_rank_cubic` | computation | For F = Q(α), α³ − α² + 1 = 0 and p = 5, F ⊗ Q_5 is unramified étale of rank 3 with factors of residue degrees 2 and 1. |
| `unramified_zero` | degenerate | The zero algebra (empty product, k = 0) is unramified étale of rank 0. |
| `unramified_witt_compat` | compatibility | For k = F_q, the algebra W(F_q)[1/p] is the unramified extension Q_q of degree log_p q, and its Frobenius is Mathlib's WittVector.frobenius after inverting p. |
| `unramified_not_qp_zeta_p` | non-example | For p odd, Q_p(ζ_p) is finite étale but not unramified: its residue field is F_p while its degree is p − 1, so it is not of the form W(k)[1/p]. |

**Acceptance requirements.** K = Q(α), α³ − α² + 1 = 0, p = 5: K ⊗ Q_5 ≅ Q_{25} × Q_5 has rank 3 (GSWZ Example 4.3). Q_p(√p) and Q_p(ζ_p) (p odd) are finite étale but not unramified.

**Uses.** GSWZ §3.1, paragraph before Theorem 9: K_p ≅ ∏ Q_{p^{s_i}} and K_n(K_p) ≅ ∏ K_n(Q_{p^{s_i}}) for p unramified PadicHodgeRegulators:D.3/completed-k3-unramified: the class of algebras whose completed K_3 the layer computes HabiroNahmSeries:HB.9/followup-etale-module-contract: full quadratic étale algebras B_p = R_p[T]/(δT² − 1), including the split case, are of this form

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §3.1, paragraph before Theorem 9, p. 39. The class of algebras; the K-theory product comparison is D.3/completed-k3-unramified.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places](#request-d-1-14); [tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius](#request-d-1-16).

<a id="padichodgeregulators-d-3-completed-k3-unramified"></a>
### Completed K₃ of a finite unramified étale algebra

`PadicHodgeRegulators:D.3/completed-k3-unramified` · construction · `completedK3`

For a finite unramified étale Q_p-algebra L = ∏_i L_i put K_3(L; Z_p) := π_3 K(L; Z_p), the p-completed K-theory of KTheoryFiniteLocalFields:L.1/completed-k-theory. The projections induce K_3(L; Z_p) ≅ ∏_i K_3(L_i; Z_p) (finite products commute with K-theory and with derived p-completion), and K_3(O_L; Z_p) → K_3(L; Z_p) is an isomorphism. The étale Chern classes give c_L : K_3(L; Z_p) ≅ H^1(L, Z_p(2)) := ∏_i H^1(L_i, Z_p(2)). For p > 3, K_3(L; Z_p) is a free Z_p-module of rank [L : Q_p]; for p ∈ {2, 3} it has the nonzero torsion Z/w_2^{(p)}(L_i) on each factor.

**Hypotheses.** L finite unramified étale over Q_p (D.3/unramified-etale-algebra); freeness needs p > 3.

**Prerequisites.** [`PadicHodgeRegulators:D.3/unramified-etale-algebra`](#padichodgeregulators-d-3-unramified-etale-algebra); `KTheoryFiniteLocalFields:L.1/completed-k-theory`; `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`; `KTheoryFiniteLocalFields:L.6/completed-k3-of-unramified-fields`; `KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1`; `KTheoryFiniteLocalFields:L.6/ring-of-integers-versus-field`.

**Proof route.**

1. Product comparison: K_n(R × S) ≅ K_n(R) × K_n(S) (GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring (ii)); mod p^ν coefficients and the homotopy limit defining K(−; Z_p) commute with finite products.
2. On each factor, KTheoryFiniteLocalFields:L.6/completed-k3-of-unramified-fields gives K_3(O_{L_i}; Z_p) ≅ K_3(L_i; Z_p) ≅ H^1(L_i, Z_p(2)) ≅ Z_p^{[L_i:Q_p]} ⊕ Z/w_2^{(p)}(L_i), with w_2^{(p)} = 1 for p ≥ 5.
3. The Chern isomorphism is natural, so it is compatible with the product decomposition.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `completedK3` | data | completedK3 p L := π_3 K(L; ℤ_p), a ℤ_[p]-module. |
| `completedK3_prodEquiv` | equivalence | completedK3 p (∏ i, L i) ≃ₗ[ℤ_[p]] ∏ i, completedK3 p (L i). |
| `completedK3_integers_equiv` | equivalence | completedK3 p O_L ≃ₗ[ℤ_[p]] completedK3 p L, induced by O_L → L. |
| `completedK3_chernEquiv` | equivalence | completedK3 p L ≃ₗ[ℤ_[p]] H^1(L, ℤ_p(2)), componentwise étale Chern class c_{2,1}. |
| `completedK3_free` | characterisation | For p > 3, Module.Free ℤ_[p] (completedK3 p L) and Module.finrank = [L : ℚ_[p]]. |
| `completedK3_map` | functoriality | A ℚ_[p]-algebra map f : L → L' induces completedK3 p L → completedK3 p L', with map_id and map_comp; the Frobenius φ_L acts by functoriality. |
| `completedK3_transfer` | functoriality | For L → L' finite free, a transfer completedK3 p L' → completedK3 p L, corresponding to corestriction under the Chern isomorphisms. |
| `completedK3_extensionality` | extensionality | The completed module is imported from p-completed K-theory. Equality of induced maps is pointwise, and product maps are determined by all factor projections. Inherit Module and map_zero/map_add/map_smul rather than define a new completion carrier. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `completedK3_rank_cubic` | computation | For p = 5 and L = Q_{25} × Q_5, completedK3 5 L is free of rank 3. |
| `completedK3_zero` | degenerate | completedK3 p 0 = 0 for the zero algebra. |
| `completedK3_chern_compat` | compatibility | For L = Q_p the Chern isomorphism agrees with KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1 at i = 2. |
| `completedK3_three_torsion` | non-example | For p = 3, completedK3 3 Q_3 has torsion Z/3 (w_2^{(3)}(Q_3) = 3), so it is not free and no injective map to a torsion-free lattice exists. |

**Acceptance requirements.** For p = 5 and L = Q_{25} × Q_5, K_3(L; Z_5) ≅ Z_5³. For p = 3 and L = Q_3, K_3(Q_3; Z_3) ≅ Z_3 ⊕ Z/3: the freeness clause fails at p = 3.

**Uses.** GSWZ Theorem 9, (183): the source of the isomorphism D_p : K_3(K_p; Z_p) → p²O_{K_p} PadicHodgeRegulators:D.4/global-p-adic-regulator: the target of the localisation map λ_{F,3} from global K_3 HabiroNumberFields:HB.7/pochhammer-sections: ξ̂ ∈ K_3(K_p) ⊗ Z_p is presented by roots of unity in this group

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Proof of Theorem 9, p. 39. The structure of the group; r = [K : Q] here.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-3-completed-k3-bloch-description"></a>
### Completed K₃ of an unramified field is the completed Bloch group

`PadicHodgeRegulators:D.3/completed-k3-bloch-description` · theorem

Let L be a finite unramified extension of Q_p with p ≥ 3. For every ν ≥ 1 the natural maps K_3(L)/p^ν → K_3^ind(L)/p^ν → B(L)/p^ν are isomorphisms (B(L) Suslin's Bloch group), and the completion map identifies K_3(L; Z_p) with lim_ν K_3(L)/p^ν ≅ lim_ν B(L)/p^ν =: B(L)^∧_p. In particular the image of B(L) — more precisely of K_3(L), which surjects onto every B(L)/p^ν — is dense in K_3(L; Z_p), and the kernel of K_3(L) → K_3(L; Z_p) is ⋂_ν p^ν K_3(L). For a finite product L = ∏ L_i the statements hold factorwise.

**Hypotheses.** L/Q_p finite unramified and p odd, so that μ(L) has order prime to p and ζ_p ∉ L.

**Prerequisites.** `KTheoryFiniteLocalFields:L.6/completion-exact-sequence`; `KTheoryFiniteLocalFields:L.6/milnor-k-of-local-fields`; `KTheoryFiniteLocalFields:L.3/moore-theorem`; `KTheoryFiniteLocalFields:L.6/finite-coefficient-lichtenbaum-quillen`; `K3BlochGroups:V.6/comparison-finite-coefficients`; `K3BlochGroups:V.4/suslin-exact-sequence`; `K3BlochGroups:V.2/k3-indecomposable`.

**Proof route.**

1. K_3^M(L) is uniquely divisible (KTheoryFiniteLocalFields:L.6/milnor-k-of-local-fields), so K_3(L)/p^ν = K_3^ind(L)/p^ν.
2. Suslin's sequence reduced mod p^ν (K3BlochGroups:V.6/comparison-finite-coefficients): K_3^ind(L)/p^ν → B(L)/p^ν is onto with kernel the image of μ̃(L)/p^ν, which vanishes because μ(L) has order prime to p and the enhancement is 2-primary.
3. The finite-coefficient groups are finite (L.6/finite-coefficient-lichtenbaum-quillen), so L.6/completion-exact-sequence gives 0 → lim_ν K_3(L)/p^ν → K_3(L; Z_p) → T_p K_2(L) → 0; Moore's theorem K_2(L) ≅ μ(L) ⊕ (divisible) with the divisible part uniquely divisible gives T_p K_2(L) = 0.
4. This also supplies the input K_3^M(L)/p^ν = 0 that K3BlochGroups:V.6/regulator-agreement-padic records as missing.

**Acceptance requirements.** For L = Q_5: K_3(Q_5; Z_5) ≅ Z_5 ≅ lim_ν B(Q_5)/5^ν. For p odd and L = Q_p(ζ_p) (ramified, μ_p ⊂ L) the first map's kernel contains the image of μ̃(L)/p ≠ 0: the hypothesis ζ_p ∉ L is used.

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Proof of Theorem 9, p. 39. The comparison of completed K_3 with the Bloch group used in the proof; the containment it claims is D.3/unramified-regulator-theorem (sourceIssues: GSWZ E39).

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-3-finite-polylogarithm"></a>
### Kontsevich's finite polylogarithm

`PadicHodgeRegulators:D.3/finite-polylogarithm` · definition · `finitePolylog`

For a prime p and n ∈ Z, the finite polylogarithm is the polynomial li_{n,p}(x) := Σ_{k=1}^{p−1} x^k / k^n ∈ F_p[x] (equivalently its lift with coefficients in Z_(p)). It has degree p − 1 (for p > 2), constant term 0, and satisfies x·li'_{n,p}(x) = li_{n−1,p}(x); li_{n,p}(1) = Σ_{k=1}^{p−1} k^{−n} ≡ 0 mod p exactly when (p − 1) ∤ n. In particular for p > 3: li_{2,p}(1) ≡ 0 and li'_{2,p}(1) = li_{1,p}(1) ≡ 0 mod p, so (x − 1)² divides li_{2,p}(x) in F_p[x].

**Hypotheses.** p prime; n ∈ Z (negative n allowed, k^{−n} = k^{|n|}).

**Prerequisites.** `mathlib:Polynomial`; `mathlib:ZMod`.

**Proof route.**

1. The power sums Σ_{k=1}^{p−1} k^m vanish mod p unless (p − 1) | m (sum over the cyclic group F_p^×).
2. x·d/dx(x^k/k^n) = x^k/k^{n−1} gives the differential relation; for n = 2 and p > 3, (p − 1) ∤ 2 and (p − 1) ∤ 1.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `finitePolylog` | data | finitePolylog p n : Polynomial (ZMod p) := Σ_{k=1}^{p−1} C ((k : ZMod p)^n)⁻¹ * X^k. |
| `finitePolylog_eval_zero` | simp | (finitePolylog p n).eval 0 = 0. |
| `finitePolylog_derivative` | relation | X * derivative (finitePolylog p n) = finitePolylog p (n − 1). |
| `finitePolylog_eval_one` | characterisation | (finitePolylog p n).eval 1 = 0 ↔ ¬ (p − 1 ∣ n). |
| `finitePolylog_two_rootMultiplicity_one` | relation | For 5 ≤ p, (X − 1)² ∣ finitePolylog p 2. |
| `finitePolylog_natDegree` | characterisation | For 2 < p, (finitePolylog p n).natDegree = p − 1. |
| `finitePolylog_extensionality` | extensionality | Equality of finite polylogarithm polynomials is determined coefficientwise by Polynomial.ext; coeff k = (k^n)^{-1} for 1≤k<p and 0 otherwise. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `finitePolylog_five_two` | computation | (finitePolylog 5 2).eval 2 = 1 in ZMod 5. |
| `finitePolylog_one_index` | degenerate | finitePolylog p 0 = Σ_{k=1}^{p−1} X^k, the truncated geometric series. |
| `finitePolylog_compat_coleman` | compatibility | For ζ ∈ μ(Q_{p^s}) ∖ {1} of order prime to p, the reduction of p^{−2}Li_2(ζ^p) is −li_{2,p}(ζ̄)/(1 − ζ̄)^p, the form of ColemanIntegration:L2/values-at-tame-roots-of-unity (c). |
| `finitePolylog_three_non_example` | non-example | (finitePolylog 3 2).eval 1 = 2 ≠ 0 in ZMod 3, so the factorisation li_{2,p} = (x − 1)² g_p fails at p = 3. |
| `finitePolylog_five_two_three` | computation | (finitePolylog 5 2).eval 3 = 3 in ZMod 5; hence f_5(3)=3/(3−1)^5=4. |
| `finitePolylog_five_two_minus_one` | computation | (finitePolylog 5 2).eval 4 = 0 in ZMod 5, so f_5(−1)=0. |

**Acceptance requirements.** li_{2,5}(2) = 2 + 1 + 2 + 1 = 1 in F_5. li_{2,3}(1) = 1 + 1/4 = 2 ≠ 0 in F_3: the double-root property fails at p = 3.

**Uses.** GSWZ §3.1, (177)–(180): the reduction of p^{−2}D_p at roots of unity is li_{2,p}(ζ)/(ζ − 1)^p, and its fibres are bounded by p − 2 PadicHodgeRegulators:D.3/residue-spanning: the counting argument for the spanning of the residue space ColemanIntegration:L2/values-at-tame-roots-of-unity: part (c) expresses p^{−k}Li_k(ζ) modulo p through li_{k,p}

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §3.1, (177), p. 38. The definition, verbatim up to layout.
- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Proof of Proposition 3.3, (180), p. 38. The double root at 1, valid for p > 3.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-3-finite-polylogarithm-reduction"></a>
### Reduction of the p-adic dilogarithm at roots of unity

`PadicHodgeRegulators:D.3/finite-polylogarithm-reduction` · lemma

Let p be odd, L an unramified extension of Q_p and ζ ∈ μ(L) ∖ {1}. Then D_L(ζ) = Li_2(ζ) ∈ p²O_L and p^{−2}D_L(ζ^p) ≡ li_{2,p}(ζ̄)/(ζ̄ − 1)^p mod p, where ζ̄ ∈ k_L^× is the residue of ζ. Equivalently, with σ(ζ) the root of unity with σ(ζ)^p = ζ, p^{−2}D_L(ζ) ≡ li_{2,p}(σ(ζ)‾)/(σ(ζ)‾ − 1)^p. Componentwise the same holds for a finite unramified product L and ζ ∈ μ(L) with all components ≠ 1.

**Hypotheses.** p odd, so every ζ ∈ μ(L) has order prime to p (L unramified).

**Prerequisites.** `ColemanIntegration:L2/values-at-tame-roots-of-unity`; [`PadicHodgeRegulators:D.1/etale-algebra-dilogarithm`](#padichodgeregulators-d-1-etale-algebra-dilogarithm); [`PadicHodgeRegulators:D.3/finite-polylogarithm`](#padichodgeregulators-d-3-finite-polylogarithm).

**Proof route.**

1. log_p(ζ) = 0, so D_L(ζ) = Li_2(ζ); ColemanIntegration:L2/values-at-tame-roots-of-unity (b) gives Li_2(ζ) ∈ p²Z_p[ζ] ⊆ p²O_L.
2. Part (c) of the same node: p^{−2}Li_2(ζ^p) ≡ −li_{2,p}(ζ̄)/(1 − ζ̄)^p mod p, and −(1 − ζ̄)^p = (ζ̄ − 1)^p for p odd.

**Acceptance requirements.** p = 5, ζ = ω(2) ∈ Q_5 (so ζ^5 = ζ): 25^{−1}D(ζ) ≡ li_{2,5}(2) = 1 mod 5, matching the Q_5-component of D_5(ζ_24) in GSWZ (273). For p = 2 and ζ = −1, ζ^p = 1 and D(1) is undefined: the printed statement of GSWZ Proposition 3.2 needs ζ^p ≠ 1.

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Proposition 3.2, (178), p. 38. The statement, for odd p; the extraction records the p = 2 caveat as GSWZ E80.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-3-dilogarithm-integrality"></a>
### p²-integrality of the dilogarithm on special units

`PadicHodgeRegulators:D.3/dilogarithm-integrality` · lemma

Let p > 3 and let L be a finite unramified étale Q_p-algebra. If z ∈ O_L satisfies z ∈ O_L^× and 1 − z ∈ O_L^× in every factor (z is a special unit), then D_L(z) ∈ p²O_L. This is GSWZ Lemma 3.1 for R^∧_p = O_{K_p}.

**Hypotheses.** p > 3; L unramified (each factor); z and 1 − z units in every factor.

**Prerequisites.** [`PadicHodgeRegulators:D.3/finite-polylogarithm-reduction`](#padichodgeregulators-d-3-finite-polylogarithm-reduction); [`PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`](#padichodgeregulators-d-1-teichmuller-unit-decomposition); `ColemanIntegration:L2/polylogarithm-expansion-at-a-root-of-unity`; `ColemanIntegration:L2/values-at-tame-roots-of-unity`; `ColemanIntegration:L0/log-one-add-convergence`.

**Proof route.**

1. Write z = ζ·(1 + x) with ζ = ω(z̄) and x ∈ pO_L (D.1/teichmuller-unit-decomposition); z̄ ≠ 1 because 1 − z is a unit, so ζ ≠ 1.
2. Expand D(ζ(1 + x)) in x around ζ (ColemanIntegration:L2/polylogarithm-expansion-at-a-root-of-unity): the constant term Li_2(ζ) lies in p²O; the first-order coefficients involve Li_1(ζ) ∈ pO and log(1 + x) ∈ pO; the higher Taylor coefficients have denominators k with v_p(x^k/k) ≥ k − v_p(k) ≥ 2 for k ≥ 2, using p > 3 and e = 1.
3. Each factor of L is treated separately.

**Acceptance requirements.** z = ω(2) ∈ Z_5 (a special unit): D(z) ∈ 25Z_5. z = p is not a unit and D^0(p) = Li_2(p) ≡ p mod p², so the unit hypothesis cannot be dropped. z = 1 + p has 1 − z = −p not a unit; the lemma does not apply there.

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Lemma 3.1 and proof, (175), p. 38. The statement and the root-of-unity input; the Taylor step is expanded in proofSteps.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-3-residue-spanning"></a>
### Dilogarithms of roots of unity span the residue space

`PadicHodgeRegulators:D.3/residue-spanning` · theorem

Let p > 3. (a) For every s ≥ 1, Span_{Z_p}{p^{−2}D(ζ) : ζ ∈ μ(Q_{p^s}) ∖ {1}} = Z_{p^s}. (b) For every s ≥ 1 also Span_{Z_p}{p^{−2}(D(ζ) − D(ζ')) : ζ, ζ' ∈ μ(Q_{p^s}) ∖ {1}} = Z_{p^s}. (c) Consequently, for a finite unramified product L = ∏_i Q_{p^{s_i}}, Span_{Z_p}{p^{−2}D_L(ζ) : ζ ∈ μ(L) with every component ≠ 1} = O_L. Statement (a) is GSWZ Proposition 3.3 with ζ = 1 excluded; (b) and (c) are needed for products once components equal to 1 are excluded.

**Hypotheses.** p > 3 (the argument uses li_{2,p}(1) ≡ li'_{2,p}(1) ≡ 0 mod p). s ≥ 1; L a finite product of unramified extensions of Q_p.

**Prerequisites.** [`PadicHodgeRegulators:D.3/finite-polylogarithm`](#padichodgeregulators-d-3-finite-polylogarithm); [`PadicHodgeRegulators:D.3/finite-polylogarithm-reduction`](#padichodgeregulators-d-3-finite-polylogarithm-reduction); [`PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`](#padichodgeregulators-d-1-unramified-frobenius-on-roots); `mathlib:Submodule.span`; `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot`; `ColemanIntegration:L2/dilogarithm-identities`; [`PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`](#padichodgeregulators-d-1-dilogarithm-scalar-extension).

**Proof route.**

1. The finite set of admissible tame roots has finitely generated Z_p-span; use the pinned Nakayama theorem with the finite free target O_L. Work modulo p and put f(x)=li_{2,p}(x)/(x−1)^p on F_{p^s}^×\{1}; zero is not a root of unity. Factor li_{2,p}=(x−1)^2g with deg g≤p−3. The equation g(x)−c(x−1)^{p−2}=0 is nonzero (for c=0, g is nonzero), so each fibre has at most p−2 points.
2. For s>1, #image(f)≥(p^s−2)/(p−2)>p^{s−1}. For s=1, f(−1)=0 by the inversion identity. At least one other admissible value is nonzero: otherwise li_{2,p} would have the p−2 admissible points and zero as roots and 1 as a double root, impossible for degree p−1. Thus #image(f)≥2>1 in the base case. Every translate image(f)−c has the same cardinality, so both values and differences span over F_p.
3. The map ζ↦ζ^p permutes the nontrivial tame roots and D(ζ^p)=φD(ζ). The finite-polylogarithm reduction identifies p^{-2}D(ζ^p) with f(ζ̄). Nakayama now gives the integral spans (a),(b). The base-case inversion may equivalently be read from D(−1)=0 and the reduction formula.
4. (c) Fix all components but one and subtract two admissible tuples. Part (b) produces O_{L_i} in that component and zero elsewhere for the scaled values p^{-2}D_L. Taking all factors gives O_L. No tuple with a component equal to 1 is used.

**Acceptance requirements.** p=5,s=1: μ_4\{1} has three elements. The residue values f(2)=1,f(3)=4,f(4)=0 generate F_5, and their differences also generate; f(4)=f(−1)=0 handles the s=1 count. p = 5 and L = Q_{25} × Q_5: the three values p^{−2}D_L(ζ_24), p^{−2}D_L(ζ_24²), p^{−2}D_L(ζ_24⁶) of GSWZ (273) (second line relabelled, GSWZ E56) form a Z_5-basis of O_L, as (274) presupposes. At p = 3 the factorisation of li_{2,3} fails (li_{2,3}(1) = 2), so the fibre bound and the proof do not apply.

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Proposition 3.3 and proof, (179)–(182), pp. 38–39. Statement (a); ζ = 1 is excluded (GSWZ E38) and p > 3 is used in the proof.
- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Proof of Proposition 3.3, (182), p. 39. The source count includes x=0; for nonzero admissible roots use the repaired q−2 count for s>1 and the separate s=1 argument in proofSteps.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-3-root-of-unity-classes"></a>
### Root-of-unity classes in completed K₃

`PadicHodgeRegulators:D.3/root-of-unity-classes` · construction · `rootClassK3`

Let p be odd, L a finite unramified étale Q_p-algebra and ζ ∈ μ(L) a root of unity of order m (prime to p) all of whose components are ≠ 1. Define [ζ]_L ∈ K_3(L; Z_p) as the image, under B(L) ⊗ Z_p → lim_ν B(L)/p^ν ≅ K_3(L; Z_p) (D.3/completed-k3-bloch-description, factorwise), of the Z_p-coefficient class ⟦ζ⟧ = m^{−1} ⊗ m[ζ] of K3BlochGroups:V.6/root-of-unity-class (iii) (componentwise; m[ζ] ∈ B(L) by K3BlochGroups:V.6/integral-root-multiple). This is the class GSWZ denote [ζ]: when ζ ∧ (1 − ζ) = 0 in Suslin's antisymmetric square (always the case after ⊗ Z_p, p odd), [ζ]_L is the image of [ζ] ∈ B(L), and GSWZ's ord(ζ)·D_p(ζ) is the regulator of the integral multiple m[ζ].

**Hypotheses.** p odd; L unramified (so ord(ζ) is prime to p); every component of ζ differs from 1 (GSWZ E38).

**Prerequisites.** `K3BlochGroups:V.6/root-of-unity-class`; `K3BlochGroups:V.6/integral-root-multiple`; `K3BlochGroups:V.6/root-of-unity-symbol`; `K3BlochGroups:V.3/angle-bracket-two-torsion`; [`PadicHodgeRegulators:D.3/completed-k3-bloch-description`](#padichodgeregulators-d-3-completed-k3-bloch-description); [`PadicHodgeRegulators:D.3/completed-k3-unramified`](#padichodgeregulators-d-3-completed-k3-unramified).

**Proof route.**

1. m is a unit in Z_p, so m^{−1} ⊗ m[ζ] is defined in B(L) ⊗ Z_p and is independent of the representative m (K3BlochGroups:V.6/root-of-unity-class).
2. The completion map B(L) ⊗ Z_p → B(L)^∧_p composed with D.3/completed-k3-bloch-description gives the class in K_3(L; Z_p); on a product it is taken factorwise.
3. ζ ∧ (1 − ζ) is 2-torsion in Suslin's antisymmetric square of each factor (the principal-unit part of 1 − ζ is uniquely (q − 1)-divisible), so after ⊗ Z_p the raw symbol [ζ] already lies in B(L) ⊗ Z_p and agrees with ⟦ζ⟧.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `rootClassK3` | data | rootClassK3 L ζ : completedK3 p L, for ζ a root of unity of L with all components ≠ 1. |
| `rootClassK3_eq_bloch` | compatibility | rootClassK3 L ζ is the image of K3BlochGroups' rootClassPadic ζ under B(L) ⊗ ℤ_p → completedK3 p L. |
| `rootClassK3_prod` | simp | For L = ∏ L_i, rootClassK3 L ζ = (rootClassK3 L_i ζ_i)_i. |
| `rootClassK3_map` | functoriality | For a ℚ_p-algebra map f : L → L', completedK3 map sends rootClassK3 L ζ to rootClassK3 L' (f ζ); in particular φ_L(rootClassK3 ζ) = rootClassK3 (ζ^p). |
| `rootClassK3_inv` | relation | rootClassK3 L ζ⁻¹ = −rootClassK3 L ζ. |
| `rootClassK3_mul_ord` | relation | ord(ζ) • rootClassK3 L ζ is the image of the integral Bloch element m[ζ]. |
| `rootClassK3_extensionality` | extensionality | In a finite product, two rootClassK3 values are equal iff all factor projections agree; the construction is invariant under equality of admissible root arguments. It is a function of roots, not asserted to be additive in the multiplicative root argument. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `rootClassK3_neg_one` | computation | For p > 3, rootClassK3 Q_p (−1) = 0. |
| `rootClassK3_order_two_product` | degenerate | For L = Q_p × Q_p and ζ = (−1, −1), rootClassK3 L ζ = 0, the product of two zero classes. |
| `rootClassK3_bloch_compat` | compatibility | When ζ ∧ (1 − ζ) = 0 in Suslin's antisymmetric square (K3BlochGroups:V.6/root-of-unity-symbol), rootClassK3 L ζ is the image of [ζ] ∈ B(L). |
| `rootClassK3_component_one` | non-example | For p = 5, L = Q_{25} × Q_5 and ζ = ζ_24^4 (Q_5 component 1), the class is not defined: the raw symbol [1] is not a Bloch-group generator and D(1) is undefined (GSWZ E38). |

**Acceptance requirements.** [−1]_{Q_p} = 0 for p > 3: the integral multiple 2[−1] = ⟨−1⟩ lies in B(Q_p) and is 2-torsion (K3BlochGroups:V.3/angle-bracket-two-torsion), so ⟦−1⟧ = 2^{−1} ⊗ 2[−1] = 0 in B(Q_p) ⊗ Z_p. A ζ with a component equal to 1 (for instance ζ_24^4 ∈ Q_{25} × Q_5 at p = 5, whose Q_5 component is 1) is rejected.

**Uses.** GSWZ Theorem 9, (183), and Example 4.3, (275): K_3(K_p; Z_p) is generated by the [ζ]; ξ = c_1[ζ_24] + c_2[ζ_24²] + c_3[ζ_24⁶] HabiroNumberFields:HB.7/followup-integral-linear-jet: a valid finite presentation ξ̂ = Σ a_ζ[ζ] with a_ζ ∈ Z_p and ζ ≠ 1 of order prime to p HabiroNumberFields:HB.7/pochhammer-sections: the sections Ψ_{[ζ]} are attached to these classes

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Theorem 9 and proof, p. 39. The classes and the integral multiple ord(ζ)·[ζ]; components equal to 1 are excluded (GSWZ E38).

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-3-local-regulator"></a>
### The p-adic regulator on completed K₃

`PadicHodgeRegulators:D.3/local-regulator` · construction · `localRegulator`

For a finite étale Q_p-algebra L = ∏ L_i (any p; L_i/Q_p finite) define D_L : K_3(L; Z_p) → L as the composite of the étale Chern isomorphism K_3(L; Z_p) ≅ H^1(L, Z_p(2)) (componentwise, D.2/etale-regulator), the inclusion into H^1(L, Q_p(2)) and the Bloch–Kato logarithm log_BK : H^1(L, Q_p(2)) ≅ D_dR(Q_p(2)) = L·e_2 ≅ L (L1/bloch-kato-logarithm, e_2 = t^{−2} ⊗ ε^{⊗2}), multiplied by the sign ε ∈ {±1} fixed so that D_L([ζ]_L) = +D_L(ζ) = +Li_2(ζ) on root-of-unity classes. By D.2/syntomic-etale-regulator-comparison, D_L = ε·reg_syn (Besser's normalisation) on the image of K_3(O_L), and by D.2/weight-two-dilogarithm-comparison D_L agrees with the dilogarithm D_L of D.1 on Bloch elements presented by special units of O_L. This is GSWZ's D_p of (19) and (183), defined on the completed group.

**Hypotheses.** L finite étale over Q_p; integrality and bijectivity statements are D.3/unramified-regulator-theorem (p > 3, L unramified).

**Prerequisites.** [`PadicHodgeRegulators:D.3/completed-k3-unramified`](#padichodgeregulators-d-3-completed-k3-unramified); [`PadicHodgeRegulators:D.2/etale-regulator`](#padichodgeregulators-d-2-etale-regulator); [`PadicHodgeRegulators:L1/bloch-kato-logarithm`](#padichodgeregulators-l1-bloch-kato-logarithm); [`PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`](#padichodgeregulators-d-2-syntomic-etale-regulator-comparison); [`PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`](#padichodgeregulators-d-2-weight-two-dilogarithm-comparison); [`PadicHodgeRegulators:D.3/root-of-unity-classes`](#padichodgeregulators-d-3-root-of-unity-classes); [`PadicHodgeRegulators:D.1/regulator-normalisation-dictionary`](#padichodgeregulators-d-1-regulator-normalisation-dictionary).

**Proof route.**

1. The Chern isomorphism and log_BK are Z_p-linear and continuous; their composite is defined on the completed group, which repairs the definitional gap recorded as GSWZ E39.
2. For roots of unity of order prime to p, ζ is a special unit, so D.2/weight-two-dilogarithm-comparison gives log_BK(c_{2,1}[ζ]_L) = ±Li_2(ζ); this fixes ε (the sign is the single sign of de Jeu's map).
3. The identification with Besser's syntomic regulator is D.2/syntomic-etale-regulator-comparison at n = 2.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `localRegulator` | data | localRegulator L : completedK3 p L →ₗ[ℤ_[p]] L. |
| `localRegulator_eq_logBK` | characterisation | localRegulator L = ε • (logBK ∘ chernEquiv) with ε = ±1 the pinned sign. |
| `localRegulator_rootClass` | simp | localRegulator L (rootClassK3 L ζ) = etaleDilog L ζ (= (Li_2(ζ_i))_i). |
| `localRegulator_specialUnits` | compatibility | On the image of a Bloch element Σ n_i [x_i] with x_i special units of O_L, localRegulator = Σ n_i etaleDilog L x_i. |
| `localRegulator_map` | functoriality | For a ℚ_p-algebra map f : L → L', localRegulator L' ∘ completedK3.map f = f ∘ localRegulator L; in particular localRegulator commutes with φ_L. |
| `localRegulator_transfer` | functoriality | For L → L' finite free, localRegulator L ∘ transfer = Tr_{L'/L} ∘ localRegulator L'. |
| `localRegulator_prod` | simp | On L = ∏ L_i, localRegulator is the product of the factor regulators. |
| `localRegulator_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `localRegulator_q5_root` | computation | localRegulator Q_5 (rootClassK3 Q_5 (teichmuller 2)) ≡ 25 mod 125. |
| `localRegulator_zero_algebra` | degenerate | localRegulator 0 = 0. |
| `localRegulator_syntomic_compat` | compatibility | On the image of K_3(O_L), localRegulator = ε·syntomicRegulator (D.2/syntomic-regulator) with n = 2. |
| `localRegulator_not_gros` | non-example | For L = Q_5, the Gros-normalised map (1 − 5^{−2})·localRegulator sends rootClassK3 (teichmuller 2) to a unit, so it is not localRegulator and does not have image 25Z_5. |

**Acceptance requirements.** L = Q_5: D_L([ω(2)]) ≡ 25 mod 125. On the zero algebra D_L = 0. D_L is not the Gros-normalised map: (1 − σ/p²)∘D_L has image O_L, not p²O_L, for L unramified and p > 3.

**Uses.** GSWZ (19), (22) and Theorem 9: the p-adic regulator D_p entering the formal completion of invertible sections and the local K_3 calculation PadicHodgeRegulators:D.4/global-p-adic-regulator: applied after the localisation map from global K_3 K3BlochGroups:V.6/regulator-agreement-padic: the p-adic regulator compared with the Bloch-group model modulo p^m

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §1.5, (19), p. 9. The map; here defined on the completed group as the regulator and compared with the dilogarithm where proved.
- [HK2011 (D.1)](#source-d-1-hk2011), Theorem 1.3.2 and Proposition 2.3.4, pp. 9 and 16. The identification of Besser's regulator with log_BK of Soulé's regulator.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-3-unramified-regulator-theorem"></a>
### The unramified p > 3 theorem

`PadicHodgeRegulators:D.3/unramified-regulator-theorem` · theorem

Let p > 3 and let L be a finite unramified étale Q_p-algebra (for instance K_p = K ⊗ Q_p for a number field K in which p is unramified). Then the p-adic regulator is a Z_p-linear isomorphism D_L : K_3(L; Z_p) ≅ p²O_L. The statement is not asserted for p ∈ {2, 3}, for ramified L, or for the uncompleted group K_3(L).

**Hypotheses.** p > 3; L a finite product of finite unramified extensions of Q_p.

**Prerequisites.** [`PadicHodgeRegulators:D.3/local-regulator`](#padichodgeregulators-d-3-local-regulator); [`PadicHodgeRegulators:D.3/completed-k3-unramified`](#padichodgeregulators-d-3-completed-k3-unramified); [`PadicHodgeRegulators:L1/integral-logarithm-unramified`](#padichodgeregulators-l1-integral-logarithm-unramified); [`PadicHodgeRegulators:D.3/residue-spanning`](#padichodgeregulators-d-3-residue-spanning); [`PadicHodgeRegulators:D.3/root-of-unity-classes`](#padichodgeregulators-d-3-root-of-unity-classes); `mathlib:Module.Free`; `mathlib:OrzechProperty`.

**Proof route.**

1. Structure: K_3(L; Z_p) ≅ H^1(L, Z_p(2)) is free of rank [L : Q_p] (D.3/completed-k3-unramified).
2. Image: log_BK(H^1(L, Z_p(2))) = 1!·p²O_L·e_2 = p²O_L because 2 ≤ p − 2 (L1/integral-logarithm-unramified). Hence D_L(K_3(L; Z_p)) = p²O_L, and D_L is injective on the torsion-free group since log_BK is injective. This supplies the containment and the extension to the completed group that GSWZ's proof asserts without proof (GSWZ E39).
3. Independent check of the image from below: D_L([ζ]_L) = Li_2(ζ) and these span p²O_L (D.3/residue-spanning (c)).
4. Alternatively, from the two inclusions p²O_L ⊆ image ⊆ p²O_L, a surjection between free Z_p-modules of the same finite rank is injective (Orzech property of commutative rings; Lean form unramifiedRegulator_injective_of_surjective).

**Acceptance requirements.** L = Q_{25} × Q_5 (p = 5, GSWZ Example 4.3): K_3(L; Z_5) ≅ 25·(Z_{25} × Z_5). L = Q_5: the generator [ω(2)] maps to an element of valuation exactly 2. p = 3, L = Q_3: K_3(Q_3; Z_3) ≅ Z_3 ⊕ Z/3 has torsion, so no injection into 9Z_3 exists; the theorem does not apply. L = Q_p(ζ_p), p odd (ramified): K_3(L; Z_p) has torsion Z/p, so the theorem does not apply.

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Theorem 9, (183), p. 39. Part (a); p unramified is implicit (D_p : B(K) → K_p is defined for unramified p).
- [BNQD2002 (D.1)](#source-d-1-bnqd2002), Lemme 1.3.2, p. 647. The index form of the integral Bloch–Kato logarithm used for the image.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-3-roots-of-unity-generate"></a>
### Completed K₃ is generated by roots of unity

`PadicHodgeRegulators:D.3/roots-of-unity-generate` · theorem

Let p > 3 and L a finite unramified étale Q_p-algebra. Then K_3(L; Z_p) is generated as a Z_p-module by the classes [ζ]_L, ζ ∈ μ(L) with every component ≠ 1; every ξ ∈ K_3(L; Z_p) has a finite presentation ξ = Σ_ζ a_ζ[ζ]_L with a_ζ ∈ Z_p, and for any such presentation D_L(ξ) = Σ_ζ a_ζ Li_2(ζ). Presentations are not unique; D_L(ξ) is.

**Hypotheses.** p > 3; L unramified; ζ ranges over roots of unity with all components ≠ 1 (GSWZ E38).

**Prerequisites.** [`PadicHodgeRegulators:D.3/unramified-regulator-theorem`](#padichodgeregulators-d-3-unramified-regulator-theorem); [`PadicHodgeRegulators:D.3/residue-spanning`](#padichodgeregulators-d-3-residue-spanning); [`PadicHodgeRegulators:D.3/root-of-unity-classes`](#padichodgeregulators-d-3-root-of-unity-classes); [`PadicHodgeRegulators:D.3/local-regulator`](#padichodgeregulators-d-3-local-regulator).

**Proof route.**

1. D_L is an isomorphism onto p²O_L (D.3/unramified-regulator-theorem) and D_L([ζ]_L) = Li_2(ζ) (D.3/local-regulator).
2. The Li_2(ζ) span p²O_L (D.3/residue-spanning (c), which also handles products once components equal to 1 are excluded); pulling back along D_L gives generation.
3. Linearity of D_L gives the value on any presentation.

**Acceptance requirements.** p = 5, L = Q_{25} × Q_5: [ζ_24], [ζ_24²], [ζ_24⁶] form a Z_5-basis, as GSWZ (274)–(275) use. For L = Q_5 the single class [ω(2)] generates K_3(Q_5; Z_5) ≅ Z_5.

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Theorem 9, p. 39. Part (b), with components equal to 1 excluded (GSWZ E38).

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

### Completion obligations for D.3

- Lemma-level decomposition of the Taylor-expansion step of D.3/dilogarithm-integrality.
- Exact 5-adic recomputation of GSWZ Example 4.3 as an executable acceptance test.

<a id="layer-d-4"></a>
## D.4: The global p-adic K₃ regulator and Habiro export

Assemble the local maps through the fixed semilocal equivalence, preserving restriction/transfer, traces, Frobenius, torsion and controlled denominators. Export this interface to Habiro-module gluing. The rational injectivity proposition and its stronger Q_p-linear form remain distinguished. The cubic-field example has an exact 5-adic acceptance specification still to be made executable.

**Atlas landmarks:** Global p-adic K₃ regulator.

<a id="padichodgeregulators-d-4-global-p-adic-regulator"></a>
### The global p-adic K₃ regulator

`PadicHodgeRegulators:D.4/global-p-adic-regulator` · construction · `globalPadicRegulator`

Let F be a number field and p a prime. The global p-adic regulator is D_{F,p} := D_{F⊗Q_p} ∘ λ_{F,p} : K_3(F) → F ⊗_Q Q_p ≅ ∏_{v|p} F_v, where λ_{F,p} : K_3(F) → ∏_{v|p} K_3(F_v; Z_p) = K_3(F ⊗ Q_p; Z_p) is the semilocal completed map of KTheoryFiniteLocalFields:L.7/semilocal-completed-map and D_{F⊗Q_p} is the regulator of D.3/local-regulator. It kills the torsion subgroup of K_3(F) and induces D_{F,p} ⊗ Q : K_3(F) ⊗ Q → F ⊗ Q_p; for p > 3 unramified in F its image lies in p²(O_F ⊗ Z_p).

**Hypotheses.** F a number field, p any prime; the integrality clause needs p > 3 unramified in F.

**Prerequisites.** `KTheoryFiniteLocalFields:L.7/semilocal-completed-map`; [`PadicHodgeRegulators:D.3/local-regulator`](#padichodgeregulators-d-3-local-regulator); [`PadicHodgeRegulators:D.3/unramified-regulator-theorem`](#padichodgeregulators-d-3-unramified-regulator-theorem); `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Proof route.**

1. λ_{F,p} is the product of the completion maps c_v followed by p-completion; under the semilocal equivalence F ⊗ Q_p ≅ ∏_v F_v it is induced by F → F ⊗ Q_p (KTheoryFiniteLocalFields:L.7/semilocal-completed-map).
2. D_{F⊗Q_p} is Z_p-linear with torsion-free target, so torsion classes of K_3(F) map to 0.
3. For p > 3 unramified, D.3/unramified-regulator-theorem gives the integrality.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `globalPadicRegulator` | data | globalPadicRegulator F p : K_3(F) →+ F ⊗[ℚ] ℚ_[p]. |
| `globalPadicRegulator_component` | projection | Its v-component is localRegulator F_v ∘ c_v. |
| `globalPadicRegulator_torsion` | simp | globalPadicRegulator F p x = 0 for every torsion x. |
| `globalPadicRegulator_integral` | characterisation | For 3 < p unramified in F, its range lies in p² • (𝓞_F ⊗ ℤ_p). |
| `globalPadicRegulator_rat` | constructor | The extension K_3(F) ⊗ ℚ →ₗ[ℚ] F ⊗ ℚ_[p]. |
| `globalPadicRegulator_galois` | functoriality | For τ ∈ Aut(F), globalPadicRegulator F p ∘ K_3(τ) = (τ ⊗ 1) ∘ globalPadicRegulator F p. |
| `globalPadicRegulator_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `globalPadicRegulator_rat_zero` | computation | globalPadicRegulator ℚ p = 0, since K_3(ℚ) ≅ ℤ/48 is finite. |
| `globalPadicRegulator_torsion_zero` | degenerate | For F totally real, K_3(F) ⊗ Q = 0 (Borel: rank r_2 = 0), so globalPadicRegulator F p ⊗ Q = 0. |
| `globalPadicRegulator_bloch_compat` | compatibility | For ξ ∈ K_3(F) whose Bloch image is presented by special units at p, globalPadicRegulator F p ξ = blochDilog F p (presentation) (D.4/special-unit-formula). |
| `globalPadicRegulator_not_injective_claim` | non-example | For F imaginary quadratic and p split, K_3(F) ⊗ Q has rank 1 while F ⊗ Q_p has rank 2; injectivity of globalPadicRegulator ⊗ Q is a separate proposition (D.4/padic-k3-regulator-injectivity), not a consequence of the ranks. |

**Acceptance requirements.** F = Q: K_3(Q) ≅ Z/48 is torsion, so D_{Q,p} = 0 for every p. F = Q(α), α³ − α² + 1 = 0, p = 5: D_{F,5}(ξ) for the class ξ of 5_2 is the value (271) of GSWZ (D.4/example-cubic-field-five-two).

**Uses.** GSWZ §1.5, Definition 1.3 and (22): the formal completion f̂ with log f̂_m = D_p(ξ)/(m² log q) + log f_m HabiroNumberFields:HB.7/invertible-local-sections: the K_3-indexed local sections use D_p(ξ) in GSWZ's normalisation HabiroNahmSeries:HB.9/p-adic-regulator-input: D_p(ξ) of the Nahm class ξ at primes p ∤ Δ Polylogarithms:P.6/padic-regulator: the weight-one analogue is the p-adic unit regulator of D.1/unit-logarithm-kernel

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §1.5, (19), p. 9. The map from K_3 of the semilocal algebra; precomposed with localisation from K_3(K).

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places](#request-d-1-14).

<a id="padichodgeregulators-d-4-special-unit-formula"></a>
### The global regulator on special-unit presentations

`PadicHodgeRegulators:D.4/special-unit-formula` · theorem

Let F be a number field, p a prime, and let ξ ∈ K_3(F) have image in B(F) ⊗ Q presented as Σ_i n_i[z_i] (n_i ∈ Q) with z_i and 1 − z_i units at every prime of F above p. Then D_{F,p}(ξ) = ±Σ_i n_i D_{F,p}^{dil}([z_i]), where D^{dil}_{F,p} is the combined dilogarithm of D.1/combined-dilogarithm and the sign is the pinned sign of D.3/local-regulator. In particular: (a) for every root of unity ζ ≠ 1 of F, D_{F,p}([ζ]) = Li_2(ζ ⊗ 1) componentwise; (b) for a fixed presentation the hypothesis holds for all but finitely many p; (c) when R = O_F[1/Δ] and all z_i, 1 − z_i ∈ R^×, the formula holds at every p ∤ Δ. For presentations by symbols that are not special units at p the formula is Besser–de Jeu's Conjecture 1.14 (gap).

**Hypotheses.** z_i, 1 − z_i ∈ O_{F,(v)}^× for every v | p; the presentation lies in the image of B(F) ⊗ Q under Suslin's map.

**Prerequisites.** [`PadicHodgeRegulators:D.4/global-p-adic-regulator`](#padichodgeregulators-d-4-global-p-adic-regulator); [`PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`](#padichodgeregulators-d-2-weight-two-dilogarithm-comparison); [`PadicHodgeRegulators:D.1/combined-dilogarithm`](#padichodgeregulators-d-1-combined-dilogarithm); [`PadicHodgeRegulators:D.3/local-regulator`](#padichodgeregulators-d-3-local-regulator); `KTheoryFiniteLocalFields:L.7/restriction-completion-square`.

**Proof route.**

1. At each v | p, the localisation of ξ is presented by special units of O_v; D.2/weight-two-dilogarithm-comparison (BdJ Theorem 1.10 for number fields) gives the v-component.
2. Roots of unity of any order: BdJ Theorem 1.12.
3. (b) is BdJ Remark 1.11: a fixed finite presentation involves finitely many elements, each a unit away from finitely many primes.

**Acceptance requirements.** F = Q(α), α³ − α² + 1 = 0: ξ = 2[1 − α²] + [1 − α] with 1 − α², α², 1 − α, α global units, so the formula holds at every p (D.4/example-cubic-field-five-two). F = Q(ζ_m), p ∤ m: D_{F,p}([ζ_m]) = (Li_2(σ_v ζ_m))_{v|p}.

**Sources.**

- [BdJ2003 (D.1)](#source-d-1-bdj2003), Theorem 1.10(2) and Remark 1.11, p. 5. The number-field version and its scope.
- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Lemma 3.1, p. 38. GSWZ work with special units of R = O_K[1/Δ], which is the range of this theorem.

**Open obligations.** [The dilogarithm formula for arbitrary Bloch elements (Besser–de Jeu Conjecture 1.14, n = 2)](#gap-d-1-1); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-4-norm-trace-compatibility"></a>
### Restriction and transfer for the global regulator

`PadicHodgeRegulators:D.4/norm-trace-compatibility` · theorem

Let E/F be a finite extension of number fields and p a prime. (a) Restriction: D_{E,p}(res_{E/F} ξ) = ι(D_{F,p}(ξ)) for ξ ∈ K_3(F), ι : F ⊗ Q_p → E ⊗ Q_p. (b) Transfer: D_{F,p}(N_{E/F} η) = Tr_{E⊗Q_p/F⊗Q_p}(D_{E,p}(η)) for η ∈ K_3(E). (c) Consequently D_{F,p}(N_{E/F} res_{E/F} ξ) = [E : F]·D_{F,p}(ξ). The same holds for the local regulators of D.3 along finite extensions of finite étale Q_p-algebras.

**Hypotheses.** E/F finite; Iwasawa branch; Bloch–Kato logarithms of the factors.

**Prerequisites.** [`PadicHodgeRegulators:D.4/global-p-adic-regulator`](#padichodgeregulators-d-4-global-p-adic-regulator); `KTheoryFiniteLocalFields:L.7/semilocal-completed-map`; `KTheoryFiniteLocalFields:L.7/transfer-completion-formula`; [`PadicHodgeRegulators:D.2/etale-regulator`](#padichodgeregulators-d-2-etale-regulator); [`PadicHodgeRegulators:L1/twist-and-change-of-field`](#padichodgeregulators-l1-twist-and-change-of-field); [`PadicHodgeRegulators:D.1/logarithm-norm-trace`](#padichodgeregulators-d-1-logarithm-norm-trace).

**Proof route.**

1. λ is compatible with restriction and transfer (KTheoryFiniteLocalFields:L.7/semilocal-completed-map and L.7/transfer-completion-formula).
2. Locally, the étale regulator takes restriction to restriction and transfer to corestriction (D.2/etale-regulator API), and log_BK takes restriction to inclusion and corestriction to trace on D_dR(Q_p(2)) (L1/twist-and-change-of-field).
3. (c) follows from (a), (b) and Tr∘ι = [E : F].

**Acceptance requirements.** F = Q, E = Q(ζ_3), p = 7: D_{Q,7}(N[ζ_3]) = Tr(D_{E,7}([ζ_3])) = Li_2(ζ_3) + Li_2(ζ_3^{−1}) = 0, consistent with K_3(Q) being torsion. Transfer is not multiplicative on sections: the HabiroNumberFields norm of sections corresponds to this additive trace on degrees, not to a product of regulators.

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §3.1, paragraph after (174), p. 38. Componentwise definition, which makes the trace compatibility a sum over embeddings.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-4-frobenius-compatibility"></a>
### Frobenius compatibility of the p-adic regulator

`PadicHodgeRegulators:D.4/frobenius-compatibility` · theorem

Let p be unramified in the number field F and let φ_p be the Frobenius of the unramified étale algebra F ⊗ Q_p ≅ ∏_{v|p} F_v (the product of the arithmetic Frobenii). Then φ_p acts on K_3(F ⊗ Q_p; Z_p) by functoriality and D_{F⊗Q_p}(φ_p x) = φ_p(D_{F⊗Q_p}(x)); in particular D_p(φ_p ξ) = φ_p D_p(ξ) for ξ ∈ K_3(F), with φ_p ξ := φ_p λ_{F,p}(ξ). On root-of-unity classes, φ_p[ζ] = [ζ^p] and D(ζ^p) = φ_p D(ζ).

**Hypotheses.** p unramified in F (any p for the functoriality; p > 3 for the integral statements it is combined with).

**Prerequisites.** [`PadicHodgeRegulators:D.3/local-regulator`](#padichodgeregulators-d-3-local-regulator); [`PadicHodgeRegulators:D.3/unramified-etale-algebra`](#padichodgeregulators-d-3-unramified-etale-algebra); [`PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`](#padichodgeregulators-d-1-dilogarithm-scalar-extension); [`PadicHodgeRegulators:D.3/root-of-unity-classes`](#padichodgeregulators-d-3-root-of-unity-classes).

**Proof route.**

1. φ_p is a Q_p-algebra automorphism, so D.3/local-regulator's functoriality (étale Chern classes and log_BK are natural for automorphisms of the field) gives the identity.
2. On roots of unity this is D.1/dilogarithm-scalar-extension (b) with φ(ζ) = ζ^p.

**Acceptance requirements.** GSWZ (273): D_5(ζ_24^5) = φ(D_5(ζ_24)) in the Q_{25}-component. With the geometric Frobenius in place of the arithmetic one the identity reads D(ζ^{p^{-1}}) = φ^{−1}D(ζ); the convention is pinned to the arithmetic Frobenius (Huber–Kings warn about this choice).

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), §3.1, (176), p. 38. The Frobenius on roots of unity used with D_p(φ_p ξ) = φ_p D_p(ξ).

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-4-torsion-and-denominators"></a>
### Torsion classes and controlled denominators

`PadicHodgeRegulators:D.4/torsion-and-denominators` · theorem

Let F be a number field and p > 3 unramified in F. (a) Every torsion element of K_3(F) has D_{F,p} = 0. (b) If β ∈ K_3(F) ⊗ Q satisfies Nβ ∈ image(K_3(F)) for a nonzero integer N, then D_{F,p}(β) ∈ p^{2 − v_p(N)}(O_F ⊗ Z_p). (c) For a root of unity ζ ∈ μ(F) ∖ {1} of order m, the coefficient-localised class ⟦ζ⟧ ∈ B(F) ⊗ Z[1/m] of K3BlochGroups:V.6/root-of-unity-class has D_{F,p}(⟦ζ⟧) = Li_2(ζ ⊗ 1), which lies in p²(O_F ⊗ Z_p) when p ∤ m. (d) The image D_{F,p}(K_3(F)) is a finitely generated Z-submodule of rank at most r_2(F) inside p²(O_F ⊗ Z_p); its Z_p-span need not be all of p²(O_F ⊗ Z_p).

**Hypotheses.** F a number field; p > 3 unramified in F for (b)–(d). N≠0 in the denominator bound; the root-of-unity notation is a coefficient-localized Bloch class transported rationally, not necessarily the raw integral symbol [ζ].

**Prerequisites.** [`PadicHodgeRegulators:D.4/global-p-adic-regulator`](#padichodgeregulators-d-4-global-p-adic-regulator); [`PadicHodgeRegulators:D.4/special-unit-formula`](#padichodgeregulators-d-4-special-unit-formula); `K3BlochGroups:V.5/k3-number-field`; `K3BlochGroups:V.2/k3-rank-borel`; `K3BlochGroups:V.6/root-of-unity-class`; `K3BlochGroups:V.6/comparison-rational`.

**Proof route.**

1. (a) The target is torsion-free.
2. (b) D_{F,p}(Nβ) ∈ p²(O_F ⊗ Z_p) by D.4/global-p-adic-regulator, and division by N costs v_p(N).
3. (c) D.4/special-unit-formula (a) and linearity: D(m^{−1} ⊗ m[ζ]) = m^{−1}·m·Li_2(ζ).
4. (d) K_3(F) is finitely generated of rank r_2 (K3BlochGroups:V.2/k3-rank-borel); the finitely generated global image has Z-rank≤r_2; λ_{F,p}(K_3(F)) spans a Z_p-submodule of K_3(F ⊗ Q_p; Z_p) of rank ≤ r_2 ≤ [F : Q].

**Acceptance requirements.** F = Q(√−3), p = 7 (split): D_{F,7} kills the finite torsion subgroup Z/w_2(F); the non-torsion part has rank r_2 = 1 inside a rank-2 target. If N=p and pβ is integral, the bound places its regulator in p(O_F⊗Z_p). This is an upper bound on denominators; it does not establish that a global class attains the bound.

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Proof of Theorem 9, p. 39. Torsion-freeness of the target, which makes torsion classes vanish.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-4-habiro-regulator-export"></a>
### The regulator exported to Habiro-module gluing

`PadicHodgeRegulators:D.4/habiro-regulator-export` · comparison

Let K be a number field, Δ a positive integer divisible by disc(K) and by 6, R = O_K[1/Δ], and p ∤ Δ (so p > 3 is unramified in K). The p-adic regulator used to define invertible L_p(ξ)-sections (GSWZ Definition 1.3, (22)) is D_p := D_{K,p} : K_3(K) → p²R^∧_p ⊂ K_p = R^∧_p[1/p] = K ⊗ Q_p, with: (i) the Iwasawa branch and D_p([ζ]) = Li_2(ζ) on roots of unity; (ii) D_p(φ_p ξ) = φ_p D_p(ξ); (iii) D_p(ξ) = Σ n_i D(z_i) for presentations by Δ-special units z_i, 1 − z_i ∈ R^×; (iv) every ξ has a Z_p-presentation λ_{K,p}(ξ) = Σ a_ζ [ζ]_{K_p} by roots of unity of order prime to p with all components ≠ 1, and D_p(ξ) = Σ a_ζ Li_2(ζ); (v) scalar dictionary: D_p = ε·log_BK∘r^et_2 (Bloch–Kato, e_2-basis), D_p = Besser's syntomic regulator, and the Gros normalisation is (1 − φ_p/p²)·D_p, which maps p²R^∧_p onto R^∧_p. No injectivity of λ_{K,p} ⊗ Q is asserted (D.4/padic-k3-regulator-injectivity).

**Hypotheses.** Δ divisible by disc(K) and 6; p ∤ Δ.

**Prerequisites.** [`PadicHodgeRegulators:D.4/global-p-adic-regulator`](#padichodgeregulators-d-4-global-p-adic-regulator); [`PadicHodgeRegulators:D.4/special-unit-formula`](#padichodgeregulators-d-4-special-unit-formula); [`PadicHodgeRegulators:D.4/frobenius-compatibility`](#padichodgeregulators-d-4-frobenius-compatibility); [`PadicHodgeRegulators:D.3/roots-of-unity-generate`](#padichodgeregulators-d-3-roots-of-unity-generate); [`PadicHodgeRegulators:D.1/regulator-normalisation-dictionary`](#padichodgeregulators-d-1-regulator-normalisation-dictionary); [`PadicHodgeRegulators:D.2/gros-normalisation`](#padichodgeregulators-d-2-gros-normalisation).

**Proof route.**

1. (i), (ii), (iii) are D.4/global-p-adic-regulator, D.4/frobenius-compatibility and D.4/special-unit-formula (c).
2. (iv) applies D.3/roots-of-unity-generate to λ_{K,p}(ξ) ∈ K_3(K_p; Z_p).
3. (v) collects D.3/local-regulator and D.2/gros-normalisation.

**Acceptance requirements.** GSWZ Example 4.3 at p = 5 (Δ = 6·23): D.4/example-cubic-field-five-two. With the Gros normalisation in (22) the integrality condition (21) would change by the factor (1 − φ_p/p²); the export pins Besser's normalisation.

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Definition 1.3, (20)–(22), p. 9. The use of D_p(ξ) that fixes the normalisation.
- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Theorem 1, p. 9. The range of primes for which the export is made.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-4-padic-k3-regulator-injectivity"></a>
### The p-adic K₃ regulator injectivity proposition

`PadicHodgeRegulators:D.4/padic-k3-regulator-injectivity` · definition · `PadicK3RegulatorInjective`

For a number field F and prime p, Inj(F,p) means injectivity of the Q-linear map D_{F,p}⊗Q:K_3(F)⊗Q→F⊗Q_p. Since the source has Q-dimension r_2(F), this is equivalent to Z-rank r_2(F) of the finitely generated integral image. Separately, StrongInj(F,p) means injectivity of the Q_p-linear extension K_3(F)⊗Q_p→F⊗Q_p, equivalently Q_p-dimension r_2(F) of its span, or Z_p-rank r_2(F) of the Z_p-span. StrongInj implies Inj; the converse is not a formal equivalence. Neither assertion for positive r_2 follows from Borel’s rank formula or the local D.3 isomorphism.

**Hypotheses.** F a number field, p a prime.

**Prerequisites.** [`PadicHodgeRegulators:D.4/global-p-adic-regulator`](#padichodgeregulators-d-4-global-p-adic-regulator); `K3BlochGroups:V.2/k3-rank-borel`; `K3BlochGroups:V.5/k3-number-field`.

**Proof route.**

1. Define the two injectivity predicates over their specified scalar fields. Rationalizing a homomorphism from the finitely generated group gives the Z-rank criterion for Inj; extending scalars to Q_p gives the Q_p-span criterion for StrongInj. A Q-linearly independent set of p-adic vectors need not be Q_p-linearly independent: (a,b)↦a+αb is injective on Q² for α∈Q_p\Q, but its Q_p-linear extension has the nonzero kernel (−α,1). No arithmetic converse is claimed.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `PadicK3RegulatorInjective` | data | PadicK3RegulatorInjective F p : Prop := Function.Injective (globalPadicRegulator_rat F p). |
| `padicK3RegulatorInjective_of_totallyReal` | example | If F is totally real, PadicK3RegulatorInjective F p holds. |
| `padicK3RegulatorInjective_iff_rank` | characterisation | PadicK3RegulatorInjective F p ↔ the integral image has Z-rank r_2(F), equivalently the rational image has Q-dimension r_2(F). This is not a Q_p-span criterion. |
| `padicK3RegulatorInjective_baseChange` | functoriality | For E/F finite, PadicK3RegulatorInjective E p implies PadicK3RegulatorInjective F p (restriction is injective rationally and compatible with D.4/norm-trace-compatibility). |
| `StrongPadicK3RegulatorInjective` | data | Function.Injective of the Q_p-linear extension of globalPadicRegulator_rat; equivalent to Q_p-span dimension r_2(F). |
| `strongPadicK3RegulatorInjective_implies` | relation | StrongPadicK3RegulatorInjective F p implies PadicK3RegulatorInjective F p; no converse from linear algebra. |
| `PadicK3RegulatorInjective_extensionality` | extensionality | The injectivity predicates depend only on the specified Q-linear or Q_p-linear map respectively: pointwise equal maps give equivalent predicates. Proof witnesses are unique by proof irrelevance; scalar extension is not an extensionality equivalence. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `injective_rat` | computation | PadicK3RegulatorInjective ℚ p holds, since K_3(ℚ) ⊗ ℚ = 0. |
| `injective_totally_real` | degenerate | For F totally real (r_2 = 0) the source is zero and the proposition holds. |
| `injective_rank_compat` | compatibility | For F imaginary quadratic, the proposition is equivalent to D_{F,p}(ξ_0) ≠ 0 for a generator ξ_0 of K_3(F) modulo torsion. |
| `injective_not_from_rank` | non-example | A zero map from a nonzero Q-vector space into a larger Q_p-vector space is not injective. The inequality r_2≤[F:Q] alone supplies no information about the regulator’s kernel. |
| `injective_scalar_extension_non_example` | non-example | For α∈Q_p outside Q, (a,b)↦a+αb on Q² is injective, while the Q_p-linear map with the same formula has nonzero kernel (−α,1). Thus rational injectivity alone does not imply full Q_p-span rank. |

**Acceptance requirements.** Inj(F, p) holds trivially when r_2(F) = 0. Inj(F, p) is not asserted for any F with r_2(F) ≥ 1.

**Uses.** PadicHodgeRegulators D.4 stage text: keep the higher p-adic regulator conjecture a distinct proposition ColemanIntegration:L3/padic-beilinson-conjecture: the weight-two Artin-motive case of the p-adic Beilinson conjecture contains non-vanishing of such regulators

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Theorem 9, p. 39. A local statement; it says nothing about the image of global K_3, whence the separate proposition.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-4-example-cubic-field-five-two"></a>
### GSWZ Example 4.3: the class of 5₂ at p = 5

`PadicHodgeRegulators:D.4/example-cubic-field-five-two` · application

Let K = Q(α), α³ − α² + 1 = 0 (discriminant −23), z_1 = z_3 = 1 − α², z_2 = z_1² − z_1 + 2 = 1 − α, and ξ = [z_1] + [z_2] + [z_3] = 2[1 − α²] + [1 − α] ∈ B(K) (the class of the knot 5_2). All of 1 − α², α², 1 − α and α are units of O_K (norm ±1). At p = 5, K_5 ≅ Q_{25} × Q_5, μ(K_5) ≅ μ_24 × μ_4, and ζ_24 := lim_s α^{5^{2s}} has order 24 with Q_5-component the Teichmüller lift of 2 (order 4). Then D_5(ξ) = c_1D_5(ζ_24) + c_2D_5(ζ_24²) + c_3D_5(ζ_24⁶) with c_1 = 1 + 4·5 + 3·5² + ⋯, c_2 = 3 + 5 + ⋯, c_3 = 1 + 5 + 4·5² + ⋯, hence λ_{K,5}(ξ) = c_1[ζ_24] + c_2[ζ_24²] + c_3[ζ_24⁶] in K_3(K_5; Z_5). The second line of GSWZ (273) is the value D_5(ζ_24²), misprinted there with the label ζ_24^5 (GSWZ E56).

**Hypotheses.** p = 5 ∤ 6·23.

**Prerequisites.** [`PadicHodgeRegulators:D.4/habiro-regulator-export`](#padichodgeregulators-d-4-habiro-regulator-export); [`PadicHodgeRegulators:D.4/special-unit-formula`](#padichodgeregulators-d-4-special-unit-formula); [`PadicHodgeRegulators:D.3/roots-of-unity-generate`](#padichodgeregulators-d-3-roots-of-unity-generate); [`PadicHodgeRegulators:D.1/combined-dilogarithm`](#padichodgeregulators-d-1-combined-dilogarithm).

**Proof route.**

1. All symbols are special units at 5, so D.4/special-unit-formula identifies D_5(ξ) with the dilogarithm sum (271).
2. ζ_24, ζ_24², ζ_24⁶ have all components ≠ 1 and their regulators form a Z_5-basis of 25·O_{K_5} (D.3/residue-spanning (c)); solving the linear system gives the c_i, recomputed 5-adically by the GSWZ extraction's reviewer.
3. Injectivity of D_5 on K_3(K_5; Z_5) (D.3/unramified-regulator-theorem) turns the identity of regulators into the identity of classes.

**Acceptance requirements.** Recompute D_5(ξ), D_5(ζ_24), D_5(ζ_24²), D_5(ζ_24⁶) to precision 5^{12} with exact arithmetic in Z_5[α] and check (271), (273) (relabelled) and (274). The Q_5-component of ζ_24^4 is 1, so ζ_24^4 is not an admissible generator.

**Sources.**

- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Example 4.3, (270)–(275), p. 54. The example.
- [GSWZ2024 (D.1)](#source-d-1-gswz2024), Example 4.3, (274), p. 54. The decomposition of D_5(ξ) by the root-of-unity values.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

### Completion obligations for D.4

- The p-adic K_3 regulator injectivity proposition is stated, not proved; no layer proves it.

<a id="layer-d-5"></a>
## D.5: Regulators of curves

Plan the good-reduction weight-two target, open-curve splitting, syntomic regulator and Coleman symbol formula with their support and residue restrictions. The comparison of modified and rigid syntomic models and transported K-structure is an unresolved input to the two curve identifications. Pullback/base change and proposed pushforward requirements stay distinct. Semistable factorization through H¹_st and the Vologodsky comparison are imported boundaries; a full semistable symbol formula and specialization in families still need sourced target nodes. This layer is partial.

**Atlas landmarks:** Weight-two syntomic cohomology of curves; Syntomic regulator on K₂ of curves; Besser's symbol formula.

<a id="padichodgeregulators-d-5-curve-weight-two-target"></a>
### The weight-two syntomic target of a curve and its two identifications

`PadicHodgeRegulators:D.5/curve-weight-two-target` · definition · `curveSyntomicTarget`

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let H^2_syn(𝒳, 2) be rigid syntomic cohomology (D.2/rigid-syntomic-cohomology). Since F^2H^1_dR = 0 and F^2H^2_dR = 0, the canonical boundary in the fixed q-Frobenius modified model, transported to rigid syntomic cohomology using Besser Proposition 8.6(2),(3), is ι : H^1_dR(X/K) → H^2_syn(𝒳, 2) is an isomorphism, and Besser's normalised identification is Θ := (1 − φ/q²)^{−1} ∘ ι^{−1} : H^2_syn(𝒳, 2) ≅ H^1_dR(X/K) (1 − φ/q² is invertible because φ has weight 1 on H^1). The cup-product pairing B(a, b) := Tr(a ∪ b) on H^1_dR(X/K) is alternating with B(φa, φb) = q·B(a, b), and for forms of the second kind B([dF], [dG]) = Σ_x Res_x(F dG).

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K).

**Prerequisites.** [`PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`](#padichodgeregulators-d-2-rigid-syntomic-cohomology); `PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology`; `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`; `ColemanIntegration:L0/annulus-residue`.

**Proof route.**

1. Use the full two-component syntomic fibre product (Besser Proposition 8.6(3)); for a proper curve and n=i=2 its auxiliary Frobenius-cone cohomology vanishes in the required degrees by weights, and F² in degrees 1,2 is zero. This gives H²_syn ≅ H¹_rig, not the cokernel of an invertible 1−φ/q² (that cokernel is zero). To name the raw canonical ι used here, first compare with the fixed q-Frobenius modified model; in that model the boundary is represented by (0,ε). The comparison is part of the definition of ι and is required explicitly.
2. Besser–de Jeu's Definition 4.6 (for n ≥ i > relative dimension, here n = i = 2 > 1) defines the normalised identification with the factor (1 − φ*/q^n)^{−1}. Besser Proposition 8.6(3) and Remark 8.7(3), plus Proposition 10.1(3), explain the factor in this modified model. The σ-semilinear rigid model is initially Q_p-linear; transport a K-structure through this identification instead of asserting K-linearity of 1−σ/p².
3. The trace and the Frobenius similitude come from Poincaré duality for rigid cohomology; the residue formula is Besser's p-adic Arakelov theory, Lemma 3.3.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `curveSyntomicTarget` | data | curveSyntomicTarget 𝒳 := H^2_syn(𝒳, 2). |
| `curveSyntomicCanIso` | equivalence | canIso 𝒳 : H1dR X ≃ₗ[K] curveSyntomicTarget 𝒳. |
| `curveSyntomicNormIso` | equivalence | normIso 𝒳 : curveSyntomicTarget 𝒳 ≃ₗ[K] H1dR X, equal to (1 − φ/q²)⁻¹ ∘ canIso⁻¹. |
| `cupTrace` | structure | cupTrace X : LinearMap.BilinForm K (H1dR X), alternating. |
| `cupTrace_frob` | relation | cupTrace (φ a) (φ b) = q • cupTrace a b. |
| `cupTrace_res_sum` | characterisation | For second-kind forms, cupTrace [dF] [dG] = Σ_x Res_x(F dG). |
| `cupTrace_eigen` | relation | If cupTrace is a q-similitude for φ and φ v = γ v (γ ≠ 0), then cupTrace (φ a) v = (q/γ)·cupTrace a v. |
| `curveSyntomicTarget_extensionality` | extensionality | The canonical/normalized equivalences are determined by their values on cohomology classes, and cupTrace by its values on pairs. Require the explicit comparison maps before transporting the K-module structure. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `curveTarget_projective_line` | computation | For 𝒳 = P^1_{O_K}, curveSyntomicTarget 𝒳 = 0. |
| `curveTarget_weight_one_analogue` | degenerate | In weight one for Spec O_K (i = n = 1), the normalised class of a unit u is log u while the canonical class is (1 − 1/q)·log u. |
| `curveTarget_eigen_factor` | compatibility | If φv = γv then B(φa, v) = (q/γ)B(a, v); for p = q = 5 and γ = 2, (1 − 1/(pγ)) = 9/10 is the factor between canonical and normalised pairings. |
| `curveTarget_h2_non_example` | non-example | For H^3_syn(𝒳, 1) the operator 1 − φ/q on H^2_rig(𝒳_k) is zero (φ = q there), so no normalised identification exists; Besser–de Jeu Definition 4.6 requires n ≥ i > dim. |

**Acceptance requirements.** 𝒳 = P^1: H^1_dR = 0 and the target is 0. For an elliptic curve y² = x³ + ax + b, ω = dx/2y and η = x dx/2y: B(ω, η) = 1 (residue at ∞ with local parameter −x/y).

**Uses.** Asakura–Miyatani, Theorem 9.1: Tr_C(Θ(reg_syn{f, g}) ∪ [ω]) = (r_p{f, g})(ω) EllipticRegulators:ER.8/good-reduction-elliptic-pairing: the Coleman formula for the weight-two elliptic regulator, which holds for Θ, not for ι^{−1} EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: the Frobenius factor (1 − p^{−2}Φ) between the canonical and normalised identifications

**Sources.**

- [BdJ2003 (D.1)](#source-d-1-bdj2003), Definition 4.6, p. 24. The normalised identification.
- [Ara2003 (D.1)](#source-d-1-ara2003), Lemma 3.3, p. 8. The residue formula for the cup product.
- [Besser2000 (D.1)](#source-d-1-besser2000), Proposition 8.6(3), Remark 8.7(3) and Proposition 10.1(3), author PDF pp. 26–28,34. Primary source independently read; the normalized versus raw modified-model map must be tracked as specified in the statement/proofSteps.

**Open obligations.** [Curve modified-versus-rigid comparison maps](#gap-d-1-12); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-5-open-curve-splitting"></a>
### The Frobenius splitting for an open curve

`PadicHodgeRegulators:D.5/open-curve-splitting` · construction · `openCurveSplitting`

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let (𝒳, D) be a good-reduction pair (ColemanIntegration:L1/good-reduction-pair) with D finite étale over O_K and Y = 𝒳 ∖ D. Then H̃^2_ms(Y, 2) = Ω^†(Y)/dA^†(Y) = H^1_dR(A^†(Y)), the restriction res : H^1_dR(X) → H^1_dR(Y) is φ-equivariant and injective, and there is a unique φ-equivariant retraction p_D : H^1_dR(Y) → H^1_dR(X) (H^1(X) has Frobenius weight 1 and the cokernel of res, spanned by residues, weight 2). p_D does not depend on the Frobenius lift and is compatible with enlarging D.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). (𝒳, D) a good-reduction pair; D finite étale over O_K.

**Prerequisites.** `ColemanIntegration:L1/good-reduction-pair`; `ColemanIntegration:L1/wide-open-neighbourhood`; `ColemanIntegration:L1/frobenius-lift`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology`; [`PadicHodgeRegulators:D.5/curve-weight-two-target`](#padichodgeregulators-d-5-curve-weight-two-target); `PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lifts-induce-homotopic-maps`.

**Proof route.**

1. The Gysin/residue sequence 0 → H^1(X) → H^1(Y) → K^{D}(−1) → K identifies the cokernel of res with residues, on which φ acts with weight 2.
2. Weights differ, so the φ-stable complement of res(H^1(X)) is unique; p_D is the projection along it (Besser–de Jeu 2012, p. 4, citing Besser's K_2 paper, Proposition 4.8).
3. Independence of the lift: two lifts induce homotopic maps on overconvergent de Rham complexes.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `openCurveSplitting` | data | openCurveSplitting 𝒳 D : H1dR (Y) →ₗ[K] H1dR X. |
| `openCurveSplitting_comp_res` | simp | openCurveSplitting 𝒳 D ∘ res = id. |
| `openCurveSplitting_frob` | characterisation | openCurveSplitting commutes with φ and is the unique such retraction. |
| `openCurveSplitting_mono` | relation | For D ⊆ D', openCurveSplitting 𝒳 D' ∘ res_{Y,Y'} = openCurveSplitting 𝒳 D. |
| `openCurveSplitting_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `splitting_p1` | computation | For P^1 and D = {0, ∞}, openCurveSplitting = 0. |
| `splitting_empty_boundary` | degenerate | For D = ∅ (Y = X), openCurveSplitting = id. |
| `splitting_res_compat` | compatibility | openCurveSplitting 𝒳 D ∘ res = id on H1dR X. |
| `splitting_not_residue_free` | non-example | For X=P¹ and D={0,∞}, dlog(t) has nonzero boundary residues and projects to 0, while residue-free cohomology is the image of H¹(X), not a proposed complementary subspace. A rule equating the complementary summand with residue-free cohomology is therefore wrong. |

**Acceptance requirements.** P^1 with D = {0, ∞}: H^1_dR(Y) = K·dt/t, φ^* = q on it, and p_D = 0. For an elliptic curve and D = {O}, p_D is the identity on H^1_dR(Y) = H^1_dR(X).

**Uses.** PadicHodgeRegulators:D.5/curve-syntomic-regulator: the regulator of a symbol on Y is projected to X by p_D Besser–de Jeu 2012, (9.13): p is the unique map with (pη) ∪ [ω] = ⟨F_η, F_ω⟩_gl for ω of the second kind holomorphic on U

**Sources.**

- [BdJ2012 (D.1)](#source-d-1-bdj2012), §1, pp. 4–5. The projection p_D from the open curve, from Besser's K_2 paper.

**Open obligations.** [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-5-curve-syntomic-regulator"></a>
### The degree-two syntomic regulator of a curve

`PadicHodgeRegulators:D.5/curve-syntomic-regulator` · construction · `curveSyntomicRegulator`

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). For u ∈ K_2(𝒳)^{(2)} ⊗ Q define reg_syn(u) ∈ H^2_syn(𝒳, 2) by the syntomic Chern class of D.2/syntomic-regulator, and put regSynCan(u) := ι^{−1}(reg_syn(u)) and regP(u) := Θ(reg_syn(u)) = (1 − φ/q²)^{−1}regSynCan(u) in H^1_dR(X/K). If the restriction of u to Y = 𝒳 ∖ D is a finite sum Σ n_i{f_i, g_i} of symbols with f_i, g_i ∈ O(Y)^×, then regSynCan(u) = p_D[Σ_i n_i ε(f_i, g_i)] with ε(f, g) := q^{−2}·log(f_0)·φ^*dlog g − q^{−1}·log(g_0)·dlog f, f_0 := f^q/φ^*f (a class in H̃^2_ms(Y, 2) = H^1_dR(A^†(Y))), and regP(u) = p_D((1 − φ^*/q²)^{−1}[Σ_i n_i ε(f_i, g_i)]). This gives the full 2g-coordinate regulator vector, not only its pairing with holomorphic forms.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). (𝒳, D) a good-reduction pair containing the supports of all f_i, g_i.

**Prerequisites.** [`PadicHodgeRegulators:D.5/curve-weight-two-target`](#padichodgeregulators-d-5-curve-weight-two-target); [`PadicHodgeRegulators:D.5/open-curve-splitting`](#padichodgeregulators-d-5-open-curve-splitting); [`PadicHodgeRegulators:D.2/syntomic-regulator`](#padichodgeregulators-d-2-syntomic-regulator); `EllipticKTheory:E.4/adams-operations-and-the-weight-decomposition`; `EllipticKTheory:E.3/localisation-sequence-for-a-curve`; `K2SymbolsBrauer:T.3/tame-symbol`.

**Proof route.**

1. The syntomic Chern class on K_2 is the cup product of the K_1 classes reg(f) = (dlog f, log(f_0)/q) (Besser–de Jeu 2003 Lemma 4.7, citing Besser 2000 Proposition 10.3).
2. On Y with a Frobenius lift the cup product of two such classes is represented by ε(f, g) in Ω^†(Y)/dA^†(Y) (Besser–de Jeu 2012 (5.1)–(5.2); Asakura–Miyatani Proposition 6.4).
3. Elements of K_2(𝒳) restrict to symbols on Y with trivial tame symbols along D (EllipticKTheory:E.3/localisation-sequence-for-a-curve); p_D returns the class to X.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `curveSyntomicRegulator` | data | curveSyntomicRegulator 𝒳 : K_2(𝒳)^{(2)}_ℚ →ₗ[ℚ] curveSyntomicTarget 𝒳. |
| `regSynCan` | projection | regSynCan := canIso⁻¹ ∘ curveSyntomicRegulator. |
| `regP` | projection | regP := normIso ∘ curveSyntomicRegulator. |
| `regSynCan_eq_frob_regP` | relation | regSynCan u = (1 − q⁻² • φ) (regP u). |
| `regP_symbol` | characterisation | On a symbol presentation on Y, regP u = openCurveSplitting ((1 − φ^*/q²)⁻¹ [Σ n_i ε(f_i, g_i)]). |
| `regSynCan_pairing_eigen` | relation | For φ v = γ v: cupTrace (x − q^{−2}φ x) v = (1 − 1/(qγ))·cupTrace x v, the pairing form of regSynCan = (1 − φ/q²)·regP. |
| `curveSyntomicRegulator_weight_three` | simp | The weight-three part of K_2(𝒳) ⊗ Q maps to 0 (H^4_syn(𝒳, 3)-target vanishes for a curve). |
| `curveSyntomicRegulator_extensionality` | extensionality | Two instances of this map agree iff their values agree on every element of the specified source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred for the semilinear twist. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `regulator_constant_symbol` | computation | For c ∈ μ_{q−1}, regSynCan {f, c} = 0. |
| `regulator_diagonal_symbol` | degenerate | regSynCan {f, f} = 0. |
| `regulator_eigen_compat` | compatibility | If φv = γv, B(regSynCan u, v) = (1 − 1/(pγ))·B(regP u, v) for K = Q_p. |
| `regulator_canonical_not_coleman` | non-example | Feeding regSynCan instead of regP into the Coleman symbol formula is off by (1 − φ/q²); on an eigen-pairing by the factor (1 − 1/(pγ)). |

**Acceptance requirements.** For c ∈ μ_{q−1}: c_0 = 1 and dlog c = 0, so regSynCan({f, c}) = 0. {f, f}: ε = −q^{−2}·d(½ log(f_0)²) is exact, so the regulator vanishes.

**Uses.** EllipticRegulators:ER.8/the-syntomic-comparison: reg_p : K_2(E) ⊗ Q → H^1_dR(E/Q_p) of a curve with good reduction, specialised to ER's classes EllipticRegulators:ER.8/elliptic-syntomic-etale-factor: reg_syn(u) = (1 − p^{−2}Φ)z with z = log_BK(reg_et(u)) PadicHodgeRegulators:D.5/coleman-symbol-formula: the pairing of regP with holomorphic forms

**Sources.**

- [AM18 (D.1)](#source-d-1-am18), Proposition 6.4, p. 34. The hypothesis under which H^2 rigid syntomic cohomology is identified with H^1_rig (the sentence continues with the isomorphism).
- [BdJ2003 (D.1)](#source-d-1-bdj2003), Lemma 4.7, p. 24. The K_1 regulator cocycle (f_0 = f^q/φ^*f) whose cup product gives ε(f, g).
- [Besser2000 (D.1)](#source-d-1-besser2000), Proposition 10.3, author PDF p. 35. Primary source independently read; the normalized versus raw modified-model map must be tracked as specified in the statement/proofSteps.

**Open obligations.** [Coleman integration with colliding supports and in genus at least one](#gap-d-1-5); [K_2 integrality for curves of genus at least two](#gap-d-1-6); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-5-coleman-symbol-formula"></a>
### Besser's Coleman-integral formula for the regulator of a symbol

`PadicHodgeRegulators:D.5/coleman-symbol-formula` · theorem

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let u ∈ K_2(𝒳)^{(2)} ⊗ Q restrict on Y = 𝒳 ∖ D to Σ_i n_i{f_i, g_i} with f_i, g_i ∈ O(Y)^× and (𝒳, D) a good-reduction pair containing all supports, and let ω ∈ H^0(X, Ω^1). Then B(regP(u), [ω]) = Σ_i n_i Σ_{x ∈ |D_K|} ord_x(f_i)·Tr_{K(x)/K}(CT_x(∫ log(g_i)·ω)), where ∫ log(g_i)ω is the Coleman integral (ColemanIntegration:L1/coleman-integral) and CT_x the log-free constant term at x in a local parameter (after a finite extension, descending by Galois equivariance). The value is independent of the branch of the logarithm and of the constant of integration. Equivalently Tr_X(Θ(reg_syn{f, g}) ∪ [ω]) = ∫_{(f)} log(g)ω (Coleman–de Shalit's p-adic regulator). The formula holds for Θ = regP, not for the canonical regSynCan.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). All supports in a finite étale D; ω holomorphic.

**Prerequisites.** [`PadicHodgeRegulators:D.5/curve-syntomic-regulator`](#padichodgeregulators-d-5-curve-syntomic-regulator); `ColemanIntegration:L1/coleman-integral`; `ColemanIntegration:L1/locally-analytic-log-functions`; `ColemanIntegration:L1/branch-independence-principle`; `ColemanIntegration:L0/log-branch-field-compatibility`; `K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form`; `EllipticKTheory:E.7/symbol-certificates`.

**Proof route.**

1. Besser, Syntomic regulators and p-adic integration II, Theorem 3 (as restated by Asakura–Miyatani Theorem 9.1 and Besser–de Jeu 2012 Remark 1.10).
2. Pairing the cocycle ε(f, g) of D.5/curve-syntomic-regulator with ω: the Coleman primitive F_ω and the double index ⟨ , ⟩_gl reduce the cup product to residues at D (Besser, p-adic Arakelov theory, Lemma 3.3), giving Σ ord_x(f)·F_{log g ω}(x).
3. Independence of branch and constant: Weil reciprocity and trivial tame symbols (K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form) kill the ambiguity.

**Acceptance requirements.** The tests of EllipticRegulators:ER.8/good-reduction-elliptic-pairing hold with regP. With regSynCan the formula fails by (1 − φ/q²) (EllipticRegulators F1 in the handoff).

**Sources.**

- [AM18 (D.1)](#source-d-1-am18), Theorem 9.1, p. 45. The formula (= Besser II Theorem 3, unramified K).
- [BdJ2012 (D.1)](#source-d-1-bdj2012), Remark 1.10, p. 4. The Coleman–de Shalit form, known to be the syntomic regulator by Besser.

**Open obligations.** [Coleman integration with colliding supports and in genus at least one](#gap-d-1-5); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-5-curve-etale-comparison"></a>
### The curve regulator and the Bloch–Kato logarithm

`PadicHodgeRegulators:D.5/curve-etale-comparison` · comparison

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). and put V = H^1_et(X_K̄, Q_p(2)), a crystalline representation with D_cris(V) = H^1_dR(X/K) ⊗ e_2 and V^{G_K} = 0. For u ∈ K_2(𝒳)^{(2)} ⊗ Q the étale regulator r^et(u) ∈ H^1(K, V) lies in H^1_f = H^1_e, and regP(u) = log_BK(r^et(u)) under D_dR(V)/Fil^0 = H^1_dR(X/K); equivalently regSynCan(u) = (1 − p^{−2}φ_p)·log_BK(r^et(u)) for K = Q_p (φ_p the p-power Frobenius). If φ_p v = γv then B(regSynCan u, v) = (1 − 1/(pγ))·B(regP u, v).

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). For the (1 − p^{−2}φ_p) form, K = Q_p (or φ_p the p-semilinear Frobenius on an unramified K).

**Prerequisites.** [`PadicHodgeRegulators:D.5/curve-syntomic-regulator`](#padichodgeregulators-d-5-curve-syntomic-regulator); [`PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`](#padichodgeregulators-d-2-syntomic-etale-regulator-comparison); [`PadicHodgeRegulators:L1/bloch-kato-logarithm`](#padichodgeregulators-l1-bloch-kato-logarithm); [`PadicHodgeRegulators:L1/dimension-formulas`](#padichodgeregulators-l1-dimension-formulas); `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`.

**Proof route.**

1. Besser 2000 Proposition 9.11 (via Nekovář–Nizioł Proposition 1.1 and Asakura–Chida §3.2): the composite H^1_dR/F² → H^2_syn → H^1(G_K, H^1_et(Q_p(2))) is the Bloch–Kato exponential of V. This is Besser’s normalized map of Proposition 8.6(3), not the raw boundary in a collapsed fixed-Frobenius cone; use the explicit comparison requested at curve-weight-two-target.
2. With the canonical identification this gives ι^{−1}reg_syn = (1 − p^{−2}φ)·log_BK∘r^et (Asakura–Chida footnote 4); applying Θ removes the factor.
3. H^1_e = H^1_f: D_cris(V)^{φ=1} = 0 by weights (Frobenius on H^1 has weight 1, twisted by p^{−2}).

**Acceptance requirements.** For E/Q_p with good reduction and v a φ-eigenvector with eigenvalue γ: Tr(regSynCan(z) ∪ v) = (1 − p^{−1}γ^{−1})Tr(log reg_f(z) ∪ v) (Asakura–Chida footnote 4). This resolves the normalisation required by EllipticRegulators:ER.8/elliptic-syntomic-etale-factor.

**Sources.**

- [AC20 (D.1)](#source-d-1-ac20), Footnote 4, p. 43. The canonical form of the comparison.
- [NN2016 (D.1)](#source-d-1-nn2016), Proposition 1.1, p. 3. The general comparison.
- [Besser2000 (D.1)](#source-d-1-besser2000), Proposition 9.11, author PDF p. 32. Primary source independently read; the normalized versus raw modified-model map must be tracked as specified in the statement/proofSteps.

**Open obligations.** [Curve modified-versus-rigid comparison maps](#gap-d-1-12); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-5-curve-regulator-functoriality"></a>
### Pullback, pushforward and base change of the curve regulator

`PadicHodgeRegulators:D.5/curve-regulator-functoriality` · theorem

Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let π : 𝒳' → 𝒳 be a finite flat morphism of good-reduction curves. (a) Pullback: regP(π^*u) = π^*regP(u), and B'(π^*a, π^*b) = deg(π)·B(a, b). (b) Pushforward: regP(π_*u') = π_*regP(u') with π_* the de Rham trace, characterised by B(π_*a', b) = B'(a', π^*b); at the level of symbols ∫_{(π^*f)} log(g)·π^*ω = ∫_{(f)} log(N g)·ω. (c) Base change: for K'/K finite unramified, regP(u|_{𝒳_{O_{K'}}}) = regP(u) ⊗ 1, and the transfer N_{K'/K} corresponds to Tr_{K'/K}. The same holds for regSynCan. Part (b) at the level of syntomic cohomology is recorded as a gap: no source read proves pushforward compatibility for rigid syntomic regulators; it follows from (a) and the projection formula on the image of pullback, and in general from the étale comparison D.5/curve-etale-comparison and corestriction compatibility of r^et.

**Hypotheses.** K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). π finite flat between smooth proper curves over O_K.

**Prerequisites.** [`PadicHodgeRegulators:D.5/curve-syntomic-regulator`](#padichodgeregulators-d-5-curve-syntomic-regulator); [`PadicHodgeRegulators:D.5/curve-etale-comparison`](#padichodgeregulators-d-5-curve-etale-comparison); `SchemeKTheoryOperations:S.2/k-theory-pullback`; `SchemeKTheoryOperations:S.2/k-theory-proper-pushforward`; `SchemeKTheoryOperations:S.2/projection-formula`; `EllipticKTheory:E.3/naturality-for-finite-pullback`; `EllipticKTheory:E.3/naturality-for-finite-transfer`; `ColemanIntegration:L1/coleman-pullback`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/de-rham-trace`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/functoriality-of-rigid-cohomology`.

**Proof route.**

1. (a) Naturality of syntomic Chern classes and of the identification Θ under pullback; the similitude is Besser's p-adic Arakelov theory Lemma 3.6.
2. (b) Adjunction of trace and pullback (p-adic Arakelov theory Lemma 3.7); for the regulator itself, use D.5/curve-etale-comparison: r^et commutes with pushforward (corestriction on H^1(K, H^1_et)) and log_BK commutes with corestriction/trace (L1/twist-and-change-of-field).
3. (c) Base change of rigid cohomology and of Coleman integration (ColemanIntegration:L0/log-branch-field-compatibility).

**Acceptance requirements.** For π multiplication by n on an elliptic curve: regP(π^*u) = π^*regP(u) and π^* acts on H^1_dR by n. For a Fermat-curve quotient the symbol identity ∫_{(π^*f)} log(g)π^*ω = ∫_{(f)} log(Ng)ω holds.

**Sources.**

- [Ara2003 (D.1)](#source-d-1-ara2003), Lemmas 3.6–3.7, p. 8. Pullback similitude; Lemma 3.7 gives the trace adjunction.

**Open obligations.** [Pushforward compatibility of the curve regulator](#gap-d-1-4); [Specialisation of curve regulators in families](#gap-d-1-8); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

<a id="padichodgeregulators-d-5-semistable-input-boundary"></a>
### What bad or semistable reduction requires beyond good reduction

`PadicHodgeRegulators:D.5/semistable-input-boundary` · comparison

For a smooth proper semistable curve X/K, NN Theorems A,B provide rational syntomic cohomology and compatible Chern classes; the arithmetic regulator factors through H¹_st(G_K,H¹_et(X_K̄,Q_p(2))). The semistable comparison imports the Hyodo–Kato (φ,N) structure from CohomologyComparisons CP.4. Besser–Zerbes Theorem 1.1 identifies Vologodsky integration with appropriately corrected/glued Coleman primitives on semistable curves. These results do not themselves give a weight-two symbol formula in H¹_dR or prove that its domain is exactly ker N. Such a formula, its monodromy restriction and any convenient quotient are remaining targets to be sourced and planned through the shared log-syntomic prefix and ColemanIntegration Part II; none is asserted by this node.

**Hypotheses.** X/K smooth proper with semistable reduction.

**Prerequisites.** [`PadicHodgeRegulators:D.2/log-syntomic-complex`](#padichodgeregulators-d-2-log-syntomic-complex); [`PadicHodgeRegulators:D.2/syntomic-exponential`](#padichodgeregulators-d-2-syntomic-exponential); `CohomologyComparisons:CP.4`; [`PadicHodgeRegulators:D.5/coleman-symbol-formula`](#padichodgeregulators-d-5-coleman-symbol-formula).

**Proof route.**

1. Import NN Theorems A,B, with the corrected degree H^i in Theorem 5.9; the factorization is into semistable cohomology, not an immediate H¹_dR identification.
2. Read Besser–Zerbes Theorem 1.1 as an integration comparison. It supplies glued primitives/harmonic corrections, not the regulator formula formerly attributed to an uncited Besser–Raskind result. Record the formula as a precise remaining target.

**Acceptance requirements.** Tate curve: the Coleman integrals become branch dependent, and the Vologodsky integral selects log_q (Besser–Zerbes §3). The good-reduction formula of D.5/coleman-symbol-formula is not asserted for any semistable curve.

**Sources.**

- [NN2016 (D.1)](#source-d-1-nn2016), Theorem B, p. 7. The semistable factorisation.
- [BZ2017 (D.1)](#source-d-1-bz2017), Theorem 1.1, p. 2. Vologodsky integrals versus glued Coleman integrals.

**Open obligations.** [Vologodsky integration has no owner](#gap-d-1-7); [Early shared classical log-syntomic producer](#gap-d-1-9); [Missing Lean signatures for supplier-dependent carriers](#gap-d-1-13).

**Required supplier refinements.** [CohomologyComparisons:CP.4](#request-d-1-13).

### Completion obligations for D.5

- Pushforward compatibility of the curve regulator (gap).
- Coleman integration with colliding supports and genus ≥ 1 inherited gaps.
- K_2 integrality for genus ≥ 2 (gap).
- Specialisation in families (gap).
- Owner for Vologodsky integration (restructure).
- Add a sourced target node for specialization in smooth families, including its relative syntomic construction; a gap mention is not a target node.
- State and source the full semistable symbol formula, its monodromy restrictions and target quotient; this packet establishes only NN factorization and BZ integration comparison.
- Supply the modified-versus-rigid model comparison and transported K-structure used by the two curve identifications.

<a id="layer-l3"></a>
## L3: Perrin–Riou regulators and explicit reciprocity

Construct the intrinsic crystalline map from the precise L2 Fontaine/Wach nodes and the actual Mellin inverse. Keep the derivative obstruction, lift ambiguity, auxiliary-weight relation and meromorphic twist extension explicit. Interpolation uses the exact conductor, Gauss sum, Gamma-leading factor and admitted logarithm domain; unramified interpolation only inverts its denominator operator. The source reciprocity formula requires the normalized Iwasawa pairing, and its determinant consequence needs determinant-line input beyond equality of pairings. Rank-one Tate and ordinary/multiplicative comparisons retain their normalization gaps.

**Atlas landmarks:** Quadratic Euler-operator formula; Perrin–Riou regulator; Perrin–Riou big exponential; Perrin–Riou reciprocity formula; Regulator determinant formula; Scalar regulator projection.

<a id="padichodgeregulators-l3-quadratic-frobenius-inverse"></a>
### Quadratic Frobenius inverse

`PadicHodgeRegulators:L3/quadratic-frobenius-inverse` · construction · `quadraticFrobeniusInverse`

Define P(a,b,Phi)=-b^(-1)(Phi+aI) as an explicit matrix expression. It is an inverse only under the separately stated quadratic relation and b nonzero.

**Hypotheses.** E is a field; Phi is a finite square matrix.

**Prerequisites.** The pinned algebraic baseline..

**Proof route.**

1. Use scalar multiplication and the existing matrix identity; no matrix inverse is used in the definition.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `quadraticFrobeniusInverse_formula` | characterisation | P=-b^(-1)(Phi+aI). |
| `quadraticFrobeniusInverse_spec` | characterisation | Under Phi^2+aPhi+bI=0 and b nonzero, Phi P=I and P Phi=I. |
| `quadraticFrobeniusInverse_map` | functoriality | A field embedding applied to all entries and scalars commutes with P. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `frobenius_scalar_two` | computation | For Phi=(2), a=-5, b=6 over Q, P=(1/2). |
| `frobenius_scalar_minus_one` | computation | For Phi=(-1), a=0, b=-1 over Q, P=(-1). |
| `frobenius_singular_excluded` | non-example | For Phi=(0), a=b=0, P=(0) and Phi P is not I; the nonzero-b hypothesis cannot be omitted. |

**Acceptance requirements.** Keep the nonzero-b hypothesis in the inverse theorem, not as an implicit convention about total inverses.

**Uses.** LLZ Lemma 5.6: Replace an inverse of Frobenius by a guarded polynomial formula.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 5A, Lemma 5.6 and proof, pp. 1126-1127. Isolates the first explicit polynomial inverse used in the displayed Euler expression.

<a id="padichodgeregulators-l3-quadratic-frobenius-inverse-spec"></a>
### Frobenius inverse identities

`PadicHodgeRegulators:L3/quadratic-frobenius-inverse-spec` · lemma · `quadraticFrobeniusInverse_spec`

If Phi^2+aPhi+bI=0 and b is nonzero, then Phi P=P Phi=I.

**Hypotheses.** E is a field; Phi is a d by d matrix; Phi^2+aPhi+bI=0; b is nonzero.

**Prerequisites.** [`PadicHodgeRegulators:L3/quadratic-frobenius-inverse`](#padichodgeregulators-l3-quadratic-frobenius-inverse).

**Proof route.**

1. Expand Phi P using the quadratic relation to obtain -b^(-1)(-bI)=I.
2. P is a polynomial in Phi, so the expansion on the other side is identical.

**Acceptance requirements.** Prove both sides without assuming commutativity of the full matrix ring.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 5A, Lemma 5.6, proof. The inverse assertion requires the explicit nonzero scalar denominator.

<a id="padichodgeregulators-l3-quadratic-euler-inverse"></a>
### Quadratic Euler inverse

`PadicHodgeRegulators:L3/quadratic-euler-inverse` · construction · `quadraticEulerInverse`

Define Q(a,b,Phi)=(1+a+b)^(-1)(Phi+(1+a)I). This is the inverse candidate for I-Phi, not an unqualified inverse at singular Euler factors.

**Hypotheses.** E is a field; Phi is a finite square matrix.

**Prerequisites.** The pinned algebraic baseline..

**Proof route.**

1. Form the indicated scalar multiple of a degree-one polynomial in Phi.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `quadraticEulerInverse_formula` | characterisation | Q=(1+a+b)^(-1)(Phi+(1+a)I). |
| `quadraticEulerInverse_spec` | characterisation | Under the quadratic relation and 1+a+b nonzero, (I-Phi)Q=Q(I-Phi)=I. |
| `quadraticEulerInverse_map` | functoriality | A field embedding commutes with Q. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `euler_scalar_two` | computation | For Phi=(2), a=-5, b=6 over Q, Q=(-1). |
| `euler_scalar_zero` | degenerate | For Phi=(0), a=b=0 over Q, Q=I: invertibility of I-Phi does not require invertibility of Phi. |
| `euler_singular_excluded` | non-example | For Phi=(1), a=-3, b=2, Q=0 and (I-Phi)Q is not I, since 1+a+b=0. |

**Acceptance requirements.** Distinguish the denominator 1+a+b from the separate denominator b.

**Uses.** LLZ Lemma 5.6: Make the second excluded denominator explicit in Euler interpolation.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 5A, Lemma 5.6 and proof, pp. 1126-1127. Isolates the inverse of I-Phi in the source's calculation.

<a id="padichodgeregulators-l3-quadratic-euler-inverse-spec"></a>
### Euler inverse identities

`PadicHodgeRegulators:L3/quadratic-euler-inverse-spec` · lemma · `quadraticEulerInverse_spec`

If Phi^2+aPhi+bI=0 and s=1+a+b is nonzero, then (I-Phi)Q=Q(I-Phi)=I.

**Hypotheses.** E is a field; Phi is square; the quadratic relation holds; 1+a+b is nonzero.

**Prerequisites.** [`PadicHodgeRegulators:L3/quadratic-euler-inverse`](#padichodgeregulators-l3-quadratic-euler-inverse).

**Proof route.**

1. Expand (I-Phi)(Phi+(1+a)I) and reduce Phi^2 using the quadratic relation; the answer is sI.
2. Divide only by s nonzero and repeat on the other side.

**Acceptance requirements.** Do not infer this statement when 1 is an eigenvalue of Phi.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 5A, Lemma 5.6, proof. The source calculation becomes a typed two-sided inverse identity with its denominator hypothesis.

<a id="padichodgeregulators-l3-quadratic-euler-product"></a>
### Quadratic Euler-operator formula

`PadicHodgeRegulators:L3/quadratic-euler-product` · theorem · `quadraticEulerProduct`

Assume p,b and s=1+a+b are nonzero. With P=Phi^(-1) and Q=(I-Phi)^(-1) certified by the preceding lemmas, Q(I-p^(-1)P) equals [(1+a+pb)Phi+(a(1+a+pb)+b(p-1))I]/[pb(1+a+b)].

**Hypotheses.** E is a field; Phi is a finite square matrix; Phi^2+aPhi+bI=0; p,b,1+a+b are nonzero.

**Prerequisites.** [`PadicHodgeRegulators:L3/quadratic-frobenius-inverse-spec`](#padichodgeregulators-l3-quadratic-frobenius-inverse-spec); [`PadicHodgeRegulators:L3/quadratic-euler-inverse-spec`](#padichodgeregulators-l3-quadratic-euler-inverse-spec).

**Proof route.**

1. Insert the two explicit polynomial expressions.
2. Reduce the quadratic term by Phi^2=-aPhi-bI, collect the coefficient of Phi and the scalar term, and use the three nonzero denominator hypotheses.
3. This is an algebraic input to interpolation, not an interpolation theorem or a definition on the excluded eigenspaces.

**Acceptance requirements.** Test Phi=2,a=-5,b=6,p=5, which gives -9/10; exclude Phi=1 and zero Frobenius where appropriate.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 5A, Lemma 5.6, p. 1126. The displayed operator formula is retained with every denominator made explicit.

<a id="padichodgeregulators-l3-gamma-leading-factor"></a>
### Leading Gamma factor

`PadicHodgeRegulators:L3/gamma-leading-factor` · definition · `gammaLeadingFactor`

For j in Z define Gamma*(1+j)=j! if j>=0 and (-1)^(-j-1)/(-j-1)! if j<=-1, as a nonzero rational number, then map it into E. This is the leading Laurent coefficient of the classical Gamma function; it is not the p-adic Gamma function.

**Hypotheses.** E has characteristic zero.

**Prerequisites.** The pinned algebraic baseline..

**Proof route.**

1. Define the two integer ranges using factorials; cast the rational factor to E.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `gammaLeadingFactor_nonneg` | simp | For n in N its value at j=n is n!. |
| `gammaLeadingFactor_neg` | simp | Its value at j=-n-1 is (-1)^n/n!. |
| `gammaLeadingFactor_ne_zero` | characterisation | It is nonzero for every integral j. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `gamma_zero` | degenerate | At j=0 the factor is 1. |
| `gamma_minus_two` | computation | At j=-2 it is -1. |
| `gamma_minus_three` | computation | At j=-3 it is 1/2, not 2. |

**Acceptance requirements.** At j=-1 the factor is +1, at j=-2 it is -1.

**Uses.** LZ Theorem B.5 and RJ Theorem I.27: Normalize interpolation in both weight ranges.

**Sources.**

- [LZ2014 (L3)](#source-l3-lz2014), Appendix B before Proposition B.1, PDF p.37. Fixes both the sign and factorial at negative integers.

<a id="padichodgeregulators-l3-logarithmic-factors"></a>
### Logarithmic factors

`PadicHodgeRegulators:L3/logarithmic-factors` · definition · `logarithmicFactors`

In each H_E(Gamma_1) component set ell_i=log(1+X)/log(chi(gamma))-i for i in Z, lambda_k=product_(0<=i<k) ell_i for k>=0, and delta_i=ell_i/(X+1-chi(gamma)^i). The apparent pole of delta_i is removable at x_i=chi(gamma)^i-1; its value there is 1/(chi(gamma)^i log(chi(gamma))). Put n_k=log(chi(gamma))^k lambda_k/product_(0<=i<k)(X-x_i).

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly.

**Prerequisites.** `LocallyAnalyticDistributions:L1`; `LocallyAnalyticDistributions:L3`.

**Proof route.**

1. Use convergent open-disc logarithms from the analytic supplier. Divide the simple zero at x_i in the analytic algebra, retaining the removable value. The empty products are one.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `ellFactor_eval_weight` | simp | ell_i(chi^j eta)=j-i for any finite-order eta on Gamma_1. |
| `lambdaFactor_succ` | relation | lambda_(k+1)=lambda_k ell_k, lambda_0=1. |
| `deltaFactor_cleared` | characterisation | (X-x_i)delta_i=ell_i, including the removable point. |
| `ellFactor_generator` | compatibility | log(gamma)/log(chi(gamma)) is independent of the chosen topological generator under the group-algebra change of variable. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `ell_at_zero` | computation | ell_0 at the trivial character is 0, whereas ell_1 there is -1. |
| `delta_at_node` | computation | delta_0 at X=0 is 1/log(chi(gamma)), not zero or an undefined inverse. |
| `lambda_empty` | degenerate | lambda_0=n_0=1; lambda_2 at chi^3 is 6. |

**Acceptance requirements.** delta_i(x_i) is a nonzero scalar; ell_i is not a unit because it vanishes at every chi^i finite-order twist.

**Uses.** LLZ Theorems 2.10,4.6,4.16: Record precisely the analytic determinant factors. LZ Appendix B and general twist extension: Control auxiliary weights and their zeros.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 1C2, definitions of ell_i, delta_i and n_k and Proposition 1.6, pp.1101-1102; Section 2A, p.1107; Theorem 4.16, p.1124. Reconciles n_k with lambda_k and the normalized delta_i, up to the displayed nonzero constant.

**Required supplier refinements.** [LocallyAnalyticDistributions:L3](#request-l3-4); [LocallyAnalyticDistributions:L1](#request-l3-6).

<a id="padichodgeregulators-l3-crystalline-regulator"></a>
### Crystalline Perrin–Riou regulator

`PadicHodgeRegulators:L3/crystalline-regulator` · construction · `crystallineRegulator`

Define L_V=(Mellin_inverse tensor 1) composed with (1-phi) composed with h_Iw^(-1), from H^1_Iw(Q_p,V) to H_E(G) tensor_E D_cris(V). Here h_Iw:N(V)^(psi=1)~=H^1_Iw is the actual PG/L2 comparison, and the Wach embedding takes (1-phi)x into (B_rig^+)^(psi=0) tensor D_cris(V). This is a Lambda_E-linear continuous map; its analytic scalar extension is H_E-linear.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution.

**Prerequisites.** [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L2/wach-psi-fixed-vectors`](#padichodgeregulators-l2-wach-psi-fixed-vectors); `PhiGammaModulesAndIwasawaCohomology:PG.4/psi-one-to-zero`; `PhiGammaModulesAndIwasawaCohomology:PG.5`; `PhiGammaModulesAndIwasawaCohomology:PG.6`; `LocallyAnalyticDistributions:L3`.

**Proof route.**

1. Berger A.3 places the genuine Iwasawa class in N(V)^(psi=1). LLZ Lemma1.7 gives N(V) subset phi*N(V) in the stated weight range.
2. The left inverse psi phi=id proves psi((1-phi)x)=0. Apply the actual Wach-to-period embedding and the Mellin module equivalence; Mellin respects the G action, rather than ordinary power-series multiplication.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `crystallineRegulator_apply` | characterisation | Mellin(L_V(z))=(1-phi)h_Iw^(-1)(z) in the specified period module. |
| `crystallineRegulator_linear` | structure | L_V(a z+b w)=a L_V(z)+b L_V(w) for a,b in Lambda_E, acting by convolution. |
| `crystallineRegulator_ext` | extensionality | The Mellin identity determines the map uniquely. |
| `crystallineRegulator_coefficient` | functoriality | The map commutes with finite coefficient extension using the supplier comparison squares. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `regulator_zero` | degenerate | The zero Iwasawa class has zero regulator. |
| `regulator_phi_fixed` | computation | An actual phi-fixed psi-one class is killed by 1-phi; for E(1) this kills the Kummer Tate tower. |
| `regulator_composition_order` | computation | In the finite linear-map model h(x)=2x, boundary(x)=3x, Mellin_inverse(x)=5x, L(2)=15; using h instead of h inverse would give 60. |

**Acceptance requirements.** Do not identify an arbitrary linear map of the same rank with this composite. The no-trivial-quotient assumption is not deleted.

**Uses.** GeneralizedHeegnerCycles:GH.4 and GH.7; KatoEulerSystems:L3; RankZeroOneBSD:BSD.6a and BSD.7a: The vector map is the local output to pair with a specified period functional. LLZ Section3: Supply the unbounded side of the bounded decomposition.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 3A, Definition 3.4, pp.1116-1117. The intrinsic map precedes all scalar and basis choices.

**Open obligations.** [Actual arithmetic carrier signatures](#gap-l3-2).

**Required supplier refinements.** [PhiGammaModulesAndIwasawaCohomology:PG.6](#request-l3-2); [LocallyAnalyticDistributions:L3](#request-l3-4); [PhiGammaModulesAndIwasawaCohomology:PG.5](#request-l3-8).

<a id="padichodgeregulators-l3-big-exponential-obstruction"></a>
### Derivative obstruction module

`PadicHodgeRegulators:L3/big-exponential-obstruction` · definition · `bigExponentialObstruction`

For h>=1 with Fil^(-h)D_cris(V)=D_cris(V), define Delta_h on (B_rig^+)^(psi=0) tensor D_cris(V) by the derivative values partial^k f(0) modulo (1-p^k phi)D_cris(V), 0<=k<=h, with their k twists. The admissible source is ker Delta_h. The kernel of 1-phi on the psi-one period module is direct_sum_(0<=k<=h)t^k D_cris(V)^(phi=p^(-k)).

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is crystalline; h>=1 and Fil^(-h)D_cris(V)=D_cris(V).

**Prerequisites.** [`PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`](#padichodgeregulators-l0-hodge-tate-and-twist-conventions); `PhiGammaModulesAndIwasawaCohomology:PG.4`; `LocallyAnalyticDistributions:L1`.

**Proof route.**

1. Form the actual quotient of D_cris by the image of each Euler endomorphism and the finite derivative map. Prove Berger p.120 exact sequence, rather than infer surjectivity of 1-phi from psi phi=id.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `bigExponentialObstruction_mem` | characterisation | f is admissible iff partial^k f(0) lies in image(1-p^k phi) for every indicated k. |
| `bigExponentialObstruction_nonsingular` | compatibility | If all these Euler maps are invertible, Delta_h=0 and its kernel is the whole source. |
| `bigExponentialObstruction_lift` | universal-property | An admissible f has a psi-one lift y with (1-phi)y=f; any two lifts differ in the displayed kernel. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `obstruction_phi_one` | non-example | For rank-one phi=1, k=0 forces f(0)=0, so a nonzero constant derivative is inadmissible. |
| `obstruction_nonsingular` | characterisation | For phi=2 over Q_5 and h=1, both 1-2 and 1-10 are invertible; no derivative obstruction remains. |
| `obstruction_lift_nonunique` | non-example | At phi=1 two lifts differing by a constant have the same boundary; no unique inverse is inferred. |

**Acceptance requirements.** Derivative values belong to quotients, not chosen complements.

**Uses.** Berger Definition II.12: Use the exact source of the big exponential. L3 singular specializations: Express the kernel instead of a total inverse.

**Sources.**

- [Berger2003 (L3)](#source-l3-berger2003), Section II.5, exact sequence and Definition II.12, p.120. Records the obstruction that prevents inverses at singular eigenvalues.

**Open obligations.** [Derivative obstruction exactness](#gap-l3-3).

**Required supplier refinements.** [PhiGammaModulesAndIwasawaCohomology:PG.4](#request-l3-3); [LocallyAnalyticDistributions:L1](#request-l3-6).

<a id="padichodgeregulators-l3-big-exponential"></a>
### Perrin–Riou big exponential

`PadicHodgeRegulators:L3/big-exponential` · construction · `bigExponential`

For admissible f in ker Delta_h choose a psi-one lift y with (1-phi)y=f and define Omega_(V,h)(f)=nabla_(h-1)...nabla_0(y), with nabla_i=t partial-i. Its value is well-defined in D_rig^+(V)^(psi=1)/V^(H_Qp). The eigencondition D_cris(V)^(phi=p^(-h))=0 suffices for an unquotiented value (Definition II.12). More generally, absence of an E(h) subrepresentation suffices by Remark II.14, after using Theorem II.13 to identify the remaining lift ambiguity with invariants. Map to H_E tensor_Lambda H^1_Iw using the established comparison.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; h>=1 with Fil^(-h) full; the source is ker Delta_h, not an arbitrary period vector.

**Prerequisites.** [`PadicHodgeRegulators:L3/big-exponential-obstruction`](#padichodgeregulators-l3-big-exponential-obstruction); [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L3/logarithmic-factors`](#padichodgeregulators-l3-logarithmic-factors).

**Proof route.**

1. The kernel of 1-phi consists of the t^k eigenvectors just recorded. nabla_(h-1)...nabla_0 kills those with k<h. The surviving k=h vectors represent E(h) invariants and vanish in the target quotient.
2. Apply Berger TheoremII.13 and its h/gamma-normalized comparison with Iwasawa cohomology.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `bigExponential_lift` | characterisation | Every valid lift gives the stated differential product in the quotient. |
| `bigExponential_linear` | structure | Omega_(V,h) is H_E-linear in the specified Mellin convention. |
| `bigExponential_no_tate` | compatibility | If no E(h) lies in V, the differential lift is independent in the unquotiented psi-one module. |
| `bigExponential_h_succ` | relation | nabla_h Omega_(V,h)=Omega_(V,h+1) with the natural obstruction-source comparison. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `bigexp_zero` | degenerate | Omega_(V,h)(0)=0 in the quotient. |
| `bigexp_kernel_killed` | computation | For a lift difference t^k v with 0<=k<h, the differential product is zero. |
| `bigexp_top_kernel` | non-example | For k=h the product is h! t^h v, nonzero before passing to invariants; the quotient cannot be dropped. |

**Acceptance requirements.** A chosen inverse of 1-phi is not the definition.

**Uses.** Berger TheoremII.10 and II.16: Interpolate and pair the big exponential. LLZ Theorem4.6: Compare it with the intrinsic regulator.

**Sources.**

- [Berger2003 (L3)](#source-l3-berger2003), Definition II.12, Theorem II.13 and Remark II.14, pp.120-121. The invariant quotient is essential in the exceptional case.

**Open obligations.** [Derivative obstruction exactness](#gap-l3-3).

<a id="padichodgeregulators-l3-auxiliary-h-comparison"></a>
### Auxiliary weight and twist comparison

`PadicHodgeRegulators:L3/auxiliary-h-comparison` · comparison · `bigExponential_regulator`

Under the nonnegative, no-trivial-quotient hypotheses and the nonsingular Euler assumptions of LLZ4.5, over Frac(H_E) one has Omega_(V,h) L_V(z)=lambda_h z after identifying its Mellin source, for any admitted h>=1. Omega_(V,h+1)=ell_h Omega_(V,h); twisting sends Omega_(V,h)(f) tensor e_j to Omega_(V(j),h+j)(partial^(-j)f tensor t^(-j)e_j), on the common domain. Thus the intrinsic L_V is independent of h.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked. Choose h>=max(1,r_d); interpret equalities in the analytic scalar extension and its localization.

**Prerequisites.** [`PadicHodgeRegulators:L3/big-exponential`](#padichodgeregulators-l3-big-exponential); [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); [`PadicHodgeRegulators:L3/logarithmic-factors`](#padichodgeregulators-l3-logarithmic-factors).

**Proof route.**

1. Unfold Berger differential lift and (1-phi)h_Iw inverse; their composite yields lambda_h. Use RemarkII.15 for h and twist laws. Specializing when ell_h vanishes does not permit division.

**Acceptance requirements.** h=0/r_d=0 is compared using h=1 and localization, never a nonexistent unqualified inverse.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Theorem4.6, p.1120. Its inverse notation is interpreted only after analytic localization.
- [Berger2003 (L3)](#source-l3-berger2003), RemarkII.15, p.121. Provides the admitted h and twist identities.

<a id="padichodgeregulators-l3-meromorphic-twist-extension"></a>
### Crystalline twist extension

`PadicHodgeRegulators:L3/meromorphic-twist-extension` · construction · `meromorphicRegulator`

For arbitrary E-linear crystalline V choose m>>0 so V(m) has nonnegative weights and no trivial quotient. Define L_V(z)=(ell_-1...ell_-m)^(-1) Tw_(chi^m)(L_(V(m))(z tensor e_m)) tensor t^m e_-m. The value lies in the total fraction algebra of H_E(G), component by component; it is independent of m. No general H_E-valued assertion follows without proving cancellation of these factors.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; use an admitted m and the actual twist comparison maps.

**Prerequisites.** [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); [`PadicHodgeRegulators:L3/auxiliary-h-comparison`](#padichodgeregulators-l3-auxiliary-h-comparison); [`PadicHodgeRegulators:L3/logarithmic-factors`](#padichodgeregulators-l3-logarithmic-factors); [`PadicHodgeRegulators:L2/local-iwasawa-twist`](#padichodgeregulators-l2-local-iwasawa-twist); [`PadicHodgeRegulators:L2/twist-compatibility`](#padichodgeregulators-l2-twist-compatibility).

**Proof route.**

1. Use LZ4.4 and the one-step twisting relation to compare m with m+1; telescope the denominator factors. Localize at their nonzero-divisors.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `meromorphicRegulator_choice` | extensionality | The value is independent of every admitted twist m. |
| `meromorphicRegulator_cleared` | characterisation | Multiplication by ell_-1...ell_-m gives the stated twisted positive-range map. |
| `meromorphicRegulator_positive` | compatibility | For V in the intrinsic range it equals L_V after localization. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `twist_extension_identity` | degenerate | An admitted m=0 recovers the intrinsic positive-range regulator. |
| `twist_extension_one_step` | compatibility | The m=1 and m=2 formulas agree by the one-step ell_-2 relation. |
| `twist_extension_pole_control` | non-example | In a scalar analytic model a nonzero numerator at the zero of ell_-1 gives a pole, so localization alone is not an H-valued result. |

**Acceptance requirements.** Unrestricted negative weights are not silently assigned the positive-range codomain.

**Uses.** LZ explicit reciprocity with V*(1): Permit negative dual weights in the exact fractional algebra. StageL3 full crystalline scope: Expose the extra cancellation assertion an H-valued extension would require.

**Sources.**

- [LZ2014 (L3)](#source-l3-lz2014), Section4.4 and AppendixB equation(10), pp.21,39. The printed arbitrary-weight extension explicitly has a fractional target.

**Open obligations.** [Unrestricted crystalline codomain](#gap-l3-10).

<a id="padichodgeregulators-l3-ramified-interpolation"></a>
### Ramified character interpolation

`PadicHodgeRegulators:L3/ramified-interpolation` · theorem · `crystallineRegulator_ramified`

Let eta=chi^j omega, j in Z, omega finite order of conductor p^n, n>=1; extend coefficients to contain omega. Write z_(eta,0) for the actual specialization in H^1(Q_p,V(eta^(-1))). Then L_V(z)(eta)=Gamma*(1+j) tau(omega)^(-1) p^(n(1+j)) phi^n (B_(j)(z_(eta,0)) tensor t^(-j)e_j), with the finite-character de Rham descent understood. B_j=exp*_(Q_p,V(eta^(-1))*(1)) for j>=0 and the Bloch–Kato logarithm on the finite part for j<=-1. The log is the inverse of exp only on its isomorphism range; source condition (dagger) supplies the finite-part class for this formula.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. z lies in the analytic Wach psi-one image (dagger of LZ AppendixB); in particular every z in the stated intrinsic range does. The Gauss sum uses the chosen roots and omega, not omega inverse.

**Prerequisites.** [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); [`PadicHodgeRegulators:L3/gamma-leading-factor`](#padichodgeregulators-l3-gamma-leading-factor); [`PadicHodgeRegulators:L1/bloch-kato-logarithm`](#padichodgeregulators-l1-bloch-kato-logarithm); [`PadicHodgeRegulators:L1/dual-exponential`](#padichodgeregulators-l1-dual-exponential); [`PadicHodgeRegulators:L1/twist-and-change-of-field`](#padichodgeregulators-l1-twist-and-change-of-field); [`PadicHodgeRegulators:L2/character-specialisation`](#padichodgeregulators-l2-character-specialisation).

**Proof route.**

1. LZ B.1 expresses the BK maps by p^-n times constant coefficients of phi^-n partial^j x. B.2 applies the unnormalized omega^-1 trace and identifies it with tau(omega)phi^-n times evaluation.
2. Use B.4 descent and the Tate factor phi^n(t^j e_-j)=p^(nj)t^j e_-j. Combine to obtain B.5, retaining (dagger) and the logarithm domain.

**Acceptance requirements.** Check Gamma*(0)=1 and conductor power n(j+1); a formula valid only for j>=0 does not cover the target.

**Sources.**

- [LZ2014 (L3)](#source-l3-lz2014), AppendixB PropositionsB.1-B.2, LemmaB.4 and TheoremB.5, pp.36-39. Covers every integral twist for ramified finite characters in the crystalline range.

<a id="padichodgeregulators-l3-unramified-interpolation"></a>
### Unramified character interpolation

`PadicHodgeRegulators:L3/unramified-interpolation` · theorem · `crystallineRegulator_unramified`

For eta=chi^j and j in Z put A_j=1-p^j phi and B_j=1-p^(-1-j)phi^(-1) on D_cris(V). If B_j is invertible then L_V(z)(chi^j)=Gamma*(1+j) A_j B_j^(-1) b_j(z_(chi^j,0)), where b_j is the exp*/log value with its Tate descent from the preceding theorem. No invertibility of A_j is required for this direction.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The same Wach-image condition (dagger) holds; B_j is bijective; for the negative range retain the actual finite-class logarithm domain.

**Prerequisites.** [`PadicHodgeRegulators:L3/ramified-interpolation`](#padichodgeregulators-l3-ramified-interpolation); [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); [`PadicHodgeRegulators:L1/bloch-kato-logarithm`](#padichodgeregulators-l1-bloch-kato-logarithm); [`PadicHodgeRegulators:L1/dual-exponential`](#padichodgeregulators-l1-dual-exponential).

**Proof route.**

1. Apply LZ B.1 at n=0 and B.2 at the origin. The commuting Euler polynomials give the stated product; invert B_j only using its explicit bijectivity hypothesis.

**Acceptance requirements.** When phi=1,j=0, A_j=0 while B_j=1-p^-1 is invertible; a vanishing specialization is valid.

**Sources.**

- [LZ2014 (L3)](#source-l3-lz2014), AppendixB TheoremB.5 and the parenthesis immediately following it, pp.39-40. The excluded operator is B_j; A_j can have a kernel.

<a id="padichodgeregulators-l3-singular-euler-specialization"></a>
### Specialization with singular Euler operators

`PadicHodgeRegulators:L3/singular-euler-specialization` · theorem · `crystallineRegulator_singular`

For every integral j under (dagger), with no Euler invertibility assumption, B_j L_V(z)(chi^j)=Gamma*(1+j) A_j b_j(z_(chi^j,0)). More precisely, if u_j is the constant coefficient of partial^j h_Iw^(-1)(z) after Tate descent, the unsimplified identities are L_V(z)(chi^j)=A_j u_j and B_j u_j=Gamma*(1+j)b_j. They determine a relation, including the image of A_j(ker B_j); replacing B_j^(-1) by a total inverse is not a formula. For the big-exponential inverse keep ker Delta_h and the invariant quotient.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. Use b_j and the negative-weight log on precisely the domains in ramified-interpolation.

**Prerequisites.** [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); [`PadicHodgeRegulators:L3/big-exponential-obstruction`](#padichodgeregulators-l3-big-exponential-obstruction); [`PadicHodgeRegulators:L3/big-exponential`](#padichodgeregulators-l3-big-exponential); [`PadicHodgeRegulators:L3/ramified-interpolation`](#padichodgeregulators-l3-ramified-interpolation).

**Proof route.**

1. Retain the constant coefficient before any division in LZ B.1-B.2 at n=0; compose the two commuting Euler maps.
2. If B_j is singular, two lifts differ by ker B_j and the corresponding outputs differ by A_j of that kernel. The authentic period lift fixes this value; BK data alone need not determine it.

**Acceptance requirements.** For rank-one phi=p^(-1),j=0, B_j=0 and A_j=1-p^-1; the cleared equality gives no unique output. An exceptional derivative formula requires separate input.

**Sources.**

- [LZ2014 (L3)](#source-l3-lz2014), AppendixB PropositionsB.1-B.2, pp.37-38. A denominator-free consequence of the two source equalities, not an invented inverse.
- [Berger2003 (L3)](#source-l3-berger2003), SectionII.5 exact sequence, p.120. Keeps the obstruction and invariant data in the general inverse problem.

<a id="padichodgeregulators-l3-growth"></a>
### Regulator growth on Frobenius quotients

`PadicHodgeRegulators:L3/growth` · theorem · `crystallineRegulator_growth`

Let W subset D_cris(V) be phi-stable and h>=0. If every phi eigenvalue on Q=D_cris(V)/W has v_p(alpha)>=-h, the projection of L_V(z) to Q belongs to distributions of order h on the cyclotomic group, with the LAD C^h-dual convention. In particular take h=max(0,-min v_p(alpha)). State the seminorm bound on each finite-character component; no universal bounded (order zero) assertion is made.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. W is phi-stable; h is a nonnegative real number and the slope bound holds on Q.

**Prerequisites.** [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); `LocallyAnalyticDistributions:L2`; `PhiGammaModulesAndIwasawaCohomology:PG.6`.

**Proof route.**

1. LZ Proposition4.8 reduces to the one-variable growth statement. Prove the coefficient/annulus estimate for the actual Wach inclusion and phi iterates, then transfer it by Mellin to the requested C^h-dual norm. The one-variable estimate must be established, not assumed because LZ calls it well known.

**Acceptance requirements.** A slope -1 gives order 1, not a bounded measure; a scalar projection inherits a slope bound only from its admitted quotient.

**Sources.**

- [LZ2014 (L3)](#source-l3-lz2014), Proposition4.8 and AppendixC, pp.17,41-43. Specializes the cyclotomic growth bound from the stated Frobenius quotient.

**Open obligations.** [Cyclotomic growth estimate](#gap-l3-5).

**Required supplier refinements.** [PhiGammaModulesAndIwasawaCohomology:PG.6](#request-l3-2); [LocallyAnalyticDistributions:L2](#request-l3-7).

<a id="padichodgeregulators-l3-naturality-and-lattice"></a>
### Regulator naturality and integral lattice

`PadicHodgeRegulators:L3/naturality-and-lattice` · theorem · `crystallineRegulator_naturality`

For finite E extensions and equivariant morphisms of crystalline representations in the intrinsic range, L commutes with the actual D_cris and Iwasawa comparison maps. For a G-stable T its image lies in the Mellin inverse of (phi*N(T))^(psi=0) embedded in the analytic period target. It need not lie in Lambda_O tensor an arbitrary D_cris lattice. Changing gamma only changes X by (1+X)^a-1; changing roots zeta to sigma_a zeta multiplies the regulator distribution by [sigma_a]^(-1). These assertions compose and respect identities.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. For lattice statements use an integral good psi-zero basis; coefficient extension is finite and flat, and all cohomological base-change hypotheses are supplied by L2.

**Prerequisites.** [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); [`PadicHodgeRegulators:L4/good-wach-basis`](#padichodgeregulators-l4-good-wach-basis); [`PadicHodgeRegulators:L2/lattice-and-coefficient-squares`](#padichodgeregulators-l2-lattice-and-coefficient-squares); [`PadicHodgeRegulators:L2/generator-independence`](#padichodgeregulators-l2-generator-independence); [`PadicHodgeRegulators:L2/root-change`](#padichodgeregulators-l2-root-change); `LocallyAnalyticDistributions:L3`.

**Proof route.**

1. Check the actual h_Iw, Wach embedding, phi/psi and Mellin squares individually. Integral (1-phi) preserves the phi* lattice. Basis coordinates are integral, while the embedding matrix is analytic.
2. Use LZ Remark4.16 for roots and the chart homomorphism for generators. Do not use PG.7 as blanket base change for arbitrary families.

**Acceptance requirements.** Test a root change by a, then b, obtaining [sigma_ab]^-1, and distinguish it from multiplying by [sigma_a].

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section3A, pp.1116-1117. Identifies the precise integral source and target lattice.
- [LZ2014 (L3)](#source-l3-lz2014), Remark4.16, p.20. Fixes the inverse group element in the root-change law.

**Required supplier refinements.** [LocallyAnalyticDistributions:L3](#request-l3-4).

<a id="padichodgeregulators-l3-explicit-reciprocity"></a>
### Perrin–Riou explicit reciprocity formula

`PadicHodgeRegulators:L3/explicit-reciprocity` · theorem · `crystallineRegulator_reciprocity`

With the crystalline pairing extended linearly in the first and via iota(g)=g^-1 in the second variable, [L_V(x),L_(V*(1))(y)]_cris=-sigma_-1 ell_0 <x,y>_Iw in the total fraction algebra of H_E(G). sigma_-1 is the inertia element with chi=-1; the dual regulator uses the admitted meromorphic twist extension. Equivalently Berger II.16 states (-1)^h <Omega_(V,h)(f),[-1]Omega_(V*(1),1-h)(g)>=-[f,iota(g)].

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; x,y are actual Iwasawa classes and the pairings are the L2/L1 local-duality pairings with these normalizations.

**Prerequisites.** [`PadicHodgeRegulators:L3/meromorphic-twist-extension`](#padichodgeregulators-l3-meromorphic-twist-extension); [`PadicHodgeRegulators:L3/big-exponential`](#padichodgeregulators-l3-big-exponential); [`PadicHodgeRegulators:L3/logarithmic-factors`](#padichodgeregulators-l3-logarithmic-factors); [`PadicHodgeRegulators:L1/dual-exponential`](#padichodgeregulators-l1-dual-exponential); [`PadicHodgeRegulators:L1/local-duality-of-conditions`](#padichodgeregulators-l1-local-duality-of-conditions); [`PadicHodgeRegulators:L1/twist-and-change-of-field`](#padichodgeregulators-l1-twist-and-change-of-field); [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L2/local-iwasawa-twist`](#padichodgeregulators-l2-local-iwasawa-twist); [`PadicHodgeRegulators:L2/character-specialisation`](#padichodgeregulators-l2-character-specialisation); [`PadicHodgeRegulators:L3/unramified-interpolation`](#padichodgeregulators-l3-unramified-interpolation).

**Proof route.**

1. Use BergerII.16 with its sign warningII.17, or LZ B.6 proof: specialize at sufficiently large integral j, cancel the factorial and adjoint Euler factors using BK local duality, then use analytic uniqueness from LAD.
2. Extend the dual regulator by LZ equation(10). Semilinearity and sigma_-1 account for the sign; omit neither.

**Acceptance requirements.** Changing the second variable by g multiplies the pairing by g^-1.

**Sources.**

- [LZ2014 (L3)](#source-l3-lz2014), AppendixB equation(10) and TheoremB.6, pp.39-40. Provides the exact regulator pairing normalization.
- [Berger2003 (L3)](#source-l3-berger2003), TheoremII.16 and RemarkII.17, pp.122-123. Cross-checks the sign against the actual big-exponential pairing.

**Open obligations.** [Normalized local Iwasawa pairing and dual-exponential adjunction](#gap-l3-12).

**Required supplier refinements.** [SelmerIwasawaCohomology:L3](#request-l3-16).

<a id="padichodgeregulators-l3-regulator-determinant"></a>
### Determinant of the crystalline regulator

`PadicHodgeRegulators:L3/regulator-determinant` · theorem · `crystallineRegulator_determinant`

Under NC, for each Delta component the determinant ideal of the H_E-linear scalar extension of L_V, with actual rank-d Iwasawa source, is generated up to H_E-unit by product_(i=0..r_d-1) ell_i^(d-n_i), where n_i=dim_E Fil^(-i)D_cris(V)=#{j:r_j<=i}. The determinant is an ideal in the analytic algebra, not a chosen equality of basis determinants.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.

**Prerequisites.** [`PadicHodgeRegulators:L3/auxiliary-h-comparison`](#padichodgeregulators-l3-auxiliary-h-comparison); [`PadicHodgeRegulators:L3/explicit-reciprocity`](#padichodgeregulators-l3-explicit-reciprocity); [`PadicHodgeRegulators:L3/logarithmic-factors`](#padichodgeregulators-l3-logarithmic-factors); [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L2/lattice-and-coefficient-squares`](#padichodgeregulators-l2-lattice-and-coefficient-squares); `PadicMeasuresIwasawaAlgebras:L5`.

**Proof route.**

1. LLZ4.7 derives this from det Omega_(V,r_d)=product ell_i^n_i (Perrin–Riou delta(V) theorem), itself obtained from reciprocity and the determinant comparison of dual cohomology.
2. Record the exact determinant comparison input as a gap; a scalar-valued pairing identity alone is not a proof of its integral determinant normalization.

**Acceptance requirements.** Weights (0,2) give ell_0 ell_1, whereas (1,1) give ell_0^2; these cases discriminate a rank-only formula.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Corollary4.7 and proof, p.1120. Gives the exponent and identifies the additional determinant theorem used.

**Open obligations.** [Determinant normalization](#gap-l3-4); [Normalized local Iwasawa pairing and dual-exponential adjunction](#gap-l3-12).

**Required supplier refinements.** [PadicMeasuresIwasawaAlgebras:L5](#request-l3-9); [SelmerIwasawaCohomology:L3](#request-l3-16).

<a id="padichodgeregulators-l3-scalar-projection"></a>
### Scalar projection of a regulator

`PadicHodgeRegulators:L3/scalar-projection` · construction · `scalarRegulator`

Given an explicitly chosen E-linear functional ell:D_cris(V)->E, define scalarRegulator_(V,ell)=(1 tensor ell) L_V. A differential or refinement supplies ell only after its pairing and period normalization are proved. The vector regulator is canonical with its cyclotomic choices; this scalar projection is not chosen from V alone.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. ell is specified, including every period scalar when it is derived from a geometric differential.

**Prerequisites.** [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); `mathlib:TensorProduct.map`; `mathlib:TensorProduct.rid`.

**Proof route.**

1. Apply the actual tensor-product linear map to the vector regulator; coefficient extension transports both the map and the functional.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `scalarRegulator_apply` | characterisation | The output is (1 tensor ell)(L_V(z)). |
| `scalarRegulator_add_functional` | structure | Projection for ell1+ell2 is the sum of the two projections; scaling ell scales the output. |
| `scalarRegulator_base_change` | functoriality | Finite coefficient extension commutes after transporting ell. |
| `scalarRegulator_growth` | compatibility | The vector seminorm bound gives the projected bound times the functional norm; a stronger eigenline bound needs the specified phi-stable quotient. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `scalar_zero_functional` | degenerate | The zero functional gives the zero map. |
| `scalar_ordered_projection` | computation | For vector (2,3), first projection gives 2 and second gives 3. |
| `scalar_period_scaling` | computation | Replacing a functional by twice itself doubles every value; it cannot be silently treated as the same normalized scalar regulator. |

**Acceptance requirements.** Two nonproportional functionals can give different scalar outputs for the same class.

**Uses.** GeneralizedHeegnerCycles:GH.7; KatoEulerSystems:L3; RankZeroOneBSD:BSD.7a: Record the extra period/differential data that arithmetic consumers must supply.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section3 equation(2), p.1117; Section1C6 modular bases. Source coordinates become scalar only in an explicitly chosen basis; the functional formulation is the invariant deduction.

<a id="padichodgeregulators-l3-tate-coleman-comparison"></a>
### Rank-one Tate and Coleman comparison

`PadicHodgeRegulators:L3/tate-coleman-comparison` · comparison · `tateRegulator_coleman`

For V=E(1), d=t^-1 e_1 and principal norm-compatible cyclotomic units u, the actual Kummer map satisfies L_(E(1))(kappa_Iw(u))=ell_0 Col_0(u) tensor d=-ell_0 Col(u) tensor d. Col_0 is exactly the raw ColemanPowerSeries composite and Col=-Col_0. Equivalently Mellin(Col_0(u))=(1-phi/p)log(f_u) and partial of this equals (1-phi)Delta(f_u). On psi-zero partial inverse is multiplication by x^-1 under Amice; no integration constant is chosen. The regulator kills the Tate-root tower and the coefficient-extended fundamental Coleman sequence gives the moment cokernel.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V=E(1), u lies in the actual principal inverse-limit unit module; use the same roots, norm operator, Kummer cocycle and Tate basis.

**Prerequisites.** [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); [`PadicHodgeRegulators:L3/logarithmic-factors`](#padichodgeregulators-l3-logarithmic-factors); [`PadicHodgeRegulators:L2/kummer-coleman-comparison`](#padichodgeregulators-l2-kummer-coleman-comparison); [`PadicHodgeRegulators:L2/root-change`](#padichodgeregulators-l2-root-change); `ColemanPowerSeries:L2/raw-coleman-map`; `ColemanPowerSeries:L2/normalized-coleman-map`; `ColemanPowerSeries:L3/principal-coleman-sequence`; `ColemanPowerSeries:L3/finite-flat-coleman-sequence`; `PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence`.

**Proof route.**

1. Use the commuting Kummer/Coleman diagram of LZ6.4.2. Differentiate its (1-phi/p)log(f_u), use partial phi=p phi partial, and compare it with the exact imported raw map.
2. The Mellin relation t partial corresponds to ell_0, giving the multiplier; the imported sign-adjusted map introduces the minus sign. Match Kummer to h_Iw using the L2 comparison, not a rank argument.

**Acceptance requirements.** Test the roots-of-unity kernel and distinguish ell_0 Col_0 from either Col_0 alone or +ell_0 Col.

**Sources.**

- [LZ2014 (L3)](#source-l3-lz2014), Section6.4.2 diagram and text, pp.28-29. States the actual multiplier in the rank-one regulator/Coleman square.

**Open obligations.** [Cross-part Kummer sign in the Tate–Coleman comparison](#gap-l3-11).

<a id="padichodgeregulators-l3-rubin-coleman-map"></a>
### Ordinary and multiplicative Coleman map

`PadicHodgeRegulators:L3/rubin-coleman-map` · construction · `rubinColemanMap`

For an elliptic curve A/Q with good ordinary or multiplicative reduction at odd p, T=T_p A, let alpha in Z_p^times be the ordinary root and beta=p/alpha. In split multiplicative reduction set (alpha,beta)=(1,p), in nonsplit (-1,-p). On the actual inverse-corestriction singular quotients H^1_(infty,s)(Q_p,T) define Col_infty into Lambda(Z_p-extension) with its injection and Rubin III.5.14 normalization. For nontrivial finite chi of conductor p^k its value is alpha^-k tau(chi) sum_(g in G_n)chi(g)^-1 exp*_(omega_A)(g z_n). At chi=1 it is (1-alpha^-1)(1-beta^-1)^-1 exp*_(omega_A)(z_0).

**Hypotheses.** p is odd; A has the stated reduction; use Rubin cyclotomic Z_p-extension indexing Q_n and compatible p-power roots. omega_A is the specified Neron differential; local finite quotients and integral H^1_s are inherited from L1/Selmer.

**Prerequisites.** [`PadicHodgeRegulators:L1/bloch-kato-subgroups`](#padichodgeregulators-l1-bloch-kato-subgroups); [`PadicHodgeRegulators:L1/dual-exponential`](#padichodgeregulators-l1-dual-exponential); [`PadicHodgeRegulators:L2/character-specialisation`](#padichodgeregulators-l2-character-specialisation); `SelmerIwasawaCohomology:L3`; [`PadicHodgeRegulators:L3/tate-coleman-comparison`](#padichodgeregulators-l3-tate-coleman-comparison).

**Proof route.**

1. Construct via the ordinary/multiplicative rank-one local duality and formal-group Coleman series, with integral singular quotient descent. Rubin cites the appendix of Rubin1998 for this explicit construction; that proof input is recorded as a gap, not replaced by interpolation as an axiom.
2. Verify the displayed finite-character identities and injection on the actual singular inverse limit. Characters determine bounded outputs using the correct uniqueness theorem.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `rubinColemanMap_specialization` | characterisation | Finite-character values are exactly the displayed Gauss-sum/differential formulas. |
| `rubinColemanMap_injective` | characterisation | Its kernel on the singular inverse-limit module is zero. |
| `rubinColemanMap_linear` | structure | It is Lambda-linear on that actual source. |
| `rubinColemanMap_period` | compatibility | Rescaling the differential by c rescales its scalar dual-exponential coordinate by c^-1, and hence the map by c^-1. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `rubin_zero` | degenerate | Col_infty(0)=0. |
| `rubin_split_trivial` | computation | At split multiplicative alpha=1 the trivial specialization is zero. |
| `rubin_nonsplit_trivial` | computation | At p=5 and alpha=-1,beta=-5 the trivial Euler multiplier is 5/3, so it is not automatically zero. |

**Acceptance requirements.** The ramified exponent uses the conductor k, not the chosen level n; the unramified denominator 1-beta^-1 is nonzero in the stated cases.

**Uses.** Rubin III.5.15 and supplied source extraction r3-prop-5.14-b: Provides the construction consumed by the noncrystalline augmentation assertion.

**Sources.**

- [RubinES (L3)](#source-l3-rubines), III Section5.8, Proposition5.14, printed p.52. The supplied URL is Rubin’s book, not Kolyvagin1990; it states containment rather than equality in the split case.

**Open obligations.** [Rubin ordinary/multiplicative construction](#gap-l3-9); [Cross-part Kummer sign in the Tate–Coleman comparison](#gap-l3-11).

**Required supplier refinements.** [SelmerIwasawaCohomology:L3](#request-l3-10).

### Completion obligations for L3

- Discharge derivative-obstruction exactness, determinant normalization and cyclotomic growth gaps; elaborate the genuine supplier arithmetic signatures.
- Resolve the general-weight fractional/H_E codomain qualification and prove the Rubin construction input with its actual singular source.

<a id="layer-l4"></a>
## L4: Coleman coordinates, images and the de Rham extension

First prove the evaluation-constraint algebra using distinct points, a domain, nonzero evaluation factors and the exact divisibility kernel. Coordinate reconstruction, logarithmic matrices and integral shear choices use the fixed row convention. Instantiate them only after obtaining genuine good Wach bases, analytic comparison and bounded image descent; equal analytic determinants alone do not establish bounded image equality. Signed kernels depend on the specified basis. For general de Rham Robba modules, build analytic differential powers and glue the Rodrigues Jacinto regulator on its admitted high-conductor open. Its primitive conductor is fixed, its negative interpolation range is restricted, and its global crystalline extension retains the source’s general target with the missing reduction and normalization proof recorded.

**Atlas landmarks:** Coleman coordinate map; Logarithmic matrix; Coleman map image theorem; Integral Coleman image theorem; De Rham character domain; De Rham regulator.

<a id="padichodgeregulators-l4-evaluation-constraints"></a>
### Specialization-constraint module

`PadicHodgeRegulators:L4/evaluation-constraints` · definition · `evaluationConstraints`

For a finite set J of evaluation indices, define the R-submodule S_J(V) of R^d by F in S_J(V) iff ev_j(F) is in V_j for every j in J, with componentwise evaluation.

**Hypotheses.** E is a field and R a commutative E-algebra; ev_j are E-algebra homomorphisms; V_j are E-subspaces. No domain, distinctness or divisibility assumption is needed just to define S.

**Prerequisites.** The pinned algebraic baseline..

**Proof route.**

1. Closure under R-scalar multiplication follows because ev_j(rF)=ev_j(r)ev_j(F) and V_j is an E-subspace. Addition and zero are componentwise.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `evaluationConstraints_mem` | characterisation | F is in S_J(V) iff for every j in J, ev_j(F) is in V_j. |
| `evaluationConstraints_empty` | simp | S_empty(V)=R^d. |
| `evaluationConstraints_antitone` | relation | If J is contained in J' then S_J'(V) is contained in S_J(V). |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `constraints_none` | degenerate | An empty set of conditions gives the full module. |
| `constraints_zero_at_zero` | computation | Over E[X], d=1, evaluation at 0 and V=0: 1 is excluded and X is included. |
| `constraints_diagonal` | computation | Over Q[X], one condition V={(a,a)} at 0: (1,1) is included and (1,0) is excluded. |

**Acceptance requirements.** Retain the actual evaluation maps and the finite set of imposed conditions.

**Uses.** LLZ Proposition 4.2 and Lemma 4.3: The image module with finitely many specialization constraints. LLZ Proposition 4.11: The module against which the actual Coleman image must be compared.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 4A, Lemma 4.1 and Proposition 4.2, p. 1118. The source module is expressed as a submodule using the actual evaluation maps.

<a id="padichodgeregulators-l4-scalar-multiple-zeros"></a>
### Division by distinct evaluation factors

`PadicHodgeRegulators:L4/scalar-multiple-zeros` · lemma · `divisibleByEvaluationProduct`

In the evaluation context, ev_j(f)=0 for all j in J iff the product of q_j over J divides f. Repeated points are not allowed.

**Hypotheses.** The evaluation context in conventions.evaluation, including injectivity of x and the evaluation-kernel divisibility hypotheses.

**Prerequisites.** [`PadicHodgeRegulators:L4/evaluation-constraints`](#padichodgeregulators-l4-evaluation-constraints).

**Proof route.**

1. Induct on J. Divide by the newly extracted q_j using the kernel hypothesis.
2. At another point i, ev_i(q_j)=x_i-x_j is nonzero; hence the quotient still vanishes there. Apply the induction hypothesis.
3. The converse follows by evaluating the product.

**Acceptance requirements.** A repeated evaluation point does not imply a double zero.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 4A, Lemma 4.3, first inclusion, pp. 1118-1119. Makes explicit the distinct-factor divisibility used in the first image inclusion.

<a id="padichodgeregulators-l4-single-constraint-basis"></a>
### Single-condition basis

`PadicHodgeRegulators:L4/single-constraint-basis` · lemma · `singleConstraintBasisExists`

For J={j}, S_J(V) has an R-basis with row matrix diag(1,...,1,q_j,...,q_j)C, where C is an E-basis of E^d adapted to V_j and q_j occurs codim(V_j) times. Its determinant is a nonzero E-scalar times q_j^codim(V_j).

**Hypotheses.** The evaluation context, including R a domain and q_j nonzero.

**Prerequisites.** [`PadicHodgeRegulators:L4/evaluation-constraints`](#padichodgeregulators-l4-evaluation-constraints); `mathlib:Module.Basis.extend`; `mathlib:Matrix.det_mul`.

**Proof route.**

1. Extend a basis of V_j to a basis of E^d using the existing vector-space basis extension.
2. In these coordinates, precisely the complementary coordinates must have ev_j=0. The kernel hypothesis divides them by q_j.
3. Multiplication by q_j is injective because R is a domain and q_j is nonzero; it identifies each complementary R-coordinate with q_j R.
4. The diagonal determinant and determinant of C give the determinant with its unit factor.

**Acceptance requirements.** Do not drop the domain or nonzero-factor assumptions; nonzero zero-divisors do not give free principal summands.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 4A, Lemma 4.1, p. 1118. Expands the adapted-basis and division argument of the source.

<a id="padichodgeregulators-l4-unused-point-invertibility"></a>
### Invertibility at a new point

`PadicHodgeRegulators:L4/unused-point-invertibility` · lemma · `constraintBasisEvaluationInvertible`

Let B be a row-basis matrix for previous constraints with det(B)=epsilon times the product over i in J of q_i^n_i, epsilon a unit in R. If j is not in J, ev_j(B) is invertible over E.

**Hypotheses.** The evaluation context; the stated determinant factorization; j not in J.

**Prerequisites.** `mathlib:Matrix.det_mul`.

**Proof route.**

1. An algebra homomorphism sends epsilon to a unit.
2. Each evaluated q_i is x_j-x_i, nonzero by distinctness. Evaluate the determinant product to obtain a nonzero determinant.
3. Use the adjugate identity over E.

**Acceptance requirements.** The point must be distinct from all points whose factors occur in the determinant.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 4A, Proposition 4.2, induction step, p. 1118. This is the source's evaluated basis matrix at the new node.

<a id="padichodgeregulators-l4-transported-specialization"></a>
### Transported specialization subspace

`PadicHodgeRegulators:L4/transported-specialization` · definition · `transportedSpecialization`

For an E-subspace V of E^d and a matrix C over E, define W={c:cC is in V}, a submodule preimage. If C is invertible, W=VC^(-1) in row-vector notation.

**Hypotheses.** E is a field; C is square. Invertibility is required only for the inverse description and dimension comparison.

**Prerequisites.** The pinned algebraic baseline..

**Proof route.**

1. Use the existing linear row-multiplication map and Submodule.comap.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `transportedSpecialization_mem` | characterisation | c is in W iff cC is in V. |
| `transportedSpecialization_one` | simp | Transport by I leaves V unchanged. |
| `transportedSpecialization_comp` | functoriality | Transport first by C and then by D equals transport by DC. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `transport_identity` | compatibility | For C=I the original subspace is recovered. |
| `transport_shear` | computation | For V=Q(1,0) and C=[[1,1],[0,1]], W=Q(1,-1), not V. |
| `transport_singular` | non-example | For C=0 and V=0, W=E^d; codimension preservation fails without invertibility. |

**Acceptance requirements.** Do not silently identify regulator-coordinate constraints with Coleman-coordinate constraints.

**Uses.** LLZ Proposition 4.2: Pull a new condition back through the previous basis matrix. LLZ Proposition 4.11: Translate regulator-coordinate conditions to Coleman-coordinate conditions with the actual matrix.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 4A, Proposition 4.2, definition of S double-prime, p. 1118. The source transports by the inverse of its evaluated matrix.

<a id="padichodgeregulators-l4-transport-dimension"></a>
### Dimension under transport

`PadicHodgeRegulators:L4/transport-dimension` · lemma · `transportedSpecialization_finrank`

For C in GL_d(E), transportedSpecialization(V,C) is linearly equivalent to V by c maps to cC, and has the same E-dimension.

**Hypotheses.** E is a field; C is invertible.

**Prerequisites.** [`PadicHodgeRegulators:L4/transported-specialization`](#padichodgeregulators-l4-transported-specialization).

**Proof route.**

1. Restrict row multiplication to the inverse-image subspace; row multiplication by C inverse is its inverse.

**Acceptance requirements.** Exhibit the equivalence itself, not only the dimension equality.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 4A, Proposition 4.2, induction step. Justifies preservation of the exponent in the new determinant factor.

<a id="padichodgeregulators-l4-constraint-basis"></a>
### Basis for simultaneous constraints

`PadicHodgeRegulators:L4/constraint-basis` · construction · `constraintBasis`

Construct an R-basis of S_J(V), indexed by Fin d, by successively imposing each evaluation condition. This extends the one-point construction and does not claim an integral basis for constraints over O_E.

**Hypotheses.** The entire evaluation context, including R a domain, all q_j nonzero, distinct points and the principal evaluation kernels.

**Prerequisites.** [`PadicHodgeRegulators:L4/single-constraint-basis`](#padichodgeregulators-l4-single-constraint-basis); [`PadicHodgeRegulators:L4/unused-point-invertibility`](#padichodgeregulators-l4-unused-point-invertibility); [`PadicHodgeRegulators:L4/transported-specialization`](#padichodgeregulators-l4-transported-specialization); [`PadicHodgeRegulators:L4/transport-dimension`](#padichodgeregulators-l4-transport-dimension).

**Proof route.**

1. Start with the standard basis when J is empty.
2. At j not in J use constraintBasisEvaluationInvertible and replace V_j by transportedSpecialization(V_j,ev_j(B)).
3. Apply singleConstraintBasisExists to the coefficient module and multiply its row matrix C on the LEFT of B. The resulting rows form a basis of the new S.
4. Carry the determinant product in the same induction; this simultaneously supplies the invariant for the next step.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `constraintBasis_rows_mem` | characterisation | Every row of the constructed basis belongs to S_J(V). |
| `constraintBasis_expansion` | universal-property | Each F in S_J(V) has unique R-coordinates in the constructed basis. |
| `constraintBasis_determinant` | characterisation | The determinant is associated to the product of q_j^codim(V_j). |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `basis_single_zero_condition` | computation | For R=Q[X], d=1, x=0 and V=0, S has the one-element basis X. |
| `basis_two_zero_conditions` | computation | For d=1 with V=0 at 0 and 5, S has a basis associated to X(X-5), not X squared. |
| `basis_two_coordinates` | computation | For d=2, V_0=span(e1) at 0 and V_1=span(e2) at 5, rows (X-5,0),(0,X) form a basis with determinant X(X-5). |

**Acceptance requirements.** There is no circular dependency on the final determinant theorem: the induction proves the basis and its determinant invariant together.

**Uses.** LLZ Proposition 4.2: Prove full R-rank and the determinant of the constrained image module.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 4A, Proposition 4.2 and proof, p. 1118. Source induction expanded to declaration granularity, with correct inverse transport and matrix order.

**Open obligations.** [Bounded evaluation, division and image descent](#gap-l3-1).

<a id="padichodgeregulators-l4-constraint-determinant"></a>
### Determinant ideal of the constraint module

`PadicHodgeRegulators:L4/constraint-determinant` · theorem · `constraintBasis_determinant`

For the constructed basis and for any other R-basis of S_J(V), the determinant of its inclusion into R^d is associated to the product of q_j^(d-dim_E V_j). This is equality of principal determinant ideals, not canonical equality of generators.

**Hypotheses.** The entire evaluation context.

**Prerequisites.** [`PadicHodgeRegulators:L4/constraint-basis`](#padichodgeregulators-l4-constraint-basis); `mathlib:Matrix.det_mul`.

**Proof route.**

1. The construction of constraintBasis carries the determinant invariant, using codimension equality after transport and Matrix.det_mul.
2. Any two R-bases differ by an invertible R-matrix, whose determinant is a unit.

**Acceptance requirements.** A rescaling of one basis vector by a nontrivial unit must not change the ideal statement.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 4A, Proposition 4.2, p. 1118. Pins the meaning of the source's determinant expression to a principal ideal.

<a id="padichodgeregulators-l4-projection-generator"></a>
### Coordinate-image generator

`PadicHodgeRegulators:L4/projection-generator` · definition · `projectionGenerator`

For coordinate k define J_k={j in J: every v in V_j has v_k=0}; define g_k as the product over J_k of t-x_j. Empty products are one.

**Hypotheses.** E is a field; R is a commutative E-algebra; J finite; V_j subspaces; t and x as in the evaluation context.

**Prerequisites.** The pinned algebraic baseline..

**Proof route.**

1. Filter the finite index set by the stated coordinate-vanishing condition and form the finite product in R.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `projectionGenerator_formula` | characterisation | g_k is exactly the product over forced-zero indices. |
| `projectionGenerator_empty` | simp | If no V_j forces coordinate k to vanish, g_k=1. |
| `projectionGenerator_eval` | characterisation | With distinct points and ev_j(t)=x_j, ev_j(g_k)=0 iff j belongs to J_k, for j in J. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `projection_no_constraints` | degenerate | With J empty, g_k=1. |
| `projection_all_zero` | computation | For d=1 and V_j=0 at 0 and 5, g_0=X(X-5). |
| `projection_mixed` | computation | For V_0=span(e1) at 0 and V_1=span(e2) at 5, g_0=X-5 and g_1=X. |

**Acceptance requirements.** The index set is coordinate-specific, not the complete set of interpolation points.

**Uses.** LLZ Lemma 4.3 and Corollary 4.15: Determine which specialization factors divide each Coleman coordinate.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 4A, Lemma 4.3 and proof, pp. 1118-1119. Uses the source's forced-zero set and not just an unspecified subset of factors.

<a id="padichodgeregulators-l4-projection-witness"></a>
### Polynomial witness for the image generator

`PadicHodgeRegulators:L4/projection-witness` · construction · `projectionWitness`

In the evaluation context construct F in S_J(V) whose k-th coordinate is exactly g_k. Other coordinates can be chosen as polynomials in t with E-coefficients.

**Hypotheses.** The entire evaluation context; k is a coordinate in Fin d.

**Prerequisites.** [`PadicHodgeRegulators:L4/evaluation-constraints`](#padichodgeregulators-l4-evaluation-constraints); [`PadicHodgeRegulators:L4/projection-generator`](#padichodgeregulators-l4-projection-generator); `mathlib:Lagrange.interpolate`; `mathlib:Lagrange.eval_interpolate_at_node`.

**Proof route.**

1. At a point in J_k choose zero in V_j. Outside J_k choose v in V_j with v_k nonzero and multiply by ev_j(g_k)/v_k.
2. Interpolate each of the other coordinates with Lagrange.interpolate on J and substitute t. Set the k-th coordinate to g_k itself.
3. Evaluation at every node returns the chosen vector by the E-algebra property and Lagrange.eval_interpolate_at_node.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `projectionWitness_coordinate` | characterisation | The k-th coordinate is g_k. |
| `projectionWitness_mem` | characterisation | The resulting vector belongs to S_J(V). |
| `projectionWitness_multiples` | characterisation | For r in R, rF belongs to S_J(V) and has k-th coordinate rg_k. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `witness_empty` | degenerate | With no conditions the standard e_k has the required coordinate one. |
| `witness_diagonal` | computation | For R=Q[X] and V={(a,a)} at 0, (1,1) witnesses that the first coordinate image contains one. |
| `witness_integral_denominators` | non-example | Interpolation of 0 and 1 at 0 and 5 is X/5. No polynomial over Z_5 has those two values, so the E-polynomial argument cannot be asserted integrally. |

**Acceptance requirements.** This is a generator witness, not merely an inclusion or a dimension count; its coefficients need not be integral.

**Uses.** LLZ Lemma 4.3: Prove the reverse image inclusion.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 4A, Lemma 4.3, interpolation step, p. 1119. Expands the source's interpolating-polynomial construction using the pinned Lagrange API.

<a id="padichodgeregulators-l4-coordinate-image"></a>
### Exact coordinate image

`PadicHodgeRegulators:L4/coordinate-image` · theorem · `coordinateImage_eq`

The k-th coordinate image of S_J(V) is exactly g_kR. If each V_j has a nonzero k-coordinate somewhere, this projection is surjective; this does not say the whole inclusion S_J(V) into R^d is surjective.

**Hypotheses.** The entire evaluation context.

**Prerequisites.** [`PadicHodgeRegulators:L4/scalar-multiple-zeros`](#padichodgeregulators-l4-scalar-multiple-zeros); [`PadicHodgeRegulators:L4/projection-witness`](#padichodgeregulators-l4-projection-witness).

**Proof route.**

1. Each projected element vanishes at the forced-zero nodes. The distinct-factor divisibility lemma gives inclusion in g_kR.
2. The witness gives g_k in the image; R-linearity gives all multiples.

**Acceptance requirements.** The proper submodule F(0)=G(0) has both coordinate images equal to R.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 4A, Lemma 4.3, pp. 1118-1119. Both directions of the source image description are explicit.

<a id="padichodgeregulators-l4-coleman-coordinates"></a>
### Coleman coordinates

`PadicHodgeRegulators:L4/coleman-coordinates` · construction · `colemanCoordinates`

For a genuine R-linear map f:H to W and coordinate equivalence e:W to R^d, define Col_e=e composed with f. In LLZ, f is 1-phi on the actual psi=1 module and e is the good psi=0 Wach-basis coordinate map. This generic definition alone does not construct either input.

**Hypotheses.** R is a commutative ring; H,W are R-modules; e is an R-linear equivalence.

**Prerequisites.** [`PadicHodgeRegulators:L4/good-wach-basis`](#padichodgeregulators-l4-good-wach-basis).

**Proof route.**

1. Compose the supplied map with the existing linear equivalence. Use standard coordinates, not a new regulator record.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `colemanCoordinates_apply` | characterisation | Col_e(z)=e(f(z)). |
| `colemanCoordinates_reconstruct` | characterisation | e inverse applied to Col_e(z) equals f(z). |
| `colemanCoordinates_precomp` | functoriality | Col_e(f composed with g)=Col_e(f) composed with g. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `coleman_zero` | degenerate | f=0 gives the zero coordinate map. |
| `coleman_standard` | compatibility | f=id and e=id on R^d give the identity coordinate map. |
| `coleman_shear_inverse` | computation | For U=[[1,1],[0,1]] over Q, c=(1,0) changes to cU inverse=(1,-1), not cU=(1,1). |

**Acceptance requirements.** Do not substitute arbitrary maps of the correct dimensions for the arithmetic inputs.

**Uses.** LLZ section 3, Definition 3.1: Define bounded coordinates after the good Wach basis exists. ModularIwasawaMainConjectures:L0: Use kernels of actual integral coordinates rather than arbitrary functionals.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 3A, displayed definition Col=J composed with (1-phi), Remark 3.1 and Lemma 3.3, pp.1116-1117. Separates coordinate algebra from construction of the arithmetic source and target.

**Open obligations.** [Actual arithmetic carrier signatures](#gap-l3-2).

<a id="padichodgeregulators-l4-coleman-reconstruction"></a>
### Reconstruction from Coleman coordinates

`PadicHodgeRegulators:L4/coleman-reconstruction` · lemma · `colemanCoordinates_reconstruct`

For every z, e inverse applied to Col_e(z) equals f(z); thus the coordinate tuple uniquely reconstructs f(z).

**Hypotheses.** The actual modules, maps and coordinate equivalence of colemanCoordinates.

**Prerequisites.** [`PadicHodgeRegulators:L4/coleman-coordinates`](#padichodgeregulators-l4-coleman-coordinates).

**Proof route.**

1. Apply the inverse identity for e to the definition.

**Acceptance requirements.** Use the actual coordinate equivalence, not a vector-space dimension comparison.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 3A, Lemma 3.3 and its proof, p.1117. This reconstruction is the first equality in the source proof.

<a id="padichodgeregulators-l4-logarithmic-matrix"></a>
### Logarithmic matrix

`PadicHodgeRegulators:L4/logarithmic-matrix` · construction · `logarithmicMatrix`

Let R to A be a homomorphism of commutative rings, e:W to R^d and b:Y to A^d coordinate equivalences, and j:W to Y an R-linear map. Define M_ik=b(j(e inverse(e_i)))_k. This is an A-matrix encoding j, not an R-matrix asserted integral without proof.

**Hypotheses.** A is an R-algebra; Y is an A-module with compatible restricted R-action; d is finite; e and b are linear equivalences over their stated rings.

**Prerequisites.** The pinned algebraic baseline..

**Proof route.**

1. Map each standard vector in R^d through e inverse, j and b.
2. In LLZ, Y is the actual analytic scalar extension with its Mellin module comparison proved. No ring-multiplicativity of the ordinary power-series Mellin transform is assumed.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `logarithmicMatrix_entry` | characterisation | M_ik=b(j(e inverse(e_i)))_k. |
| `logarithmicMatrix_expansion` | characterisation | b(j(w))=algebraMap(e(w)) times M, using row multiplication. |
| `logarithmicMatrix_zero` | simp | For j=0, M=0. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `matrix_identity` | compatibility | For R=A and all maps identity, M=I. |
| `matrix_non_diagonal` | computation | For standard Q-coordinates and j with row matrix [[1,2],[3,4]], M is that matrix, not its transpose. |
| `matrix_singular_inclusion` | non-example | For j with row matrix diag(1,0), det M=0; the construction does not imply invertibility. |

**Acceptance requirements.** Pin row/column orientation and the coefficient embedding.

**Uses.** LLZ equation (1) and Lemma 3.3: Express the analytic vector regulator in a fixed crystalline basis.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 3, equation (1), pp. 1116-1117. Defines the comparison matrix from basis images with the correct coefficient ring.

<a id="padichodgeregulators-l4-matrix-expansion"></a>
### Expansion in the logarithmic matrix

`PadicHodgeRegulators:L4/matrix-expansion` · lemma · `logarithmicMatrix_expansion`

For w in W, b(j(w))=algebraMap(e(w)) times M. Map the input row from R to A before multiplying.

**Hypotheses.** The rings, coordinate equivalences, map j and scalar tower of logarithmicMatrix.

**Prerequisites.** [`PadicHodgeRegulators:L4/logarithmic-matrix`](#padichodgeregulators-l4-logarithmic-matrix); `mathlib:Module.Basis.constr_apply_fintype`; `mathlib:Matrix.vecMulBilin`.

**Proof route.**

1. Expand w in its finite coordinate basis.
2. Apply R-linearity of j, A-linearity of b and the scalar-tower identity. The resulting finite sum is row multiplication.

**Acceptance requirements.** The matrix must not be transposed accidentally.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 3, equation (1) and Lemma 3.3. The finite basis expansion in the source becomes a map-level identity.

<a id="padichodgeregulators-l4-regulator-coordinate-decomposition"></a>
### Vector-regulator coordinate decomposition

`PadicHodgeRegulators:L4/regulator-coordinate-decomposition` · theorem · `regulatorCoordinateDecomposition`

For the preceding actual maps, b(j(f(z)))=algebraMap(Col_e(z)) times M. With the independently constructed Iwasawa and Mellin comparison maps this gives LLZ's decomposition of the vector regulator. Without those maps it is only the stated linear algebra theorem.

**Hypotheses.** The full coefficient-extension and actual-map hypotheses of logarithmicMatrix and colemanCoordinates.

**Prerequisites.** [`PadicHodgeRegulators:L4/coleman-reconstruction`](#padichodgeregulators-l4-coleman-reconstruction); [`PadicHodgeRegulators:L4/matrix-expansion`](#padichodgeregulators-l4-matrix-expansion).

**Proof route.**

1. Apply logarithmicMatrix_expansion to f(z), then substitute colemanCoordinates.
2. The arithmetic application uses the INVERSE of h_Iw:N(V)^psi=1 to H^1_Iw in LLZ Definition 3.4.

**Acceptance requirements.** No arbitrary scalar projection and no unproved replacement for the Iwasawa comparison.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 3, Lemma 3.3, Definition 3.4 and equation (2), p. 1117. Separates the coordinate identity from the genuinely arithmetic comparison inputs.

<a id="padichodgeregulators-l4-constant-basis-covariance"></a>
### Constant basis covariance

`PadicHodgeRegulators:L4/constant-basis-covariance` · theorem · `constantBasisCovariance`

With column basis vectors n'=Un and nu'=Bnu, U in GL_d(R), B in GL_d(A), the coordinate row changes by c'=cU inverse and the matrix by M'=algebraMap(U) M B inverse. Hence c'M'=cM B inverse, so the vector in Y is unchanged. Fixing the crystalline basis means B=I.

**Hypotheses.** Actual coordinate bases and invertible matrices over their declared rings. Lattice-preserving Wach application: U belongs to GL_d(O_E). A rational matrix only yields a rational comparison.

**Prerequisites.** [`PadicHodgeRegulators:L4/coleman-coordinates`](#padichodgeregulators-l4-coleman-coordinates); [`PadicHodgeRegulators:L4/logarithmic-matrix`](#padichodgeregulators-l4-logarithmic-matrix).

**Proof route.**

1. Expanding the same vector in the two domain bases gives c'U=c.
2. Apply j to n'=Un and substitute nu=B inverse times nu'.
3. Multiply associatively; do not interchange matrices.
4. For Wach modules invoke only the good-basis theorem and permitted constant integral transformations, not arbitrary power-series basis changes.

**Acceptance requirements.** Check both domain and target basis changes; the inverse on Coleman coordinates is essential.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 3, equation (1); section 5C, Remark 5.12, p. 1129. Extends the stated fixed-crystalline-basis transformation to explicit two-basis covariance.

<a id="padichodgeregulators-l4-shear-matrix"></a>
### Integral shear matrix

`PadicHodgeRegulators:L4/shear-matrix` · definition · `shearMatrix`

Define A(e1,e2)=[[1,e2],[e1,1]], with row action (F,G)A=(F+e1G,G+e2F). Over a commutative ring it is invertible precisely when 1-e1e2 is a unit, not merely nonzero.

**Hypotheses.** The entries lie in a commutative ring.

**Prerequisites.** The pinned algebraic baseline..

**Proof route.**

1. Use the existing two by two Matrix carrier and compute the determinant.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `shearMatrix_action` | characterisation | (F,G)A=(F+e1G,G+e2F). |
| `shearMatrix_det` | characterisation | det A=1-e1e2. |
| `shearMatrix_unit` | characterisation | If 1-e1e2 is a unit, A has a two-sided inverse over the same ring. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `shear_identity` | degenerate | e1=e2=0 gives I. |
| `shear_order` | computation | For e1=2,e2=3 and (F,G)=(7,11), the output is (29,32). |
| `shear_nonunit_determinant` | non-example | Over Z_5, e1=1,e2=-4 give nonzero determinant 5 but a matrix not invertible over Z_5. |

**Acceptance requirements.** Retain the coefficient ring in the invertibility statement.

**Uses.** LLZ Proposition 5.11: Remove axis specialization lines while preserving the integral lattice.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 5C, Proposition 5.11, proof, p. 1129. The integral ring makes the distinction between nonzero and unit determinant necessary.

<a id="padichodgeregulators-l4-shear-specialization-lines"></a>
### Transformation of specialization lines

`PadicHodgeRegulators:L4/shear-specialization-lines` · lemma · `shearSpecializationLines`

Over a field, assume 1-e1e2 nonzero and (F',G')=(F,G)A. Then F=0 iff F'=e1G'; G=0 iff G'=e2F'; and F=rG iff (1+e2r)F'=(e1+r)G'. If e1+r and 1+e2r are nonzero, the latter line has both coordinate projections nonzero.

**Hypotheses.** E is a field and 1-e1e2 is nonzero.

**Prerequisites.** [`PadicHodgeRegulators:L4/shear-matrix`](#padichodgeregulators-l4-shear-matrix).

**Proof route.**

1. Expand each difference; it equals (1-e1e2) times the original difference.
2. Use the determinant's nonvanishing for both implications. Divide the transformed slope only when its denominator is nonzero.

**Acceptance requirements.** Treat both axes as well as finite nonzero slopes.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 5C, Proposition 5.11, proof, p. 1129. Preserves all three cases of the source's change-of-lines argument.

<a id="padichodgeregulators-l4-integral-shear-choice"></a>
### Integral shear avoiding finitely many slopes

`PadicHodgeRegulators:L4/integral-shear-choice` · theorem · `integralShearChoice`

Let O embed in a field E, with O a commutative local domain and its maximal ideal infinite. For finitely many nonzero slopes r_i in E, choose nonzero e1,e2 in that maximal ideal such that e1+r_i and 1+e2r_i are nonzero for every i. Then det A is a unit in O. Finite extensions of Q_p satisfy the infinite-ideal hypothesis via distinct positive powers of a uniformizer.

**Hypotheses.** O is a commutative local domain; E is a field; O to E is injective; maximalIdeal(O) is infinite; the slope set is finite.

**Prerequisites.** [`PadicHodgeRegulators:L4/shear-matrix`](#padichodgeregulators-l4-shear-matrix); `mathlib:IsLocalRing.maximalIdeal`; `mathlib:IsLocalRing.isUnit_one_sub_self_of_mem_nonunits`.

**Proof route.**

1. Avoid the finite set {0,-r_i} when choosing e1, using the injection O to E.
2. Avoid {0,-r_i inverse} when choosing e2.
3. Since e1e2 is in the maximal ideal, 1-e1e2 is a unit.
4. This repairs the insufficiency of merely requiring a nonzero determinant and does not need a large residue field.

**Acceptance requirements.** Uniformizer powers provide infinitely many choices even when the residue field is small.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 5C, Proposition 5.11, p.1129; compare arXiv1006.5163v2 Section 5.3, Proposition 5.11 and Remark 5.12, p.25. The maximal-ideal strengthening is already present in the preprint's integral remark and is used to make the published proof valid.

<a id="padichodgeregulators-l4-sheared-coordinate-surjectivity"></a>
### Rational surjectivity after integral basis change

`PadicHodgeRegulators:L4/sheared-coordinate-surjectivity` · theorem · `shearedCoordinateSurjectivity`

In the two-dimensional evaluation context, suppose each V_j is a one-dimensional E-subspace of E^2. A constant integral shear chosen as above makes both projections of S_J(V)A equal to R. For R=O_E[[X]][1/varpi] this is rational surjectivity, not an assertion that integral Coleman images equal O_E[[X]].

**Hypotheses.** The entire evaluation context with d=2 and dim_E V_j=1 for every imposed condition; O embeds in E and is as in integralShearChoice.

**Prerequisites.** [`PadicHodgeRegulators:L4/integral-shear-choice`](#padichodgeregulators-l4-integral-shear-choice); [`PadicHodgeRegulators:L4/shear-specialization-lines`](#padichodgeregulators-l4-shear-specialization-lines); [`PadicHodgeRegulators:L4/coordinate-image`](#padichodgeregulators-l4-coordinate-image).

**Proof route.**

1. Each line is an axis or has a finite nonzero slope. Collect the finitely many slopes.
2. Use integralShearChoice and shearSpecializationLines; every transformed line has both projections nonzero.
3. Evaluation commutes with the constant matrix A, so S(V)A=S(VA). The two forced-zero sets are empty and coordinateImage_eq gives the conclusion.
4. Integral finite-index conclusions still need LLZ Theorem 5.10 and its integral lower inclusion, recorded as remaining work.

**Acceptance requirements.** The proper ideal (5,X) in Z_5[[X]] becomes the full ring after inverting 5; rational surjectivity does not remove the integral correction.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section 5C, Proposition 5.11 and Remark 5.12, pp. 1128-1129; section 4A, Lemma 4.3. The algebra proves the rational conclusion; Theorems 5.10 and 5.13 supply additional integral content, not silently assumed here.

<a id="padichodgeregulators-l4-good-wach-basis"></a>
### Good integral Wach bases

`PadicHodgeRegulators:L4/good-wach-basis` · theorem · `exists_goodWachBasis`

For a crystalline V and G-stable T, each integral Wach basis n_i^0 admits a replacement n_i congruent n_i^0 mod pi such that b_i=(1+pi)phi(n_i) is a Lambda_O(G)-basis of (phi*N(T))^(psi=0). Rationally every E-basis nu_i of D_cris(V) has such a lift n_i mod pi. Analytically H_E tensor_Lambda (phi*N(V))^(psi=0) is (phi*N_rig(V))^(psi=0), and these b_i form its H_E-basis. This is an existence theorem, not a statement about all Wach bases.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; T stable; for the analytic closure argument use finite free modules with their canonical Frechet topology.

**Prerequisites.** `PhiGammaModulesAndIwasawaCohomology:PG.6`; `LocallyAnalyticDistributions:L3`; `PadicMeasuresIwasawaAlgebras:L2`.

**Proof route.**

1. Use the integral correction in LLZ2010 Lemma3.9 to improve Gamma invariance modulo pi^2. Proposition3.11 lifts generators successively modulo phi(pi)^k, using the Mellin identification of the products (1-chi(gamma)^(-i)gamma) with phi(pi)^k.
2. Complete the successive lifts; equality of finite Z_p ranks at each quotient and intersection of the ideals equal to zero prove independence. Constant E basis transport supplies prescribed nu_i.
3. For LLZ2.11 the scalar-extension image is finitely generated and closed, and bounded-series density makes it dense in the analytic target. Import the Frechet–Stein closedness theorem explicitly.

**Acceptance requirements.** Changing by a constant GL_d(O_E) matrix preserves goodness. An arbitrary power-series change does not follow from this theorem.

**Sources.**

- [LLZWach2010 (L3)](#source-l3-llzwach2010), Theorem3.5, Lemmas3.7-3.10, Proposition3.11, Lemma3.15, pp.10-13. Gives the integral iterative proof and rational basis transport.
- [LLZ2011 (L3)](#source-l3-llz2011), Proposition2.11, Theorem2.12, Corollary2.13, Remark2.14, pp.1115-1116. Specifies analytic extension and the precise unproved arbitrary-basis claim.

**Required supplier refinements.** [PadicMeasuresIwasawaAlgebras:L2](#request-l3-1); [PhiGammaModulesAndIwasawaCohomology:PG.6](#request-l3-2); [LocallyAnalyticDistributions:L3](#request-l3-4).

<a id="padichodgeregulators-l4-noncritical-refinement"></a>
### Noncritical crystalline refinement

`PadicHodgeRegulators:L4/noncritical-refinement` · definition · `noncriticalRefinement`

A refinement is a full phi-stable flag 0=Y_0 subset Y_1 subset ... subset Y_d=D_cris(V), dim Y_i=i. It is noncritical if each Y_i has the i smallest filtration weights in LLZ’s positive representation convention (weights -s_1>=...>=-s_d with 0<=s_1<=...<=s_d); Equivalently dim Fil^j(Y_i)=max(0,dim Fil^j(D_cris(V))-d+i), for every j, with multiplicities retained. On W=V(m) nonnegative weights are r_1<=...<=r_d with s_i=m-r_(d+1-i). Existence after finite E extension is a separate hypothesis.

**Hypotheses.** V is crystalline, initially with nonpositive weights -s_i. Repeated weights are allowed.

**Prerequisites.** [`PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`](#padichodgeregulators-l0-hodge-tate-and-twist-conventions); `PadicHodgeTheory:R06.2`.

**Proof route.**

1. Use the full induced filtered subspace, not only the list of phi eigenvalues. Interpret noncriticality using LLZ Section1C5 and the equivalent dimension equalities of the flag and filtration.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `noncriticalRefinement_flag` | characterisation | Every step is phi-stable and has dimension i. |
| `noncriticalRefinement_weights` | characterisation | The induced filtration on Y_i has weights -s_1,...,-s_i. |
| `noncriticalRefinement_extension` | compatibility | Finite field extension transports a noncritical flag and its filtration dimensions. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `refinement_rank_one` | characterisation | The unique flag of a rank-one filtered phi module is noncritical. |
| `refinement_wrong_line` | non-example | For weights 0,-2 with Fil^1 the second eigenline, the flag starting in that line is critical in the LLZ positive convention. |
| `refinement_scalar_phi` | characterisation | With scalar phi any flag is stable, but only flags with the required filtration dimensions are noncritical. |

**Acceptance requirements.** A phi-stable line lying in the wrong filtration step fails noncriticality even if phi has distinct eigenvalues.

**Uses.** LLZ Theorem2.10: Supplies the saturated flag used to compute elementary divisors. LLZ Section1D: Prevents treating Frobenius eigenvalues alone as a refinement.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section1C5, pp.1104-1105; Section2C before Proposition2.7, p.1112. The flag condition is exactly the input to the elementary-divisor proof.

**Required supplier refinements.** [PadicHodgeTheory:R06.2](#request-l3-11).

<a id="padichodgeregulators-l4-refinement-saturated-flag"></a>
### Saturated Wach flag comparison

`PadicHodgeRegulators:L4/refinement-saturated-flag` · theorem · `wachFlag_comparison`

For a noncritical refinement of a positive V, put mathcalY_i=B_rig^+ tensor Y_i and X_i=N_rig(V) intersect mathcalY_i[(t/pi)^(-1)]. Then X_i is saturated, rank i, and has weights -s_1,...,-s_i. For m>=s_d put A_i=pi^-m X_i e_m and B_i=t^-m mathcalY_i e_m. B_i is the saturation of A_i; A_d/A_(i-1) embeds in B_d/B_(i-1), with quotient annihilated by (t/pi)^(m-s_i). Passing to phi* and psi-zero gives cyclic successive quotients Btilde_i/(Btilde_(i-1)+Atilde_i) with exact annihilator n_(m-s_i); n_(m-s_i) annihilates the remaining quotient.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. Use the noncritical flag and m>=s_d; all intersections are in the same localized period module.

**Prerequisites.** [`PadicHodgeRegulators:L4/noncritical-refinement`](#padichodgeregulators-l4-noncritical-refinement); [`PadicHodgeRegulators:L3/logarithmic-factors`](#padichodgeregulators-l3-logarithmic-factors); `PhiGammaModulesAndIwasawaCohomology:PG.6`; `LocallyAnalyticDistributions:L3`.

**Proof route.**

1. LLZ2.4 proves saturation by intersecting a phi-stable period subspace and records equality of filtrations in 2.5 using the crystalline reduction theorem2.2. The supplier must give the t/pi comparison elementary divisors of 2.3.
2. Use the dimension count in Lemma2.6 to bound the last quotient. Proposition2.7 converts it to the twisted flag. Lemma2.9 and Proposition1.6 transfer (t/phi(pi)) powers to n_k under Mellin; the rank-one quotient proves exact annihilation.

**Acceptance requirements.** In rank one the exact annihilator is n_r, not ell_0...ell_(r-1); its removable weight-node factors have been divided out.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Propositions2.4-2.5, Lemma2.6, Proposition2.7, Lemma2.9, pp.1110-1114. The complete flag chain replaces a bare assertion of a determinant.

**Required supplier refinements.** [PhiGammaModulesAndIwasawaCohomology:PG.6](#request-l3-2); [LocallyAnalyticDistributions:L3](#request-l3-4).

<a id="padichodgeregulators-l4-logarithmic-elementary-divisors"></a>
### Elementary divisors of the logarithmic matrix

`PadicHodgeRegulators:L4/logarithmic-elementary-divisors` · theorem · `logarithmicMatrix_elementaryDivisors`

For W with nonnegative weights r_1<=...<=r_d admitting a noncritical refinement after finite coefficient extension, the H_E(Gamma_1) elementary divisors of (B_rig^+)^(psi=0) tensor D_cris(W)/(phi*N_rig(W))^(psi=0), and hence of the row-oriented logarithmic matrix M, are n_(r_1),...,n_(r_d). Consequently det M is associated to their product. In particular M(x_i) is invertible for x_i=chi(gamma)^i-1, 0<=i<r_d, since n_r has a removable nonzero value there.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The refinement hypothesis holds after finite extension; work componentwise in H_E, with its actual elementary-divisor theorem.

**Prerequisites.** [`PadicHodgeRegulators:L4/refinement-saturated-flag`](#padichodgeregulators-l4-refinement-saturated-flag); [`PadicHodgeRegulators:L4/good-wach-basis`](#padichodgeregulators-l4-good-wach-basis); [`PadicHodgeRegulators:L4/logarithmic-matrix`](#padichodgeregulators-l4-logarithmic-matrix); [`PadicHodgeRegulators:L3/logarithmic-factors`](#padichodgeregulators-l3-logarithmic-factors); `LocallyAnalyticDistributions:L2`.

**Proof route.**

1. Apply the flag cyclic-annihilator criterion LLZ1.12 to the psi-zero filtration of2.9. Descend elementary-divisor ideals by faithful flatness and uniqueness under finite coefficient extension.
2. Corollary3.2 transfers the lattice quotient calculation to the actual chosen basis matrix. Evaluate the removable n_r factors, including i>=r where numerator and denominator have no zero.

**Acceptance requirements.** Weights (0,2) give (1,n_2); the matrix has nonzero determinant but is not an analytic isomorphism everywhere.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Corollary1.12, Theorem2.10 and Corollary3.2, pp.1103,1114,1117. States the actual analytic elementary divisors.

**Required supplier refinements.** [LocallyAnalyticDistributions:L2](#request-l3-7).

<a id="padichodgeregulators-l4-specialization-subspaces"></a>
### Coleman specialization subspaces

`PadicHodgeRegulators:L4/specialization-subspaces` · definition · `colemanSpecializationSubspaces`

Under NC define V_(i,eta) in D_cris(V) as (1-p^i phi)(1-p^(-1-i)phi^-1)^(-1) Fil^(-i) if eta=chi_0^i, and phi Fil^(-i) otherwise, for 0<=i<r_d. Identify D_cris with row coordinates through the chosen ordered nu basis. The constraint on Coleman rows is W_(i,eta)={v in E^d: v M(x_i) belongs to V_(i,eta)}=V_(i,eta) M(x_i)^(-1). It has codimension d-dim Fil^(-i).

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.

**Prerequisites.** [`PadicHodgeRegulators:L3/unramified-interpolation`](#padichodgeregulators-l3-unramified-interpolation); [`PadicHodgeRegulators:L3/ramified-interpolation`](#padichodgeregulators-l3-ramified-interpolation); [`PadicHodgeRegulators:L4/logarithmic-elementary-divisors`](#padichodgeregulators-l4-logarithmic-elementary-divisors); [`PadicHodgeRegulators:L4/logarithmic-matrix`](#padichodgeregulators-l4-logarithmic-matrix); [`PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`](#padichodgeregulators-l0-hodge-tate-and-twist-conventions).

**Proof route.**

1. LLZ4.8 derives the filtration condition from reciprocity and the fact that the BK exponential vanishes on Fil^0. Corollaries4.9-4.10 identify the isotypical specialization.
2. Transport by the actual evaluated matrix using the row convention. The coefficient-space subspace in Proposition4.11 must be this transported subspace, not the untransported V_(i,eta).

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `colemanSpecializationSubspaces_mem` | characterisation | v is in W_(i,eta) iff v M(x_i) is in V_(i,eta). |
| `colemanSpecializationSubspaces_codim` | structure | codim W_(i,eta)=d-dim Fil^(-i). |
| `colemanSpecializationSubspaces_covariance` | compatibility | If M becomes U M B^-1 then W becomes W U^-1, with the period subspace transported by B^-1. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `specialization_transport` | computation | For V=span(1,0) and M=[[0,1],[1,0]], W=span(0,1), so the first Coleman coordinate is forced zero. |
| `specialization_full_filtration` | characterisation | If Fil^(-i) is full and both Euler maps invertible then W=E^d. |
| `specialization_singular_exclusion` | non-example | A phi eigenvalue p^-1 at i=0 violates NC and forbids using the displayed inverse. |

**Acceptance requirements.** Using the raw period subspace as the Coleman constraint can give the wrong coordinate vanishing.

**Uses.** LLZ Theorems4.12,4.15: Defines the exact subspaces of the bounded image. ModularIwasawaMainConjectures:L0: Signed local conditions must use the coordinates in this chosen good basis.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Proposition4.8, Corollaries4.9-4.10 and Proposition4.11, pp.1120-1123. Identifies the period subspace and then the matrix transport.

<a id="padichodgeregulators-l4-actual-coleman-image"></a>
### Image of the Coleman vector map

`PadicHodgeRegulators:L4/actual-coleman-image` · theorem · `colemanMap_image`

Under NC, in each eta component the image of the actual Col:N(V)^(psi=1)->Lambda_E(Gamma_1)^d is exactly S={F:F(x_i) belongs to W_(i,eta),0<=i<r_d}. Its determinant ideal is product_i(X-x_i)^(d-n_i). Each coordinate image equals product_(i: W_(i,eta) subset {v:v_j=0})(X-x_i) Lambda_E. The kernel of 1-phi is zero under the excluded Frobenius eigenvalues, giving a bounded Lambda_E exact sequence with quotient direct_sum_i E^d/W_(i,eta), with Gamma action evaluated at x_i. Analytic scalar extension gives the corresponding H_E exact sequence.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.

**Prerequisites.** [`PadicHodgeRegulators:L4/specialization-subspaces`](#padichodgeregulators-l4-specialization-subspaces); [`PadicHodgeRegulators:L4/constraint-basis`](#padichodgeregulators-l4-constraint-basis); [`PadicHodgeRegulators:L4/constraint-determinant`](#padichodgeregulators-l4-constraint-determinant); [`PadicHodgeRegulators:L4/projection-witness`](#padichodgeregulators-l4-projection-witness); [`PadicHodgeRegulators:L3/regulator-determinant`](#padichodgeregulators-l3-regulator-determinant); [`PadicHodgeRegulators:L4/logarithmic-elementary-divisors`](#padichodgeregulators-l4-logarithmic-elementary-divisors); [`PadicHodgeRegulators:L4/coleman-coordinates`](#padichodgeregulators-l4-coleman-coordinates); `PadicMeasuresIwasawaAlgebras:L4`; `LocallyAnalyticDistributions:L2`.

**Proof route.**

1. The actual decomposition and filtration condition give containment in S. Compare regulator, logarithmic-matrix and constraint determinants as in LLZ4.12.
2. The printed determinant argument needs the analytic lattice/descent criterion: equal determinants over H_E cannot by itself erase a possible proper bounded quotient. Record this precise input as a gap/request rather than treating equality as a generic determinant theorem over arbitrary rings.
3. Apply the algebraic projection witness to the exact bounded equality. Use the kernel description of 1-phi for injectivity; evaluation and bounded Lagrange interpolation give the quotient. Write bounded and analytically extended sequences on their respective rings.

**Acceptance requirements.** The coordinate ideal must come from transported W_(i,eta). The exact sequence is not a map onto a field with scalar ring forgotten.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Theorem4.12, Corollaries4.13-4.15, pp.1123-1124. Target statement and determinant route, with the missing descent interface made explicit.

**Open obligations.** [Bounded evaluation, division and image descent](#gap-l3-1); [Determinant normalization](#gap-l3-4).

**Required supplier refinements.** [PadicMeasuresIwasawaAlgebras:L4](#request-l3-5); [LocallyAnalyticDistributions:L2](#request-l3-7).

<a id="padichodgeregulators-l4-regulator-elementary-divisors"></a>
### Elementary divisors of the regulator

`PadicHodgeRegulators:L4/regulator-elementary-divisors` · theorem · `crystallineRegulator_elementaryDivisors`

Under NC the H_E(G)-module cokernel of the H_E-linear extension of the actual L_V has elementary divisors lambda_(r_1),...,lambda_(r_d). These are analytic cokernel invariants, not bounded Coleman coordinate images. For each component the determinant specializes to the L3 formula.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.

**Prerequisites.** [`PadicHodgeRegulators:L4/actual-coleman-image`](#padichodgeregulators-l4-actual-coleman-image); [`PadicHodgeRegulators:L4/logarithmic-elementary-divisors`](#padichodgeregulators-l4-logarithmic-elementary-divisors); [`PadicHodgeRegulators:L3/logarithmic-factors`](#padichodgeregulators-l3-logarithmic-factors); [`PadicHodgeRegulators:L4/regulator-coordinate-decomposition`](#padichodgeregulators-l4-regulator-coordinate-decomposition); `LocallyAnalyticDistributions:L2`.

**Proof route.**

1. Combine the elementary divisors of the image-constraint matrix and M. Their zero divisors are disjoint after the removable weight zeros are removed from n_r. Use the analytic elementary-divisor product criterion of LLZ4.16, with the nested weight multiplicities.

**Acceptance requirements.** Weights (0,2) give (1,ell_0 ell_1), not (1,(X-x_0)(X-x_1)) and not two identical factors.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Theorem4.16 and proof, p.1124. Computes the unbounded vector-regulator cokernel.

**Required supplier refinements.** [LocallyAnalyticDistributions:L2](#request-l3-7).

<a id="padichodgeregulators-l4-modular-specialization"></a>
### Rank-two modular specialization relation

`PadicHodgeRegulators:L4/modular-specialization` · theorem · `modularColeman_specialization`

For the nonordinary modular representation V=V_(fbar)(k-1) in LLZ Section1C6 (p odd, weight k>=2, p not dividing N, coefficient E containing eigenvalues, source Frobenius exclusions), use the prescribed ordered bases and M(0)=[[0,p^(k-1)],[-1,a_p]]. Then at the trivial Delta component (1-a_p+p^(k-2)) Col_2(z)(0)=p^(k-2)(p-1) Col_1(z)(0); at nontrivial eta, Col_2(z)^eta(0)=0. For k=2 the quotient functional on the ordered pair (Col_1,Col_2) is rho(g,h)=(p-1)g(0)-(2-a_p)h(0), valued in E. Its kernel is the actual rational image, and it is surjective when the coefficients are not both zero.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. f and V have LLZ1C6 hypotheses; phi has no eigenvalue in p^Z and the refinement input for image equality holds. The period/Frobenius comparison for the modular form is a proved external dependency.

**Prerequisites.** [`PadicHodgeRegulators:L3/quadratic-euler-product`](#padichodgeregulators-l3-quadratic-euler-product); [`PadicHodgeRegulators:L4/actual-coleman-image`](#padichodgeregulators-l4-actual-coleman-image); [`PadicHodgeRegulators:L4/specialization-subspaces`](#padichodgeregulators-l4-specialization-subspaces); `AutomorphicGaloisRepresentations:R19.5`.

**Proof route.**

1. Use the quadratic Euler calculation with the source period basis, as in Lemmas5.6-5.7. Insert M(0) and set the unwanted filtration coordinate to zero.
2. At k=2 compute the annihilator of that line directly. E303 records the printed swapped functional and coefficient field. The quotient sequence follows from the general image theorem in its stated range.

**Acceptance requirements.** At p=5,k=2,a_p=0 the vector (1,2) satisfies 2 h=4 g and our rho=0, while the printed rho is -6.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Lemma5.6, Corollary5.7, text before Proposition5.9 and Proposition5.9, pp.1126-1127. The preceding relation fixes the ordered-coordinate normalization.

**Required supplier refinements.** [AutomorphicGaloisRepresentations:R19.5](#request-l3-12).

<a id="padichodgeregulators-l4-integral-image-index"></a>
### Integral Coleman image has finite cokernel

`PadicHodgeRegulators:L4/integral-image-index` · theorem · `integralColemanImage_finite`

In the modular range of LLZ5.10 let X_j^eta be the rational coordinate generator and X_k=product_(i=0..k-2)(X-chi(gamma)^i+1). For the prescribed integral good basis, X_k Lambda_O subset Im Col_j^eta subset X_j^eta Lambda_O, and X_j^eta Lambda_O/Im Col_j^eta has finite O_E length, hence is pseudo-null over O_E[[X]]. After the integral shear of Proposition5.11 all X_j^eta become 1, so each coordinate cokernel is finite; integral surjectivity is not asserted.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. Use the actual modular lattice and good basis of LLZ Section5; supply the integral lower inclusion for that lattice, including any extra (C),(D) restrictions required by the proof in LLZ2010.

**Prerequisites.** [`PadicHodgeRegulators:L4/actual-coleman-image`](#padichodgeregulators-l4-actual-coleman-image); [`PadicHodgeRegulators:L4/integral-shear-choice`](#padichodgeregulators-l4-integral-shear-choice); `PadicMeasuresIwasawaAlgebras:L4`; `PhiGammaModulesAndIwasawaCohomology:PG.6`.

**Proof route.**

1. The lower inclusion is phi(pi)^(k-1)(phi*N(T))^(psi=0) subset (1-phi)N(T)^(psi=1). Its integral convergence proof is a specific unresolved input: LLZ2011 cites the proof of LLZ2010 Proposition4.11, whose stated scope is more restricted.
2. Mellin transports the lower inclusion to X_k. The quotient X_j Lambda_O/X_k Lambda_O is finite free over O_E, and rational equality makes its further quotient torsion. Finite generation gives finite O_E length.
3. Take the shear coefficients in the maximal ideal, avoid the finitely many forbidden ratios, and use inverse coordinate-basis transport. This removes rational zero factors, retaining the finite integral defect.

**Acceptance requirements.** The proper ideal (varpi,X) becomes the full ring after inverting varpi but is not integrally surjective.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Theorems 5.10 and 5.13, Proposition 5.11 and the published basis-change Remark 5.12, pp.1128-1129; the maximal-ideal selection is in arXiv1006.5163v2 Remark 5.12, p.25. Finite cokernel is the integral conclusion.
- [LLZWach2010 (L3)](#source-l3-llzwach2010), Proposition4.11 and proof, pp.26-27. Precisely marks the integral proof input still needed beyond its printed scope.
- [LLZ2010v2 (L3)](#source-l3-llz2010v2), Section 5.3, Remark 5.12, p.25. The preprint supplies the integral maximal-ideal choice; distinguish it from the published basis-change Remark 5.12.

**Open obligations.** [Integral lower inclusion](#gap-l3-6).

**Required supplier refinements.** [PhiGammaModulesAndIwasawaCohomology:PG.6](#request-l3-2); [PadicMeasuresIwasawaAlgebras:L4](#request-l3-5).

<a id="padichodgeregulators-l4-signed-local-condition"></a>
### Signed local conditions from Coleman maps

`PadicHodgeRegulators:L4/signed-local-condition` · construction · `signedColemanLocalCondition`

For a specified actual good integral Wach basis and coordinate j, export the closed Lambda_O-submodule ker Col_j of H^1_Iw(Q_p,T) via the proved h_Iw comparison. Its Tate-orthogonal local condition on the dual torsion representation is owned by ModularIwasawaMainConjectures. Under basis n prime=U n its row maps become Col prime=Col U^-1; the new kernel need not equal the old kernel. A basis or named signed normalization is part of the input.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The h_Iw lattice comparison and chosen integral good basis are specified; continuity gives the closed kernel.

**Prerequisites.** [`PadicHodgeRegulators:L4/coleman-coordinates`](#padichodgeregulators-l4-coleman-coordinates); [`PadicHodgeRegulators:L4/good-wach-basis`](#padichodgeregulators-l4-good-wach-basis); [`PadicHodgeRegulators:L4/constant-basis-covariance`](#padichodgeregulators-l4-constant-basis-covariance); [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L2/wach-psi-fixed-vectors`](#padichodgeregulators-l2-wach-psi-fixed-vectors); [`PadicHodgeRegulators:L2/lattice-and-coefficient-squares`](#padichodgeregulators-l2-lattice-and-coefficient-squares); `mathlib:LinearMap.ker`.

**Proof route.**

1. Transport the exact map, then take its genuine kernel. Export its pairing interface; do not reconstruct global Selmer groups here. No arbitrary good coordinate is identified with Pollack plus/minus without a separate source comparison.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `signedColemanLocalCondition_mem` | characterisation | A class lies in the condition iff its specified Col_j value is zero. |
| `signedColemanLocalCondition_closed` | structure | The kernel is a closed Lambda_O submodule. |
| `signedColemanLocalCondition_covariance` | compatibility | Its transported description is {z:(Col(z) U^-1)_j=0}. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `signed_zero` | degenerate | The zero class lies in every condition. |
| `signed_basis_mix` | computation | For Col(z)=(1,0) and U^-1=[[1,1],[0,1]], the second new coordinate is 1, so the second condition changes. |
| `signed_scalar_basis` | compatibility | Multiplying a coordinate by an O_E unit leaves its kernel unchanged; a noninvertible operation is not a basis change. |

**Acceptance requirements.** Equal rational images do not imply equal integral kernels.

**Uses.** ModularIwasawaMainConjectures:L0; ModularIwasawaMainConjectures:L4: Local kernels and their exact basis dependence are the regulator-side export.

**Sources.**

- [LLZ2011 (L3)](#source-l3-llz2011), Section3A and Section1A applications, pp.1096-1097,1116. The signed consumers require kernels of the actual normalized maps.

<a id="padichodgeregulators-l4-derham-character-domain"></a>
### Admitted de Rham character domain

`PadicHodgeRegulators:L4/derham-character-domain` · definition · `deRhamCharacterDomain`

Let D be a de Rham (phi,Gamma)-module over R_E, Delta=N_rig(D) its differential module, and m(Delta) an overconvergence/localization threshold. On a torsion weight component write a character kappa by z_kappa=kappa(exp(q)), q=p for odd p and q=4 for p=2. If the torsion components differ set v_p(z_kappa-z_eta)=-infinity. For a primitive finite character eta of conductor p^c set B(eta,N)={kappa:v_p(z_kappa-z_eta)>p^(N-c)}. Choose the source threshold N(D); put U_D=union_(c>m(Delta)) B(eta,N(D)). Choices give admissible domains with compatible restriction, not a maximal canonical domain or all weight space. N(D) can be bounded in terms of the conductor of an extension where D becomes semistable.

**Hypotheses.** E/Q_p finite; D is de Rham; the locally analytic character space is the actual PMIA weight space. Localization and Robba norms are provided by PHT/PG.

**Prerequisites.** `PhiGammaModulesAndIwasawaCohomology:PG.2`; `PadicHodgeTheory:P7`; `PadicMeasuresIwasawaAlgebras:L0a`; `LocallyAnalyticDistributions:L1`.

**Proof route.**

1. Use RJ0E3 for weight coordinates and IC4/I.17 for convergence. Choose N(D) so its annulus estimate gives convergence on every indicated ball. Threshold dependence is bounded by the potentially semistable localization extension.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `deRhamCharacterDomain_mem` | characterisation | Membership is existence of an admitted primitive eta with the stated coordinate valuation inequality. |
| `deRhamCharacterDomain_open` | structure | U_D is an admissible open of character space. |
| `deRhamCharacterDomain_restrict` | compatibility | Two valid threshold choices define compatible restrictions of the same regulator on their common admitted domain. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `domain_center` | characterisation | Each admitted eta has infinite valuation difference from itself and lies in its ball. |
| `domain_wrong_torsion` | non-example | A character on another torsion component has valuation difference -infinity and lies outside this ball. |
| `domain_threshold` | non-example | A character with valuation difference exactly p^(N-c) is excluded by the strict inequality; the trivial character is not supplied by a high-conductor center argument. |

**Acceptance requirements.** Finite characters of conductor c>m(Delta) lie in U_D; the trivial character is not guaranteed to do so.

**Uses.** RJ TheoremsI.15 and I.27: The regulator is defined only on this convergence domain. AutomorphicGaloisRepresentations:R19.5; modular bad-reduction consumers: Do not export a global scalar distribution from an arbitrary de Rham representation.

**Sources.**

- [RJ2018 (L3)](#source-l3-rj2018), Section 0E3 and IA, Theorem I.1; Sections IC4-IC5, equation(3), Theorem I.15 and Lemma I.17, pp.896-898,910-915. Records the precise strict inequality and high-conductor union.

**Required supplier refinements.** [LocallyAnalyticDistributions:L1](#request-l3-6); [PhiGammaModulesAndIwasawaCohomology:PG.2](#request-l3-13); [PadicHodgeTheory:P7](#request-l3-14); [PadicMeasuresIwasawaAlgebras:L0a](#request-l3-15).

<a id="padichodgeregulators-l4-analytic-differential-powers"></a>
### Analytic powers of the differential operator

`PadicHodgeRegulators:L4/analytic-differential-powers` · construction · `analyticDifferentialPower`

On Delta^(psi=0), for a sufficiently small weight affinoid and N large define kappa(partial) by the convergent series sum_(i in (Z/p^N)^times) sum_(j>=0) binom(omega_kappa,j) kappa(i) i^-j (1+T)^i p^(Nj) phi^N(partial^j z_i), where z_i=psi^N((1+T)^(-i)z). The value is independent of large N and representatives and is rigid analytic in kappa; for kappa=x^k, k in Z, it equals partial^k on psi-zero (negative powers use its inverse there).

**Hypotheses.** Delta=N_rig(D) is the genuine differential Robba module; partial=nabla/t and psi/phi satisfy the source relations. Restrict to a weight affinoid and annulus where RJ PropositionI.13 proves convergence.

**Prerequisites.** `PadicHodgeTheory:P7`; `PhiGammaModulesAndIwasawaCohomology:PG.2`; `PhiGammaModulesAndIwasawaCohomology:PG.4`; `PadicMeasuresIwasawaAlgebras:L0a`; [`PadicHodgeRegulators:L4/derham-character-domain`](#padichodgeregulators-l4-derham-character-domain).

**Proof route.**

1. Decompose psi-zero over units modulo p^N. On each piece p^N partial is a small perturbation of the scalar i. Expand its analytic binomial power.
2. RJ I.13 proves convergence by Robba differential bounds and bounded binomial coefficients, then checks refinement of N and representative changes. At algebraic weights finite binomial identities or the psi-zero inverse yield integral powers.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `analyticDifferentialPower_integer` | characterisation | At x^k the operator is partial^k for every integer k. |
| `analyticDifferentialPower_linear` | structure | It is E-linear in z and analytic in kappa on the specified affinoid. |
| `analyticDifferentialPower_choices` | extensionality | Changing N or residue representatives preserves the value on the common annulus. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `differential_weight_zero` | degenerate | At k=0 the operator is the identity on psi-zero. |
| `differential_weight_one` | computation | At k=1 it is partial, not t partial. |
| `differential_inverse` | compatibility | At k=-1, partial composed with the operator is identity on psi-zero; no inverse is asserted on all Delta. |

**Acceptance requirements.** This construction acts on the imported Delta; no second differential-module carrier is defined here.

**Uses.** RJ equation(3): Apply it to (1-phi)z before localization. RJ TheoremsI.15,I.27: Provides analytic interpolation rather than only integer values.

**Sources.**

- [RJ2018 (L3)](#source-l3-rj2018), SectionIC2, PropositionI.13 and proof, pp.911-913. The analytic differential calculus is a substantive construction, not a formal exponent.

**Open obligations.** [N_rig and exponential comparison](#gap-l3-7).

**Required supplier refinements.** [PhiGammaModulesAndIwasawaCohomology:PG.4](#request-l3-3); [PhiGammaModulesAndIwasawaCohomology:PG.2](#request-l3-13); [PadicHodgeTheory:P7](#request-l3-14); [PadicMeasuresIwasawaAlgebras:L0a](#request-l3-15).

<a id="padichodgeregulators-l4-derham-regulator"></a>
### Rodrigues Jacinto de Rham regulator

`PadicHodgeRegulators:L4/derham-regulator` · construction · `deRhamRegulator`

For z in Delta^(psi=1) and primitive finite eta of conductor exactly p^m with m>m(Delta), define Lambda_(D,z)(eta kappa)=G(eta)^(-1) sum_(a in (Z/p^m)^times) eta(a) sigma_a [phi^(-m) kappa(partial)(1-phi)z]_0, on its admitted high-conductor ball; the exponent m is the conductor exponent of eta, not a freely enlargeable localization index. The constant term is taken in E_m tensor D_dR(D) after localization at that conductor; the sum descends to D_dR(D). These definitions glue to a rigid analytic D_dR(D)-valued function on U_D. For positive-weight D and z in D^(psi=1), use its actual inclusion in Delta; an Iwasawa version is through the proved PG.5/L2 map.

**Hypotheses.** D is de Rham; use the actual Delta, localization embeddings, q coordinates and Gauss periods G(eta)=sum eta(a) zeta_(p^c)^a. On each ball retain the threshold needed for its analytic powers. Keep phi^(-m), the residue sum modulo p^m and G(eta) at the same primitive conductor. A larger coefficient field may receive this fixed expression; it does not replace m in the formula.

**Prerequisites.** [`PadicHodgeRegulators:L4/analytic-differential-powers`](#padichodgeregulators-l4-analytic-differential-powers); [`PadicHodgeRegulators:L4/derham-character-domain`](#padichodgeregulators-l4-derham-character-domain); `PhiGammaModulesAndIwasawaCohomology:PG.2`; `PhiGammaModulesAndIwasawaCohomology:PG.5`; [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); `PadicHodgeTheory:P7`.

**Proof route.**

1. RJ IC4 equation(3) fixes m by cond(eta)=p^m. I.15 and I.17 establish convergence on that character ball; constant coefficients after localization at m lie in the indicated de Rham realization.
2. Changing residue representatives or embedding the fixed conductor-m expression in a larger coefficient field preserves its value. Compare admitted charts on overlaps using the proved analytic differential identities; use the Gauss-sum transformation under Gamma to prove descent and glue in actual rigid analytic weight space. Do not replace the primitive conductor by a larger imprimitive modulus.

**API.**

| Name | Role | Contract |
| --- | --- | --- |
| `deRhamRegulator_formula` | characterisation | Its value on an admitted ball is the displayed localized constant-term Gauss sum. |
| `deRhamRegulator_linear` | structure | It is E-linear in z; the Gamma action induces the source character-equivariance convention. |
| `deRhamRegulator_descent` | compatibility | The conductor-m expression descends to D_dR(D). Embedding it in a larger coefficient field preserves its value while phi^(-m), the residue modulus and G(eta) remain at cond(eta)=p^m. |
| `deRhamRegulator_restrict` | extensionality | Two admitted thresholds give equal functions on their common domain. |

**Acceptance tests.** These are mathematical test specifications; supplier-dependent tests become executable only on the actual carriers.

| Name | Kind | Expected result |
| --- | --- | --- |
| `derham_zero` | degenerate | The zero psi-one vector gives the zero analytic function. |
| `derham_phi_fixed` | degenerate | A psi-one vector fixed by phi is killed by 1-phi and gives zero. |
| `derham_period_normalization` | computation | Replacing G(eta) by G(eta)^-1 would multiply the expression by G(eta)^2; the stated denominator is essential. |
| `derham_conductor_level` | non-example | In the Gauss-sum model at p=5, let eta be the quadratic character of conductor 5. For primitive compatible roots zeta_5=zeta_25^5, sum_(a mod 5, 5 not dividing a) eta(a) zeta_5^a=G(eta) is nonzero, whereas sum_(a mod 25, 5 not dividing a) eta(a) zeta_25^a=0. Thus the normalized conductor-5 value is 1 and the imprimitive modulus-25 replacement is 0. |

**Acceptance requirements.** An arbitrary analytic function with the expected values is not the construction. Conductor and localization enlargement are distinct: equation(3) is not invariant under replacing m by m+1 with eta unchanged.

**Uses.** RJ TheoremsI.27,I.29: Supplies bad-reduction interpolation and the crystalline comparison. Modular and Euler-system consumers via scalar projection: A differential must still be specified to obtain a scalar function.

**Sources.**

- [RJ2018 (L3)](#source-l3-rj2018), Equation(3), TheoremI.15, LemmaI.17 and proofs, pp.914-916. Constructs the vector function and proves its admitted-domain analyticity.

**Open obligations.** [Actual arithmetic carrier signatures](#gap-l3-2); [Representation-level L2 comparison versus general de Rham Robba modules](#gap-l3-13).

**Required supplier refinements.** [PhiGammaModulesAndIwasawaCohomology:PG.5](#request-l3-8); [PhiGammaModulesAndIwasawaCohomology:PG.2](#request-l3-13); [PadicHodgeTheory:P7](#request-l3-14).

<a id="padichodgeregulators-l4-derham-interpolation-growth"></a>
### De Rham interpolation and convergence bound

`PadicHodgeRegulators:L4/derham-interpolation-growth` · theorem · `deRhamRegulator_interpolation`

For D with nonnegative Hodge–Tate weights, z in D^(psi=1), and eta x^j in U_D with eta primitive of conductor p^n, RJ I.27 gives Lambda_(D,z)(eta x^j)=Gamma*(j+1) p^(n(j+1)) exp*(integral_G eta chi^(-j) mu_z) tensor e_(eta,-j)^(dR,dual) for j>=0, and the analogous exp^(-1) value for j sufficiently negative that the indicated Bloch–Kato exponential is bijective. Gauss bases are e_(eta,j)^dR=G(eta)t^-j e_(eta,j), dual=G(eta)^-1 t^j e_(eta^-1,-j). For general z in Delta use TheoremI.15 after nabla_h, with Gamma*(j-h+1) and j>=h or j sufficiently negative. Its growth statement is the local Robba annulus convergence estimate of LemmaI.17; it is not a global finite-order distribution bound.

**Hypotheses.** D is de Rham; positivity and z in D^(psi=1) are required for I.27. Negative j belongs to the proved isomorphism range, not every j<0. All characters lie in the admitted open.

**Prerequisites.** [`PadicHodgeRegulators:L4/derham-regulator`](#padichodgeregulators-l4-derham-regulator); [`PadicHodgeRegulators:L3/gamma-leading-factor`](#padichodgeregulators-l3-gamma-leading-factor); [`PadicHodgeRegulators:L1/bloch-kato-exponential`](#padichodgeregulators-l1-bloch-kato-exponential); [`PadicHodgeRegulators:L1/bloch-kato-logarithm`](#padichodgeregulators-l1-bloch-kato-logarithm); [`PadicHodgeRegulators:L1/dual-exponential`](#padichodgeregulators-l1-dual-exponential); [`PadicHodgeRegulators:L2/character-specialisation`](#padichodgeregulators-l2-character-specialisation); `PadicHodgeTheory:P7`; `LocallyAnalyticDistributions:L1`.

**Proof route.**

1. RJ I.22-I.26 compute localized differential coefficients and compare the actual cohomological exponential/dual exponential using Nakamura’s comparison, with the source Gauss/Tate bases.
2. I.17 bounds each binomial-series term on an annulus by C+j(v_p(binom(omega_kappa,j))/j+N+C_partial), with the differential bound and domain inequality ensuring its limit tends to infinity. This is the proved local growth control.
3. For general Delta vectors use nabla_h Delta subset D (PropositionI.9) and TheoremI.15. The required Nakamura map comparison is an explicit supplier gap.

**Acceptance requirements.** Do not supply an exp inverse at j=-1 merely because the negative Gamma factor exists; verify the finite-class map is bijective.

**Sources.**

- [RJ2018 (L3)](#source-l3-rj2018), LemmaI.17, PropositionsI.22-I.26, TheoremI.27 and footnotes10,25, pp.914-920. Exact integer ranges, period bases and convergence estimates.

**Open obligations.** [N_rig and exponential comparison](#gap-l3-7); [Representation-level L2 comparison versus general de Rham Robba modules](#gap-l3-13).

**Required supplier refinements.** [LocallyAnalyticDistributions:L1](#request-l3-6); [PadicHodgeTheory:P7](#request-l3-14).

<a id="padichodgeregulators-l4-crystalline-derham-comparison"></a>
### Crystalline extension of the de Rham regulator

`PadicHodgeRegulators:L4/crystalline-derham-comparison` · comparison · `deRhamRegulator_crystalline`

For any crystalline de Rham D and z in N_rig(D)^(psi=1), Rodrigues Jacinto TheoremI.15/CorollaryI.29 assert that Lambda_(D,z) extends from U_D to the entire weight space. In the explicitly computed subcase with strictly negative phi slopes and an eigenbasis after finite coefficient extension, write z=sum A_lambda_i tensor e_i, phi(e_i)=alpha_i e_i and psi(lambda_i)=alpha_i lambda_i. PropositionI.28 identifies its value at ramified eta x^j, j>0, with sum_i alpha_i^-n (integral_Zp^times eta^-1 x^j lambda_i)e_i. This analytic integral expression gives the global extension in that subcase. The broader crystalline extension requires a proof of the reductions beyond that subcase; it is recorded as a gap, rather than deleting the source’s general target. On the common L3 range, the comparison to the LLZ/LZ regulator is a map-level equality after explicitly converting the Amice/Mellin, inverse finite-character and Gauss/Tate period conventions.

**Hypotheses.** D crystalline de Rham; z in the authentic differential module psi-one source. For the explicit I.28 formula additionally assume strictly negative phi slopes and a genuine eigenbasis, not just that eigenvalues lie in E. For the LLZ/LZ comparison retain their nonnegative/no-trivial-quotient range.

**Prerequisites.** [`PadicHodgeRegulators:L4/derham-regulator`](#padichodgeregulators-l4-derham-regulator); [`PadicHodgeRegulators:L4/derham-interpolation-growth`](#padichodgeregulators-l4-derham-interpolation-growth); [`PadicHodgeRegulators:L3/ramified-interpolation`](#padichodgeregulators-l3-ramified-interpolation); [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); `LocallyAnalyticDistributions:L3`; [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L2/character-specialisation`](#padichodgeregulators-l2-character-specialisation).

**Proof route.**

1. RJ IC9 identifies N_rig(D) with the crystalline period module; under negative slopes the psi-one vectors lie in the positive Robba part. In an eigenbasis apply PropositionI.28’s Amice integral expression, which is analytic on the whole weight space.
2. The printed CorollaryI.29 asserts the general crystalline case, although this argument was introduced in a strict-slope eigenbasis subcase. Supply an explicit twist/nonsemisimple reduction or alternate proof as the recorded follow-up input.
3. Compare ramified integral characters with LZ B.5, carrying actual alpha powers, coefficient embeddings, and Gauss/Tate dual bases through the Fourier/Mellin square. Prove equality by analytic uniqueness on a justified dense subset of each admitted ball.

**Acceptance requirements.** A general de Rham D has no alpha_i eigenbasis in D_dR and does not satisfy this global-extension theorem.

**Sources.**

- [RJ2018 (L3)](#source-l3-rj2018), TheoremI.15, p.914; SectionIC9, PropositionI.28, CorollaryI.29, p.920. Precisely states the crystalline subrange in which a global extension is proved.

**Open obligations.** [Crystalline/de Rham normalization square](#gap-l3-8); [Representation-level L2 comparison versus general de Rham Robba modules](#gap-l3-13).

**Required supplier refinements.** [LocallyAnalyticDistributions:L3](#request-l3-4).

<a id="padichodgeregulators-l4-split-multiplicative-augmentation"></a>
### Split multiplicative Coleman augmentation

`PadicHodgeRegulators:L4/split-multiplicative-augmentation` · theorem · `rubinColemanMap_augmentation`

For an elliptic curve A with split multiplicative reduction at odd p, the actual Col_infty:H^1_(infty,s)(Q_p,T_p A)->Lambda is injective and its image is contained in the augmentation ideal ker(Lambda->Z_p). This is containment, not image equality or an exceptional-zero derivative formula.

**Hypotheses.** Use the source, differential, roots, indexing and lattice of rubinColemanMap. Split multiplicative reduction gives alpha=1,beta=p.

**Prerequisites.** [`PadicHodgeRegulators:L3/rubin-coleman-map`](#padichodgeregulators-l3-rubin-coleman-map); `PadicMeasuresIwasawaAlgebras:L2`.

**Proof route.**

1. Specialize the authentic formula at chi=1: (1-alpha^-1)=0, while (1-beta^-1)=1-p^-1 is nonzero. The value vanishes; the bounded character value is the augmentation. Injection is the previously constructed map’s theorem.

**Acceptance requirements.** Nonsplit alpha=-1 does not force augmentation zero. A derivative or L-invariant theorem needs its own additional input.

**Sources.**

- [RubinES (L3)](#source-l3-rubines), III Section5.8, Proposition5.14(b), printed p.52. The supplied review-added noncrystalline property, with its exact weaker image assertion.

**Open obligations.** [Rubin ordinary/multiplicative construction](#gap-l3-9).

**Required supplier refinements.** [PadicMeasuresIwasawaAlgebras:L2](#request-l3-1).

### Completion obligations for L4

- Discharge bounded image descent, the integral lower inclusion and analytic elementary-divisor supplier contracts.
- Supply N_rig/Nakamura comparisons and prove the exact crystalline/de Rham normalization square; elaborate arithmetic signatures.

## Supplier refinements

These requests supplement the imported node prerequisites. A stage names an owner, not an assertion that the owner already supplies this exact contract. The former whole-layer request to L2 is resolved by the precise local node references above. General de Rham cohomology and pairing refinements remain requests to their actual external owners.

<a id="request-d-1-1"></a>
### MotivicEtaleKTheory:M.7 — D.1 request 1

Soulé's étale Chern classes c_{i,k} : K_{2i−k}(R; Z/n) → H^k_et(R, μ_n^{⊗i}) for rings R with n invertible (fields, p-adic integer rings with p ∤ n replaced by their generic fibres, number rings), natural in R, compatible with the coefficient maps n | n', with products and with transfers (corestriction), and Soulé's product formula — planned in the part of MotivicEtaleKTheory that needs only M.7 (étale K-theory), as RT-AREA-ktheory-2/18 directs, so that HabiroNumberFields HB.1/HB.2 and PadicHodgeRegulators D.2 import one construction.

**Consumers.** [`PadicHodgeRegulators:D.2/etale-regulator`](#padichodgeregulators-d-2-etale-regulator).

<a id="request-d-1-2"></a>
### MotivicEtaleKTheory:M.1 — D.1 request 2

The continuous realisation K_{2n−1}(F) → H^1(F, Z_p(n)) = lim_ν H^1(F, μ_{p^ν}^{⊗n}) obtained from the classes c_{n,1} with p-power coefficients, its agreement with the Kummer map for n = 1, and its compatibility with restriction and transfer.

**Consumers.** [`PadicHodgeRegulators:D.2/etale-regulator`](#padichodgeregulators-d-2-etale-regulator).

<a id="request-d-1-3"></a>
### Polylogarithms:P.4 — D.1 request 3

De Jeu's complexes M̃^{(n)}(F) (n ≥ 2; in weight two M̃^{(2)}(F) → ∧²F^×_Q) of a field of characteristic 0 and its subcomplex M̃^{(2)}(O) for a discrete valuation ring O ⊂ F generated by special units (Besser–de Jeu §3), with the map H^1(M̃^{(2)}(F)) → K_3^{(2)}(F) and its comparison, up to the sign fixed by de Jeu, with Suslin's isomorphism B(F) ⊗ Q ≅ K_3^ind(F) ⊗ Q of K3BlochGroups V.4/V.6; in weight n, the map H^1(M̃^{(n)}(F)) → K^{(n)}_{2n−1}(F) for number fields (an isomorphism for n = 2, 3 and for cyclotomic fields) and the cyclotomic symbols [ζ]_n.

**Consumers.** [`PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`](#padichodgeregulators-d-2-weight-two-dilogarithm-comparison); [`PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison`](#padichodgeregulators-d-2-higher-weight-polylogarithm-comparison).

<a id="request-d-1-4"></a>
### CrystallineCohomology:CR.5 — D.1 request 4

Absolute log-crystalline cohomology RΓ_cr(X, J^{[r]})_n of fs log-schemes X log-smooth over O_K^× (O_K a complete DVR of mixed characteristic with perfect residue field, any ramification), with its divided-power filtration, Frobenius, base change in n and the Cartier-type hypotheses needed for the Hyodo–Kato comparison.

**Consumers.** [`PadicHodgeRegulators:D.2/log-syntomic-complex`](#padichodgeregulators-d-2-log-syntomic-complex).

<a id="request-d-1-5"></a>
### CrystallineCohomology:CR.3 — D.1 request 5

Frobenius on absolute crystalline cohomology of smooth O_K-schemes, compatible with the PD filtration, used in the non-log case of the syntomic complex.

**Consumers.** [`PadicHodgeRegulators:D.2/log-syntomic-complex`](#padichodgeregulators-d-2-log-syntomic-complex).

<a id="request-d-1-6"></a>
### CrystallineCohomology:CR.2 — D.1 request 6

The crystalline (PD) Poincaré lemma for the relative period rings A_cr(R) of small semistable O_K-algebras (Tsuji, as used by Colmez–Nizioł §4.7), identifying Galois cochains in the PD de Rham complex of the envelope with Galois cochains in [F^r A_cr(R) → A_cr(R)].

**Consumers.** [`PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`](#padichodgeregulators-d-2-fontaine-messing-kato-period-map).

<a id="request-d-1-7"></a>
### AInfCohomology:AI.4 — D.1 request 7

The relative period rings A_cr(R) and their filtration and Frobenius for small (semistable, log) O_K-algebras R, with the Galois action of G_R, as used in the local construction of the Fontaine–Messing–Kato period map.

**Consumers.** [`PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`](#padichodgeregulators-d-2-fontaine-messing-kato-period-map).

<a id="request-d-1-8"></a>
### DerivedDeRhamCohomology:DD.2 — D.1 request 8

Algebraic de Rham cohomology of smooth K-schemes with its Hodge filtration, functorial in X, and the comparison of Fil^n RΓ_dR(X_K) with the de Rham term of rigid syntomic cohomology.

**Consumers.** [`PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`](#padichodgeregulators-d-2-rigid-syntomic-cohomology).

<a id="request-d-1-9"></a>
### PhiGammaModulesAndIwasawaCohomology:PG.5 — D.1 request 9

For p odd, E/Q_p finite and T a free O_E-lattice with continuous G_{Q_p}-action: instantiate PG.5/psi-complex on D(T) over O_E ⊗ A_{Q_p} with the actual ψ of PG.4; construct the quasi-isomorphism to SelmerIwasawaCohomology:L3/iwasawa-cohomology; prove that D(T)^{ψ=1} → lim_cor H^1(Q_p(μ_{p^n}), T) is a Λ_{O_E}(G_∞)-linear bijection whose n-th component (n ≥ 1) is Cherbonnier–Colmez's ℓ(γ_n)ι_{φ,γ_n}(x_n, y) (their Proposition I.4.1 cocycle); H^2_Iw ≅ D(T)/(ψ − 1); compatibility with O_{E'} ⊗ − and with H^1_Iw(V) = H^1_Iw(T) ⊗ Q.

**Consumers.** [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L2/lattice-and-coefficient-squares`](#padichodgeregulators-l2-lattice-and-coefficient-squares).

<a id="request-d-1-10"></a>
### PhiGammaModulesAndIwasawaCohomology:PG.6 — D.1 request 10

Wach modules: for an E-linear crystalline V of G_{Q_p} with Hodge–Tate weights in [a; b] (HT(E(1)) = +1) and a G-stable O_E-lattice T, N(T) is free of rank d over O_E ⊗ A^+_{Q_p}, Γ-trivial modulo π, N(T) = N(V) ∩ D(T), φ(π^b N) ⊆ π^b N with π^b N/φ^*(π^b N) killed by q^{b−a}; N(T(j)) = π^{−j}N(T) ⊗ e_j; N(T) ⊆ φ^*N(T) when a ≥ 0; the inclusion-preserving lattice bijection (Berger, Limites III.4.2); and the φ-module isomorphism N(V)/πN(V) ≅ D_cris(V).

**Consumers.** [`PadicHodgeRegulators:L2/wach-psi-fixed-vectors`](#padichodgeregulators-l2-wach-psi-fixed-vectors); [`PadicHodgeRegulators:L2/twist-compatibility`](#padichodgeregulators-l2-twist-compatibility); [`PadicHodgeRegulators:L2/lattice-and-coefficient-squares`](#padichodgeregulators-l2-lattice-and-coefficient-squares).

<a id="request-d-1-11"></a>
### PhiGammaModulesAndIwasawaCohomology:PG.4 — D.1 request 11

The actual ψ on O_E ⊗ A_{Q_p} and on D(T): ψφ = id, ψ(φ(λ)x) = λψ(x), Γ-equivariance and integrality; ψ(π^{−1}) = π^{−1} and ψ(π^{−m}) = π^{−m}(p^{m−1} + πQ_m(π)) with Q_m ∈ Z_p[X] (Berger, Lemma A.4).

**Consumers.** [`PadicHodgeRegulators:L2/wach-psi-fixed-vectors`](#padichodgeregulators-l2-wach-psi-fixed-vectors).

<a id="request-d-1-12"></a>
### PhiGammaModulesAndIwasawaCohomology:PG.1 — D.1 request 12

The O_E-linear Fontaine equivalence with D(T(η)) = D(T) ⊗ e_η for continuous characters η of G_∞ (φ and ψ acting on the first factor, g acting by η(g)g), D(O_{E'} ⊗ T) = O_{E'} ⊗ D(T), D(T) free and D(T) ⊂ D(V).

**Consumers.** [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L2/twist-compatibility`](#padichodgeregulators-l2-twist-compatibility); [`PadicHodgeRegulators:L2/lattice-and-coefficient-squares`](#padichodgeregulators-l2-lattice-and-coefficient-squares).

<a id="request-d-1-13"></a>
### CohomologyComparisons:CP.4 — D.1 request 13

The Hyodo–Kato (φ, N)-structure on H^1_dR of a curve with semistable reduction over O_K and its comparison with H^1_et(X_K̄, Q_p) (semistable comparison), used to state the bad-reduction regulator input. Separately, route the integral/open classical log-syntomic construction to an EARLY prefix of CohomologyComparisons Part II after CR.5/CR.6, as required by the accepted RT-AREA-iwasawa-2/3 verification. Name that producer rather than importing the late proper rational B_st comparison as its construction. Required contracts: CN’s undivided complex and its divided counterpart, a directed integral period morphism into the modified twist, the exact small-range comparison and the formal semistable exponential with its distinct i≤r−1/i=r ranges.

**Consumers.** [`PadicHodgeRegulators:D.5/semistable-input-boundary`](#padichodgeregulators-d-5-semistable-input-boundary); [`PadicHodgeRegulators:D.2/log-syntomic-complex`](#padichodgeregulators-d-2-log-syntomic-complex); [`PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`](#padichodgeregulators-d-2-fontaine-messing-kato-period-map); [`PadicHodgeRegulators:D.2/small-twist-comparison`](#padichodgeregulators-d-2-small-twist-comparison); [`PadicHodgeRegulators:D.2/syntomic-exponential`](#padichodgeregulators-d-2-syntomic-exponential).

<a id="request-d-1-14"></a>
### tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places — D.1 request 14

The named semilocal equivalence F ⊗_Q Q_p ≅ ∏_{v|p} F_v (and O_F ⊗ Z_p ≅ ∏ O_v) with its characteristic property, as planned in that layer; this roadmap uses it as given.

**Consumers.** [`PadicHodgeRegulators:D.1/combined-dilogarithm`](#padichodgeregulators-d-1-combined-dilogarithm); [`PadicHodgeRegulators:D.1/unit-logarithm-kernel`](#padichodgeregulators-d-1-unit-logarithm-kernel); [`PadicHodgeRegulators:D.3/unramified-etale-algebra`](#padichodgeregulators-d-3-unramified-etale-algebra); [`PadicHodgeRegulators:D.4/global-p-adic-regulator`](#padichodgeregulators-d-4-global-p-adic-regulator); [`PadicHodgeRegulators:L1/semilocal-bloch-kato`](#padichodgeregulators-l1-semilocal-bloch-kato).

<a id="request-d-1-15"></a>
### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group — D.1 request 15

Import the local unit filtration, canonical Teichmüller splitting and p-adic log/exp isomorphism on sufficiently deep units from upstream Layer 1. For finite L/Q_p, kernel(log on O_L^×)=μ(L); for unramified L and odd p, log:1+pO_L≅pO_L. Check agreement with the pinned TauCeti.teichmuller section and Coleman’s Iwasawa branch, without rebuilding the upstream carrier.

**Consumers.** [`PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`](#padichodgeregulators-d-1-teichmuller-unit-decomposition); [`PadicHodgeRegulators:D.1/unit-logarithm-kernel`](#padichodgeregulators-d-1-unit-logarithm-kernel); [`PadicHodgeRegulators:L1/integral-logarithm-unramified`](#padichodgeregulators-l1-integral-logarithm-unramified).

<a id="request-d-1-16"></a>
### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — D.1 request 16

Import finite unramified extension classification, existence/uniqueness of arithmetic Frobenius and the integer-ring identification O_L≅W(F_q), natural under embeddings and finite products, including the agreement of Frobenius with WittVector.frobenius. IsArithFrobAt only states a residue congruence; FormallyUnramified on the generic characteristic-zero field only states separability. Supply the specialized product interface retained at D.3/unramified-etale-algebra.

**Consumers.** [`PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`](#padichodgeregulators-d-1-unramified-frobenius-on-roots); [`PadicHodgeRegulators:D.3/unramified-etale-algebra`](#padichodgeregulators-d-3-unramified-etale-algebra).

<a id="request-d-1-17"></a>
### ArithmeticGaloisDuality:R02.4 — D.1 request 17

For K/Q_p finite and finite-dimensional continuous Q_p-representation V, provide the perfect cup-product pairings H^i(K,V)×H^{2−i}(K,V*(1))→Q_p, the invariant identification H²(K,Q_p(1))≅Q_p, finite-dimensional H^i(K,V), vanishing above 2 and the local Euler characteristic dim H⁰−dim H¹+dim H²=−[K:Q_p]dim V, obtained by finite coefficients, a stable lattice, inverse limits and rationalization. It must agree with the read D7/local-invariant-trivialization and D7/duality-after-localization pairings; a discrete class-formation Ext theorem alone is not this statement. The result must apply to every finite K/Q_p, without assuming that K is already presented as a completion of a chosen global field.

**Consumers.** [`PadicHodgeRegulators:L1/bloch-kato-logarithm`](#padichodgeregulators-l1-bloch-kato-logarithm); [`PadicHodgeRegulators:L1/dimension-formulas`](#padichodgeregulators-l1-dimension-formulas); [`PadicHodgeRegulators:L1/local-duality-of-conditions`](#padichodgeregulators-l1-local-duality-of-conditions); [`PadicHodgeRegulators:L1/tate-twist-examples`](#padichodgeregulators-l1-tate-twist-examples); [`PadicHodgeRegulators:L1/dual-exponential`](#padichodgeregulators-l1-dual-exponential).

<a id="request-l3-1"></a>
### PadicMeasuresIwasawaAlgebras:L2 — L3 request 1

Bounded Lambda_E=O_E[[G]][1/varpi], character-chart evaluation, bounded division by X-x, nonzero factors and integral augmentation; the existing unit-measure Amice equivalence is reused exactly and is not the unbounded Mellin theorem.

**Consumers.** [`PadicHodgeRegulators:L4/good-wach-basis`](#padichodgeregulators-l4-good-wach-basis); [`PadicHodgeRegulators:L4/split-multiplicative-augmentation`](#padichodgeregulators-l4-split-multiplicative-augmentation).

<a id="request-l3-2"></a>
### PhiGammaModulesAndIwasawaCohomology:PG.6 — L3 request 2

Actual integral Wach modules, gamma-trivial reduction, phi* inclusion, D_cris comparison and t/pi comparison elementary divisors of LLZ2.3; regulator-specific good-basis consequence is owned and planned here.

**Consumers.** [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); [`PadicHodgeRegulators:L3/growth`](#padichodgeregulators-l3-growth); [`PadicHodgeRegulators:L4/good-wach-basis`](#padichodgeregulators-l4-good-wach-basis); [`PadicHodgeRegulators:L4/refinement-saturated-flag`](#padichodgeregulators-l4-refinement-saturated-flag); [`PadicHodgeRegulators:L4/integral-image-index`](#padichodgeregulators-l4-integral-image-index).

<a id="request-l3-3"></a>
### PhiGammaModulesAndIwasawaCohomology:PG.4 — L3 request 3

Authentic continuous phi/psi on the coefficient/Wach/differential modules, psi phi=id and decompositions/localization; instantiate the existing PG.4/psi-one-to-zero algebra node rather than redefine it.

**Consumers.** [`PadicHodgeRegulators:L3/big-exponential-obstruction`](#padichodgeregulators-l3-big-exponential-obstruction); [`PadicHodgeRegulators:L4/analytic-differential-powers`](#padichodgeregulators-l4-analytic-differential-powers).

<a id="request-l3-4"></a>
### LocallyAnalyticDistributions:L3 — L3 request 4

Full unbounded analytic Mellin module equivalence and integral/bounded inclusion, group-action/convolution linearity, Tate logarithm differentiation and change of roots; L3/finite-character-component-mellin currently treats only bounded finite-component charts.

**Consumers.** [`PadicHodgeRegulators:L3/logarithmic-factors`](#padichodgeregulators-l3-logarithmic-factors); [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); [`PadicHodgeRegulators:L3/naturality-and-lattice`](#padichodgeregulators-l3-naturality-and-lattice); [`PadicHodgeRegulators:L4/good-wach-basis`](#padichodgeregulators-l4-good-wach-basis); [`PadicHodgeRegulators:L4/refinement-saturated-flag`](#padichodgeregulators-l4-refinement-saturated-flag); [`PadicHodgeRegulators:L4/crystalline-derham-comparison`](#padichodgeregulators-l4-crystalline-derham-comparison).

<a id="request-l3-5"></a>
### PadicMeasuresIwasawaAlgebras:L4 — L3 request 5

Finite O_E-length and pseudo-null module criteria over O_E[[X]], distinguished polynomial quotients, determinant/lattice comparison and bounded descent required by LLZ4.12.

**Consumers.** [`PadicHodgeRegulators:L4/actual-coleman-image`](#padichodgeregulators-l4-actual-coleman-image); [`PadicHodgeRegulators:L4/integral-image-index`](#padichodgeregulators-l4-integral-image-index).

<a id="request-l3-6"></a>
### LocallyAnalyticDistributions:L1 — L3 request 6

Open-disc analytic logarithm/division with removable values, analytic weight affinoids, constant-term restriction and locally analytic topology for actual period/distribution spaces.

**Consumers.** [`PadicHodgeRegulators:L3/logarithmic-factors`](#padichodgeregulators-l3-logarithmic-factors); [`PadicHodgeRegulators:L3/big-exponential-obstruction`](#padichodgeregulators-l3-big-exponential-obstruction); [`PadicHodgeRegulators:L4/derham-character-domain`](#padichodgeregulators-l4-derham-character-domain); [`PadicHodgeRegulators:L4/derham-interpolation-growth`](#padichodgeregulators-l4-derham-interpolation-growth).

<a id="request-l3-7"></a>
### LocallyAnalyticDistributions:L2 — L3 request 7

Order-h distributions and seminorm transfer under Mellin; analytic uniqueness on each proved dense character set; elementary-divisor/Bézout theory for actual H_E analytic algebra, including closed finite submodules and the needed Frechet–Stein input.

**Consumers.** [`PadicHodgeRegulators:L3/growth`](#padichodgeregulators-l3-growth); [`PadicHodgeRegulators:L4/logarithmic-elementary-divisors`](#padichodgeregulators-l4-logarithmic-elementary-divisors); [`PadicHodgeRegulators:L4/actual-coleman-image`](#padichodgeregulators-l4-actual-coleman-image); [`PadicHodgeRegulators:L4/regulator-elementary-divisors`](#padichodgeregulators-l4-regulator-elementary-divisors).

<a id="request-l3-8"></a>
### PhiGammaModulesAndIwasawaCohomology:PG.5 — L3 request 8

Actual psi complex to derived corestriction Iwasawa-cohomology comparison and specialization, including integral and finite coefficient-extension hypotheses. Generic Herr algebra is insufficient. For RJ, also supply Nakamura’s Iwasawa cohomology and exponential comparison for general de Rham Robba modules; no etaleness assumption is imposed by RJ I.15/I.27. The representation-level Iwasawa specialization retains its separate etale comparison.

**Consumers.** [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); [`PadicHodgeRegulators:L4/derham-regulator`](#padichodgeregulators-l4-derham-regulator).

<a id="request-l3-9"></a>
### PadicMeasuresIwasawaAlgebras:L5 — L3 request 9

Determinant lines and duality comparison for the genuine rank-d Iwasawa complex used in delta(V); identify component ideals with the correct H_E scalar extension.

**Consumers.** [`PadicHodgeRegulators:L3/regulator-determinant`](#padichodgeregulators-l3-regulator-determinant).

<a id="request-l3-10"></a>
### SelmerIwasawaCohomology:L3 — L3 request 10

Actual inverse-corestriction singular local quotients, source topology and finite-level maps for RubinIII.5.14; integral H_f is the preimage of rational H_f, not a freely selected lattice.

**Consumers.** [`PadicHodgeRegulators:L3/rubin-coleman-map`](#padichodgeregulators-l3-rubin-coleman-map).

<a id="request-l3-11"></a>
### PadicHodgeTheory:R06.2 — L3 request 11

Authentic D_cris/D_dR filtered, tensor, dual, Tate and finite-coefficient-extension comparisons; induced filtered subspaces and weak admissibility for the refinement input.

**Consumers.** [`PadicHodgeRegulators:L4/noncritical-refinement`](#padichodgeregulators-l4-noncritical-refinement).

<a id="request-l3-12"></a>
### AutomorphicGaloisRepresentations:R19.5 — L3 request 12

Proved local geometric crystalline/de Rham comparison for the modular representation at the stated prime, identification of the ordered differential/Frobenius basis and periods. Resolve the legacy R11 reference through an actual source-specific supplier; do not treat NeronModels as modular-curve comparison.

**Consumers.** [`PadicHodgeRegulators:L4/modular-specialization`](#padichodgeregulators-l4-modular-specialization).

<a id="request-l3-13"></a>
### PhiGammaModulesAndIwasawaCohomology:PG.2 — L3 request 13

Actual general de Rham differential module N_rig(D), its phi/psi/partial identities, overconvergence threshold and localization, including inclusion t^-a D subset N_rig(D) subset t^-b D. Add this in the supplier direction, as PartII if outside its current contract.

**Consumers.** [`PadicHodgeRegulators:L4/derham-character-domain`](#padichodgeregulators-l4-derham-character-domain); [`PadicHodgeRegulators:L4/analytic-differential-powers`](#padichodgeregulators-l4-analytic-differential-powers); [`PadicHodgeRegulators:L4/derham-regulator`](#padichodgeregulators-l4-derham-regulator).

<a id="request-l3-14"></a>
### PadicHodgeTheory:P7 — L3 request 14

Robba annulus norms, differential bounds, de Rham localization embeddings/constant terms and N_rig differential-module interface supporting RJ I.3/I.9/I.13/I.17. Extend the supplier as PartII where its foundational annulus scope needs extension.

**Consumers.** [`PadicHodgeRegulators:L4/derham-character-domain`](#padichodgeregulators-l4-derham-character-domain); [`PadicHodgeRegulators:L4/analytic-differential-powers`](#padichodgeregulators-l4-analytic-differential-powers); [`PadicHodgeRegulators:L4/derham-regulator`](#padichodgeregulators-l4-derham-regulator); [`PadicHodgeRegulators:L4/derham-interpolation-growth`](#padichodgeregulators-l4-derham-interpolation-growth).

<a id="request-l3-15"></a>
### PadicMeasuresIwasawaAlgebras:L0a — L3 request 15

Actual locally analytic character weight space with torsion components, q coordinate, finite conductor indexing and analytic binomial functions; admitted open balls and restriction/gluing interfaces.

**Consumers.** [`PadicHodgeRegulators:L4/derham-character-domain`](#padichodgeregulators-l4-derham-character-domain); [`PadicHodgeRegulators:L4/analytic-differential-powers`](#padichodgeregulators-l4-analytic-differential-powers).

<a id="request-l3-16"></a>
### SelmerIwasawaCohomology:L3 — L3 request 16

The actual local Iwasawa cup-product pairing on inverse-corestriction H^1(Q_p(mu_{p^n}),T) and its Tate dual, with values in Lambda, coefficient extension and finite-level specialization. Specify the inverse-action involution in the second variable and the local invariant/trace normalization, using ArithmeticGaloisDuality D7 local pairings. The read L3 cohomology, Shapiro, descent and twist nodes do not by themselves supply this pairing or its normalized specialization identity (LZ Section 2.6 and Appendix B.6).

**Consumers.** [`PadicHodgeRegulators:L3/explicit-reciprocity`](#padichodgeregulators-l3-explicit-reciprocity); [`PadicHodgeRegulators:L3/regulator-determinant`](#padichodgeregulators-l3-regulator-determinant).

## Open mathematical and implementation obligations

Each obligation names its consumers. No layer is closed by this assembly. The typed algebraic prototypes and their elaboration cannot validate arithmetic contracts recorded only as comments; their exact supplier interfaces must be provided before full Lean-signature and executable-test coverage is claimed.

<a id="gap-d-1-1"></a>
### The dilogarithm formula for arbitrary Bloch elements (Besser–de Jeu Conjecture 1.14, n = 2)

That the p-adic regulator of the class of Σ n_i[z_i] ∈ B(F) ⊗ Q equals ±Σ n_i D(σ z_i) is proved only when every z_i is a special unit of the valuation ring at p (BdJ Theorems 1.6(2), 1.10) or a root of unity (Theorem 1.12). For general presentations it is BdJ's Conjecture 1.14, open even for n = 2 in every source read. GSWZ (19) asserts the general identity (sourceIssues E101). The packet defines D_p on completed K_3 as the regulator, so Theorem 9 and the Habiro export do not depend on the conjecture; only the explicit evaluation of D_p by dilogarithms of non-special symbols does.

**Consumers.** [`PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`](#padichodgeregulators-d-2-weight-two-dilogarithm-comparison); [`PadicHodgeRegulators:D.4/special-unit-formula`](#padichodgeregulators-d-4-special-unit-formula).

<a id="gap-d-1-2"></a>
### Upper end of the Kato–Kurihara–Tsuji range

Colmez–Nizioł quote the exact comparison for i ≤ r ≤ p − 1; Nekovář–Nizioł use r ≤ p − 2. The original statements of Kato, Kurihara and Tsuji were not read. The packet relies only on r ≤ p − 2 (weight two for p ≥ 5).

**Consumers.** [`PadicHodgeRegulators:D.2/small-twist-comparison`](#padichodgeregulators-d-2-small-twist-comparison).

<a id="gap-d-1-3"></a>
### Sign of Cherbonnier–Colmez's δ_n against the Kummer cocycle

With τ[u_n] = [ε]^{c(τ)}[u_n], (1 − τ)(log[u_n]·t^{−1} ⊗ e_1) = −c(τ)e_1, so Cherbonnier–Colmez's δ_n appears to be minus the Kummer map τ ↦ τ(α)/α unless they use α/τ(α). The sign s of L2/kummer-coleman-comparison, and through it L3/tate-coleman-comparison's Col = −Col_0, must be fixed by a careful reading of CC99 §V.3; the computation in this job is not a confirmed source error.

**Consumers.** [`PadicHodgeRegulators:L2/kummer-coleman-comparison`](#padichodgeregulators-l2-kummer-coleman-comparison).

<a id="gap-d-1-4"></a>
### Pushforward compatibility of the curve regulator

No source read proves that the rigid syntomic regulator on K_2 of curves commutes with finite pushforward. The node gives a route through the étale comparison (D.5/curve-etale-comparison) and corestriction compatibility of the étale regulator; Asakura and Besser–Loeffler–Zerbes use the compatibility without proof in the sources read.

**Consumers.** [`PadicHodgeRegulators:D.5/curve-regulator-functoriality`](#padichodgeregulators-d-5-curve-regulator-functoriality).

<a id="gap-d-1-5"></a>
### Coleman integration with colliding supports and in genus at least one

ColemanIntegration L1 integrates only on Y = 𝒳 ∖ D with D finite étale (one point of D per residue disc); symbols whose divisors collide modulo p need Coleman integration on general wide opens, which no layer owns. ColemanIntegration's recorded gaps 'Independence of the Frobenius lift and functoriality when Ω+ is not free' and 'Algebraic de Rham comparison for good-reduction affine curves' are inherited for genus ≥ 1.

**Consumers.** [`PadicHodgeRegulators:D.5/coleman-symbol-formula`](#padichodgeregulators-d-5-coleman-symbol-formula); [`PadicHodgeRegulators:D.5/curve-syntomic-regulator`](#padichodgeregulators-d-5-curve-syntomic-regulator).

<a id="gap-d-1-6"></a>
### K_2 integrality for curves of genus at least two

The identification K_2(𝒳)_Q → K_2(X)_Q ∩ ker(tame symbols) used to feed symbols into the regulator needs Harder-type finiteness; EllipticKTheory supplies it only for elliptic curves (E.5/harder-finiteness).

**Consumers.** [`PadicHodgeRegulators:D.5/curve-syntomic-regulator`](#padichodgeregulators-d-5-curve-syntomic-regulator).

<a id="gap-d-1-7"></a>
### Vologodsky integration has no owner

ColemanIntegration Part II is the proposed owner of the missing semistable Vologodsky integration interface. BZ Theorem 1.1 was read, but it does not give the weight-two regulator formula or a ker N restriction. Source and state the full formula and monodromy/convenient-quotient hypotheses before claiming that target.

**Consumers.** [`PadicHodgeRegulators:D.5/semistable-input-boundary`](#padichodgeregulators-d-5-semistable-input-boundary).

<a id="gap-d-1-8"></a>
### Specialisation of curve regulators in families

Specialisation of the syntomic regulator to fibres of a smooth family (Asakura, Theorem 4.9, via Asakura–Miyatani arXiv:2007.14255) was not read; only base change along finite unramified extensions is planned.

**Consumers.** [`PadicHodgeRegulators:D.5/curve-regulator-functoriality`](#padichodgeregulators-d-5-curve-regulator-functoriality).

<a id="gap-d-1-9"></a>
### Early shared classical log-syntomic producer

Name and plan the early CohomologyComparisons Part II producer required by the accepted RT-AREA-iwasawa-2/3 review. Its current CP.4 rational proper B_st theorem is not the integral/open producer. The four D.2 comparison nodes preserve the required interfaces without claiming ownership or completion.

**Consumers.** [`PadicHodgeRegulators:D.2/log-syntomic-complex`](#padichodgeregulators-d-2-log-syntomic-complex); [`PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`](#padichodgeregulators-d-2-fontaine-messing-kato-period-map); [`PadicHodgeRegulators:D.2/small-twist-comparison`](#padichodgeregulators-d-2-small-twist-comparison); [`PadicHodgeRegulators:D.2/syntomic-exponential`](#padichodgeregulators-d-2-syntomic-exponential); [`PadicHodgeRegulators:D.5/semistable-input-boundary`](#padichodgeregulators-d-5-semistable-input-boundary).

<a id="gap-d-1-10"></a>
### Integral period morphism and divided-Frobenius normalization

CN §5.1.1 defines the undivided p^r−φ complex; classical divided-Frobenius complexes and period-map normalizations must be compared by directed integral maps. A p^r-exact fundamental sequence is not an invertible quasi-isomorphism in D(Z/p^n). Supply the genuine integral morphism and the exact classical small-range convention before using an integral isomorphism; the rational comparison alone does not close this gap.

**Consumers.** [`PadicHodgeRegulators:D.2/log-syntomic-complex`](#padichodgeregulators-d-2-log-syntomic-complex); [`PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`](#padichodgeregulators-d-2-fontaine-messing-kato-period-map); [`PadicHodgeRegulators:D.2/small-twist-comparison`](#padichodgeregulators-d-2-small-twist-comparison).

<a id="gap-d-1-11"></a>
### Noncircular de Rham local-duality descent

FO Theorem 9.27 is semistable. Import potential semistability and prove descent of H_f under finite Galois extension with exact rational invariants/res-cor; alternatively give a freely readable direct de Rham source for all three exact annihilator statements. The ℓ≠p clause has been narrowed to the finite unramified p-primary modules of the read supplier; an extension to other torsion modules would require a stronger statement.

**Consumers.** [`PadicHodgeRegulators:L1/local-duality-of-conditions`](#padichodgeregulators-l1-local-duality-of-conditions).

<a id="gap-d-1-12"></a>
### Curve modified-versus-rigid comparison maps

Specify the rigid-to-fixed-q-Frobenius modified-model map of Besser 8.6(2),(3), identify the raw boundary ι, and prove Θ=(1−φ/q²)^{-1}ι^{-1} is the map whose composition with the étale edge equals exp_BK. Track the K-module structure transported from the modified model and the σ-semilinear versus q-linear Frobenius. AC footnote 4 checks only the Q_p case, not a substitution of one Frobenius for the other.

**Consumers.** [`PadicHodgeRegulators:D.5/curve-weight-two-target`](#padichodgeregulators-d-5-curve-weight-two-target); [`PadicHodgeRegulators:D.5/curve-etale-comparison`](#padichodgeregulators-d-5-curve-etale-comparison).

<a id="gap-d-1-13"></a>
### Missing Lean signatures for supplier-dependent carriers

Most period-ring, p-adic representation, cohomology and K-theory carriers are absent at the pinned baseline. The suggested file gives explicitly UNELABORATED mathematical contracts, not Lean theorem/API signatures or executable examples for these objects. Its successful elaboration checks only the native polynomial, finite-field, product-field and linear-algebra signatures. Do not treat comment-name coverage as compliance with PROTOCOL §13 or formalization; turn each contract into typed signatures as its suppliers become available.

**Consumers.** [`PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`](#padichodgeregulators-l0-hodge-tate-and-twist-conventions); [`PadicHodgeRegulators:L0/fundamental-exact-sequences`](#padichodgeregulators-l0-fundamental-exact-sequences); [`PadicHodgeRegulators:L0/integral-period-interface`](#padichodgeregulators-l0-integral-period-interface); [`PadicHodgeRegulators:L1/bloch-kato-subgroups`](#padichodgeregulators-l1-bloch-kato-subgroups); [`PadicHodgeRegulators:L1/bloch-kato-exponential`](#padichodgeregulators-l1-bloch-kato-exponential); [`PadicHodgeRegulators:L1/bloch-kato-logarithm`](#padichodgeregulators-l1-bloch-kato-logarithm); [`PadicHodgeRegulators:L1/dual-exponential`](#padichodgeregulators-l1-dual-exponential); [`PadicHodgeRegulators:L1/dimension-formulas`](#padichodgeregulators-l1-dimension-formulas); [`PadicHodgeRegulators:L1/local-duality-of-conditions`](#padichodgeregulators-l1-local-duality-of-conditions); [`PadicHodgeRegulators:L1/twist-and-change-of-field`](#padichodgeregulators-l1-twist-and-change-of-field); [`PadicHodgeRegulators:L1/tate-twist-examples`](#padichodgeregulators-l1-tate-twist-examples); [`PadicHodgeRegulators:L1/abelian-variety-logarithm`](#padichodgeregulators-l1-abelian-variety-logarithm); [`PadicHodgeRegulators:L1/integral-logarithm-unramified`](#padichodgeregulators-l1-integral-logarithm-unramified); [`PadicHodgeRegulators:L1/semilocal-bloch-kato`](#padichodgeregulators-l1-semilocal-bloch-kato); [`PadicHodgeRegulators:L2/fontaine-iwasawa-map`](#padichodgeregulators-l2-fontaine-iwasawa-map); [`PadicHodgeRegulators:L2/generator-independence`](#padichodgeregulators-l2-generator-independence); [`PadicHodgeRegulators:L2/root-change`](#padichodgeregulators-l2-root-change); [`PadicHodgeRegulators:L2/local-iwasawa-twist`](#padichodgeregulators-l2-local-iwasawa-twist); [`PadicHodgeRegulators:L2/twist-compatibility`](#padichodgeregulators-l2-twist-compatibility); [`PadicHodgeRegulators:L2/wach-psi-fixed-vectors`](#padichodgeregulators-l2-wach-psi-fixed-vectors); [`PadicHodgeRegulators:L2/character-specialisation`](#padichodgeregulators-l2-character-specialisation); [`PadicHodgeRegulators:L2/lattice-and-coefficient-squares`](#padichodgeregulators-l2-lattice-and-coefficient-squares); [`PadicHodgeRegulators:L2/kummer-coleman-comparison`](#padichodgeregulators-l2-kummer-coleman-comparison); [`PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`](#padichodgeregulators-d-1-teichmuller-unit-decomposition); [`PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`](#padichodgeregulators-d-1-unramified-frobenius-on-roots); [`PadicHodgeRegulators:D.1/etale-algebra-dilogarithm`](#padichodgeregulators-d-1-etale-algebra-dilogarithm); [`PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`](#padichodgeregulators-d-1-dilogarithm-scalar-extension); [`PadicHodgeRegulators:D.1/combined-dilogarithm`](#padichodgeregulators-d-1-combined-dilogarithm); [`PadicHodgeRegulators:D.1/regulator-normalisation-dictionary`](#padichodgeregulators-d-1-regulator-normalisation-dictionary); [`PadicHodgeRegulators:D.1/unit-logarithm-kernel`](#padichodgeregulators-d-1-unit-logarithm-kernel); [`PadicHodgeRegulators:D.1/logarithm-norm-trace`](#padichodgeregulators-d-1-logarithm-norm-trace); [`PadicHodgeRegulators:D.2/etale-regulator`](#padichodgeregulators-d-2-etale-regulator); [`PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`](#padichodgeregulators-d-2-rigid-syntomic-cohomology); [`PadicHodgeRegulators:D.2/syntomic-regulator`](#padichodgeregulators-d-2-syntomic-regulator); [`PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`](#padichodgeregulators-d-2-syntomic-etale-regulator-comparison); [`PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`](#padichodgeregulators-d-2-weight-two-dilogarithm-comparison); [`PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison`](#padichodgeregulators-d-2-higher-weight-polylogarithm-comparison); [`PadicHodgeRegulators:D.2/gros-normalisation`](#padichodgeregulators-d-2-gros-normalisation); [`PadicHodgeRegulators:D.2/log-syntomic-complex`](#padichodgeregulators-d-2-log-syntomic-complex); [`PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`](#padichodgeregulators-d-2-fontaine-messing-kato-period-map); [`PadicHodgeRegulators:D.2/small-twist-comparison`](#padichodgeregulators-d-2-small-twist-comparison); [`PadicHodgeRegulators:D.2/syntomic-exponential`](#padichodgeregulators-d-2-syntomic-exponential); [`PadicHodgeRegulators:D.3/unramified-etale-algebra`](#padichodgeregulators-d-3-unramified-etale-algebra); [`PadicHodgeRegulators:D.3/completed-k3-unramified`](#padichodgeregulators-d-3-completed-k3-unramified); [`PadicHodgeRegulators:D.3/completed-k3-bloch-description`](#padichodgeregulators-d-3-completed-k3-bloch-description); [`PadicHodgeRegulators:D.3/finite-polylogarithm`](#padichodgeregulators-d-3-finite-polylogarithm); [`PadicHodgeRegulators:D.3/finite-polylogarithm-reduction`](#padichodgeregulators-d-3-finite-polylogarithm-reduction); [`PadicHodgeRegulators:D.3/dilogarithm-integrality`](#padichodgeregulators-d-3-dilogarithm-integrality); [`PadicHodgeRegulators:D.3/residue-spanning`](#padichodgeregulators-d-3-residue-spanning); [`PadicHodgeRegulators:D.3/root-of-unity-classes`](#padichodgeregulators-d-3-root-of-unity-classes); [`PadicHodgeRegulators:D.3/local-regulator`](#padichodgeregulators-d-3-local-regulator); [`PadicHodgeRegulators:D.3/unramified-regulator-theorem`](#padichodgeregulators-d-3-unramified-regulator-theorem); [`PadicHodgeRegulators:D.3/roots-of-unity-generate`](#padichodgeregulators-d-3-roots-of-unity-generate); [`PadicHodgeRegulators:D.4/global-p-adic-regulator`](#padichodgeregulators-d-4-global-p-adic-regulator); [`PadicHodgeRegulators:D.4/special-unit-formula`](#padichodgeregulators-d-4-special-unit-formula); [`PadicHodgeRegulators:D.4/norm-trace-compatibility`](#padichodgeregulators-d-4-norm-trace-compatibility); [`PadicHodgeRegulators:D.4/frobenius-compatibility`](#padichodgeregulators-d-4-frobenius-compatibility); [`PadicHodgeRegulators:D.4/torsion-and-denominators`](#padichodgeregulators-d-4-torsion-and-denominators); [`PadicHodgeRegulators:D.4/habiro-regulator-export`](#padichodgeregulators-d-4-habiro-regulator-export); [`PadicHodgeRegulators:D.4/padic-k3-regulator-injectivity`](#padichodgeregulators-d-4-padic-k3-regulator-injectivity); [`PadicHodgeRegulators:D.4/example-cubic-field-five-two`](#padichodgeregulators-d-4-example-cubic-field-five-two); [`PadicHodgeRegulators:D.5/curve-weight-two-target`](#padichodgeregulators-d-5-curve-weight-two-target); [`PadicHodgeRegulators:D.5/open-curve-splitting`](#padichodgeregulators-d-5-open-curve-splitting); [`PadicHodgeRegulators:D.5/curve-syntomic-regulator`](#padichodgeregulators-d-5-curve-syntomic-regulator); [`PadicHodgeRegulators:D.5/coleman-symbol-formula`](#padichodgeregulators-d-5-coleman-symbol-formula); [`PadicHodgeRegulators:D.5/curve-etale-comparison`](#padichodgeregulators-d-5-curve-etale-comparison); [`PadicHodgeRegulators:D.5/curve-regulator-functoriality`](#padichodgeregulators-d-5-curve-regulator-functoriality); [`PadicHodgeRegulators:D.5/semistable-input-boundary`](#padichodgeregulators-d-5-semistable-input-boundary).

<a id="gap-l3-1"></a>
### Bounded evaluation, division and image descent

The authentic O_E[[X]][1/varpi] instance needs bounded division, evaluation kernels and nonzero X-x. The LLZ4.12 determinant argument additionally needs a bounded-to-analytic image equality/descent theorem; equal H_E determinants do not prove equality of arbitrary bounded submodules.

**Consumers.** [`PadicHodgeRegulators:L4/constraint-basis`](#padichodgeregulators-l4-constraint-basis); [`PadicHodgeRegulators:L4/actual-coleman-image`](#padichodgeregulators-l4-actual-coleman-image).

<a id="gap-l3-2"></a>
### Actual arithmetic carrier signatures

Pinned libraries have no native Wach, D_cris/D_dR, H_Iw, full analytic-distribution or differential Robba-module carrier. Supplier PG/PHT/Regulator L0-L2/LAD interfaces must first be elaborated. Suggested arithmetic contracts are comments; only genuine algebraic carrier signatures are compiled.

**Consumers.** [`PadicHodgeRegulators:L3/crystalline-regulator`](#padichodgeregulators-l3-crystalline-regulator); [`PadicHodgeRegulators:L4/coleman-coordinates`](#padichodgeregulators-l4-coleman-coordinates); [`PadicHodgeRegulators:L4/derham-regulator`](#padichodgeregulators-l4-derham-regulator).

<a id="gap-l3-3"></a>
### Derivative obstruction exactness

Berger p.120 cites Perrin–Riou1994 Section2.2 for exactness of the derivative-obstruction sequence. That proof was not independently acquired/read here; prove solvability and kernel on authentic period modules, including the top t^h eigenvectors and invariant quotient.

**Consumers.** [`PadicHodgeRegulators:L3/big-exponential-obstruction`](#padichodgeregulators-l3-big-exponential-obstruction); [`PadicHodgeRegulators:L3/big-exponential`](#padichodgeregulators-l3-big-exponential).

<a id="gap-l3-4"></a>
### Determinant normalization

LLZ4.7 imports Perrin–Riou delta(V), Proposition3.6.7 and Colmez1998 IX.4.5. Berger/LZ supply the read reciprocity route, but the exact determinant-line normalization and rank-d Iwasawa comparison are still required. Pairing equality alone is not the determinant theorem.

**Consumers.** [`PadicHodgeRegulators:L3/regulator-determinant`](#padichodgeregulators-l3-regulator-determinant); [`PadicHodgeRegulators:L4/actual-coleman-image`](#padichodgeregulators-l4-actual-coleman-image).

<a id="gap-l3-5"></a>
### Cyclotomic growth estimate

LZ4.8 reduces its quotient-slope bound to a one-variable statement called well known. Supply the actual Wach coefficient/annulus seminorm estimate and identify its Mellin image with LAD order-h distributions; order-zero boundedness is not automatic.

**Consumers.** [`PadicHodgeRegulators:L3/growth`](#padichodgeregulators-l3-growth).

<a id="gap-l3-6"></a>
### Integral lower inclusion

Supply phi(pi)^(k-1)(phi*N(T))^psi0 subset (1-phi)N(T)^psi1 over O_E for the actual modular lattice. LLZ2011 cites the proof of LLZ2010 Prop4.11; the latter’s printed (C),(D) hypotheses and rational one-coordinate proof do not by themselves establish the wider integral assertion. Retain those restrictions until integral convergence and coefficient descent are proved.

**Consumers.** [`PadicHodgeRegulators:L4/integral-image-index`](#padichodgeregulators-l4-integral-image-index).

<a id="gap-l3-7"></a>
### N_rig and exponential comparison

PHT/PG must supply the authentic N_rig(D), partial, localization, annulus norms, nabla_h Delta subset D and the Nakamura2014 cohomological exponential comparison cited by RJ I.10/I.22. RJ’s downstream formulas were read; Nakamura’s proof was not acquired/read in this run.

**Consumers.** [`PadicHodgeRegulators:L4/analytic-differential-powers`](#padichodgeregulators-l4-analytic-differential-powers); [`PadicHodgeRegulators:L4/derham-interpolation-growth`](#padichodgeregulators-l4-derham-interpolation-growth).

<a id="gap-l3-8"></a>
### Crystalline/de Rham normalization square

Prove the map-level conversion of RJ Amice lambda_i, inverse finite-character convention, alpha_i^-n and Gauss dual bases to LLZ/LZ Mellin. Also prove the general crystalline extension asserted by RJ I.15/I.29: the displayed IC9 calculation starts in a strict-negative-slope eigenbasis subcase. A finite coefficient extension alone does not diagonalize a nonsemisimple phi. No global extension is inferred for general de Rham D.

**Consumers.** [`PadicHodgeRegulators:L4/crystalline-derham-comparison`](#padichodgeregulators-l4-crystalline-derham-comparison).

<a id="gap-l3-9"></a>
### Rubin ordinary/multiplicative construction

The supplied public Rubin book states PropositionIII.5.14 and refers to the appendix of Rubin1998, Euler systems and modular elliptic curves, LMS Lecture Notes254, pp.351–367, for the construction. That appendix was not acquired/read. Supply its integral singular-quotient descent and injectivity, including the ordinary/multiplicative differential normalization.

**Consumers.** [`PadicHodgeRegulators:L3/rubin-coleman-map`](#padichodgeregulators-l3-rubin-coleman-map); [`PadicHodgeRegulators:L4/split-multiplicative-augmentation`](#padichodgeregulators-l4-split-multiplicative-augmentation).

<a id="gap-l3-10"></a>
### Unrestricted crystalline codomain

StageL3 prints H_E-valued output for all crystalline V. LZ Section4.4 equation(10) constructs the normalized map for arbitrary weights into Frac(H_E) via logarithmic-factor division. Extra H_E-valued cancellation is not proved here and must not be asserted for every V. The packet proposes an explicit scope qualification and retains this target gap.

**Consumers.** [`PadicHodgeRegulators:L3/meromorphic-twist-extension`](#padichodgeregulators-l3-meromorphic-twist-extension).

<a id="gap-l3-11"></a>
### Cross-part Kummer sign in the Tate–Coleman comparison

L2/kummer-coleman-comparison supplies h_Iw(Delta(f_u) tensor e_1)=s kappa(u) with s in {+1,-1}, not the normalized equality used by the L3 Tate comparison. CC99 Proposition V.3.2 proof writes its Kummer representative with (1-tau), whereas the declared Selmer Kummer map uses tau(alpha)/alpha. Compare the actual period lift, Tate basis and h_Iw cocycle of I.4.1/IV.2.1 with LZ Section 6.4.2 before transporting the ell_0 Col_0=-ell_0 Col formula to this kappa. Its source-normalized target is retained; no sign is selected by assembly. Rubin’s separate source theorem is retained, but comparison through this Tate node inherits the gap.

**Consumers.** [`PadicHodgeRegulators:L3/tate-coleman-comparison`](#padichodgeregulators-l3-tate-coleman-comparison); [`PadicHodgeRegulators:L3/rubin-coleman-map`](#padichodgeregulators-l3-rubin-coleman-map).

<a id="gap-l3-12"></a>
### Normalized local Iwasawa pairing and dual-exponential adjunction

The L1 nodes provide the finite-level dual exponential and local-duality contract; the L2 nodes provide h_Iw, twists and character specialization. None defines the Lambda-valued Iwasawa pairing asserted in L3/explicit-reciprocity. Supply the inverse-action pairing and its normalized specialization, and check the order/sign of the L1 adjunction against Berger II.5–II.6 and LZ Appendix B.6. LZ’s source formula retains -sigma_-1 ell_0 and antilinearity in the second variable. A stage reference or finite-level perfectness alone cannot discharge this comparison.

**Consumers.** [`PadicHodgeRegulators:L3/explicit-reciprocity`](#padichodgeregulators-l3-explicit-reciprocity); [`PadicHodgeRegulators:L3/regulator-determinant`](#padichodgeregulators-l3-regulator-determinant).

<a id="gap-l3-13"></a>
### Representation-level L2 comparison versus general de Rham Robba modules

The new precise dependency L2/fontaine-iwasawa-map applies to etale D(T) attached to a representation. L2/character-specialisation likewise specializes representation Iwasawa classes. These nodes support only that specialization of the L4 construction. RJ’s general de Rham D and N_rig(D) need the separately requested PG.5 Nakamura comparison and its localization/exponential interface; no etaleness or representation realization is inferred from the new node reference. Retain the existing N_rig/exponential and crystalline normalization gaps.

**Consumers.** [`PadicHodgeRegulators:L4/derham-regulator`](#padichodgeregulators-l4-derham-regulator); [`PadicHodgeRegulators:L4/derham-interpolation-growth`](#padichodgeregulators-l4-derham-interpolation-growth); [`PadicHodgeRegulators:L4/crystalline-derham-comparison`](#padichodgeregulators-l4-crystalline-derham-comparison).

## Source qualifications

The following register retains the inputs’ independently checked source qualifications, including rejected proposed corrections. “Unverifiable” identifies a remaining source comparison rather than a correction established here. Exact quotations, searches and version hashes remain in the part packets. A preprint correction is never silently asserted for an unread version of record.

### PadicHodgeRegulators/E101

**Source:** [GSWZ2024 (D.1)](#source-d-1-gswz2024), §1.5, after (19), p. 9 (arXiv 2412.04241v2).

**Qualification or proposed correction.** Besser–de Jeu Theorem 1.6(2) (and 1.10, 1.12) shows the coincidence only on classes presented by special units of the valuation ring (and on roots of unity); the identity for arbitrary elements is their Conjecture 1.14. D_p should be defined on K_3(K_p; Z_p) as the regulator, and the dilogarithm formula used only for special-unit presentations at p, which covers GSWZ's uses (Lemma 3.1 concerns special units; the Nahm and knot examples use global units).

**Reason.** BdJ Theorem 1.6 restricts to the subcomplex 'generated by symbols of the form [x]k ⊗ y1 ∧ … ∧ yn−k, where all yi are elements in O∗, and x is in O♭' (special units), and Conjecture 1.14 states the general case as a conjecture; BdJ remark that 'perhaps R does not have enough special units'.

**Version qualification.** new

**Independent finding:** confirmed. Confirmed as a citation-scope gap: GSWZ after (19) cites BdJ 1.6(2), which covers the special-unit complex; BdJ Conjecture 1.14, including its published pp.873–874, states the unrestricted formula as conjectural. This does not disprove the regulator defined by its étale realization.

### PadicHodgeRegulators/E102

**Source:** [GSWZ2024 (D.1)](#source-d-1-gswz2024), Theorem 9 and proof, p. 39 (arXiv 2412.04241v2).

**Qualification or proposed correction.** For K_p = ∏_i Q_{p^{s_i}} with more than one factor and ζ restricted to roots of unity with every component ≠ 1 (GSWZ E38), generation needs Proposition 3.3 in a product form: the Z_p-span of {p^{−2}D(ζ) − p^{−2}D(ζ')} is also Z_{p^s} (D.3/residue-spanning (b), (c)), which follows from the same counting bound. For the nonzero admissible domain use (p^s−2)/(p−2) when s>1; s=1 requires the separate zero/nonzero-value argument, not the original q−1 count.

**Reason.** Proposition 3.3 is proved for one factor Q_{p^s}; a tuple ζ = (ζ_i) with all ζ_i ≠ 1 cannot isolate a single factor, so the product statement needs the difference argument.

**Version qualification.** new

**Independent finding:** confirmed. Confirmed as a missing product argument when tuples with a component 1 are disallowed. The repaired nonzero-domain count and separate s=1 zero/nonzero argument prove difference-spanning; factor isolation then proves the product case. The original q−1 count alone was insufficient for the stated admissible domain.

### PadicHodgeRegulators/E103

**Source:** [BdJ2003 (D.1)](#source-d-1-bdj2003), Remark 1.13, p. 6 (arXiv math/0110334v2).

**Qualification or proposed correction.** The relation reg^Gros = (1 − Frob/p^n) reg converts Li_n into Li_n^{(p)}, but Theorem 1.12 carries the factor ±(n − 1)! that Gros's formula lacks; the remark should account for it (a normalisation of the Chern classes). For n = 2 the factor is 1.

**Reason.** Comparing Theorem 1.12 ([ζ]_n ↦ ±(n − 1)! L_mod,n(ζ)) with the quoted result of Gros ([ζ]_n ↦ Li_n^{(p)}(ζ)).

**Version qualification.** new

**Independent finding:** rejected. Rejected as an established source mistake. The quoted Gros symbols and de Jeu’s symbols/Chern-class normalization have not been independently identified in higher weight; the factorial mismatch alone is not a counterexample. Weight two has factorial 1. Keep higher-weight convention comparison as an obligation, not a confirmed erratum.

### PadicHodgeRegulators/E104

**Source:** [BdJ2003 (D.1)](#source-d-1-bdj2003), Proof of Theorem 1.12, p. 41 (arXiv math/0110334v2).

**Qualification or proposed correction.** s ≥ 1; and 'As reg([x]n) = Lmod,n(x) if x is a special unit' should carry the factor ±(n − 1)!.

**Reason.** The case s = 1 (order divisible by p exactly once) is not special and must be covered by the same argument; Theorem 1.6(2) has the factor ±(n − 1)!.

**Version qualification.** known

**Independent finding:** confirmed. Confirmed for the cited preprint: the distribution argument also needs s=1 and the special-unit value has the factorial/sign. Published p.910 retains s>1 but restores ±(n−1)! in that value. Thus only the s inequality is claimed to persist in the version of record.

### PadicHodgeRegulators/E105

**Source:** [BdJ2003 (D.1)](#source-d-1-bdj2003), Proof of Lemma 4.10 and (4.4), p. 25 (arXiv math/0110334v2).

**Qualification or proposed correction.** (dω, (1 − φ∗/q^n)ω − dε), as the cone differential (4.1) d(a, b) = (da, f(a) − db) requires; and '(ω, η)' should read (ω, ε).

**Reason.** Apply (4.1) with f = 1 − φ*/q^n.

**Version qualification.** known

**Independent finding:** confirmed. Confirmed for the cited preprint from the cone differential. Published (4.4), p.891, puts −dε inside the second component, correcting the parenthesis; the proof of Lemma 4.10, p.893, still uses η where ε is intended. Scope the two clauses separately.

### PadicHodgeRegulators/E106

**Source:** [CN2017 (D.1)](#source-d-1-cn2017), §1, p. 2 and §2.4.3, p. 23 (arXiv 1505.06471v4).

**Qualification or proposed correction.** 0 ≤ b(r) ≤ p − 2 (equivalently a(r) = ⌊r/(p − 1)⌋, as in Nekovář–Nizioł §4.1).

**Reason.** With b(r) ≤ p − 1, r = p − 1 has two decompositions (a, b) = (0, p − 1) and (1, 0), so a(r) is not determined.

**Version qualification.** new

**Independent finding:** confirmed. Confirmed in v4 and the publicly deposited accepted manuscript: r=p−1 admits both (a,b)=(0,p−1),(1,0) under the printed weak upper bound. Use Euclidean remainder b<p−1. The publisher version was attempted but not read.

### PadicHodgeRegulators/E107

**Source:** [CN2017 (D.1)](#source-d-1-cn2017), Theorem 1.1(ii), p. 2, against Theorem 5.4(ii), p. 54 (arXiv 1505.06471v4).

**Qualification or proposed correction.** The proof supports the conservative N(K,p,r) of Theorem 5.4(ii). Dependence only on e is not established by the descent argument read here; the stronger introduction claim is not disproved.

**Reason.** The descent constant of Lemma 5.9 involves the conductor c(K); Remark 1.7 only hopes for dependence on the different.

**Version qualification.** new

**Independent finding:** confirmed. Confirmed as a proof-scope inconsistency in v4 and the accepted manuscript: the introduction advertises N(e,p,r), but Theorem 5.4(ii) and its descent use N(K,p,r)/c(K). Record the weaker proved bound. This is not a counterexample disproving that a stronger uniform bound may exist; no assertion about the unread publisher text.

### PadicHodgeRegulators/E108

**Source:** [NN2016 (D.1)](#source-d-1-nn2016), Remark 4.14, p. 54 (arXiv 1309.7620v5).

**Qualification or proposed correction.** Assume r ≥ q + 2.

**Reason.** For X = Spec K, q = 0 and r = 1, exp_BK : K → H^1(G_K, Q_p(1)) is not surjective (dimensions [K : Q_p] and [K : Q_p] + 1).

**Version qualification.** new

**Independent finding:** confirmed. Confirmed in v5 and published p.1772: X=Spec K,q=0,r=1 gives the non-surjective unit exponential K→H¹(K,Q_p(1)). The safer sufficient range r≥q+2 is used; no minimal corrected hypothesis is claimed.

### PadicHodgeRegulators/E109

**Source:** [NN2016 (D.1)](#source-d-1-nn2016), Theorem 5.9, p. 59 (arXiv 1309.7620v5).

**Qualification or proposed correction.** H^i in place of H^{i+1}, as in Theorem B (p. 7).

**Reason.** r^et_{r,i} lands in H^1(G_K, H^i_et(X_K̄, Q_p(r))).

**Version qualification.** new

**Independent finding:** confirmed. Confirmed in v5 and published p.1779: the regulator was defined with H^i_et, and Theorem B uses H^i; H^{i+1} in Theorem 5.9 is the wrong degree.

### PadicHodgeRegulators/E110

**Source:** [NN2016 (D.1)](#source-d-1-nn2016), Proposition 2.16, p. 15 (arXiv 1309.7620v5).

**Qualification or proposed correction.** Exclude the trivial representation: the stated F¹=0 hypothesis is insufficient. The proof’s H²=0 step additionally excludes Q_p(1), for example by requiring F^{-1}D_K=0. No optimal corrected general theorem for F⁰=0 is claimed; use the verified stronger ranges in applications.

**Reason.** V = Q_p has F^1 = 0, but H^1_st(G_K, Q_p) = K_0/(1 − σ) has dimension 1 while H^1(G_K, Q_p) has dimension [K : Q_p] + 1.

**Version qualification.** new

**Independent finding:** confirmed. Confirmed in v5 and published pp.1714–1715 by D=D_st(Q_p): F¹=0, but H¹_st has dimension 1 and H¹ has dimension [K:Q_p]+1. Excluding weight zero is necessary; the displayed proof’s further H²=0 argument also requires exclusion of Q_p(1), e.g. F^{-1}=0. No optimal corrected theorem for all F⁰=0 is established here.

### PadicHodgeRegulators/E111

**Source:** [HK2011 (D.1)](#source-d-1-hk2011), Definition 0.4.5, p. 6 (arXiv math/0612611v1).

**Qualification or proposed correction.** Tr(x_{σ(1)} ∘ ⋯ ∘ x_{σ(2n−1)}).

**Reason.** As printed σ does not act on the summand, so the alternating sum vanishes for n ≥ 2.

**Version qualification.** new

**Independent finding:** confirmed. Confirmed at HK Definition 0.4.5: the printed summand does not depend on σ, so its signed permutation sum is zero for n≥2. The trace must use permuted indices to define the intended primitive class.

### PadicHodgeRegulators/E112

**Source:** [Berger2003 (D.1)](#source-d-1-berger2003), Lemma II.1, p. 10 (arXiv math/0209283v1).

**Qualification or proposed correction.** 'if n = 0', and the hypothesis ψ(y) = y, used in the proof and in all applications, should be in the statement.

**Reason.** The first case of the lemma covers n ≥ 1; the proof writes 'ψ(y) = y means that …'.

**Version qualification.** known

**Independent finding:** confirmed. Confirmed for arXiv v1 only. The published Documenta Lemma I.9, p.111, already assumes y∈D^{ψ=1} and gives n=0 in the second case, correcting both defects. The author’s 2026 errata page was also read.

### PadicHodgeRegulators/E113

**Source:** [FO (D.1)](#source-d-1-fo), Proof of Proposition 6.36(1), p. 150.

**Qualification or proposed correction.** Non-vanishing (dimension 1) follows from the Euler characteristic formula, since H^0(Q_p(−1)) = H^2(Q_p(−1)) = 0; Tate duality pairs H^1(Q_p(−1)) with H^1(Q_p(2)), not with H^0.

**Reason.** Local Tate duality pairs H^i(V) with H^{2−i}(V^*(1)).

**Version qualification.** new

**Independent finding:** confirmed. Confirmed in the author book draft, proof of 6.36(1): local duality pairs H¹(Q_p(−1)) with H¹(Q_p(2)), not H⁰(Q_p). The asserted dimension follows instead from the local Euler characteristic and vanishing of H⁰,H².

### PadicHodgeRegulators/E114

**Source:** [HK2 (D.1)](#source-d-1-hk2), Appendix A, Proposition A.3, p. 47 (arXiv math/0101071v2).

**Qualification or proposed correction.** (O_F^*)^∧.

**Reason.** F is the number field; the proof and Proposition 2.3.2 use O_F.

**Version qualification.** new

**Independent finding:** confirmed. Confirmed in HK2 v2 Appendix A.3: F is the global field in the cohomology group and in the unit argument; O_K is an inconsistent letter, corrected to O_F.

### PadicHodgeRegulators/E115

**Source:** [Berger2003DM (D.1)](#source-d-1-berger2003dm), Proof of Theorem A.3, p. 126 (Documenta version).

**Qualification or proposed correction.** With the paper's convention (positive = Hodge–Tate weights ≤ 0, p. 105) the case treated has weights ≥ 0; 'positive' should read 'with nonnegative Hodge–Tate weights'.

**Reason.** Compare the definition on p. 105.

**Version qualification.** new

**Independent finding:** confirmed. Confirmed in Documenta p.126: “positive” on p.105 means HT weights≤0, whereas this step assumes weights≥0; write the latter explicitly. The author’s 2026 errata page contains no correction of this paper.

### PadicHodgeRegulators/E116

**Source:** [LZ2014 (D.1)](#source-d-1-lz2014), §2, p. 7 (arXiv 1108.5954v3).

**Qualification or proposed correction.** [Ber03, Theorem A.3] (Theorem A.2 is the characterisation of Wach modules).

**Reason.** In both versions of Berger's paper the ψ-invariants statement is Theorem A.3.

**Version qualification.** new

**Independent finding:** confirmed. Confirmed in LZ v3 §2: the ψ-fixed-vector theorem invoked is Berger A.3; A.2 is the characterization of Wach modules. Read both the cited sentence and Berger’s appendix.

### PadicHodgeRegulators/E117

**Source:** [AC20 (D.1)](#source-d-1-ac20), Remark 3.2(1), p. 15 (arXiv 2003.08888v2).

**Qualification or proposed correction.** [Be1, Proposition 8.6.3], as Besser–de Jeu cite the same item.

**Reason.** Besser–de Jeu 2003 p. 21 cite 'Proposition 8.6.3' of the same paper for the comparison of syntomic and modified syntomic cohomology.

**Version qualification.** new

**Independent finding:** confirmed. Confirmed directly, rather than through BdJ alone: AC v2 Remark 3.2(1) calls it Remark 8.6.3, but Besser’s public original has Proposition 8.6, item 3, author pp.26–28. Remark 8.7 is a different item.

### PadicHodgeRegulators/E301

**Source:** [LLZ2011 (L3)](#source-l3-llz2011), Published Proposition 5.11, first sentence of proof, p. 1129; compare arXiv:1006.5163v2 Proposition 5.11 and Remark 5.12, p. 25..

**Qualification or proposed correction.** The displayed integral GL(2,O_E) conclusion requires 1-e1e2 to be a UNIT. Choose nonzero e1,e2 in the maximal ideal, avoiding finitely many exceptional slopes. Nonvanishing alone only proves invertibility over E.

**Reason.** In Z_5 take e1=1,e2=-4: determinant 5 is nonzero and not a unit. The finite-avoidance construction repairs the proof without changing the proposition.

**Version qualification.** The sufficient maximal-ideal choice is already explicit in arXiv v2 Remark 5.12. No separate published corrigendum located; no novelty claim.

**Independent finding:** confirmed. Confirmed at published Proposition5.11 and arXiv v2 Remark5.12. The published nonzero determinant condition is insufficient over O_E: e1=1,e2=-4 in Z_5 give determinant 5. The preprint maximal-ideal choice guarantees a unit determinant and finite avoidance handles all slopes.

### PadicHodgeRegulators/E302

**Source:** [LLZ2011 (L3)](#source-l3-llz2011), Published Proposition 4.2 proof, p. 1118, after the definition of S double-prime..

**Qualification or proposed correction.** S is contained in S′. An arbitrary combination of the old basis lies in S′; it lies in S exactly when its coefficient row belongs to S double-prime.

**Reason.** S imposes the conditions of S′ plus one more. For d=1, zero evaluations at 0 and 5 give S=(X(X-5)) and S′=(X), witnessing the direction. The subsequent matrix product uses the correct condition.

**Version qualification.** No correction located in the publication/preprint comparisons and searches listed; novelty not asserted.

**Independent finding:** confirmed. Confirmed at Proposition4.2: S imposes the old conditions and one extra, so S is contained in S-prime. The ideals (X(X-5)) subset (X) give a strict concrete check. The later transported coefficient condition uses the correct inclusion.

### PadicHodgeRegulators/E303

**Source:** [LLZ2011 (L3)](#source-l3-llz2011), Published Proposition5.9, p.1127, displayed ordered-pair quotient functional; compared arXiv1006.5163v2..

**Qualification or proposed correction.** For the preceding ordered pair (Col_1,Col_2), use rho(g,h)=(p-1)g(0)-(2-a_p)h(0), or its negative. Alternatively reverse the two coordinates explicitly. The coefficient-valued quotient is E unless E=Q_p.

**Reason.** The preceding k=2 relation is (2-a_p)Col_2(0)=(p-1)Col_1(0). At p=5,a_p=0 the pair (1,2) obeys that line, but the printed rho gives -6. Our rho vanishes. An E-linear nonzero quotient of E^2 cannot be Q_p for a nontrivial coefficient extension.

**Version qualification.** No correction located in the comparisons/search listed; no novelty or independent-review claim.

**Independent finding:** confirmed. Confirmed from the preceding k=2 relation and M(0), not by guessing a sign. The allowed ordered pair (1,2) at p=5,a_p=0 has printed rho=-6 and corrected rho=0. E is the coefficient-valued quotient unless E=Q_p; coordinate reversal is a distinct convention.

### PadicHodgeRegulators/E304

**Source:** [LLZ2011 (L3)](#source-l3-llz2011), Published Corollary4.13, p.1124; scalar ring of the displayed sequence..

**Qualification or proposed correction.** As written with bounded N(V), state the sequence over Lambda_E(Gamma_1). For H_E scalar action, analytically extend the source and target (equivalently use the corresponding analytic Wach modules), retaining the period embedding in the quotient map.

**Reason.** Theorem2.12 identifies the bounded psi-zero target with Lambda_E^d. Multiplying a basis vector by the unbounded analytic factor ell_0 is not an element of that bounded module. Proposition2.11 separately supplies its analytic scalar extension, so the two carrier versions must be distinguished.

**Version qualification.** No separate correction located; submitted typing/coordinate clarification, with no novelty or independent-review claim.

**Independent finding:** confirmed. Confirmed as a scalar-carrier correction. Theorem2.12 gives the bounded psi-zero module over Lambda_E; Proposition2.11 separately constructs its analytic H_E extension. Corollary4.13 must either remain bounded over Lambda_E or extend both source and target analytically.

### PadicHodgeRegulators/E305

**Source:** [LLZ2011 (L3)](#source-l3-llz2011), Published Proposition4.11, p.1123, identification of the Coleman coefficient-space subspaces..

**Qualification or proposed correction.** In the ordered nu period coordinates, the Coleman row subspace is W_(i,eta)=V_(i,eta) M(x_i)^(-1). Its codimension agrees with V_(i,eta); the period and coefficient subspaces are not literally the same in fixed coordinates.

**Reason.** Equation(2) says L=Col M nu. Thus L(x_i) in V_(i,eta) means Col(x_i) M(x_i) in V_(i,eta). At p=5,k=2,a_p=0 the preceding modular relation gives Coleman line span(1,2), whereas M(0)=[[0,5],[-1,0]] sends it to the period line span(-2,5). These fixed-coordinate lines differ.

**Version qualification.** No separate correction located; submitted typing/coordinate clarification, with no novelty or independent-review claim.

**Independent finding:** confirmed. Confirmed as a fixed-coordinate correction, rather than a claim that the source forgot an abstract identification. Equation(2) is L=Col M nu; therefore the preimage of the period subspace is V_(i,eta) M(x_i)^(-1). The weight-two lines span(1,2) and span(-2,5) exhibit the distinction.

## Suggested Lean interface

The [suggested file](../suggested/PadicHodgeRegulators.lean) has one import block and the namespace `TauCeti.PadicHodgeRegulators`. It combines the finite-polylogarithm, finite-product, residue-spanning and linear-algebra prototypes with the Euler, constraint-module, coordinate and matrix prototypes. It retains named unelaborated arithmetic contracts wherever the genuine supplier carriers are absent. All nodes retain `implementationStatus: unchecked`. The standard note explains exactly what elaboration checks; completion requires turning those contracts and tests into typed declarations on the supplied objects.
